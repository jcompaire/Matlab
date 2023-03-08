## A MATLAB script to download hourly HYCOM data via OpenDAP and store them as netCDF files separately *(get_hycom_individual.m)* or combined into a single one *(get_hycom_whole.m)*.

Source of HYCOM data: https://www.hycom.org/data/goml0pt04/expt-32pt5
This product has 12 variables (see details in the link above).
In these scripts, we will get the data from the horizontal components of the velocity ('u', 'v') for the Gulf of Mexico.
- 'u' = eastward_sea_water_velocity
- 'v' = northward_sea_water_velocity

The surface velocity fields used in [Compaire et al. (2021)](https://doi.org/10.1002/lno.11762) were downloaded using scripts analogous to those presented here.

Temporal evolution of the horizontal components of the surface velocity in the Bay of Campeche (see location details and dates in figures)

![alt text](https://github.com/jcompaire/Matlab/blob/e3dea31805acd5c2103f0fa99447a24b950845ea/images/u_BCampeche.png)
![alt text](https://github.com/jcompaire/Matlab/blob/e3dea31805acd5c2103f0fa99447a24b950845ea/images/v_BCampeche.png)

## References
[Compaire et al. (2021)](https://doi.org/10.1002/lno.11762)
```
Compaire, J.C., Pérez‐Brunius, P., Jiménez‐Rosenberg, S.P.A., Rodríguez Outerelo, J.,
Echeverri Garcia, L.D.P., & Herzka, S.Z. (2021). Connectivity of coastal and neritic 
fish larvae to the deep waters. Limnology and Oceanography, 66(6), 2423-2441.
