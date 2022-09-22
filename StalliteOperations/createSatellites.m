sat23561 = struct;
sat23561.name = 'ARIANE 40 + R/B';
sat23561.apogee = (6371 + 775)*1000;
sat23561.perigee = (6371 + 758)*1000;
sat23561.semiMajorAxis = (sat23561.apogee + sat23561.perigee)/2;
sat23561.eccentricity = (sat23561.apogee - sat23561.perigee)/(sat23561.apogee + sat23561.perigee);
sat23561.inclination = 98.49;
sat23561.RAAN = 13.2;
sat23561.argOfPeri = 1.49;
sat23561.trueAnomaly = 0;

sat22830 = struct;
sat22830.name = 'ARIANE 40 R/B';
sat22830.apogee = (6371 + 799)*1000;
sat22830.perigee = (6371 + 777)*1000;
sat22830.semiMajorAxis = (sat22830.apogee + sat22830.perigee)/2;
sat22830.eccentricity = (sat22830.apogee - sat22830.perigee)/(sat22830.apogee + sat22830.perigee);
sat22830.inclination = 98.62;
sat22830.RAAN = 13.3;
sat22830.argOfPeri = 0.14;
sat22830.trueAnomaly = 0;

sat20443 = struct;
sat20443.name = 'ARIANE 40 R/B';
sat20443.apogee = (6371 + 777)*1000;
sat20443.perigee = (6371 + 743)*1000;
sat20443.semiMajorAxis = (sat20443.apogee + sat20443.perigee)/2;
sat20443.eccentricity = (sat20443.apogee - sat20443.perigee)/(sat20443.apogee + sat20443.perigee);
sat20443.inclination = 98.64;
sat20443.RAAN = 22.4;
sat20443.argOfPeri = 9.02;
sat20443.trueAnomaly = 0;

sat25942 = struct;
sat25942.name = 'CZ-4B R/B';
sat25942.apogee = (6371 + 844)*1000;
sat25942.perigee = (6371 + 690)*1000;
sat25942.semiMajorAxis = (sat25942.apogee + sat25942.perigee)/2;
sat25942.eccentricity = (sat25942.apogee - sat25942.perigee)/(sat25942.apogee + sat25942.perigee);
sat25942.inclination = 98.32;
sat25942.RAAN = 28.6;
sat25942.argOfPeri = 6.17;
sat25942.trueAnomaly = 0;

sat21610 = struct;
sat21610.name = 'ARIANE 40 R/B';
sat21610.apogee = (6371 + 768)*1000;
sat21610.perigee = (6371 + 753)*1000;
sat21610.semiMajorAxis = (sat21610.apogee + sat21610.perigee)/2;
sat21610.eccentricity = (sat21610.apogee - sat21610.perigee)/(sat21610.apogee + sat21610.perigee);
sat21610.inclination = 98.7;
sat21610.RAAN = 34.7;
sat21610.argOfPeri = 6.06;
sat21610.trueAnomaly = 0;

sat25732 = struct;
sat25732.name = 'CZ-4B R/B';
sat25732.apogee = (6371 + 869)*1000;
sat25732.perigee = (6371 + 790)*1000;
sat25732.semiMajorAxis = (sat25732.apogee + sat25732.perigee)/2;
sat25732.eccentricity = (sat25732.apogee - sat25732.perigee)/(sat25732.apogee + sat25732.perigee);
sat25732.inclination = 98.71;
sat25732.RAAN = 35.7;
sat25732.argOfPeri = 0.93;
sat25732.trueAnomaly = 0;

sat27432 = struct;
sat27432.name = 'CZ-4B R/B';
sat27432.apogee = (6371 + 895)*1000;
sat27432.perigee = (6371 + 811)*1000;
sat27432.semiMajorAxis = (sat27432.apogee + sat27432.perigee)/2;
sat27432.eccentricity = (sat27432.apogee - sat27432.perigee)/(sat27432.apogee + sat27432.perigee);
sat27432.inclination = 98.64;
sat27432.RAAN = 41;
sat27432.argOfPeri = 5.27;
sat27432.trueAnomaly = 0;

sat23828 = struct;
sat23828.name = 'PSLV R/B';
sat23828.apogee = (6371 + 839)*1000;
sat23828.perigee = (6371 + 789)*1000;
sat23828.semiMajorAxis = (sat23828.apogee + sat23828.perigee)/2;
sat23828.eccentricity = (sat23828.apogee - sat23828.perigee)/(sat23828.apogee + sat23828.perigee);
sat23828.inclination = 98.42;
sat23828.RAAN = 44;
sat23828.argOfPeri = 2.94;
sat23828.trueAnomaly = 0;

startOrbit = struct;
startOrbit.name = 'Starting Orbit';
startOrbit.apogee = (6371 + 800)*1000;
startOrbit.perigee = (6371 + 800)*1000;
startOrbit.semiMajorAxis = (startOrbit.apogee + startOrbit.perigee)/2;
startOrbit.eccentricity = (startOrbit.apogee - startOrbit.perigee)/(startOrbit.apogee + startOrbit.perigee);
startOrbit.inclination = 98;
startOrbit.RAAN = 15;
startOrbit.argOfPeri = 0;
startOrbit.trueAnomaly = 0;

sats = [sat25942 sat20443 sat22830 sat23561 sat21610 sat25732 sat27432];
save satellites.mat sats startOrbit