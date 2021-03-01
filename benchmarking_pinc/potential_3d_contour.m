
clc;clear all;close all;
filename1 = 'avg_potential_v2.txt';
delimiterIn = '\t';
headerlinesIn = 2;
A = importdata(filename1,delimiterIn,headerlinesIn);

    
    X0=A.data(:,1);
    Y0=A.data(:,3);
    Z0=A.data(:,5);
    X1=zeros(1,129);
    Y1=zeros(1,129);
    
    j=1;
    lx=length(X0);
    for i=1:1:129
        X1(i)=X0(j);
        j=j+129;
    end
    k=1;
    for i=1:1:129
        Y1(i)=Y0(k);
        k=k+1;
    end
	
% 	index1 = find(Z0<=-1000);
%     Z0(index1)=-1000;

	
    Z1=reshape(Z0,129,129);
    [X,Y]=meshgrid(X1',Y1');
    figure(1);
%     contourf(X,Y,Z1,'ShowText','on');
   contourf(X,Y,Z1,1000,'EdgeColor','none');
    grid on;
    xlabel('x[m]');
    ylabel('y[m]');
    zlabel('Potential');
    colormap(jet);colorbar;
    
    figure(2);
    surf(X,Y,Z1,'EdgeColor','none');
%     zlim([-1000 200])
    grid on;
    xlabel('x[m]');
    ylabel('y[m]');
    zlabel('Potential');
    colormap(jet);colorbar;
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
