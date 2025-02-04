
    % Chiudi tutte le figure aperte
    close all;

    q = 1.60217663e-19;
    k = 1.380649e-23;
    T = 300;

    
    %% ========================== IMPORT DATA ============================ %%
    % Leggi il file CSV
    data = readmatrix('../data/zenon.csv');
    
    % Estrai le colonne relative a corrente e tensione
    Current_zenon = data(1:22, 2); % Corrente (prima colonna)
    Voltage_zenon = data(1:22, 1); % Tensione (seconda colonna)

    data2 = readmatrix("../data/zenoff.csv");
    
    % Estrai le colonne relative a corrente e tensione
    Current_zenoff = flip(data2(:, 2)); % Corrente (prima colonna)
    Voltage_zenoff = flip(data2(:, 1)); % Tensione (seconda colonna)
    
    %% ========================== PLOTTING ============================== %%
    % Creazione figura
    f1 = figure();
    f1.WindowState = 'normal';
    movegui('northeast');
    
    % Plot della caratteristica corrente-tensione
    plot([Voltage_zenoff ; Voltage_zenon] , [Current_zenoff ; Current_zenon]*1e3 , '-', 'LineWidth', 2, 'Color', 'b'); % Corrente in A
    
    
    % Titoli, assi e griglia
    title('Caratteristica I-V del Diodo Zener');
    xlabel('V - [V]');
    ylabel('I - [mA]');
    grid on; 
    grid minor;
    
    % Miglioramento estetico del grafico
    set(gca, 'FontSize', 14);

    fit_out = fit(Voltage_zenon(20:length(Voltage_zenon)) , log(Current_zenon(20:length(Voltage_zenon))) , 'poly1')



    n = fit_out.p1*k*T/q
    I0 = exp(fit_out.p2/fit_out.p1)

    f2 = figure();
    f2.WindowState = 'normal';
    movegui('northeast');
    
    % Plot della caratteristica corrente-tensione
    plot(Voltage_zenon(20:length(Voltage_zenon)) , log(Current_zenon(20:length(Voltage_zenon))) , '-', 'LineWidth', 2, 'Color', 'b'); % Corrente in A
    hold on;
    plot(fit_out);
    

    % Titoli, assi e griglia
    title('Fit I-V del Diodo Zener');
    xlabel('V - [V]');
    ylabel('I - [mA]');
    grid on; 
    grid minor;
    
    % Miglioramento estetico del grafico
    set(gca, 'FontSize', 14);





    
    saveas(f1,"../img/zen_sim.png");