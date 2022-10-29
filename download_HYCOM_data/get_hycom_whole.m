clc
clear
close all
%
%% Access Data through OpenDAP
ncdisp('http://tds.hycom.org/thredds/dodsC/GOMl0.04/expt_32.5/2016/hrly');
filenc=('http://tds.hycom.org/thredds/dodsC/GOMl0.04/expt_32.5/2016/hrly');
% ========== Time - LON - LAT - Depth ==========
time=ncread(filenc,'MT');
% Obtain hourly index of dates of interest (start - end / 22-23-Jun 2016) 
first_hour=((datenum('2016-06-22')-datenum('2016-01-01'))*24)+1; % first hour of first day
last_hour=((datenum('2016-06-23')-datenum('2016-01-01'))*24)+24; % last hour of last day
dates=time(first_hour:last_hour);
lon=ncread(filenc,'Longitude'); lat=ncread(filenc,'Latitude');
depth=ncread(filenc,'Depth'); % 0, 5, 10, 15, 25, ... 5500 m
depth=single(depth(1:3)); % Get only first three layers
%% Creating the netCDF and
% ### storing the complete dataset in a single file
%% Select variables order Lon-Lat-Depth-Time
u=ncread(filenc,'u',[1 1 1 first_hour],[Inf Inf length(depth) length(dates)]);
v=ncread(filenc,'v',[1 1 1 first_hour],[Inf Inf length(depth) length(dates)]);
% Open the file
name_nc=['uv_0_10_hourly_whole.nc'];
%% netCDF
% Define the global attributes 
ncid = netcdf.create(name_nc,'CLOBBER');
varid = netcdf.getConstant('GLOBAL');
netcdf.putAtt(ncid,varid,'Original_source','http://tds.hycom.org/thredds/dodsC/GOMl0.04/expt_32.5/2016/hrly');
netcdf.putAtt(ncid,varid,'Convention','CF-1.0');
netcdf.putAtt(ncid,varid,'title','HYCOM GOM10.04');
netcdf.putAtt(ncid,varid,'developed_by','Naval Research Laboratory');
netcdf.putAtt(ncid,varid,'experiment','32.5');
netcdf.putAtt(ncid,varid,'extracted_by','Jesus C Compaire');
netcdf.putAtt(ncid,varid,'institution','CICESE');   
netcdf.putAtt(ncid,varid,'e-mail','jesus.canocompaire@uca.es');
% Define the dimensions
dimlon = netcdf.defDim(ncid,'lon',length(lon));
dimlat = netcdf.defDim(ncid,'lat',length(lat));
dimdepth = netcdf.defDim(ncid,'depth',length(depth));
dimtime = netcdf.defDim(ncid,'time',length(dates));
% Define IDs for the dimension variables (lon,lat, depth, time...)
longitude_ID=netcdf.defVar(ncid,'lon','double',dimlon);
latitude_ID=netcdf.defVar(ncid,'lat','double',dimlat);
depth_ID=netcdf.defVar(ncid,'depth','double',dimdepth);
time_ID=netcdf.defVar(ncid,'time','double',dimtime);
% Define the main variable (U)
u_ID = netcdf.defVar(ncid,'u','double',[dimlon dimlat dimdepth dimtime]);
v_ID = netcdf.defVar(ncid,'v','double',[dimlon dimlat dimdepth dimtime]);
% Define the attributes to each variable
netcdf.putAtt(ncid,latitude_ID,'standard_name','latitude');
netcdf.putAtt(ncid,latitude_ID,'units','degrees_north');
netcdf.putAtt(ncid,latitude_ID,'axis','Y');
netcdf.putAtt(ncid,longitude_ID,'standard_name','longitude');
netcdf.putAtt(ncid,longitude_ID,'units','degrees_north');
netcdf.putAtt(ncid,longitude_ID,'axis','X');
netcdf.putAtt(ncid,depth_ID,'standard_name','depth');
netcdf.putAtt(ncid,depth_ID,'units','m');
netcdf.putAtt(ncid,depth_ID,'positive','down');
netcdf.putAtt(ncid,depth_ID,'axis','Z');
netcdf.putAtt(ncid,time_ID,'standard_name','time');
netcdf.putAtt(ncid,time_ID,'units','days since 1900-12-31 00:00:00');
netcdf.putAtt(ncid,time_ID,'calendar','standard');
netcdf.putAtt(ncid,time_ID,'axis','T');
netcdf.putAtt(ncid,u_ID,'coordinates','Date');
netcdf.putAtt(ncid,u_ID,'standard_name','eastward_sea_water_velocity');
netcdf.putAtt(ncid,u_ID,'units','m/s');
netcdf.putAtt(ncid,u_ID,'_FillValue',1.267650600228229e+30);
netcdf.putAtt(ncid,u_ID,'long_name','u-veloc. [32.5H]')
netcdf.putAtt(ncid,v_ID,'coordinates','Date');
netcdf.putAtt(ncid,v_ID,'standard_name','northward_sea_water_velocity');
netcdf.putAtt(ncid,v_ID,'units','m/s');
netcdf.putAtt(ncid,v_ID,'_FillValue',1.267650600228229e+30);
netcdf.putAtt(ncid,v_ID,'long_name','v-veloc. [32.5H]')
% We are done defining the NetCdf
netcdf.endDef(ncid);
% Then store the dimension variables in
netcdf.putVar(ncid,longitude_ID,lon);
netcdf.putVar(ncid,latitude_ID,lat);
netcdf.putVar(ncid,depth_ID,depth);
netcdf.putVar(ncid,time_ID,dates);
% Then store my main variable
netcdf.putVar(ncid,u_ID,u);
netcdf.putVar(ncid,v_ID,v);
% We're done, close the netCDF
netcdf.close(ncid)
%
