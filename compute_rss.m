% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% Function to compute the received signal strength from the path loss model
% The received signal strength (RSS) is the strength of a received signal measured at the receiver's antenna. 
% for 4 signals transmitted from the source node to the anchor nodes
% for a radio signal travelling from a source node to four anchor nodes
% dist: vector containing distances from source to 4 anchors
% noise: vector of normally distributed random variables that models the shadowing phenomenon
% noise is computed from noise function
% distance is computed from euclidean distance function
% alpha: path loss exponent 
% P_0: reference power at reference distance d_0
% d_0: reference distance

function[rss]=compute_rss(dist, noise, alpha, P_0, d_0)
for i=1:4;
	rss(i) = P_0 - (10*alpha*log10(dist(i)/d_0)) + noise(i);
end;