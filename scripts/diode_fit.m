% Chiudi tutte le figure aperte
close all;
q = 1.60217663e-19;
k = 1.380649e-23;
T = 300;

data = readmatrix('../data/Zener.csv');
    
% Estrai le colonne relative a corrente e tensione
Current_zenon = -data(:, 1); % Corrente (prima colonna)
Voltage_zenon = -data(:, 2); % Tensione (seconda colonna)

start = 165;
stop = 260;

fit_out = fit(Voltage_zenon(start:stop) , log(Current_zenon(start:stop)) , 'poly1')


Vt = k*T/q;
n = fit_out.p1/Vt;
I0 = exp(fit_out.p2/fit_out.p1);


f2 = figure();
f2.WindowState = 'normal';
movegui('northeast');

% Plot della caratteristica corrente-tensione
plot(Voltage_zenon(start:stop) , Current_zenon(start:stop) , '-', 'LineWidth', 2, 'Color', 'b'); % Corrente in A
hold on;
vd = 0.1:0.01:0.5;
id = I0*exp(vd/(n*25.852e-3));
plot(vd , id);


% Titoli, assi e griglia
title('Fit I-V del Diodo Zener');
xlabel('V - [V]');
ylabel('I - [mA]');
grid on; 
grid minor;

% Miglioramento estetico del grafico
set(gca, 'FontSize', 14);

fprintf("diode params:\n\tn = %f\n\tI0 = %f" , n , I0);