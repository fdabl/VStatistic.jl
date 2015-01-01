#=

Implements the v-statistic, a measure that compares the estimation
accuracy of the ordinary least squares estimator against a random benchmark.

See the paper here: http://www.ncbi.nlm.nih.gov/m/pubmed/23661222/
It features an implemention in R which relies on the "hypergeo" package.

=#

module V
import GSL:sf_hyperg_2F1
# could have also used scipy.special.hyp2f1 via @pyimports


function stat(n::Integer, p::Integer, Rsq)
    Rsq = Rsq <= 0 ? .0001 : Rsq

    r = ((p - 1) * (1 - Rsq)) / ((n - p) * Rsq)
    g = min(r, 1)
    g = .4999 < g < .5001 ? .5001 : g

    z = (g - √(g - g^2)) / (2g - 1)
    α = acos((1 - z) / √(1 - 2z * (1 - z)))

    v = begin
        ((2 * cos(α) * gamma((p + 2) / 2)) /
        (sqrt(π) * gamma((p + 1) / 2))) *
        (sf_hyperg_2F1(.5, (1 - p) / 2, 3/2, cos(α)^2) -
        sin(α)^(p - 1))
    end

    return v
end

end
