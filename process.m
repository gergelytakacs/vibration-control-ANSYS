% Plots and compares ANSYS simulation and
% experimental results.
%
% Prof. Gergely Takacs, PhD.
% http://www.gergelytakacs.com

clc
clear

startON=2590; % Selects a starting point for comparison
startA=1;

importfile('results.csv');
load experiment;

l=250;
t=-0.05:0.01:(l-5-1)*0.01

figure(1)
plot(t,exp.on(startON:startON+l-1))
hold on
plot(t,results(1:l,2),'r-')
xlabel('Time (s)')
ylabel('Tip deflection (mm)')
legend('Experiment','ANSYS')
grid on
axis([0,results(l-5,1),-10,10])

hold off

figure(2)
plot(t,exp.onU(startON:startON+l-1))
hold on
plot(t,l,'r-')
xlabel('Time (s)')
ylabel('Tip deflection (mm)')
legend('Experiment','ANSYS')
grid on
axis([0,results(l-5,1),-130,130])
hold off


