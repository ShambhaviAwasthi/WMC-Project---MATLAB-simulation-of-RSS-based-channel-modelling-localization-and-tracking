% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% Function to compute the estimated position of a mobile device using LLS
% base_stations: coordinates of known base stations, one coordinate per line
% distances: estimated distance to each base station, one per column
% Returns the estimated x and y coordinates of the mobile device

function x = lls( base_stations, distances )
    n = size(distances, 2); % size of distances for dimension 2
    b = zeros([n-1, 1]); % Preallocate the array
    h = base_stations(2:n, 1:2) * 2; % leaving first coordinate for base station 1
    ht = transpose(h);
    % Compute vector b
    for i = 2:n;
        b(i-1) = (base_stations(i, 1) ^ 2) + (base_stations(i, 2) ^ 2)- (distances(i) ^ 2) + (distances(1) ^ 2);
    end
    % Compute the estimated location relative to base_station 1 and translate in absolute coordinates.
    % ht * h \ ht is equivalent to inv(ht * h) * ht
    x = transpose(((ht * h) \ ht) * b) + base_stations(1, 1:2);
end

