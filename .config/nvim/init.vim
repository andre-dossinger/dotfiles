" plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'airblade/vim-rooter'

Plug 'https://github.com/itchyny/lightline.vim'

Plug 'https://github.com/preservim/nerdtree'

Plug 'https://github.com/airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'arcticicestudio/nord-vim'

Plug 'jparise/vim-graphql'

" to enable this plugin install (additionally to the package neovim) the
"   package python-neovim (for arch distros)
Plug 'puremourning/vimspector'

Plug 'zivyangll/git-blame.vim'

call plug#end()


" general

"" remap leader key to space bar
let mapleader = "\<Space>"

"" saving .netrwhist to cache instead of config directory
let g:netrw_home="~/.cache/nvim"

"" replace cursor line where left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

""  turn relative line numbers on
:set relativenumber
:set rnu

"" tab keymapping
cnoreabbrev <expr> tn getcmdtype() == ":" && getcmdline() == 'tn' ? 'tabnew' : 'tn'
nnoremap tk :tabNext<CR>
nnoremap tj :tabnext<CR>

"" always show full file path in status line
let g:lightline = {
	\		'active': {
	\			'left': [ [ 'mode', 'paste' ], [ 'readonly', 'absolutepath', 'modified' ] ],
	\		}
	\	}


" theme

colorscheme nord


" vimspector

nmap <leader>db <Plug>VimspectorToggleBreakpoint
nnoremap <leader>do :call vimspector#Reset()<CR>
nmap <leader>dr <Plug>VimspectorRestart
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dn <Plug>VimspectorStepInto
nmap <leader>du <Plug>VimspectorStepOut
nmap <leader>dc <Plug>VimspectorContinue
nnoremap <leader>dd :call vimspector#Launch()<CR>

"" this is used for java debugging (using coc as java-debug-server)
"" for this to work you need to install the following coc plugins:
""   :CocInstall coc-java
""   :CocInstall coc-java-debug
"" to start debugging a java application you first up need to start a java
""   application waiting for a debugger on port 5005. E. g.:
""   java -jar -Xdebug  -agentlib:jdwp="transport=dt_socket,server=y,suspend=y,address=5005" target/server.jar
""     or
""   mvn test -Dmaven.surefire.debug
nmap <leader>ds :CocCommand java.debug.vimspector.start<CR>


" nerdtree

let NERDTreeShowHidden=1

nnoremap <C-t> :NERDTreeToggle<CR>

"" exit if NERDTree is the only window left
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" fzf
"" in oder to use fzf install the packages fzf and ripgrep with your favorite package manager

nnoremap <C-f> :Files<CR>
nnoremap <C-g> :Rg<CR>


" git-blame

nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>


" lsp

source ~/.config/nvim/coc.vim
