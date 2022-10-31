% A MATLAB script to download hourly HYCOM data via OpenDAP and store them
% as ncfiles separately (get_hycom_individual.m) or combined into a single one
% (get_hycom_whole.m).
% Source of HYCOM data: https://www.hycom.org/data/goml0pt04/expt-32pt5
% This product has 12 variables (see details in the link above).
% In these scripts, we will get the data from the horizontal components of the
% velocity ('u', 'v'):
%   'u' = eastward_sea_water_velocity
%   'v' = northward_sea_water_velocity 
