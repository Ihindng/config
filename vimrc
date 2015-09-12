execute pathogen#infect()
syntax on
set number
set laststatus=2
colorscheme molokai
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
map <C-e> :NERDTreeToggle<CR>
set is!
set autoindent
set smartindent
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set pastetoggle=<F9>

" youcompleteme
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_global_ycm_extra_conf='/usr/share/vim/vimfiles/third_party/ycmd/ycmd/tests/testdata/.ycm_extra_conf.py'

" airlile
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" excute current file
autocmd FileType ruby nmap <F5> :call RunWith("ruby")<cr>
autocmd FileType python nmap <F5> :call RunWith("python")<cr>
autocmd FileType coffee nmap <F5> :call RunWith("coffee")<cr>
autocmd FileType javascript nmap <F5> :call RunWith("node")<cr>
autocmd FileType c map <F5> :call RunWith("c") <CR>
autocmd FileType cpp map <F5> :call RunWith("cpp") <CR>
autocmd FileType scheme map <F5> :call RunWith("scheme") <CR>

autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set noexpandtab tabstop=2 shiftwidth=2 autoindent smartindent cindent
autocmd FileType ruby set tabstop=2 shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4
autocmd FileType c set tags+=~/.vim/systags
autocmd FileType cpp  set tags+=~/.vim/systags

function RunWith(Language)
  execute "w"
  if a:Language == "c"
  execute "!clear;time " . "gcc --std=c11 -g % -o %<&& ./%<"
  elseif a:Language == "cpp"
  execute "!clear;time " . "g++ % -o %<&& ./%<"
  elseif a:Language == "scheme"
  " execute "!clear;time " . "scheme < % | grep -E \"^\;|=\""
  execute "!clear;time " . "scheme < % | tail -n +12 |perl -pe 's/(Value)/\e[1;31m$1\e[0m/g'  " 
  else
  execute "!clear;time " . a:Language . " " . expand("%")
  endif
endfunction

