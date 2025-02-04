
    % Chiudi tutte le figure aperte
    close all;
    
    %% ========================== IMPORT DATA ============================ %%
    % Leggi il file CSV
    filename = 'zenon.csv';
    data = readmatrix(filename);
    
    % Estrai le colonne relative a corrente e tensione
    Current_zenon = data(:, 2); % Corrente (prima colonna)
    Voltage_zenon = data(:, 1); % Tensione (seconda colonna)

    data2 = readmatrix("zenoff.csv");
    
    % Estrai le colonne relative a corrente e tensione
    Current_zenoff = flip(data2(:, 2)); % Corrente (prima colonna)
    Voltage_zenoff = flip(data2(:, 1)); % Tensione (seconda colonna)
    
    %% ========================== PLOTTING ============================== %%
    % Creazione figura
    f1 = figure();
    f1.WindowState = 'normal';
    movegui('northeast');
    
    % Plot della caratteristica corrente-tensione
    plot([Voltage_zenoff ; Voltage_zenon] , [Current_zenoff ; Current_zenon] , '-', 'LineWidth', 2, 'Color', 'b'); % Corrente in A
    hold on;
    
    % Titoli, assi e griglia
    title('Caratteristica I-V del Diodo Zener');
    xlabel('V - [V]');
    ylabel('I - [A]');
    grid on; 
    grid minor;
    
    % Miglioramento estetico del grafico
    set(gca, 'FontSize', 14);
    
    saveas(f1,"zen_sim.png");