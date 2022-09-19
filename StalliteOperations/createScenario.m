load satellites.mat sats

startTime = datetime(2022,09,20,0,0,0);
stopTime = startTime + days(1);
sampleTime = 60;

sc = satelliteScenario(startTime, stopTime, sampleTime);
for i = 1:length(sats)
    sat = makeSatFromStruct(sc, sats(i));
    show(sat)
    groundTrack(sat,LeadTime=3600)
end

play(sc)