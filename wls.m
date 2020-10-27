% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% Function to compute the estimated position of a mobile device using WLS
% base_stations: coordinates of known base stations, one coordinate per line
% distances: estimated distance to each base station, one per column
% Returns the estimated x and y coordinates of the mobile device

function x = wls(base_stations, distances)
% these steps are similar to LLS
    n = size(distances, 2); % compute alpha
    b = zeros([n-1, 1]); % Preallocate the array
    H = base_stations(2:n, 1:2) * 2;
    % Compute vector b
    for i = 2:n;
        b(i-1) = (base_stations(i, 1) ^ 2) + (base_stations(i, 2) ^ 2)- (distances(i) ^ 2) + (distances(1) ^ 2);
    end
    
    % compute WLS
    S = zeros([n-1, n-1]); % allocating (n-1) X (n-1) matrix
    for i = 1:n-1;
        for j = 1:n-1;
            var = distances(1)^4; % Computes the variance for every distance
            if i == j;
                var = distances(1)^4 + distances(i+1)^4; % The variances for the diagonal of the matrix is different
            end;
            S(i,j) = var;
        end;
    end;
    x = transpose(((transpose(H) * (S \ H)) \ transpose(H)) * (S \ b));
end