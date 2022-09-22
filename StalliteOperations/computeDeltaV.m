mu                      = 398600e+09;           % [km^3/s^2]

load satellites.mat sats startOrbit


initialSemiMajorAxis    = startOrbit.semiMajorAxis;       %[m]
initialInclination      = startOrbit.inclination /180*pi; %[rad]
initialRAAN             = startOrbit.RAAN /180*pi;        %[rad]
initialEccentricity     = startOrbit.eccentricity;
initialArgOfPeri        = startOrbit.argOfPeri;

deltaVs = zeros(1,length(sats));

for i = 1:length(sats)
    newSemiMajorAxis    = sats(i).semiMajorAxis;
    newInclination      = sats(i).inclination /180*pi;
    newRAAN             = sats(i).RAAN /180*pi;
    newEccentricity     = sats(i).eccentricity;
    newArgOfPeri        = sats(i).argOfPeri;

    V = sqrt(mu/initialSemiMajorAxis);

    dVsemiMajorAxis = abs(sqrt(mu/newSemiMajorAxis) - sqrt(mu/initialSemiMajorAxis))
    dVInclination = V * sqrt(2 - 2 * cos( pi/2 * (initialInclination - newInclination)))
    dVRAAN = pi/2 * V * abs(initialRAAN - newRAAN) * sin(initialInclination)
    dVEccentricity = V * 2/3 * abs( asin(newEccentricity) - asin(initialEccentricity))
    dVargOfPeri = V * 2/3 * initialEccentricity^2/sqrt(1-initialEccentricity^2) + abs(initialArgOfPeri - newArgOfPeri)

    dV = dVsemiMajorAxis + dVInclination + dVRAAN + dVEccentricity + dVargOfPeri;
    deltaVs(i) = dV / 1000;
end

deltaVs