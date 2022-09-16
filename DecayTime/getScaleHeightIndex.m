function scaleHeightIndex = getScaleHeightIndex(height, altitudeLevels )
scaleHeightIndex = 1;
for index = 1:length(altitudeLevels)
    if altitudeLevels(index)<= height/1000 % Table values are in km not m
            scaleHeightIndex = index;
    else
        return
    end
end
scaleHeightIndex = 19;
end