load satellites.mat sats startOrbit

RAANs = 0:1:50;
maxWeight = 100000;
optRAAN = 0;

for i = 1:length(RAANs)
    startOrbit.RAAN = RAANs(i);
    [deltaVCatch, deltaVSlowDown, massOfFuel, massAtStart, durations] = computeDeltaV(sats, startOrbit);
    maxWeightCheck = max(massAtStart);
    if maxWeight > maxWeightCheck
        maxWeight = maxWeightCheck;
        optRAAN = RAANs(i);
    end
end
maxWeight
optRAAN