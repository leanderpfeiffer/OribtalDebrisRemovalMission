function [dt, h] = getDecayTimeForLevel(h0,B)
    load atmosphere.mat scaleHeightLevels altitudeLevels
    
    scaleHeightIndex = getScaleHeightIndex(h0, altitudeLevels);
    scaleHeight = scaleHeightLevels(scaleHeightIndex) * 1000;

    h = altitudeLevels(scaleHeightIndex) * 1000;
    
    density = getDensity(h);
    c = sqrt(6371*398600e+12);

    dt = -scaleHeight / (c*B*density) * (exp(h/scaleHeight)-exp(h0/scaleHeight));
    
end