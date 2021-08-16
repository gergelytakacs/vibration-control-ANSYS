clc
clear

startON=2590;
startA=1;

importfile('results.csv')
load exp

l=length(results);
t=-0.05:0.01:(length(results)-5-1)*0.01

figure(1)
plot(t,exp.on(startON:startON+l-1))
hold on
plot(t,results(:,2),'r-')
xlabel('Time (s)')
ylabel('Tip deflection (mm)')
legend('Experiment','ANSYS')
grid on
axis([0,results(l-5,1),-10,10])

hold off

figure(2)
plot(t,exp.onU(startON:startON+l-1))
hold on
plot(t,results(:,3),'r-')
xlabel('Time (s)')
ylabel('Tip deflection (mm)')
legend('Experiment','ANSYS')
grid on
axis([0,results(l-5,1),-130,130])
hold off


return



















load n4s2s;
A=n4s2s.a;
B=n4s2s.b;
C=n4s2s.c;
sys=ss(A,B,C,0,0.01,'inputname','u','outputname','y')

%LQ---Controller--------------------------
Q=C'*C;
R=1E-4;
K=dlqr(A,B,Q,R);
%------------Kalman filter----------------
xe=[0 0]';
Qn=1
Rn=0
[kest,L,P,M] = kalman(sys,Qn,Rn);
%-----------------------------------------
for i=1:1
    xe(:,i+1)=A*xe(:,i)+B*results(i,3)+L*(results(i,2)-C*xe(:,i)); %USE THIS INNOVATION GAIN L
    end

figure(3)
plot(xe(1,1:l),xe(2,1:l),'gx-')
hold on
plot(results(:,3),results(:,4),'ro-')
hold off
axis([-20,20,-8,8])

