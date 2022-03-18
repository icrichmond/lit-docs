# Renno_et_al_2008

Rennó, C.D., Nobre, A.D., Cuartas, L.A., Soares, J.V., Hodnett, M.G. and Tomasella, J., 2008. HAND, a new terrain descriptor using SRTM-DEM: Mapping terra-firme rainforest environments in Amazonia. _Remote Sensing of Environment_, _112_(9), pp.3469-3481.

https://www.researchgate.net/profile/Javier-Tomasella/publication/222541760_HAND_a_new_terrain_descriptor_using_SRTM-DEM_Mapping_terra-firme_rainforest_environments_in_Amazonia/links/5a4b5505a6fdcce19721b56a/HAND-a-new-terrain-descriptor-using-SRTM-DEM-Mapping-terra-firme-rainforest-environments-in-Amazonia.pdf

---

## Height above nearest drainage
The [[HAND]] algorithm computes the vertical distance between each cell and the nearest drainage cell in a contributing area defined by a distance threshold. This represents a normalized [[DEM]] for a [[drainage]] network where each cell's value corresponds to its relationship to the nearest drainage. 

## Methods
![[Pasted image 20220317165447.png]]
![](images/Pasted image 20220317165447.png)


### Flow direction
D8 where cell value represents flow to one of 8 neighbour cells down the steepest slope, or if none of neighbours are lower the flow direction is undefined and the cell represents a pit. A cell can only be hydrologically connected to one of its neighbours. 

Sinks and flat areas are handled using depression breaching (see Figure 2). This takes a "incoherent" [[DEM]] and returns a "coherent" DEM.

### Drainage network
Generate the local drainage network, predicting the head water, where channels begin. The [[drainage]] network is defined by cells that have a contributing area greater than a given threshold. The contributing area is the number of cells whose flow paths converge to the focal cell. The contributing area is calculated where first, all cells that are not pits are assigned 1. Then iteratively increasing the number of cells included up to the threshold, the sum of hydrologically connected cells represent the contributing area. 

### Height above nearest drainage [[HAND]]
[[HAND]] (i, j) = 

- H (i, j) - Hd (i, j) {if Hd < H}
- 0 {If Hd >= H}

where H (i, j) is the height of the point (i, j), Hd (i, i) is the height of the [[drainage]] point hydrologically connected to point (i, j).

All cells belonging to the [[drainage]] network are zeroed in height which implies the [[drainage]] potential (according to the [[HAND]] algorithm) along the stream channel is disregarded. 

![[Pasted image 20220317165246.png]]
![](images/Pasted image 20220317165246.png)

Heights are taken from original, non-corrected [[DEM]] and not from the topogically coherent [[DEM]] (corrected with the breaching depressions method) because that process introduces unwanted artifacts as a side effect of generating the accurate [[drainage]] network. 

### Sensitivity to threshold
The only flexible parameter required to calculate [[HAND]] is the size of the contributing area. Decreasing the threshold size of the contributing area increases the density of the [[drainage]] network. The authors recommend ground truthing the threshold to appropriately represent the local drainage density. 

Decreasing the threshold ~ increasing the number of stream orders ~ decreasing overall smoothness ~ increasing ability to distinguish contrasting local environments

Figure 7 explores the sensitivity of [[HAND]] to a range of thresholds. 
