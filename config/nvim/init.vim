" Thomas Hourlier

" Neovim {{{
let g:loaded_node_provider = 0 " disable ruby extension support
let g:loaded_ruby_provider = 0 " disable ruby extension support
let g:python_host_prog = '/Users/thomashourlier/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/thomashourlier/.pyenv/versions/neovim3/bin/python'
" }}}

" General {{{
set nocompatible
set clipboard=unnamed
set shell=/bin/zsh
set noshowmode " do no who --- INSERT --- Airline is already doing that
set autowrite     " Automatically :write before running commands
set history=50    " remember last 50 commands entered
set undolevels=500
set showtabline=2
set encoding=UTF-8
set showtabline=0
filetype on
filetype plugin indent on
xnoremap p pgvy
" }}}

" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
" core
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-unimpaired'
Plug 'Valloric/ListToggle'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'tpope/vim-projectionist'
Plug 'scrooloose/nerdtree'

" quick search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'dyng/ctrlsf.vim'

" tools for coding
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'danro/rename.vim'
Plug 'editorconfig/editorconfig-vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" theme
Plug 'itchyny/lightline.vim'
Plug 'flazz/vim-colorschemes'

" language specific
Plug 'sheerun/vim-polyglot'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/ember_tools.vim'
Plug 'slashmili/alchemist.vim'
Plug 'jparise/vim-graphql'

call plug#end()
" }}}

" Colors {{{
syntax enable
set background=dark
colorscheme railscasts
" }}}

" Spaces Tab {{{
set tabstop=2
set shiftwidth=2
set backspace=2
set shiftround
set expandtab
set autoindent
set copyindent
" }}}

" Editor UI {{{
set number
set wrap
set ruler
set nocursorline
set showmatch
set splitright
set splitbelow
" }}}

" Status Line {{{
set laststatus=2
set showcmd
" }}}

" Search {{{
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
set inccommand=nosplit
" }}}

" Folding {{{
set foldmethod=marker   " fold based on marker " {{{  }}}
set foldlevelstart=0    " start with fold level of 20
nnoremap <space> za
" }}}

" Mouvement {{{
" Move between window: this come with vim-tmux-navigator
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
vnoremap < <gv
vnoremap > >gv
" remap S-k show help under cursor
nnoremap <S-k> <C-k>
" natural scrolling
nnoremap <S-j> <C-e>
nnoremap <S-k> <C-y>
" }}}

" Backups {{{
set backupdir=~/.vim_tmp,.
set directory=~/.vim_tmp,.
" }}}

" Leader Key {{{
let g:mapleader = ';'
" }}}

" Buffers {{{
set confirm
set autowriteall
nnoremap <silent> <leader>bb <C-^>
nnoremap <silent> <leader>bw :bp <bar> bd #<cr>
nnoremap <silent> <leader>bl :ls<CR>:buffer<Space>
nnoremap <silent> <leader>bt :enew<CR>
nnoremap <silent> <leader>bh :new<CR>
nnoremap <silent> <leader>bv :vnew<CR>
" }}}

" Tabs {{{
nnoremap <silent> <Leader>t <esc>:tabnew<CR>
nnoremap <silent> <Leader>t. <esc>:tabnext<CR>
nnoremap <silent> <Leader>t, <esc>:tabprevious<CR>
nnoremap <silent> <Leader>tw <esc>:tabclose<CR>
" }}}

" Windows {{{
nnoremap <silent> + :resize +3<CR>
nnoremap <silent> - :resize -3<CR>
nnoremap <silent> > :vertical resize +5<CR>
nnoremap <silent> < :vertical resize -5<CR>
nnoremap <silent> <C-c> :cclose<CR>:lclose<CR>:nohlsearch<CR>
" }}}

" Completion {{{
set wildmenu wildmode=full
" }}}

" Leader Mapping {{{
" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguraiton
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" remap redo to U
nnoremap <S-u> <C-r>

" open NERDTree and find the current file
nnoremap <silent> <C-b> :call NERDTreeToggleInCurDir()<CR>

" search accross all files
" nnoremap <C-r> :Ack --ignore-dir={node_modules,tmp,var,log,vendor,dist,.git}<Space>""<Left>
nmap <C-r> <Plug>CtrlSFPrompt
vmap <C-r> <Plug>CtrlSFVwordExec
nnoremap <C-F> :CtrlSFToggle<CR>

