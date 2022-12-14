function dV = getManeuverDV(startOrbit, finalOrbit)
    mu = 398600e+09;
    initialSemiMajorAxis    = startOrbit.semiMajorAxis;       % [m]
    initialInclination      = startOrbit.inclination /180*pi; % [rad]
    initialRAAN             = startOrbit.RAAN /180*pi;        % [rad]
    initialEccentricity     = startOrbit.eccentricity;        % [-]
    initialArgOfPeri        = startOrbit.argOfPeri;           % [-]

    newSemiMajorAxis    = finalOrbit.semiMajorAxis;
    newInclination      = finalOrbit.inclination /180*pi;
    newRAAN             = finalOrbit.RAAN /180*pi;
    newEccentricity     = finalOrbit.eccentricity;
    newArgOfPeri        = finalOrbit.argOfPeri;

    V = sqrt(mu/initialSemiMajorAxis);

    dVsemiMajorAxis = abs(sqrt(mu/newSemiMajorAxis) - sqrt(mu/initialSemiMajorAxis));
    dVInclination = V * sqrt(2 - 2 * cos( pi/2 * (initialInclination - newInclination)));
    dVRAAN = pi/2 * V * abs(initialRAAN - newRAAN) * sin(initialInclination);
    dVEccentricity = V * 2/3 * abs( asin(newEccentricity) - asin(initialEccentricity));
    dVargOfPeri = V * 2/3 * initialEccentricity^2/sqrt(1-initialEccentricity^2) + abs(initialArgOfPeri - newArgOfPeri);

    dV = dVsemiMajorAxis + dVInclination + dVRAAN + dVEccentricity + dVargOfPeri;
end
