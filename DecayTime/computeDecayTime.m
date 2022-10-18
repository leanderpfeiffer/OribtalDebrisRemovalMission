%B = getBallisticCoefficient(2, 100, 1700);
%B = 0.1
B = 0.155;
tGoal = 24; % [years]

hA = 650000;
hB = 50000;
tol = 1; % [years]

tNew = getDecayTime(B,hA);

while tNew > tGoal + tol || tNew < tGoal - tol
   hNew = (hA + hB)/2;
   tNew = getDecayTime(B,hNew);
   if tNew - tGoal > 0
       hA = hNew;
   elseif tNew -tGoal < 0
       hB = hNew;
   end
end
plotDecayTime(400000,B)
hA
tNew



