using Base.Test
import VStatistic: vstat, sample_size


@test_approx_eq_eps vstat(120, 4, .05) .5109757 .001
@test sample_size(3, .05) == (278, 92.67)
@test sample_size(3, .05, v=.8) == (278, 92.67)
