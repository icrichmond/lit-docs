get_files <- function(directory = '.') {
  files <- c('index.Rmd', dir(directory, pattern = '\\.md$', full.names = TRUE, recursive = TRUE, all.files = TRUE))
  files[grep('README|html\\/', files, invert = TRUE)]
}

write_parts <- function() {
  dirs <- grep('/\\.|public|_targets|html|images|\\_unsorted|libs|R|\\_book|\\.$', list.dirs('.', recursive = TRUE), value = TRUE, invert = TRUE)
  sel_parts <- dirs[grep('topics$', dirs, invert = TRUE)]
  lapply(sel_parts, function(x) {
    nm <- basename(x)
    writeLines(paste0('# (PART) ', stringi::stri_trans_totitle(nm), ' {-}'),
               file.path(x, paste0('aa_index_', nm, '.md')))
  })
  sel_parts
}

find_within_brackets <- function(filepath) {
  chars <- readChar(filepath, file.info(filepath)$size)
  links <- gsub('\\[|\\]', '', regmatches(chars, gregexpr("\\[\\[.*?\\]\\]", chars))[[1]]) 
  DT <- data.table(links_to = links)[, links_from := basename(sans_ext(filepath))]
  return(DT[links_to != links_from])
}
# chk::chk_equal(nrow(find_within_brackets('README.md')), 0)

vis_network <- function(edges) {
  visIgraph(graph_from_edgelist(as.matrix(edges), directed = FALSE)) %>%
    # visOptions(width = '100%', height = '50%') %>%
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
  
  data.table(
    files = sans_ext(file_base),
    htmls = sans_ext(html_base)#,
    # equal = all.equal(
      # sans_ext(file_base),
      # sans_ext(html_base)
    # )
  )
}


get_recent_pages <- function(N = 10) {
  ls_files <- dir_ls('.', glob = '*.md', recurse = TRUE)
  
  DT <- rbindlist(lapply(ls_files, file_info))
  sub <- DT[!grepl('unsorted|index|README', path)]
  setorder(sub, -change_time)
  
  get_html_link <- function(path) {
    base <- basename(with_ext(path, 'html'))
    cell_spec(sans_ext(base), 'html', link = tolower(base))
  }
  
  sub[seq.int(N), .(Link = get_html_link(path), Modified = change_time)] |> 
    kable(format = 'html', escape = FALSE)
}
