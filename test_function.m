% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% Function to test an estimation function on a specific mobility pattern
% Testing the estimation function passed in parameter as a function handle with the mobility pattern also specified as a function handle.
% Returns a vector containing the various amount of error in the estimation of the position

function [ errors ] = test_function( estimation_function, mobility_pattern,base_stations, mob_pattern_parameters, alpha, mu, sigma, P_0, d_0 )
    anchors_x = base_stations(:, 1); % x-coordinates for anchors ( known base stations )
    anchors_y = base_stations(:, 2); % y-coordinates for anchors ( known base stations )
    [ mobile_x, mobile_y, s ] = mobility_pattern(mob_pattern_parameters{:}); % from mobility pattern functions
    nb_positions = size(mobile_x, 2); % assigns number of columns in mobile_x
    nb_base_stations = size(base_stations, 1); % assigns number of rows in base stations i.e number of anchor nodes
    estimated_coord = zeros(nb_positions, 2); % assigns number of columns in nb_positions
    
    % for each source node compute the distance to the anchors, estimate rss 
    % estimate distance from rss, estimate coordinates using the algorithms

    for i = 1:nb_positions
        %compute distances to the anchors for each source node
        dist = compute_dist(anchors_x, anchors_y, mobile_x(1,i), mobile_y(1,i));

        %estimate the rss for each source node
        rss = compute_rss(dist, set_noise(mu, sigma, nb_base_stations), alpha, P_0, d_0);

        %estimate distances to the anchor nodes based on the rss vector
        estimated_dist = estimate_dist(rss, set_noise(mu, sigma, nb_base_stations), alpha, P_0, d_0);

        %estimate the coordinates using the estimation function
        %i.e LLS and WLS
        estimated_coord(i, :) = estimation_function(base_stations, estimated_dist);
    end;

    % create matrix of size (n,2) storing actual coordinates for n points
    % horzcat : concatenate vectors horizontally
    actual_coord = horzcat(mobile_x(:), mobile_y(:));

    %compute error vector
    errors = compute_error(actual_coord, estimated_coord);    
    
end

