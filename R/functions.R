get_files <- function() {
  files <- c('index.Rmd', dir('.', pattern = '\\.md$', full.names = TRUE, recursive = TRUE, all.files = TRUE))
  files[grep('README', files, invert = TRUE)]
}

write_parts <- function() {
  dirs <- grep('/\\.|public|_targets|R|\\.$', list.dirs('.', recursive = TRUE), value = TRUE, invert = TRUE)
  drop_some <- dirs[grep('topics$|unsorted', dirs, invert = TRUE)]
  lapply(drop_some, function(x) {
    nm <- basename(x)
    writeLines(paste0('# (PART) ', stringi::stri_trans_totitle(nm), ' {-}'),
               file.path(x, paste0('aa_index_', nm, '.md')))
  })
  drop_some
}

find_within_brackets <- function(filepath) {
  chars <- readChar(filepath, file.info(filepath)$size)
  links <- gsub('\\[|\\]', '', regmatches(chars, gregexpr("\\[\\[.*?\\]\\]", chars))[[1]]) 
  DT <- data.table(links_to = links)[, links_from := basename(sans_ext(filepath))]
  return(DT[links_to != links_from])
}
chk::chk_equal(nrow(find_within_brackets('README.md')), 0)

vis_network <- function(edges) {
  visIgraph(graph_from_edgelist(as.matrix(edges), directed = FALSE)) %>%
    visOptions(width = '100%', height = '50%') %>%
    visNodes(font = list(size = 20)) %>%
    visPhysics(stabilization = FALSE, solver = 'barnesHut', barnesHut = list(centralGravity = 0.1))
}

write_rmd_files <- function(files) {
  lns <- readLines('_bookdown.yml')
  ln <- grep('rmd_files', lns)
  replace_ln <- paste0('rmd_files: [',
                       paste0(paste0('"', files, '"'), collapse = ','),
                       ']')
  lns[ln] <- replace_ln
  writeLines(lns, '_bookdown.yml')
  files
}


get_book_deps <- function() {
  c('_bookdown.yml', 'style.css', '_output.yml', 'index.Rmd')
}


check_files_for_bs4 <- function(files) {
  with_html <- lapply(files, function(x) with_ext(basename(x), "html"))
  html_base <- vapply(with_html, basename, FUN.VALUE = 'potato')
  file_base <- vapply(files, basename, FUN.VALUE = 'potato')
  names(file_base) <- NULL
  
  cbind(
    files = (file_base),
    htmls = (html_base)#,
    # equal = all.equal(
      # sans_ext(file_base),
      # sans_ext(html_base)
    # )
  )
}