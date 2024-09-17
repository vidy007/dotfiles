set noshowmode
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jreybert/vimagit'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ericbn/vim-relativize'
Plug 'ervandew/supertab'
Plug 'bfrg/vim-cpp-modern'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'vidy007/vim-ch'

call plug#end()

let g:gruvbox_transparent_bg = '1'
colorscheme gruvbox
set background=dark
let g:airline_powerline_fonts = 1
set number
set termguicolors
let g:airline#extensions#tabline#enabled = 1
set mouse=a
let g:startify_custom_header= [
        \'          ██╗ ██████╗██╗                  ██╗',
	\'  ██╗ ██╗ ╚═╝██╔════╝██████╗  ██████╗ ██████║',
	\'  ██║ ██║ ██╗██║     ██╔══██╗██╔══██║██╔══██║',
	\'  ██║ ██║ ██║██║     ██║  ██║██║  ██║██║  ██║',
	\'  ╚████╔╝ ██║╚██████╗██║  ██║ ██████║╚██████║',
	\'   ╚═══╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝',
	\]
let g:startify_lists = [ 
          \ { 'type': 'dir',       'header': ['   Recents in '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ { 'type': 'commands',  'header': ['   Commands']       },
          \ ]
highlight StartifyBracket ctermfg=241
highlight StartifyNumber  ctermfg=214
highlight StartifyHeader  ctermfg=214
highlight StartifyFile    ctermfg=208
highlight StartifyPath 	  ctermfg=166
highlight EndOfBuffer     ctermfg=bg
highlight StartifyFooter  ctermfg=109
let g:startify_enable_special = 0
