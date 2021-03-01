clc; clearvars;
% ******************************
% General physical parameters
% ******************************

  Q 		= 1.60217662e-19;
  mAr 		= 6.6335209E-26;
  mH        = 1.6735575E-27;
  mE 		= 9.11E-31;
  speedLight= 2.9979e8;
  PI 		= 3.14;
  EPS0      = 8.85418782e-12;
  KB        = 1.38064852E-23;

  PLA_DEN	= 1E9;
  Ni      	= PLA_DEN;
  Ne 		= 1.0 * PLA_DEN;
  Nn        = 1E9;  %Neutral Density
  TeSI      = 123113;
  TiSI      = 12311;
  TnSI      = 12311; %Neutral Temperature
  PLASMA_FREQ_E = sqrt((Ne*Q*Q)/(EPS0*mE))/(2*PI);
  DL        = sqrt((TeSI*KB*EPS0)/(Ne*Q*Q));  %Debye Length
  ds        = DL;
  SYS_LEN   = 0.3265;  %in terms of DL
  
%   ds        = 0.005 * speedLight / PLASMA_FREQ_E;

  Total_runtime = 12 ; %in MiliSecond

%   fprintf('Electron Plasma Frequency= %e\n',wpe);
  fprintf('Electron Plasma Frequency Analytic= %e\n',PLASMA_FREQ_E);
  fprintf('Neutral Pressure= %e\n',Nn*KB*TnSI);
  
% *************************
% 	Grid parameters
% *************************
  Nx = 128;
  Ny = 128;
  dx =  (SYS_LEN*ds)/Nx;
  dy =  (SYS_LEN*ds)/Ny;
  Lx =  SYS_LEN*ds;
  Ly =  SYS_LEN*ds;

  simulationVolume = Lx * Ly;
  numCells         = Nx * Ny;

  
% ******************************
%	DEVICE PARAMETERS
% ******************************

  RADIUS = 0.5;   %in meter
  LENGTH = 1.5;    %in meter
  ORIGX = 0.0;
  ORIGY = 0.0;

  PROBE_LOC = 1.0;

% *************************
%	PLASMA SOURCE
% *************************

  SOURCE_RAD = RADIUS;
  SOURCE_DIA = 2*SOURCE_RAD;
  BEAM_CURRENT_DENSITY = 31E-5;  % in Amp/m2
  BEAM_CURRENT = BEAM_CURRENT_DENSITY*0.5*RADIUS;
  MAGFIELDSTRENGTH = 0; %1E-8  % in Tesla
  DRIFTI = 6.0191e+03; %1E5  % m/se
  DRIFTE = 1.6242e+06; %1E6  % m/s
  TI = 12311;    %6.0191e+03;  % m/s  sqrt(2*(Ti*Q)/mAr)
  TE = 123113;   %1.6242e+06;   % m/s sqrt(2*(Ti*Q)/mE)


%RF SOURCE PARAMETERS
%RF_POWER = 20   %Watt
%omega =  200E6 % in Hz
%phi = pi/4 % radian
%sinusoidalAmpV = RF_POWER/BEAM_CURRENT    %2000  in VOLT




% *************************
% streaming electrons
% *************************
  totalNumElectrons    = Ne * simulationVolume;
  numElectronsPerCell  = 15;
  numElectronPtcls     = numElectronsPerCell * numCells;
  electronNumRatio     = totalNumElectrons / numElectronPtcls;
  electronVelocityMKS  = DRIFTE;
  peakCurrentElectrons = Q * Ne * SOURCE_DIA * electronVelocityMKS;
  fprintf('electron Num Ratio= %e\n',electronNumRatio);
  fprintf('peak Current Electrons= %e\n',peakCurrentElectrons);

% *************************
% streaming ions
% *************************
  totalNumIons   = Ni * simulationVolume;
  numIonsPerCell = 15;
  numIonPtcls    = numIonsPerCell * numCells;
  ionNumRatio    = totalNumIons / numIonPtcls;
  IonVelocityMKS = DRIFTI;
  peakCurrentIons = Q * Ni * SOURCE_DIA * IonVelocityMKS;
  fprintf('ion Num Ratio= %e\n',ionNumRatio );
  fprintf('peak Current Ions = %e\n',peakCurrentIons);

%   d = 1. / sqrt( 1./(dx*dx) + 1./(dy*dy) );
%   timeStep = 0.5 * d / electronVelocityMKS;
  timeStep = 0.1*(((dx/DL)/(PLASMA_FREQ_E)));
  
  fprintf('time Steps = %e\n',timeStep);
  
  TotaltimeSteps = (Total_runtime*1E-3)/timeStep;
  fprintf('Total time Steps = %f\n',round(TotaltimeSteps));
  fprintf('Dumping period = %f\n',round(round(TotaltimeSteps)/400));