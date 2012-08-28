if exists('g:loaded_librarian') || &cp
  finish
endif

let g:loaded_librarian = '0.0.1'
let s:keepcpo = &cpo
set cpo&vim

if !exists('g:librarian_storage')
  let g:librarian_storage = {}
endif

if !exists('g:librarian_storage_by_file')
  let g:librarian_storage_by_file = {}
endif

if !exists('g:librarian_filename')
  let is_a_git_project = isdirectory(getcwd() . "/.git")

  if is_a_git_project
    let g:librarian_filename = '~/.vim_librarian'
  else
    let g:librarian_filename = getcwd() . '/.vim_librarian'
  endif
endif

if !exists('g:librarian_long_quickfix')
  let g:librarian_long_quickfix = 0
endif

if !exists('g:librarian_signs')
  let g:librarian_signs = 1
endif

if !exists('g:librarian_highlight')
  let g:librarian_highlight = 0
endif

command! -nargs=1 -complete=custom,librarian#BookmarkNames VLBookmark call librarian#Add(<f-args>)
command! -nargs=1 -complete=custom,librarian#BookmarkNames VLDelBookmark call librarian#Del(<f-args>)
command! -nargs=1 -complete=custom,librarian#BookmarkNames VLOpenBookmarks call librarian#Open(<f-args>)
command! -nargs=1 -complete=custom,librarian#BookmarkNames VLQFOpenBookmarksFor call librarian#Go(<f-args>)
command! VLQFOpenBookmarks call librarian#Copen()

hi link Librarian Search

if g:librarian_signs || g:librarian_highlight
  sign define bookmark text=->
  autocmd BufRead * call librarian#Highlight()
endif

let &cpo = s:keepcpo
unlet s:keepcpo
