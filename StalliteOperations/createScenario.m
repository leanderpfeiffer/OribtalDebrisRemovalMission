load satellites.mat sats startOrbit

startTime = datetime(2022,09,20,0,0,0);
stopTime = startTime + days(1);
sampleTime = 60;

sc = satelliteScenario(startTime, stopTime, sampleTime);

for i = 1:length(sats)
    sat = makeSatFromStruct(sc, sats(i));
    sat.MarkerColor = [0 1 0];
    sat.Orbit.LineColor = [0 1 0];
    sat.LabelFontColor = [0 1 0];
    show(sat)
    %groundTrack(sat,LeadTime=3600)%,LeadLineColor='blue',TrailLineColor ='blue')
end
startingOrbit = makeSatFromStruct(sc, startOrbit);
%startingOrbit.MarkerColor = [1 0 1];
%startingOrbit.Orbit.LineColor = [1 0 1];
%startingOrbit.LabelFontColor = [1 0 1];

show(startingOrbit)
%groundTrack(startingOrbit,LeadTime=3600)



play(sc)