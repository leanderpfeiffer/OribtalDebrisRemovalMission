function du = rocketODEfixed(u, rocket, gamma)
    v = u(1);
    x = u(3);
    h = u(4);
    m = u(5);

    R = 6371000;
    
    coefficientOfDrag = getCoefficientOfDrag(v,h);
    D = 1/2 * rocket.A * getDensity(h)* v^2* coefficientOfDrag;
    g = getGravitationalAcceleration(h);
    
    dv = rocket.T/m - D/m -g*sin(gamma);
    dgamma = -1/v*(g-v^2/(R+h))*cos(gamma);
    dx = R/(R+h)*v*cos(gamma);
    dh = v*sin(gamma);
    dm = - rocket.dm;

    du = [dv; dgamma; dx; dh; dm];

end
