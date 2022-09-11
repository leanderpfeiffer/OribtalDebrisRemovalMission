function du = rocketODEend(u, rocket, t, steeringData)
    v = u(1);
    gamma = atan(tan(steeringData.gamma0) * (1 - (t - steeringData.tStart)/ (steeringData.tEnd - steeringData.tStart)));
    x = u(3);
    h = u(4);
    m = u(5);

    R = 6371000;
    g0 = getGravitationalAcceleration(0);
    
    D = 1/2 * rocket.A * getDensity(h)* v^2;
    g = getGravitationalAcceleration(h);
    
    dv = rocket.T/m - D/m -g*sin(gamma);
    dgamma = 0;
    dx = R/(R+h)*v*cos(gamma);
    dh = v*sin(gamma);
    dm = - rocket.T/(rocket.Isp*g0);

    du = [dv; dgamma; dx; dh; dm];

end
