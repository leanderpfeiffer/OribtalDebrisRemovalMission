

params = [1764, 5.3; 1000, 6.6; 912, 1.4];
figure
xlabel('Time [years]')
ylabel('Altitude [km]')
hold on
for i=1:3

[P,t] = computeOrbitalDecay(6371+600,0,params(i,2),1,params(i,1),50,1);
T = t/(3600*24*365);
Alt = nthroot((P/(2*pi)).^2* 398600, 3) - 6371;

plot(T,Alt)

end
legend('ARIANE 40 R/B', 'CZ-4B R/B', 'PSLV R/B')
hold off