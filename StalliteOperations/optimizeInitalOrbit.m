createSatellites
load satellites.mat sats startOrbit

%RAANs = 0:1:50;
%semiMajorAxes = (6571:20:7600)*1e+03;
e = 0:0.01:0.5;
%inclination = 95:0.05:100;
%argOfPeri = -10:0.2:20;

len = length(e);

maxWeight = zeros(1,len);

for i = 1:len
    %startOrbit.RAAN = RAANs(i);
    %startOrbit.semiMajorAxis = semiMajorAxes(i);
    startOrbit.eccentricity = e(i);
    %startOrbit.inclination = inclination(i);
    %startOrbit.argOfPeri = argOfPeri(i);
    
    [deltaVCatch, deltaVSlowDown, massOfFuel, massAtStart, durations] = computeDeltaV(sats, startOrbit);
    maxWeight(i) = max(massAtStart);
end
maxWeight
bestWeight = min(maxWeight)
value = e(find(maxWeight == bestWeight))