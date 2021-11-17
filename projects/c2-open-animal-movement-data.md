# Open animal movement data
[[open-data]] [[reproducibility]] [[animal-movement]]


## Reasons not to archive data publicly
### Flawed science
[[Mills_et_al_2015]] mentions "flawed science if data is shared publicly, because only the PIs sufficiently understand the data" - this is not really relevant to animal movement data because the [[structure-of-movement-data]] is simpler.

### Repeating non-published analyses, eg. insignificant results
Solutions: 
* Publish a pre-print with your insignificant results
* Communicate with downstream data users
* Allow others to explore the data from new perspectives 

## Metadata
[[Whitlock_et_al_2011]] mentions the value of publishing data alongside a paper that uses it, as the methods will help speak to the data. I personally disagree since it is insufficient to use a document not properly structured to describe data, as a placeholder or alternative for metadata. 

There is much less complexity in designing consistent metadata structure for animal movement data than other forms of ecological data. The [[structure-of-movement-data]], at it's simplest, is a series of rows with locations (longitude, latitude), individual identifier and time. Additional information may indicate precision of the location, number of satellites, etc.

## Format
Text based file format, non-proprietary [[Whitlock_et_al_2011]]. In the case of animal movement data, CSV or TSV. 