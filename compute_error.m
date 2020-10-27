% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% function to compute the distance between the actual and estimated coordinates
% this determines the error of distance
% actual_coord: actual coordinates of source node A(n,2)
% estimated_coord: estimated coord of source node B(n,2)

function[error]=compute_error(actual_coord,estimated_coord)
for i=1:size(actual_coord, 1);
% error is basically the euclidean distance between actual and estimated coordinates
% euclidean distance is calculated used already defined eucliean function
    error(i) = eucl_dist(actual_coord(i, 1), actual_coord(i,2), estimated_coord(i,1), estimated_coord(i,2));
end;
    