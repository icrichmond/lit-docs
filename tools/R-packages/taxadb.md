# taxadb

Carl Boettiger, Kari Norman, Jorrit Poelen and Scott Chamberlain (2021). taxadb: A High-Performance Local Taxonomic Database Interface. R package version 0.1.3. https://CRAN.R-project.org/package=taxadb

---

Discussion of taxonomic data sources https://docs.ropensci.org/taxadb/articles/data-sources.html

[[Franz_et_al_2019]] https://academic.oup.com/database/article/doi/10.1093/database/bax100/4791171

## Challenges
```
R: name2taxid('Felidae')
[1] "9681"
R: name2taxid('Felidae ')
[1] NA
```