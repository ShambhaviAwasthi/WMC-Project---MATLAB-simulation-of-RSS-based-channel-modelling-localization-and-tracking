% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

clc
close all

% Defining all the parameters for the functions
% Estimation functions list
estimation_functions = {@lls @wls};

% Mobility patterns
mob_patterns = {@random @straight_line @square};

% Specific parameters relative to each mobility pattern
mob_patterns_parameters = {
    { 100 } % random(nb_locations) 
    { 200 } % linear(nb_locations)
    { } % square()
};

% Coordinates of the anchor nodes ie. 4 here in the setup
base_stations = [
    0, 0;
    0, 1000;
    1000, 1000;
    1000, 0
];

% Noise parameters
mu = 0;
sigma = 1;

% Path loss exponent (dB)
alpha = 3;

% Reference power at reference distance (dB)
P_0 = -10;

% Reference distance (m)
d_0 = 1;

% Map each function name to the parameters that we need to pass
% container.Map function maps the value to the keys
% mapping the mobility pattern to its mobility pattern parameters
% return [x,y,s]
mob_patterns_parameters_map = containers.Map(cellfun(@(x) func2str(x), mob_patterns, 'UniformOutput', false),mob_patterns_parameters);
% A cell array is a data type with indexed data containers called cells, where each cell can contain any type of data
errors = cell(size(mob_patterns, 2) * size(estimation_functions, 2));

i = 1;
% finding localization errors
for mob_pattern = mob_patterns;
    for estimation_function = estimation_functions;
        for filter = filters;
            errors{i} = test_function(estimation_function{1}, mob_pattern{1},base_stations, mob_patterns_parameters_map(func2str(mob_pattern{1})), alpha, mu, sigma, P_0, d_0);
            i = i + 1;
        end;
    end;
end;

% Graph plotting
% 2 figures containing many subplots
close all
nb_est_func = size(estimation_functions, 2);
nb_mob_patterns = size(mob_patterns, 2);

% Colormap
cc = lines(max(nb_est_func, nb_mob_patterns));

figure('Name', 'Estimation functions - 17BEC0084 17BEC0619')
for i = 1:nb_est_func;
        subplot(nb_est_func ,1,i)
        for k = 1:nb_mob_patterns;
            h = cdfplot(errors{(i -1)+ (k -1) * nb_est_func+j});
            set(h,'LineWidth',1.5, 'DisplayName', func2str(mob_patterns{k}), 'Color', cc(k, :))
            hold on
        end
        hold off
        xlabel('Localization error')
        ylabel('CDF')
        legend('show')
        axis([0 450 0 1.2])
        title(strcat(func2str(estimation_functions{i}),' estimation function - 17BEC0084 17BEC619'))
end

figure('Name', 'Mobility patterns - 17BEC0084 17BEC0619')
for i = 1:nb_mob_patterns
    subplot(nb_mob_patterns, 1, i)
    for j = 1:nb_est_func
            h = cdfplot(errors{(i -1) * nb_est_func + (j -1)+ 1});
            set(h, 'LineWidth',1.5,'DisplayName',func2str(estimation_functions{j}), 'Color', cc((j -1)+1, :))
            hold on
    end
    hold off
    xlabel('Localization error')
    ylabel('CDF')
    legend('show')
    axis([0 450 0 1.2])
    title(strcat(func2str(mob_patterns{i}),' mobility pattern - 17BEC0084 17BEC619'))
end