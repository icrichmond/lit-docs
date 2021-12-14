# taxize
[[R]] package for resolve taxa from names

Interacts with [[NCBI]] [[taxonomy]] database
(faster results if you generate an API key, find it here https://www.ncbi.nlm.nih.gov/account/settings/)


## Challenges
Predominantly the Catalogue of Life Checklist that returns matched_name with the canonical content, downstream breaking classification
```
R: DT[data_source_title == 'Catalogue of Life Checklist', 
+    .(matched_name)][1:7]
                      matched_name
                            <char>
1:                            Aves
2:         Grus vipio Pallas, 1811
3:        Chlamydotis Lesson, 1839
4: Anser albifrons (Scopoli, 1769)
5:     Larus fuscus Linnaeus, 1758
6: Phaetusa simplex (Gmelin, 1789)
7:     Eidolon helvum (Kerr, 1792)

```

```
R: DT[, .N, .(is.na(family), data_source_title)][(is.na)]
    is.na                    data_source_title     N
   <lgcl>                               <char> <int>
1:   TRUE                                 <NA>  1942
2:   TRUE          Catalogue of Life Checklist   371
3:   TRUE Open Tree of Life Reference Taxonomy     1
4:   TRUE                 Encyclopedia of Life     7
5:   TRUE                          Wikispecies     7
6:   TRUE                             Freebase     1
7:   TRUE              Index to Organism Names     2
```