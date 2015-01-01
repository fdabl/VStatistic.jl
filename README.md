# v-statistic

Implements the v-statistic, a measure that compares the estimation
accuracy of the ordinary least squares estimator against a random benchmark.

See the paper here: http://www.ncbi.nlm.nih.gov/m/pubmed/23661222/ which features
an implementation in R.

I also wrote a python version, see [here](https://github.com/dostodabsi/vstat.py).

# install and run

install with

```
Pkg.add("VStatistic")
```

run with

```
import VStatistic: vstat, sample_size

vstat(120, 4, .05) # get v-statistic
sample_size(3, .05, v=.9) # get needed (total n, n per predictor)
```
