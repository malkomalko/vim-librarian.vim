if exists('g:loaded_simple_bookmarks') || &cp
  finish
endif

let g:loaded_simple_bookmarks = '0.0.1' " version number
let s:keepcpo                 = &cpo
set cpo&vim

if !exists('g:simple_bookmarks_storage')
  let g:simple_bookmarks_storage = {}
endif

if !exists('g:simple_bookmarks_storage_by_file')
  let g:simple_bookmarks_storage_by_file = {}
endif

if !exists('g:simple_bookmarks_filename')
  let g:simple_bookmarks_filename = '~/.vim_librarian'
endif

if !exists('g:simple_bookmarks_long_quickfix')
  let g:simple_bookmarks_long_quickfix = 0
endif

if !exists('g:simple_bookmarks_signs')
  let g:simple_bookmarks_signs = 1
endif

if !exists('g:simple_bookmarks_highlight')
  let g:simple_bookmarks_highlight = 0
endif

command! -nargs=1 -complete=custom,simple_bookmarks#BookmarkNames Bookmark call simple_bookmarks#Add(<f-args>)
command! -nargs=1 -complete=custom,simple_bookmarks#BookmarkNames DelBookmark call simple_bookmarks#Del(<f-args>)
command! -nargs=1 -complete=custom,simple_bookmarks#BookmarkNames OpenBookmarks call simple_bookmarks#Open(<f-args>)
command! -nargs=1 -complete=custom,simple_bookmarks#BookmarkNames CopenBookmarksFor call simple_bookmarks#Go(<f-args>)
command! CopenBookmarks call simple_bookmarks#Copen()

hi link SimpleBookmark Search

if g:simple_bookmarks_signs || g:simple_bookmarks_highlight
  sign define bookmark text=->
  autocmd BufRead * call simple_bookmarks#Highlight()
endif

let &cpo = s:keepcpo
unlet s:keepcpo
