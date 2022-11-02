## A MATLAB script to download hourly HYCOM data via OpenDAP and store them as netCDF files separately *(get_hycom_individual.m)* or combined into a single one *(get_hycom_whole.m)*.

Source of HYCOM data: https://www.hycom.org/data/goml0pt04/expt-32pt5
This product has 12 variables (see details in the link above).
In these scripts, we will get the data from the horizontal components of the velocity ('u', 'v') for the Gulf of Mexico.
- 'u' = eastward_sea_water_velocity
- 'v' = northward_sea_water_velocity

Temporal evolution of the horizontal components of the surface velocity in the Bay of Campeche (see location details and dates in figures)

![alt text](https://github.com/jcompaire/Matlab/blob/e3dea31805acd5c2103f0fa99447a24b950845ea/images/u_BCampeche.png)
![alt text](https://github.com/jcompaire/Matlab/blob/e3dea31805acd5c2103f0fa99447a24b950845ea/images/v_BCampeche.png)
