using V
using Base.Test


@test_approx_eq_eps V.vstat(120, 4, .05) .5109757 .001
@test V.sample_size(3, .05) == 278
@test V.sample_size(3, .05, power=.8) == 278
