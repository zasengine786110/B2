% Code takes the values from initial to final and computes the probits in each 1m area, it then converts it to a proportion and multiplies this by the number of people in the given 1m ring, this done using assuming an even distribution of people in the area. 
% The code then prints out the values of the probits, proportions, number of people in the ring and the number of people affected by the given probit in the ring of people with respect to area

startDistance = 5;
endDistance = 150;
initialValue = 6;
finalValue = 20;
people = 350;
totalArea = pi*(endDistance^2-startDistance^2);

totalLh = 0;
totalEr = 0;

for r = initialValue:finalValue
    LHprobit = -77.1 + 6.91*log(52500000/(r^2));
    ERprobit = -15.6 + 1.93*log(52500000/(r^2));
    
    
    LHproportion = probitToPercentage(LHprobit)/100;
    ERproportion = probitToPercentage(ERprobit)/100;
    
    peopleInR = people*pi*(r^2-(r-1)^2) / totalArea;
    ERaffected = peopleInR * ERproportion;
    LHaffected = peopleInR * LHproportion;
    totalLh = totalLh + LHaffected;
    totalEr = totalEr + ERaffected;
    disp(['r: ', num2str(r), ', LHprobit: ', num2str(LHprobit), ', ERprobit: ', num2str(ERprobit), ', LHproportion: ', num2str(LHproportion), ', ERproportion: ', num2str(ERproportion), ', People in r: ', num2str(peopleInR), ', ERaffected: ', num2str(ERaffected), ', LHaffected: ', num2str(LHaffected)])
end

disp(['Total LH affected: ', num2str(totalLh), ', Total ER affected: ', num2str(totalEr)])
