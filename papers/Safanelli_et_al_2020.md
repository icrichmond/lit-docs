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
	- "Slope gradient is a flow attribute that relates to the velocity of gravity-driven flows"
- Aspect (degrees)
- Hillshade (degrees)
- Northness (unitless)
	- Derived from aspect
- Eastness (unitless)
	- Derived from aspect
- Curvatures (m)
	- Horizontal
		- Derived from first and second order partial derivatives, representing if a lateral flow converges (kh < 0) or diverges (kh > 0)
	- Vertical
		- Derived from first and second order partial derivatives, representing the relative acceleration (kv > 0) and deceleration (kv < 0) of a gravity-driven flow
	- Mean
		- Represents accumulation mechanisms of gravity-driven flows: convergence and relative deceleration. 
	- Max
		- Highest curvature for a given point on the topographic surface, represents ridges (kmax > 0) and closed depressions (kmax < 0)
	- Min
		- Lowest curvature for a given point on the topographic surface, represents hills (kmax > 0) and valleys (kmax < 0)
	- Gaussian
		- Product of maximal and minimal curvatures. 
- Shape index (unitless)
	- Ranges from -1 to 1 and represents convex (SI > 0) and concave (SI < 0) landforms
