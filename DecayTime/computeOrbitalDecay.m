function [P,t] = computeOrbitalDecay(a,e,A,Cd,m0,F107,Ap)
%% Purpose:
%  Given a satellite starting semi-major axis and its corresponding eccentricity,
%  this routine will compute the orbital trajectory of this satellite until 
%  it reaches 180 km in height at which point it will most 
%  likely re-enter the atmosphere within a fraction of a day.
%
%
%% Source References:
% Pamrar, R. Satellite Orbital Decay Calclulations. The Australian Space Weather
% Agency. 
% S
%
%% Inputs:
%
%  a                         [1 x N]/double            Semi-Major Axis (km)                    
%
%  e                         [1 x N]/double            Eccentricity
%
%  A                         [1 x N]/double            Effective Area (m^2)
%
%  Cd                        [1 x N]/double            Coefficient of Drag
%
%  m0                        [1 x N]/double            Satellite Mass (kg)
%
%  F107                      [1 x N]/double         F10.7 Solar Radio Flux
%
%  Ap                        [1 x N]/double            Geomagnetic Index
%
%
%% Outputs:
%  P                        [M x N]                    Orbital Period (sec)
%
%  t                        [M x N]                    Time of Propagation
%                                                      (sec)
%% Revision History:
%  Darin C. Koblick                                         (c) 02-12-2016
%% ----------------------------- Begin Code Sequence ----------------------
if exist('getConst','file')
    const = getConst();
    Re = const.Earth.Rad;      %Earth Radius (km)
    Mu = const.Earth.Mu;       %Earth's Gravitational Constant
else
    Re = 6378.137;      
    Mu = 398600.4418;      
end

%% Demonstration of Decay in absense of any user inputs:
if nargin == 0
       a =  Re+(300:25:400);                 %km
       m0 = 100;                             %kg
       A =  1;                               %m^2
       e =  0;
       Cd = 1;
     F107 = 70;
       Ap = 0;
    [P,t] = computeOrbitalDecay(a,e,A,Cd,m0,F107,Ap);
    figure('color',[1 1 1]);
    plot(t./86400,((P./(2.*pi)).^2.*Mu).^(1/3)-Re,'k','linewidth',2);
    grid on;
    xlabel('Time (Days)');
    ylabel('Altitude (km)');
    title(['Vectorized Orbital Decay vs. Time ','A*C_D = ',num2str(A*Cd)]);
    ylim([180 max(a-Re)]);
    [P,t] = deal([]);
    return;
end

 P = 2*pi.*sqrt(a.^3./Mu);  %Orbital Period (sec)
 Ae = A.*Cd;                %Effective Cross Sectional Area
 dt = min(0.5*P);           %Time step in seconds
 t = 0;                     %Elapsed Propagation Time (sec)
 
 %% Defined inline Orbital Routines:
  h = @(P)((P./(2.*pi)).^2.*Mu).^(1/3)-Re;   % Compute the circular height (km)
 rP = @(a,e)a.*(1-e);                        % Compute the Perigee Radius calculation
 he = @(a,e)(rP(a,e)-Re)+900.*e.^(0.6);      % Compute the effective height (km)
 
 %% Very Basic Atmospheric Model:
 m = @(h)27-0.012.*(h-200);                        %180 < h [km] < 500
 H = @(h)(900 + 2.5.*(F107-70) + 1.5.*Ap)./m(h);   %Equivilent height in km
 rho = @(h)6e-10.*exp(-(h-175)./H(h));             %Density (kg m^-3)
  
 %% Find the period corresponding to a height of 180 km:
 P_min = 2*pi.*sqrt((Re+180).^3./Mu);

 %Iterate satellite orbit with time:
 while any(P(end,:) > P_min,2)
     hh = he(h(P(end,:))+Re,e);
     idx = hh >= 180;
     %Compute the change in orbital period:
     dP = bsxfun(@rdivide,-3.*pi.*(hh+Re).*1000.*rho(hh).*Ae.*dt,m0);
     P(end+1,idx) = P(end,idx)+dP(idx); %#ok<AGROW>
       t(end+1,1) = t(end,1)+dt;   %#ok<AGROW>
 end
 
%Clean-up the results such that the period does not fall below P_min:
P(P<P_min) = NaN;
end