% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% linear mobility pattern generating function for source nodes
% nb_locations = 200

function [ x, y, s ] = straight_line ( nb_locations )
    x = zeros(1, nb_locations);
    y = zeros(1, nb_locations);
    p = 1000/nb_locations; % 1000 source nodes
    for i = 1:nb_locations;
        x(i) = i * (p); % x-coordinate
        y(i) = i * (p); % y-coordinate
    end;
    s = sqrt(1000 / nb_locations);
end

