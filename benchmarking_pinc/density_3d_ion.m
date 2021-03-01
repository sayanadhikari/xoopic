
clc;clear all;close all;
filename1 = 'den_N_gradB100_N.txt';
delimiterIn = '\t';
headerlinesIn = 2;
A = importdata(filename1,delimiterIn,headerlinesIn);

    
    X0=A.data(:,1);
    Y0=A.data(:,3);
    Z0=A.data(:,5);
    X1=zeros(1,129);
    Y1=zeros(1,65);
    
    j=1;
    lx=length(X0);
    for i=1:1:129
        X1(i)=X0(j);
        j=j+65;
    end
    k=1;
    for i=1:1:65
        Y1(i)=Y0(k);
        k=k+1;
    end
	index1 = find(Z0>1E18);
    Z0(index1)=NaN;
	
    Z1=reshape(Z0,65,129);
    [X,Y]=meshgrid(X1',Y1');
    figure(1);
    contourf(X,Y,Z1,1000,'EdgeColor','none');
    
    %%%%%%%%%%%%%%%%% OBJECT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    rectangle('Position',[0 -0.02 0.12 0.02],'EdgeColor','b','FaceColor','w') %ANODE LOWER
    rectangle('Position',[0.0 0.06 0.12 0.02],'EdgeColor','b','FaceColor','w') %ANODE UPPER

    rectangle('Position',[0.10 0.0 0.02 0.025],'EdgeColor','r','FaceColor','#7E2F8E') %DIE LOWER
    rectangle('Position',[0.10 0.035 0.02 0.025],'EdgeColor','r','FaceColor','#7E2F8E') %DIE UPPER

    rectangle('Position',[0.10 0.025 0.02 0.01],'EdgeColor','k','FaceColor','k') %CATHODE
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     zlim([-1000 200])
    grid on;
    xlabel('x[m]');
    ylabel('y[m]');
    title('Ion Density');
    colormap(jet);colorbar;
    
    figure(2);
    surf(X,Y,Z1,'EdgeColor','none');
%   %%%%%%%%%%%%%%%%% OBJECT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    rectangle('Position',[0 -0.02 0.12 0.02],'EdgeColor','b','FaceColor','w') %ANODE LOWER
    rectangle('Position',[0.0 0.06 0.12 0.02],'EdgeColor','b','FaceColor','w') %ANODE UPPER

    rectangle('Position',[0.10 0.0 0.02 0.025],'EdgeColor','r','FaceColor','#7E2F8E') %DIE LOWER
    rectangle('Position',[0.10 0.035 0.02 0.025],'EdgeColor','r','FaceColor','#7E2F8E') %DIE UPPER

    rectangle('Position',[0.10 0.025 0.02 0.01],'EdgeColor','k','FaceColor','k') %CATHODE
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    grid on;
    xlabel('x[m]');
    ylabel('y[m]');
    zlabel('Ion Density');
    colormap(jet);colorbar;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
