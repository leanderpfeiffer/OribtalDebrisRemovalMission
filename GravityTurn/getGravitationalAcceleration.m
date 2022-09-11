function g = getGravitationalAcceleration(height)
    g = 6.6743015e-11*5.9722e+24/(height + 6371000)^2;
end