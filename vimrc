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


" airlile
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" excute current file
autocmd FileType ruby nmap <F5> :call RunWith("ruby")<cr>
autocmd FileType python nmap <F5> :call RunWith("python")<cr>
autocmd FileType coffee nmap <F5> :call RunWith("coffee")<cr>
autocmd FileType javascript nmap <F5> :call RunWith("node")<cr>

autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set noexpandtab tabstop=2 shiftwidth=2 autoindent smartindent cindent
autocmd FileType ruby set tabstop=2 shiftwidth=2
autocmd FileType python set tabstop=4 shiftwidth=4

function RunWith(Language)
  execute "w"
  execute "!clear;time " . a:Language . " " . expand("%")
endfunction
