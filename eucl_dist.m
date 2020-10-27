% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% This function computes euclidean distance between two points
% x1, y1 coordinates of the first point
% x2, y2 coordinates of the second point
% return distance between (x1,y1) and (x2,y2)

function[dist] = eucl_dist(x1, y1, x2, y2)
dist = sqrt((x1-x2)^2+(y1-y2)^2); % distance formula 2D
