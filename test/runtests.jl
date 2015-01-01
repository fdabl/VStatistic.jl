using V
using Base.Test


@test_approx_eq_eps V.stat(120, 4, .05) .5109757 .001