" fuzzy file search
nnoremap <C-p> :FZF<CR>

" sort visual block
vnoremap <leader>s :sort<CR>

" testing
nnoremap <silent> t<C-n> :TestNearest<CR>
nnoremap <silent> t<C-f> :TestFile<CR>
nnoremap <silent> t<C-s> :TestSuite<CR>
nnoremap <silent> t<C-l> :TestLast<CR>
nnoremap <silent> t<C-g> :TestVisit<CR>

" ale
" for typescript go to definition
noremap <Leader>] :ALEGoToDefinition<CR>

" }}}

" Plugin configurations {{{
" Lightline {{{
let g:lightline = {}
let g:lightline.colorscheme = 'powerline'
let g:lightline.enable = {}
let g:lightline.enable.tabline = 0

let g:lightline.active = {}
let g:lightline.active.left = [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ]
let g:lightline.component_function = { 'gitbranch': 'fugitive#head' }
" }}}

" Autoclose {{{
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'
let g:closetag_filetypes = 'html,javascript,javascript.jsx,jsx,typescript,typescript.tsx'
let g:closetag_xhtml_filenames = '*.js,*.jsx,*.ts,*.tsx'
let g:closetag_xhtml_filetypes = 'javascript,javascript.jsx,jsx,typescript,typescript.tsx'
" }}}

" NERDTree {{{
let g:NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden = 1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists('t:NERDTreeBufName') && bufwinnr(t:NERDTreeBufName) != -1)
    exe ':NERDTreeClose'
  else
    if (expand('%:t') != '')
      exe ':NERDTreeFind'
    else
      exe ':NERDTreeToggle'
    endif
  endif
endfunction
" }}}

" Ale {{{
let g:ale_open_list = 0
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'typescript': ['eslint', 'prettier'],
\   'graphql': ['prettier'],
\   'json': ['prettier'],
\   'html': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\   'markdown': ['prettier'],
\   'ruby': ['rubocop'],
\   'terraform': ['terraform'],
\   'elixir': ['mix_format'],
\}
let g:ale_set_highlights = 0
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 1500
let g:ale_sign_error = 'x'
let g:ale_sign_style_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_sign_style_warning = '!'
let g:ale_sign_info = '?'
let g:ale_completion_enabled = 0
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1

set completeopt-=preview

call deoplete#custom#option({
\ 'auto_complete_delay': 30,
\ 'auto_refresh_delay': 30,
\ 'max_list': 10,
\ })

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }}}

" CtrlF {{{
let g:ctrlsf_auto_focus = {
    \ "at": "done",
    \ "duration_less_than": 1000
    \ }

let g:ctrlsf_mapping = {
    \ "vsplit": "<C-O>",
    \ "split": "",
    \ }

" }}}

" FZF {{{
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore={node_modules,tmp,var,log,vendor,dist,.git} -l -g ""'
" }}}

" NERDCommenter {{{
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
" }}}

" fugitive {{{
autocmd QuickFixCmdPost *grep* cwindow
" }}}

" SuperTab {{{
" let g:SuperTabDefaultCompletionType = 'context'
" let g:SuperTabContextDefaultCompletionType = '<c-n>'
" }}}

" ListToggle {{{
let g:lt_height = 7
" }}}

" Javascript {{{
let g:javascript_plugin_flow = 1
let g:vim_jsx_pretty_colorful_config = 1
" }}}

" Tests {{{
function! TmuxWithStatusStrategy(cmd)
  let l:current_status = 'VIMUX_CURRENT_STATUS=`tmux show-options -g status-right | cut -d \" -f2`; '
  let l:extend_status_right_cmd = 'tmux set -g status-right-length 250; '

  let l:running_label = '#[fg=white] Running '. a:cmd
  let l:running_cmd =  'tmux set -g status-right "' . l:running_label . ' $VIMUX_CURRENT_STATUS"'
  let l:success_label = '#[fg=green] Tests passed '
  let l:success_cmd =  'tmux set -g status-right "' . l:success_label . ' $VIMUX_CURRENT_STATUS"'
  let l:failure_label = '#[fg=red] Tests failed '
  let l:failure_cmd =  'tmux set -g status-right "' . l:failure_label . ' $VIMUX_CURRENT_STATUS"'

  let l:default_cmd =  'sleep 1 && tmux set -g status-right-length 64 && tmux set -g status-right "$VIMUX_CURRENT_STATUS"; '

  let l:cmd = l:current_status . l:extend_status_right_cmd . "clear; " . l:running_cmd . " && (" . a:cmd . " && " . l:success_cmd .") || (" . l:failure_cmd . ") && " . l:default_cmd ."\n"

  call VimuxRunCommand(l:cmd)
