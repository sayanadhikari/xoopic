clc;clear all;close all;
filename1 = 'electron_current_history_v2.txt';
filename2 = 'ion_current_history_v2.txt';
delimiterIn = '\t';
headerlinesIn = 2;
A = importdata(filename1,delimiterIn,headerlinesIn);
B = importdata(filename2,delimiterIn,headerlinesIn);

    
X0=A.data(:,1);
Y0=A.data(:,3);

X1=B.data(:,1);
Y1=B.data(:,3);

figure;
hold all;
plot(X0,Y0);
plot(X1,Y1);
xlabel('Time (s)');
ylabel('Current (A)')
legend('I_e','I_i')

