library(chk)
library(xfun)
library(data.table)
library(igraph)
library(visNetwork)

file <- 'topics/animal-movement/animal-movement.md'
files <- dir('.', pattern = '\\.md$', full.names = TRUE, recursive = TRUE)

find_within_brackets <- function(filepath) {
  chars <- readChar(filepath, file.info(filepath)$size)
  links <- gsub('\\[|\\]', '', regmatches(chars, gregexpr("\\[\\[.*?\\]\\]", chars))[[1]]) 
  DT <- data.table(links_to = links)[, links_from := basename(sans_ext(filepath))]
  return(DT[links_to != links_from])
}
chk::chk_equal(nrow(find_within_brackets('README.Rmd')), 0)

find_within_brackets(file)

a <- lapply(files, find_within_brackets)

network_to <- function(x) {
  visIgraph(graph_from_edgelist(as.matrix(x), directed = FALSE)) %>% 
    visPhysics(solver = 'repulsion')
}

lapply(a[vapply(a, nrow, 42) > 0], network_to)