endfunction

let g:test#custom_strategies = {'TmuxWithStatusStrategy': function('TmuxWithStatusStrategy')}
let g:test#strategy = 'TmuxWithStatusStrategy'
let g:test#enabled_runners = ['ruby#rspec', 'javascript#jest', 'javascript#reactscripts', 'elixir#exunit']
let g:test#filename_modifier = ':p'
let test#javascript#reactscripts#executable = 'DEBUG=papinette.* ./node_modules/.bin/react-scripts test --watchAll=false'
let test#ruby#rspec#executable = 'spring rspec'
" }}}

" vimux {{{
let s:testWindowIndex = system("tmux list-windows -F '#{window_index} #{window_name}' | grep -m1 'test' | awk '{ print $1 }' | tr '\n' '.'")
let g:VimuxRunnerIndex = s:testWindowIndex."1"
" }}}

" Projectionist {{{
let g:projectionist_heuristics = {
    \ 'package.json&.ember-cli.js' : {
    \    'app/initializers/*.js': {
    \      'type': 'initializer'
    \    },
    \    'app/models/*.js': {
    \      'type': 'model',
    \      'alternate': 'app/adapters/{}.js'
    \    },
    \    'app/adapters/*.js': {
    \      'type': 'adapter',
    \      'alternate': 'app/serializers/{}.js'
    \    },
    \    'app/serializers/*.js': {
    \      'type': 'serializer',
    \      'alternate': 'app/models/{}.js'
    \    },
    \    'app/services/*.js': {
    \      'type': 'service'
    \    },
    \    'app/routes/*.js': {
    \      'type': 'route',
    \      'alternate': 'app/controllers/{}.js'
    \    },
    \    'app/controllers/*.js': {
    \      'type': 'controller',
    \      'alternate': 'app/templates/{}.hbs'
    \    },
    \    'app/templates/*.hbs': {
    \      'type': 'template',
    \      'alternate': 'app/routes/{}.js'
    \    },
    \    'app/components/*.js': {
    \      'type': 'component',
    \      'alternate': 'app/templates/components/{}.hbs'
    \    },
    \    'app/components/*/component.js': {
    \      'type': 'component',
    \      'alternate': 'app/components/{}/template.hbs'
    \    },
    \    'app/templates/components/*.hbs': {
    \      'type': 'ctemplate',
    \      'alternate': 'app/components/{}.js'
    \    }
    \  },
    \ 'mix.exs': {
    \   'lib/*.ex': {
    \     'type':      'src',
    \     'alternate': 'test/{}_test.exs'
    \   },
    \   'test/*_test.exs': {
    \     'type':      'test',
    \     'alternate': 'lib/{}.ex'
    \   }
    \ },
    \ 'package.json': {
    \   "*.tsx": {
    \     "alternate": "{dirname}/__tests__/{basename}.test.tsx",
    \     "type": "source"
    \   },
    \   '**/__tests__/*.test.tsx': {
    \     'type': 'test',
    \     'alternate': '{}.tsx'
    \   },
    \   "*.jsx": {
    \     "alternate": "{dirname}/__tests__/{basename}.test.jsx",
    \     "type": "source"
    \   },
    \   '**/__tests__/*.test.jsx': {
    \     'type': 'test',
    \     'alternate': '{}.jsx'
    \   },
    \   "*.js": {
    \     "alternate": "{dirname}/__tests__/{basename}.test.js",
    \     "type": "source"
    \   },
    \   '**/__tests__/*.test.js': {
    \     'type': 'test',
    \     'alternate': '{}.js'
    \   },
    \   "*.ts": {
    \     "alternate": "{dirname}/__tests__/{basename}.test.ts",
    \     "type": "source"
    \   },
    \   '**/__tests__/*.test.ts': {
    \     'type': 'test',
    \     'alternate': '{}.ts'
    \   }
    \ }
    \ }
" }}}

" polyglot {{{
let g:polyglot_disabled = []
" }}}

" }}}

" AutoGroups {{{
autocmd Filetype ruby nnoremap <leader>ga :AV<cr>
autocmd Filetype ruby nnoremap <leader>gr :RV<cr>
" }}}
