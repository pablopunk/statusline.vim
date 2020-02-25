hi StatusLine guibg=NONE

if !exists('g:statusline_color_N') | let g:statusline_color_N = '#8854d0' | en
if !exists('g:statusline_color_I') | let g:statusline_color_I = '#22a6b3' | en
if !exists('g:statusline_color_V') | let g:statusline_color_V = '#3867d6' | en
if !exists('g:statusline_color_C') | let g:statusline_color_C = '#fc5c65' | en

function! GitBlameShort() abort
  let blame = get(b:,'coc_git_blame','')
  if blame == ''
    return ''
  endif

  return blame =~ 'Not committed' ? '   WIP' : '   ' . substitute(blame[1:],' .*','', 'g')
endfunction

function! ColorMode() abort
  let m = toupper(mode())
  let color_for_mode = get(g:,'statusline_color_'.m,'#8854d0') " get color or use default

  exe 'hi StatusBranch guifg=#dedede guibg=' . color_for_mode
  exe 'hi StatusBranchReverse guifg=' . color_for_mode
  exe 'hi StatusMode guifg=' . color_for_mode

  return m . ' '
endfunction

function! ShowBranch() abort
  let b = get(g:,'coc_git_status','')
  if b == ''
    return ''
  endif

  return '  ' . b[:13] . ' '
endfunction

function! ShowFileType() abort
  return &filetype == '' ? '' : '  ' . &filetype
endfunction

function! Show() abort
  return &filetype == '' ? '' : ' ' . &filetype
endfunction

"  
set statusline=
set statusline+=%#StatusMode#
set statusline+=%{ColorMode()}
set statusline+=%#StatusBranch#
set statusline+=%{ShowBranch()}
set statusline+=%#StatusBranchReverse#
set statusline+=
set statusline+=%#LineNr#
set statusline+=\ %m%r%t
set statusline+=%=%{get(b:,'coc_current_function','')}
set statusline+=%{ShowFileType()}
set statusline+=%{GitBlameShort()}
set statusline+=\ 
set statusline+=\ %l:%c
set statusline+=\ 
set statusline+=\ %p%%
