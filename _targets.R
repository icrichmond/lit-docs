library(targets)


library(chk)
library(xfun)
library(data.table)
library(igraph)
library(visNetwork)
library(stringi)
library(bookdown)

source('R/functions.R')

Sys.setenv(NO_COLOR = TRUE)

c(
  tar_target(
    files,
    get_files(),
    cue = tar_cue('always')
  ),
  tar_target(
    nodes,
    find_within_brackets(files),
    pattern = map(files)
  ),
  tar_target(
    rmd_files,
    write_rmd_files(files)
  ),
  tar_target(
    book_deps,
    get_book_deps(),
    format = 'file'
  ),
  tar_target(
    book,
    {book_deps; render_book()}
  )
)

