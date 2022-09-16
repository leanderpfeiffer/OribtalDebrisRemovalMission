decaytime = 0;
B = getBallisticCoefficient(0.4, 5^2*pi, 10000);
h = 200000;

while h > 0
    [dt, hNew] =  getDecayTimeForLevel(h,B);
    decaytime = decaytime + dt/(3600*24*365) % in hours
    h = hNew - 1 
end
