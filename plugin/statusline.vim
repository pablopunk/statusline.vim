hi StatusLine guibg=NONE

if !exists('g:statusline_color_n') | let g:statusline_color_n = '#8854d0' | en
if !exists('g:statusline_color_i') | let g:statusline_color_i = '#22a6b3' | en
if !exists('g:statusline_color_v') | let g:statusline_color_v = '#3867d6' | en
if !exists('g:statusline_color_c') | let g:statusline_color_c = '#fc5c65' | en

function! GitBlameShort() abort
  let blame = get(b:,'coc_git_blame','')
  return blame =~ 'Not committed' ? 'WIP' : substitute(blame[1:],' .*','', 'g')
endfunction

function! ColorMode() abort
  let m = tolower(mode())
  let color_for_mode = get(g:,'statusline_color_'.m,'#8854d0') " get color or use default

  exe 'hi StatusBranch guifg=#dedede guibg=' . color_for_mode
  exe 'hi StatusBranchReverse guifg=' . color_for_mode

  return toupper(mode())
endfunction

"  
set statusline=
set statusline+=%{ColorMode()}
set statusline+=\ %#StatusBranchReverse#
set statusline+=%#StatusBranch#
set statusline+=\ %{get(g:,'coc_git_status','')}
set statusline+=\ %#StatusBranchReverse#
set statusline+=
set statusline+=%#LineNr#
set statusline+=\ %m%r%t
set statusline+=%=%{get(b:,'coc_current_function','')}
set statusline+=
set statusline+=\ %y
set statusline+=\ 
set statusline+=\ %{GitBlameShort()}
set statusline+=\ 
set statusline+=\ %l:%c
set statusline+=\ 
set statusline+=\ %p%%
