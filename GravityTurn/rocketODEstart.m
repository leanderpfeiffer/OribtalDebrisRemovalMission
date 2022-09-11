function du = rocketODEstart(u, rocket)
    v = u(1);
    gamma = pi/2; 
    x = u(3);
    h = u(4);
    m = u(5);

    g0 = getGravitationalAcceleration(0);
    
    D = 1/2 * rocket.A * getDensity(h)* v^2;
    g = getGravitationalAcceleration(h);
    
    dv = rocket.T/m - D/m -g;
    dgamma = 0;
    dx = 0;
    dh = v;
    dm = - rocket.T/(rocket.Isp*g0);

    du = [dv; dgamma; dx; dh; dm];

end