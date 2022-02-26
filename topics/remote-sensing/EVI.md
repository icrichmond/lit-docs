# EVI
Enhanced vegetation index
[[spectral-indices]]

[[EVI]] is similar to [[NDVI]] but adds some corrective enhancements 

$EVI = G * ((NIR - R) / (NIR + C1 * R – C2 * B + L))$

L: canopy background
C: coefficient for atmospheric resistance
B: blue band

From: https://www.usgs.gov/landsat-missions/landsat-enhanced-vegetation-index, https://earthobservatory.nasa.gov/features/MeasuringVegetation/measuring_vegetation_4.php

> ... EVI corrects for some atmospheric conditions and canopy background noise and is more sensitive in areas with dense vegetation. It incorporates an “L” value to adjust for canopy background, “C” values as coefficients for atmospheric resistance, and values from the blue band (B).  These enhancements allow for index calculation as a ratio between the R and NIR values, while reducing the background noise, atmospheric noise, and saturation in most cases.

> The EVI data product also does not become saturated as easily as the NDVI when viewing rainforests and other areas of the Earth with large amounts of chlorophyll.

