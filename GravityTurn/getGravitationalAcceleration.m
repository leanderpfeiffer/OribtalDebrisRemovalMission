function g = getGravitationalAcceleration(height)
    g = 398600e+09/(height + 6371000)^2;
end