function sat = makeSatFromStruct(sc,satStruct)
    sat = satellite(sc,satStruct.semiMajorAxis, satStruct.eccentricity, satStruct.inclination, satStruct.RAAN, satStruct.argOfPeri, satStruct.trueAnomaly, "OrbitPropagator", "two-body-keplerian", "Name", satStruct.name);
end