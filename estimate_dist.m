% 17BEC0084 Shambhavi Awasthi
% 17BEC0619 Viraj Chokhany
% wmc project B1 slot

% function to estimate distances from the source to the anchor nodes using the lognomal path loss model
% rss: vector of RSS from 4 anchor nodes
% noise: noise values for 4 anchors
% alpha: path loss exponent
% P_0: reference power at reference distance (dB)
% d_0: reference distance (m)
% returns the estimated distance

function[estimated_dist]=estimate_dist(rss, noise, alpha, P_0, d_0)
for i = 1:4;
	estimated_dist(i) = 10^((P_0+noise(i)-rss(i))/(10*alpha))*d_0;
end;