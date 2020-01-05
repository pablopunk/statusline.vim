hi StatusLine guibg=NONE

function! GitBlameShort() abort
  let blame = get(b:,'coc_git_blame','')
  return blame =~ 'Not committed' ? 'WIP' : substitute(blame[1:],' .*','', 'g')
endfunction

function! ColorMode() abort
  let m = toupper(mode())
  if m =~ 'N'
    hi StatusBranch guifg=#dedede guibg=#8854d0
    hi StatusBranchReverse guifg=#8854d0
  elseif m =~ 'I'
    hi StatusBranch guifg=#454545 guibg=#2bcbba
    hi StatusBranchReverse guifg=#2bcbba
  elseif m =~ 'V'
    hi StatusBranch guifg=#dedede guibg=#3867d6
    hi StatusBranchReverse guifg=#3867d6
  elseif m =~ 'C'
    hi StatusBranch guifg=#dedede guibg=#3867d6
    hi StatusBranchReverse guifg=#3867d6
  endif

  return ''
endfunction

"  
set statusline=
set statusline+=%{toupper(mode())}
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
