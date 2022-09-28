function pressure = getPressure(height)
    load atmosphere.mat altitudeLevels scaleHeightLevels pressureLevels altitudeLevels

    scaleHeightIndex = getScaleHeightIndex(height, altitudeLevels);

    scaleHeight = scaleHeightLevels(scaleHeightIndex) * 1000;
    pressureLevel = pressureLevels(scaleHeightIndex);
    altitudeLevel = altitudeLevels(scaleHeightIndex);
    
    pressure = pressureLevel * exp(- (height-altitudeLevel)/scaleHeight);
end
