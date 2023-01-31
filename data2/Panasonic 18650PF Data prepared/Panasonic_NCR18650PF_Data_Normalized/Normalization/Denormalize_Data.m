%Example file showing how to de-normalize data
%Run file to de-normalize example file "n10degC..."
load("n10degC_LA92_Pan18650PF.mat")
load("MIN_MAX_Normalization.mat")

%Denormalize data
%X = { V, I, T, V_0.5mHz, I_0.5mHz, V_5mHz, I_5mHz}
V = X(1,:)*(MAX(1)-MIN(1))+MIN(1);
I = X(2,:)*(MAX(2)-MIN(2))+MIN(2);
T = X(3,:)*(MAX(3)-MIN(3))+MIN(3);
V_0p5mHz = X(4,:)*(MAX(1)-MIN(1))+MIN(1);
I_0p5mHz = X(5,:)*(MAX(2)-MIN(2))+MIN(2);
V_5mHz = X(6,:)*(MAX(1)-MIN(1))+MIN(1);
I_5mHz = X(7,:)*(MAX(2)-MIN(2))+MIN(2);

figure
subplot(2,1,1)
grid on
hold all;
time = 0:1:(length(V)-1);
time = time/60;
plot(time,V,'LineWidth',1,'LineStyle','-','Color','[0 0.4470 0.7410]');
plot(time,V_0p5mHz,'LineWidth',2,'LineStyle','-','Color','k');
plot(time,V_5mHz,'LineWidth',1.5,'LineStyle','-',"Color",'[0.8500 0.3250 0.0980]');

ylabel("Voltage (V)")
xlabel('Time (minutes)')
legend(["Unfiltered"; "0.5 mHz filter"; "5 mHz filter"],'orientation','horizontal')
set(gca,'FontSize',11)

subplot(2,1,2)
grid on
hold all;
time = 0:1:(length(V)-1);
time = time/60;
plot(time,I,'LineWidth',1,'LineStyle','-','Color','[0 0.4470 0.7410]');
plot(time,I_0p5mHz,'LineWidth',2,'LineStyle','-','Color','k');
plot(time,I_5mHz,'LineWidth',1.5,'LineStyle','-',"Color",'[0.8500 0.3250 0.0980]');

ylabel("Current (A)")
xlabel('Time (minutes)')
legend(["Unfiltered"; "0.5 mHz filter"; "5 mHz filter"],'orientation','horizontal')

set(gcf,'position',[0,0,650,350])
set(gca,'FontSize',11)

%************************************************%
figure
subplot(2,1,1)
grid on
hold all;
time = 0:1:(length(V)-1);
time = time/60;
plot(time,T,'LineWidth',1,'LineStyle','-','Color','[0 0.4470 0.7410]');

ylabel(['Temperature (' char(176) 'C)'])
xlabel('Time (minutes)')
set(gca,'FontSize',11)
set(gcf,'position',[0,0,650,350])
