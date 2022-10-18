function coefficientOfDrag = getCoefficientOfDrag(velocity, height)
    Ma = getMachNumber(height, velocity);
    coefficientOfDrag = 0.25;
    return
    if 0 <= Ma && Ma < 0.9
        coefficientOfDrag = 0.57143*Ma^2 -0.1714*Ma + 0.2;
    elseif 0.9 <= Ma && Ma < 1.25
        coefficientOfDrag = 0.51;
    elseif 1.25 <= Ma
        coefficientOfDrag = 0.0256*Ma^2+ -0.256*Ma + 0.78;
    else
        coefficientOfDrag = 0.2;
    end

end