# West_et_al_2019

West, H., Quinn, N. and Horswell, M., 2019. Remote sensing for drought monitoring & impact assessment: Progress, past challenges and future opportunities. _Remote Sensing of Environment_, _232_, p.111291.

http://agri.ckcest.cn/file1/M00/0E/C9/Csgk0F2MZRaAbujrABTiyhZ7Uyg676.pdf

---

## Introduction

There is no universal definition of drought. The simplest is a water deficit when compared normal conditions. Droughts have slow, prolonged impacts. 

Historically drought monitoring:

- In-situ station based measurements
	- [[PDSI]]
- [[remote-sensing]]
	- meteorological
	- [[vegetation]] health
	- water levels

Classifications of [[drought]]

- meteorological 
- agricultural
- hydrological
- socioeconomic


![[Pasted image 20220303104644.png]]![](images/Pasted image 20220303104644.png)
Drought propagation: where a precipitation deficit progresses through the hydrological cycle from meteorological to agricultural to hydrological drought

## Precipitation monitoring

- Tropical Rainfall Measuring Mission [[TRMM]]
- Global Precipitation Measurement mission [[GPM]]
- Standardized Precipitation Index [[SPI]]
	- requires long term (~30 year) record
	- comparable across wet/flood and dry/drought, space, time

## Evapotranspiration monitoring

Evapotranspiration ([[ET]]) is the key factor in meteorological and agricultural drought

Calculation of [[ET]] requires variables related to vegetation condition, vegetation type, soil properties

- Global Land Evapotranspiration Amsterdam Model [[GLEAM]]
	- Microwave measurements of vegetation, soil moisture, precipitation
	- Land surface temperature [[LST]]
	- [[GLEAM]] is the only global scale [[ET]] based on [[remote-sensing]] data alone
- [[EEFlux]]
- [[Landsat]] [[LST]]

## Vegetation and soil monitoring

[[remote-sensing]] for agricultural drought (where there is a deficit in soil moisture driven by a precipitation deficit)

- Soil moisture content
	- Passive/active microwave
	- Hyperspectral
	- Passive multispectral, to infer soil moisture by assessing [[vegetation]] condition and productivity
		- [[NDVI]] uses the red edge and the authors found 30% of the 300 papers reviewed that investigated agricultural drought used [[NDVI]]

Limitations of [[NDVI]]:

- measurement only represents conditions at that specific time
- no consideration of relative condition to longer term change
- [[NDVI]] is influenced by soil brightness where [[vegetation]] density is low
- also limited in high density biomass environments

An alternative or improvement is the Vegetation Health Index [[VHI]] [[Kogan_1997]]. The [[VHI]] is a weighted average of two sub indices

VCI = ((NDVI - NDVI min) X 100) / (NDVI max - NDVI min)
TCI = ((BT max - BT) X 100) / (BT max - BT min)
VHI = alpha X VCI X (I - alpha) X TCI

Where min/max are those measures over the study period, BT is the Brightness Temperature from a thermal sensor. VCI normalizes spurious and short term signals, and amplifies long term trend. TCI uses thermal bands, eg [[Landsat]] [[LST]], and compared to NIR-based vegetation indices  
alone, temperature/brightness indices have been found to be more  
sensitive to soil water stress. 

GPP [[primary-productivity]]: rate at which [[vegetation]] converts light into energy via photosynthesis

## Integrated approaches

[[Zhang_et_al_2017]] recommend multi index approaches

Synthesized Drought Index [[SDI]] [[Du_et_al_2012]]: 

- Combines [[VCI]] [[TCI]] [[PCI]] using [[PCA]]
- [[MODIS]], [[TRMM]]

Challenges: soil moisture from [[remote-sensing]] only 1-5 cm depth, while crop roots typically 10-20 cm depth. A solution is to integrate in-situ measurements. 

[[Brown_et_al_2008]] introduces [[VegDRI]]. 1 km resolution, updated weekly

[[Amani_et_al_2017]] introduces the [[TVMDI]]. Combines [[LST]], soil moisture and [[NDVI]]






