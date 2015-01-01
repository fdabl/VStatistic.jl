module V
import GSL:sf_hyperg_2F1
# could have also used scipy.special.hyp2f1 via @pyimports


function vstat(n::Integer, p::Integer, R²)
    R² = R² <= 0 ? .0001 : R²

    r = ((p - 1) * (1 - R²)) / ((n - p) * R²)
    g = min(r, 1)
    g = .4999 < g < .5001 ? .5001 : g

    z = (g - √(g - g^2)) / (2g - 1)
    α = acos((1 - z) / √(1 - 2z * (1 - z)))

    v = begin
        ((2 * cos(α) * gamma((p + 2) / 2)) /
        (√(π) * gamma((p + 1) / 2))) *
        (sf_hyperg_2F1(.5, (1 - p) / 2, 3/2, cos(α)^2) -
        sin(α)^(p - 1))
    end

    return v
end


function sample_size(p::Integer, R²; v=.8)
    n = p
    while vstat(n, p, R²) < v
        n += 1
    end
    return n, round(n / p, 2)
end

end
