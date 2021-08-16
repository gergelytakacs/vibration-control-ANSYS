importfile('results_OFF.csv')
importfile('results_ON.csv')

subplot(2,1,1)
plot(results_OFF(:,1),results_OFF(:,2),'b-')
hold on
plot(results_ON(:,1),results_ON(:,2),'r-')
xlabel('Time (s)')
ylabel('Tip deflection (mm)')
legend('Free','LQ Control')
axis([min(results_OFF(:,1)) max(results_OFF(:,1)) -10 10])
grid on

subplot(2,1,2)
stairs(results_ON(:,1),results_ON(:,3),'r-')
xlabel('Time (s)')
ylabel('PZT Voltage (V)')
axis([min(results_OFF(:,1)) max(results_OFF(:,1)) -140 140])
grid on

hold off