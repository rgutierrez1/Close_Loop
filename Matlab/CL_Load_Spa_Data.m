%% Read CSV Spa Data
% load tables

clear variables; clc;
addpath(genpath('/Users/rodrigo/Analisis_Gutierrez/'));
addpath(genpath('/Users/rodrigo/MATLAB_Repository/Close_Loop'));
cd '/Users/rodrigo/Analisis_Gutierrez/';

%%

% Define how to read csv files and preserve headers
T = readtable ("Paciente18.csv",'Delimiter','comma','VariableNamingRule',...
            'preserve','VariableNamesLine',1);
%%
for k=19:50
    filename = ['Paciente' num2str(k) '.csv'];
    if exist(filename,"file") 
        T_temp = readtable (filename,'Delimiter','comma','VariableNamingRule',...
            'preserve','VariableNamesLine',1);
        T = vertcat(T,T_temp);
    else
    end
end
%% histogram of quality

nbins = 20;
subplot(1,3,1)
h = histogram(T.Qualy1,nbins);
x = h.BinEdges;
y = h.Values;
text(x(1:end-1),y,num2str(y'),'vert','bottom','horiz','center'); 
box off
% ylim ([0 2000])
ylabel('Count')
xlabel('Quality Index')
title('Qualy 1')

subplot(1,3,2)
h = histogram(T.Qualy2,nbins);
x = h.BinEdges;
y = h.Values;
text(x(1:end-1),y,num2str(y'),'vert','bottom','horiz','center'); 
box off
% ylim ([0 2000])
ylabel('Count')
xlabel('Quality Index')
title('Qualy 2')

subplot(1,3,3)
h = histogram(T.Qualy3,nbins);
x = h.BinEdges;
y = h.Values;
text(x(1:end-1),y,num2str(y'),'vert','bottom','horiz','center'); 
box off
% ylim ([0 2000])
ylabel('Count')
xlabel('Quality Index')
title('Qualy 3')

sgtitle('Quality Index', 'Fontweight', 'bold', 'Color','red')

%% histogram of BIS

nbins = 20;
subplot(1,2,1)
h = histogram(T.Bis1,nbins);
x = h.BinEdges;
y = h.Values;
text(x(1:end-1),y,num2str(y'),'vert','bottom','horiz','center'); 
box off
% ylim ([0 400])
ylabel('Count')
xlabel('BIS')
title('BIS 1')

subplot(1,2,2)
h = histogram(T.Bis3,nbins);
x = h.BinEdges;
y = h.Values;
text(x(1:end-1),y,num2str(y'),'vert','bottom','horiz','center'); 
box off
% ylim ([0 400])
ylabel('Count')
xlabel('BIS')
title('BIS 3')


sgtitle('BIS', 'Fontweight', 'bold', 'Color','red')
%% histogram of SR and SEF

nbins = 20;
subplot(1,2,1)
h = histogram(T.Supre1,nbins);
x = h.BinEdges;
y = h.Values;
text(x(1:end-1),y,num2str(y'),'vert','bottom','horiz','center'); 
box off
% ylim ([0 1000])
ylabel('Count')
xlabel('SR')
title('SR')

subplot(1,2,2)
h = histogram(T.Sef951,nbins);
x = h.BinEdges;
y = h.Values;
text(x(1:end-1),y,num2str(y'),'vert','bottom','horiz','center'); 
box off
% ylim ([0 400])
ylabel('Count')
xlabel('SEF 95')
title('SEF')


sgtitle('SR and SEF95', 'Fontweight', 'bold', 'Color','red')