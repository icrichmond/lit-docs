# Safanelli_et_al_2020

Safanelli, J.L., Poppiel, R.R., Ruiz, L.F.C., Bonfatti, B.R., Mello, F.A.D.O., Rizzo, R. and Demattê, J.A., 2020. Terrain analysis in google earth engine: A method adapted for high-performance global-scale analysis. _ISPRS International Journal of Geo-Information_, _9_(6), p.400.

https://www.mdpi.com/2220-9964/9/6/400/htm

---

TAGEE - terrain analysis in [[earth-engine]]

Calculates methods adapted to the spheroid angular grid, eg. WGS84, for [[DEM]] with geographical coordinates without needing to reproject

(Math is described in Florinsky_2016)

Input:

- [[DEM]]
- bounding box

Output: 

- Slope (m)
- Aspect (degrees)
- Hillshade (degrees)
- Northness (unitless)
- Eastness (unitless)
- Curvatures (m)
	- Horizontal
	- Vertical
	- Mean
	- Max
	- Gaussian
- Shape index (unitless)