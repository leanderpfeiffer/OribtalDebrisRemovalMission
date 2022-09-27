function t = getDecayTime(B,h)
    t = 0;
    while h > 0
        [dt, hNew] =  getDecayTimeForLevel(h,B);
        t = t + dt/(3600*24*365); % in years
        h = hNew - 1;
    end
end

