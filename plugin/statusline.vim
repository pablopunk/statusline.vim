" Statusline
hi StatusLine guibg=NONE
hi StatusBranch guifg=#dedede guibg=#686de0
hi StatusBranchReverse guifg=#686de0
"  
set statusline=
set statusline+=%{toupper(mode())}
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
set statusline+=\ %{get(b:,'coc_git_blame', '')}
set statusline+=\ 
set statusline+=\ %l:%c
set statusline+=\ 
set statusline+=\ %p%%
