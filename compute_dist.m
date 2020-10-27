% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% Function to compute Euclidean distance from the source to 4 anchor nodes
% a_x: x coordinates of the anchors
% a_y: y coordinates of the anchors
% s_x: x coordinate of the source
% s_y: y coordinate of the source

function[dist] = compute_dist(a_x, a_y, s_x, s_y)
for i = 1:4;
    dist(i) = eucl_dist(s_x, s_y, a_x(i), a_y(i)); 
end;