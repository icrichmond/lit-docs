# Ermida_et_al_2020

Ermida, S.L., Soares, P., Mantas, V., Göttsche, F.M. and Trigo, I.F., 2020. Google earth engine open-source code for land surface temperature estimation from the landsat series. _Remote Sensing_, _12_(9), p.1471.

https://www.mdpi.com/2072-4292/12/9/1471

---

[[LST]] using [[Landsat]]

Landsat thermal band has ~100 m resolution, recorded from 1982 (Landsat 4) - present (Landsat 8). Tier 1 is the highest available data quality suitable for time series, Tier 2 is the remainder. 

Results: narrower thermal band in Landsat 8 has better performance. 

## Methods
See Figure 1 for complete flowchart

### Landsat

- TOA: TIR. Resampled from 120 m (Landsat 4, 5), 60 m (Landsat 7), 100 m (Landsat 8) to 30 m 
- SR: Red, NIR. 30 m. 

### Atmospheric data
Total column water vapour [[TCWW]] from NCEP/NCAR reanalysis data is the only global product available within [[earth-engine]] for the full time period of [[Landsat]]. It is recorded every 6 hours with a spatial resolution of 2.5 degrees. The two closest measures are linearly interpolated for each [[Landsat]] pixel. 


### Surface emissivity
ASTER GED v3 - Global Emissivity Dataset

Either use the GED emissivity product directly, or correct using [[NDVI]]

To correct using [[NDVI]], calculate the fractional vegetation cover [[FVC]] according to [[Carloson_et_al_1997]]

FVC = ((NDVI - NDVI bare) / (NDVI veg - NDVI base)) ^ 2

NDVI veg is the NDVI value for a completely vegetation pixel. NDVI bare is the NDVI value for a completely bare pixel. In this paper, the authors use NDVI bare = 0.2 and NDVI veg = 0.86. 

Emissivity is corrected using the FVC 

### Statistical Mono Window
SMW is a linear regression of radiative transfer equation with a dependence on surface emissivity




