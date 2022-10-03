function [deltaVCatch, deltaVSlowDown, massOfFuel, massAtStart, durationSlowDown, durationCatch, dwRel] = computeDeltaV(sats, startOrbit)

mu              = 398600e+09;           % [m^3/s^2]
Re              = 6371e+03;             % [m]
g0              = 9.81;                 % [m/s^2]

Isp             = 1390;                 % [s]
T               = 26e-3;                % [N]
structureMass   = 100;                  % [kg]
finalAltitude   = 400e+03;              % [m]
finalRadius     = Re + finalAltitude;   % [m]
finalV          = sqrt(mu/finalRadius); % [m/s]



satCount    = length(sats);

deltaVCatch         = zeros(1,satCount);
deltaVSlowDown      = zeros(1,satCount);
massOfFuel          = zeros(1,satCount);
massAtStart         = zeros(1,satCount);
durationSlowDown    = zeros(1,satCount);
durationCatch       = zeros(1,satCount);
dwRel               = zeros(1,satCount);


for i = 1:length(sats)
    deltaVCatch(i)      = getManeuverDV(startOrbit,sats(i));
    deltaVSlowDown(i)   = finalV - sqrt(mu/sats(i).semiMajorAxis);
    massRatioCatch      = exp( - deltaVCatch(i) / (Isp * g0));
    massRatioSlowDown   = exp( - deltaVSlowDown(i) / (Isp * g0));
    
    wSat        = sqrt(mu/startOrbit.semiMajorAxis^3);
    wDebris     = sqrt(mu/sats(i).semiMajorAxis^3);
    dwRel(i) = abs(wSat - wDebris) * (24*180*3600)/pi; % [deg/day]

    massBeforeSlowDown = (structureMass + sats(i).mass) / massRatioSlowDown - sats(i).mass;
    massAtStart(i) = massBeforeSlowDown / massRatioCatch;
    massOfFuel(i)  = massAtStart(i) - structureMass;

    durationCatch(i) = deltaVCatch(i) * structureMass / (T*3600 * 24);
    durationSlowDown(i) = deltaVSlowDown(i) * (massBeforeSlowDown + sats(i).mass)/(T * 3600 * 24); % [days] 

end
end