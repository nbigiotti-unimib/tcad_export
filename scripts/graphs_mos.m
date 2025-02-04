
    % Chiudi tutte le figure aperte
    close all;
    
    %% ========================== IMPORT DATA ============================ %%
    % Leggi il file CSV
    filename = 'mos_iv_vds1v.csv';
    data = readmatrix(filename);
    
    % Estrai le colonne relative a corrente e tensione
    Current_ids_vgs = data(:, 2); % Corrente (prima colonna)
    Voltage_ids_vgs = data(:, 1); % Tensione (seconda colonna)

    data2 = readmatrix("mos_iv_vg2v.csv");
    
    % Estrai le colonne relative a corrente e tensione
    Current_ids_vds = data2(:, 2); % Corrente (prima colonna)
    Voltage_ids_vds = data2(:, 1); % Tensione (seconda colonna)
    
    %% ========================== PLOTTING ============================== %%
    % Creazione figura
    f1 = figure();
    f1.WindowState = 'normal';
    movegui('northeast');
    
    % Plot della caratteristica corrente-tensione
    plot(Voltage_ids_vgs , Current_ids_vgs , '-', 'LineWidth', 2, 'Color', 'b'); % Corrente in A
    
    % Titoli, assi e griglia
    title('Caratteristica Ids-Vgs del MOSFET');
    xlabel('V - [V]');
    ylabel('I - [A]');
    legend("VDS = 1V");
    grid on; 
    grid minor;
    
    % Miglioramento estetico del grafico
    set(gca, 'FontSize', 14);
    
    
    % Creazione figura
    f2 = figure();
    f2.WindowState = 'normal';

    % Plot della caratteristica corrente-tensione
    plot(Voltage_ids_vds , Current_ids_vds , '-', 'LineWidth', 2, 'Color', 'b'); % Corrente in A


    % Titoli, assi e griglia
    title('Caratteristica Ids - Vds del MOSFET');
    xlabel('V - [V]');
    ylabel('I - [A]');
    legend("VGS = 2V");
    grid on;

saveas(f1,"nmos_ids_vgs.png");
saveas(f2,"nmos_ids_vds.png");