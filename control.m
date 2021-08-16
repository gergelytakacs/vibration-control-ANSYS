% Plots and compares ANSYS simulation and
% experimental results.
%
% Prof. Gergely Takacs, PhD.
% http://www.gergelytakacs.com

load n4s2s;
A=n4s2s.a;
B=n4s2s.b;
C=n4s2s.c;

sys=ss(A,B,C,0,0.01,'inputname','u','outputname','y')

%LQ---Controller--------------------------
%Q=eye(2);
Q=C'*C;
R=1E-4;
K=dlqr(A,B,Q,R);
K



%------------Kalman filter----------------
x=[-1 0]';
xe=[-1 0]'
xe2=[-1 0]'

Qn=1
Rn=0

[kest,L,P,M] = kalman(sys,Qn,Rn);
%-----------------------------------------

for i=1:200
    u(i)=-K*x(:,i);
    x(:,i+1)=(A-B*K)*x(:,i);
    y(i)=C*x(:,i+1);
    
    xe(:,i+1)=A*xe(:,i)+B*u(i)+L*(y(i)-C*xe(:,i)); %USE THIS INNOVATION GAIN L
    xe2(:,i+1)=A*xe2(:,i)+B*u(i)+M*(y(i)-C*xe2(:,i));
end

plot(x(1,:),x(2,:),'.-')
hold on
plot(xe(1,:),xe(2,:),'gx-')
hold on
xlabel('x_1')
ylabel('x_2')
legend('Simulation','Estimate')
grid on