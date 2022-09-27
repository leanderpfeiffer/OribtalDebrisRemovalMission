%B = 0.155; %getBallisticCoefficient(0.6, 0.1, 1.33);
B = 0.665
%B = 0.301
tGoal = 25; % [years]

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

hA
tNew



