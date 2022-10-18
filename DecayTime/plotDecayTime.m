function [t] = plotDecayTime(initialH,B)
    h = initialH;
    t = 0;
    figure
    hold on
    view([90 -90])
    while h > 0
        [dt, hNew, f] =  getDecayTimeForLevel(h,B);
        fplot(@(h)( f(h)/(3600*24*365) + t),[hNew, h], 'blue')
        t = t + dt/(3600*24*365); % in years
        
        h = hNew - 1;   
    end
    xlabel('Altitude [m]')
    ylabel('Time [years]')
    hold off
    
end

