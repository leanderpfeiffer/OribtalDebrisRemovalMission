function scaleHeightIndex = getScaleHeightIndex(height, altitudeLevels )
for index = 1:length(altitudeLevels)
    if altitudeLevels(index)<= height/1000 % Table values are in km not m
            scaleHeightIndex = index;
        return
    end
end
end