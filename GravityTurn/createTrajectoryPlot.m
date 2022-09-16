load trajectory.mat x h
rEarth = 6371000; % [km]
I = length(x);
xCoord = zeros(I,1);
yCoord = zeros(I,1);
for i = 1:I
    xCoord(i) = (rEarth + h(i)) * sin(x(i)/rEarth);
    yCoord(i) = (rEarth + h(i)) * cos(x(i)/rEarth);
end
Evals = 0:0.01:360.0;
figure('color','white');
fill(rEarth.*cosd(Evals),rEarth.*sind(Evals),[0.75 1.00 0.75]);
hold on
axis square
plot(xCoord,yCoord)