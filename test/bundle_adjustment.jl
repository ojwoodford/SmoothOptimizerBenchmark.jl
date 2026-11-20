using Test
using SmoothOptimizerBenchmark
isdefined(@__MODULE__, :SMOOTHBENCH_TEST_FIXTURES) || include("fixtures.jl")

# The synthetic scene (CN9): a ring of cameras around a ball of points. Every observation is in front of its camera, at
# a depth above 1 (the cameras are 3 from the centre, the points within 1.5 of it), at the true scene and at the start;
# each point is seen by half the cameras, at least 8 of them (or all, when there are fewer); the focal length is 1
@testset "Bundle adjustment: the ring of cameras (CN9)" begin
    SB = SmoothOptimizerBenchmark
    depths(x, bam) = [begin
                          c, p = bam.cams_indices[k], bam.pnts_indices[k]
                          o = 3 * bam.npnts + 9 * (c - 1)
                          (SB.bal_rotation(x[o+1:o+3]) * x[3p-2:3p] + x[o+4:o+6])[3]
                      end for k in 1:bam.nobs]
    for ncams in (4, 32)
        bam = SB.make_synthetic_bam(ncams)
        @test bam.ncams == ncams && bam.npnts == 5 * ncams
        k = min(ncams, max(SB.BA_MIN_TRACK, round(Int, SB.BA_TRACK_FRACTION * ncams)))
        @test bam.nobs == k * bam.npnts
        @test all(p -> count(==(p), bam.pnts_indices) == k, 1:bam.npnts)
        x0 = copy(bam.meta.x0)
        @test minimum(depths(x0, bam)) > 1
        @test all(c -> x0[3 * bam.npnts + 9 * c] == SB.BA_FOCAL_LENGTH, 1:ncams)
        # The start's projections are close to the observations, which are the true scene's
        r = zeros(2 * bam.nobs)
        SB.NLPModels.residual!(bam, x0, r)
        @test 0 < maximum(abs, r) < 0.1
        # The true scene (the start without its noise: the same draws, then none) has zero residuals, and its depths
        # are above 1 too
        rng = SB.MersenneTwister(42 + ncams)
        xt = copy(x0)
        np = bam.npnts
        for p in 1:np
            randn(rng, 3); rand(rng)
        end
        for c in 1:ncams
            randn(rng, 3)
        end
        for i in eachindex(xt)
            (i <= 3 * np || (i - 3 * np - 1) % 9 < 6) && (xt[i] -= 0.01 * randn(rng))
        end
        SB.NLPModels.residual!(bam, xt, r)
        @test maximum(abs, r) < 1e-12
        @test minimum(depths(xt, bam)) > 1
    end
    # The camera at angle θ looks at the centre: the centre is on its optical axis, at depth 3
    for θ in (-pi, -1.0, 0.0, 2.0)
        C = -SB.BA_RING_RADIUS * [sin(θ), 0.0, cos(θ)]
        R = SB.bal_rotation([0.0, -θ, 0.0])
        @test isapprox(R * (zeros(3) - C), [0.0, 0.0, SB.BA_RING_RADIUS]; atol=1e-12)
    end
end
