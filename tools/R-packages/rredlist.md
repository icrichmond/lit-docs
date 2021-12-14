# rredlist

```
rl_citation()
#> [1] "IUCN 2015. IUCN Red List of Threatened Species. Version 2020-2 <www.iucnredlist.org>"
```
(update years + version)

---

[[R]] package for interacting with the [[IUCN-Red-List]]. It does not include the spatial data. 

## Setup
> IUCN requires you to get your own API key, an alphanumeric string that you need to send in every request. 

Access it by logging in, then navigating to your profile's API and making a request. 

## Challenges
If 
```
R: tar_read(classification)[is.na(family), unique(matched_name)]
  [1] NA                                             
  [2] "Chlamydotis Lesson, 1839"                     
  [3] "Anser albifrons (Scopoli, 1769)"              
  [4] "Phaetusa simplex (Gmelin, 1789)"              
  [5] "Eidolon helvum (Kerr, 1792)"                  
...                     
[198] "Chordata"                                     
[199] "Mycteria Linnaeus, 1758"                      
[200] "Cerdocyon thous (Linnaeus, 1766)"             
[201] "Sula bassanus"                                
[202] "Equus (Hippotigris) grevyi Oustalet, 1882"   
```