function density = getDensity(height)
    load atmosphere.mat altitudeLevels scaleHeightLevels densityLevels

    scaleHeightIndex = getScaleHeightIndex(height, altitudeLevels);

    scaleHeight = scaleHeightLevels(scaleHeightIndex) * 1000;
    densityLevel = densityLevels(scaleHeightIndex);
    
    density = densityLevel * exp(- height/scaleHeight);
end
