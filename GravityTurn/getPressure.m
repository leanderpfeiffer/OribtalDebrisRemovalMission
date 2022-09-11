function pressure = getPressure(height)
    load atmosphere.mat altitudeLevels scaleHeightLevels pressureLevels

    scaleHeightIndex = getScaleHeightIndex(height, altitudeLevels);

    scaleHeight = scaleHeightLevels(scaleHeightIndex) * 1000;
    pressureLevel = pressureLevels(scaleHeightIndex);
    
    pressure = pressureLevel * exp(- height/scaleHeight);
end
