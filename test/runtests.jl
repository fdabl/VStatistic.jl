using V:vstat
using Base.Test


@test_approx_eq_eps vstat(120, 4, .05) .5109757 .001
