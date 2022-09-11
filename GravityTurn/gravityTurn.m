rocketA = struct;
rocketA.m0 = 3800;
rocketA.mf = 2300;
rocketA.T = 30000000;
rocketA.A = 123;
rocketA.Isp = 2;

rocketODEstart([0 pi/2 0 0 rocketA.m0], rocketA)
rocketODE([0 pi/2 0 0 rocketA.m0], rocketA)
% Simulation based on Falcon
stage1rocket = struct;
