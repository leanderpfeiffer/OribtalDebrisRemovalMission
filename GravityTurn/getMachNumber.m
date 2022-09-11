function Ma = getMachNumber(height, velocity)
    pressure = getPressure(height);
    density = getDensity(height);
    Ma = velocity/sqrt(1.4 * pressure/density);
end