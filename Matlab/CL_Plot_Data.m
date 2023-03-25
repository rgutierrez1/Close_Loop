%% CL_Plot_Data% load tables

clear variables; clc;
addpath(genpath('/Users/rodrigo/Analisis_Gutierrez/'));
addpath(genpath('/Users/rodrigo/MATLAB_Repository/Close_Loop'));
cd '/Users/rodrigo/Analisis_Gutierrez/';

%%

% Define how to read csv files and preserve headers
T = readtable ("Paciente23.csv",'Delimiter','comma','VariableNamingRule',...
            'preserve','VariableNamesLine',1);
%%
T.Conflict(:) = NaN;

for k=1:size(T,1)
    if T.BIS(k) > 60 && T.SEF(k) < 10
        T.Conflict(k) = 1;
    elseif T.BIS(k) < 40 && T.SEF(k) > 14
        T.Conflict(k) = 1;
    else
        T.Conflict(k) = 0.5;
    end
end

%%

subplot(8,1,1)
plot(T.("Fecha Hora"),T.("I Propo"), 'LineWidth',2)
hold on
plot(T.("Fecha Hora"), T.("I Midazo"), 'LineWidth',2)
ylim([0 4])
for k=1:size(T,1)
    TF = isnan(T.("B Propo")(k));
    if TF == 0
        xline(T.("Fecha Hora")(k), 'LineWidth',1, 'Alpha',0.5)
    else
    end
end
ylabel({"Propofol";"(mg/k/h)"}, 'FontSize',10, 'FontWeight','bold')
hold off
% Pending to add Boluses

subplot(8,1,2)
plot(T.("Fecha Hora"),T.("I Fenta"), 'LineWidth',2)
ylim([0 4])
ylabel({"Fentanyl"; "(mcg/k/h)"}, 'FontSize',10, 'FontWeight','bold')

subplot(8,1,3)
plot(T.("Fecha Hora"),T.("SAS"), 'LineWidth',2)
ylim([0 6])
yline(2, 'LineStyle','--','LineWidth',1.5)
ylabel("SAS", 'FontSize',10, 'FontWeight','bold')

subplot(8,1,4)
plot(T.("Fecha Hora"),T.("BIS"), 'LineWidth',2, 'Color',"#7E2F8E")
ylim([0 100])
ylabel("BIS", 'FontSize',10, 'FontWeight','bold')
yline([40 60], 'LineStyle','--','LineWidth',1.5, 'Color', "#7E2F8E")

subplot(8,1,5)
plot(T.("Fecha Hora"),T.("SEF"), 'LineWidth',2, 'Color',"#77AC30")
ylim([0 30])
ylabel("SEF (Hz)", 'FontSize',10, 'FontWeight','bold')
yline(10, 'LineStyle','--','LineWidth',1.5, 'Color', "#77AC30")

subplot(8,1,6)
plot(T.("Fecha Hora"),T.("SR"), 'LineWidth',2, 'Color',"#A2142F")
ylim([0 20])
ylabel("SR", 'FontSize',10, 'FontWeight','bold')
yline(2, 'LineStyle','--','LineWidth',1.5, 'Color', "#A2142F")

subplot(8,1,7)
plot(T.("Fecha Hora"),T.("Qualy"), 'LineWidth',2, 'Color',"#0000FF")
ylim([0 100])
ylabel("Signal Quality", 'FontSize',10, 'FontWeight','bold')
yline(90, 'LineStyle','--','LineWidth',1.5, 'Color', "#0000FF")

subplot(8,1,8)
plot(T.("Fecha Hora"),T.("Conflict"), 'LineWidth',2, 'Color',"#0000FF")
ylim([0 2])
ylabel({"BIS and SEF"; "conflict"}, 'FontSize',10, 'FontWeight','bold')
yline(90, 'LineStyle','--','LineWidth',1.5, 'Color', "#0000FF")

sgtitle('Paciente 23', 'Fontweight', 'bold')

fig = gcf;
fig.Position(3:4)=[1500,950];
filename = 'Paciente_23.jpg';
saveas(gcf,filename)
