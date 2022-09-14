function du = rocketODEend(u, rocket, t, steeringData)
    v = u(1);
    gamma0 = u(2);
    % Tangent Steering law
    gamma = atan(tan(steeringData.gamma0) * (1 - (t - steeringData.tStart)/ (steeringData.tEnd - steeringData.tStart)));
    % Linear steering law
    % gamma = steeringData.gamma0 * (steeringData.tEnd - t)/(steeringData.tEnd - steeringData.tStart);
    x = u(3);
    h = u(4);
    m = u(5);

    R = 6371000;
    g0 = getGravitationalAcceleration(0);
    
    D = 1/2 * rocket.A * getDensity(h)* v^2 * 0.35;
    g = getGravitationalAcceleration(h);
    
    dv = rocket.T/m - D/m -g*sin(gamma);
    dgamma = gamma - gamma0;
    dx = R/(R+h)*v*cos(gamma);
    dh = v*sin(gamma);
    dm = - rocket.dm;

    du = [dv; dgamma; dx; dh; dm];

end
