function sat = makeSatFromStruct(sc,satStruct)
    sat = satellite(sc,satStruct.semiMajorAxis, satStruct.eccentricity, satStruct.inclination, satStruct.RAAN, satStruct.argOfPeri, satStruct.trueAnomaly, "OrbitPropagator", "two-body-keplerian", "Name", satStruct.name);
    
    %if satStruct.mass == 350
     %   sat.MarkerColor = 'red';
        %sat.MarkerSize = 10;
   % else
    %    sat.MarkerColor = 'blue';
        %sat.MarkerSize = 5;
    %end

end