function du = rocketODEstart(u, rocket)
    v = u(1);
    gamma = pi/2; 
    x = u(3);
    h = u(4);
    m = u(5);

    g0 = getGravitationalAcceleration(0);
    
    coefficientOfDrag = getCoefficientOfDrag(v,h);
    D = 1/2 * rocket.A * getDensity(h)* v^2* coefficientOfDrag;
    g = getGravitationalAcceleration(h);
    
    dv = rocket.T/m - D/m -g;
    dgamma = 0;
    dx = 0;
    dh = v;
    dm = - rocket.dm;

    du = [dv; dgamma; dx; dh; dm];

end
