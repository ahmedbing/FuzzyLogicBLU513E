clear all;
clc;

RobotData = readtable('Robot_Data.csv');

%Filling Empty NaN Value for missing data 
%Before feed to ANFIS
FilledX = fillmissing(RobotData.X,'linear');
FilledY= fillmissing(RobotData.Y,'linear');
FilledTheta = fillmissing(RobotData.Theta , 'linear');

Filled_Dest_X = fillmissing(RobotData.X_Dest , 'previous');
Filled_Dest_X = fillmissing(Filled_Dest_X , 'next');

Filled_Dest_Y = fillmissing(RobotData.Y_Dest , 'previous');
Filled_Dest_Y = fillmissing(Filled_Dest_Y , 'next');

Filled_Lin_Vel = fillmissing(RobotData.Lin_Vel,'linear');
Filled_Ang_Vel = fillmissing(RobotData.Ang_Vel,'linear');

RobotData.X = FilledX;
RobotData.Y = FilledY;
RobotData.Theta = FilledTheta;
RobotData.X_Dest = Filled_Dest_X;
RobotData.Y_Dest = Filled_Dest_Y;
RobotData.Lin_Vel = Filled_Lin_Vel;
RobotData.Ang_Vel = Filled_Ang_Vel;

RobotTable1 = RobotData(1:30000,2:7); 
LinearVelocity= RobotTable1{:,:};
RobotTable2 = [RobotData(1:30000,2:6) , RobotData(1:30000,7)]; 
AngularVelocity= RobotTable2{:,:};
