% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% function to generate random mobility patterns
% it returns two vectors  Xs and Ys for the source nodes

function [ s_x, s_y, s ] = random( nb_locations )
    s = 1;
    % generating vector of x coordinates of the source nodes Xs
    s_x = randi([1,999], 1, nb_locations); % generates vector for nb_locations randomly from 1-999
    % generating vector of y coordinates of the source nodes Ys
    s_y = randi([1,999], 1, nb_locations); % generates vector for nb_locations randomly from 1-999
end

