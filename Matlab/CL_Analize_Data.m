%% CL_Analize_Data
clear variables; clc;
addpath(genpath('/Users/rodrigo/Dropbox (Partners HealthCare)/rBIS/Data_Inspection/'));
addpath(genpath('/Users/rodrigo/MATLAB_Repository/Close_Loop'));
cd '/Users/rodrigo/Dropbox (Partners HealthCare)/FONDEF_ID21I10193/Data_Inspection';

%%
% idx = T.Qualy1 >= 0.8 & T.Supre1 <= 2;
idx = T.Qualy1 >= 0.8;
newTbl = T(idx,:);

%%
subplot(1,2,1)
plot(T.Sef951,T.Bis1,'o')
ylabel('BIS', 'FontSize',14)
xlabel('SEF95', 'FontSize',14)
title('All Data', 'FontSize',16)

subplot(1,2,2)
plot(newTbl.Sef951,newTbl.Bis1, 'o')
ylabel('BIS', 'FontSize',14)
xlabel('SEF95', 'FontSize',14)
title('Excluding Qualy < 80 and SR >2', 'FontSize',16)

%% BIS vs SEF lm

mdl = fitlm(newTbl.Sef951,newTbl.Bis1);

%%
plot(mdl)
hold on
ylabel('BIS', 'FontSize',14)
xlabel('SEF95', 'FontSize',14)
title('Excluding Qualy < 80 and SR >2', 'FontSize',16)
p_value = 'p < 0.001';
text(25,30,p_value,"FontSize",14)
hold off

%% TS vs SEF
subplot(1,2,1)
plot(T.Sef951,T.Supre1,'o')
ylabel('SR', 'FontSize',14)
xlabel('SEF95', 'FontSize',14)
title('All Data', 'FontSize',16)

subplot(1,2,2)
plot(newTbl.Sef951,newTbl.Supre1, 'o')
ylabel('SR', 'FontSize',14)
xlabel('SEF95', 'FontSize',14)
title('Excluding Qualy < 80', 'FontSize',16)

%%
mdl = fitlm(newTbl.Sef951,newTbl.Supre1);

p_value = mdl.Coefficients.pValue(2);

plot(mdl)
hold on
ylabel('SR', 'FontSize',14)
xlabel('SEF95', 'FontSize',14)
title('Excluding Qualy < 80', 'FontSize',16)
p_value = num2str(p_value);
text(25,30,p_value,"FontSize",14)
hold off

%% TS vs BIS
plot(newTbl.Bis1,newTbl.Supre1, 'o')
ylabel('SR', 'FontSize',14)
xlabel('BIS', 'FontSize',14)
title('Excluding Qualy < 80', 'FontSize',16)