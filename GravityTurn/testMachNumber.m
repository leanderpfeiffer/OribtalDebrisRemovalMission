cD = zeros(1500,1);
for i = 1:1500
    cD(i) = getCoefficientOfDrag(i,0);
end

plot(cD)
