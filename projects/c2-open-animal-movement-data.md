# C2-open-animal-movement-data

[[open-data]] [[reproducibility]] [[animal-movement]]


## [[open-data]] debate
[[reasons-open-data]]
[[reasons-closed-data]]


## Metadata
[[Whitlock_et_al_2011]] mentions the value of publishing data alongside a paper that uses it, as the methods will help speak to the data. I personally disagree since it is insufficient to use a document not properly structured to describe data, as a placeholder or alternative for metadata. 

There is much less complexity in designing consistent metadata structure for animal movement data than other forms of ecological data. The [[structure-of-movement-data]], at it's simplest, is a series of rows with locations (longitude, latitude), individual identifier and time. Additional information may indicate precision of the location, number of satellites, etc.

Avoid the trap of making another standard

## Format
Text based file format, non-proprietary [[Whitlock_et_al_2011]]. In the case of animal movement data, CSV or TSV. 

## Rights to data
[[Duke_et_al_2013]] access to data is a right

## Movebank
Despite (?) the [[MoveBank-Attribute-Dictionary]]'s recommendations, taxonomy is not well structured in some cases

For example, 
`Aves ,grus grus,anthropoides paradiseus`
Gets parsed by eg. [[taxize]] as just "Aves"
Instead of being separated into *Grus grus* and *Anthropoides paradiseus* (Common crane, blue crane).

Alternatively, `Aves ` with the space returns an NA with [[taxadb]]. Seems like multiple species listed in taxon_ids are always separated by a comma, no space if Genus species but if higher tax like Aves, just Aves then a space, then a comma. 

If the intention is this field is parsed in the downloaded data, this means that only those with access to all datasets on Movebank could do a review of available data 