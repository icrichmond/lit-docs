library(targets)

library(downlit)
library(bslib)
library(chk)
library(xfun)
library(data.table)
library(igraph)
library(visNetwork)
library(stringi)
library(bookdown)
library(fs)
library(kableExtra)
library(spelling)


source('R/functions.R')

Sys.setenv(NO_COLOR = TRUE)

c(
  tar_target(
    files,
    get_files(),
    cue = tar_cue('always')
  ),
  tar_target(
    edges,
    find_within_brackets(files),
    pattern = map(files)
  ),
  tar_target(
    add_parts,
    {files; write_parts()},
    format = 'file'
  ),
  tar_target(
    files_with_parts,
    {add_parts; get_files()}
  ),
  tar_target(
    rmd_files,
    write_rmd_files(files_with_parts),
    format = 'file'
  ),
  tar_target(
    checked_bs4_names,
    check_files_for_bs4(rmd_files)
  ),
  tar_target(
    book_deps,
    {rmd_files; checked_bs4_names; get_book_deps()},
    format = 'file'
  ),
  tar_target(
    book,
    render_book(book_deps, "bookdown::gitbook", output_dir = "docs"),
    cue = tar_cue('always')
  ),
  tar_target(
    spell_check,
    spell_check_files(dir(pattern = '.md', recursive = TRUE))
  )
)
