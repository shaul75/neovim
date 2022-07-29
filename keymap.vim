" Allow saving of files as sudo when I forgot to start vim using sudo.
"cmap w!! w !sudo tee > /dev/null %
inoremap jk <Esc>
 
" set leader key to space
let g:mapleader=" "

" most recentuly used files
nnoremap <Leader>m <cmd>Telescope oldfiles<cr>

" find buffer
nnoremap ; <cmd>Buffers<cr>
 " quickfix list
nnoremap qf <cmd>Telescope quickfix<cr>

" all files
nnoremap <leader>p <cmd>Files<cr>
" nnoremap <Leader>bfs :lua require'telescope.builtin'.find_files{}<CR>

" ripgrep like grep through dir
nnoremap <leader>rg <cmd>Telescope live_grep<cr>

" pick color scheme
nnoremap <leader>cs <cmd>Telescope colorscheme<cr>

nnoremap <leader>t <cmd>NvimTreeToggle<cr>
nnoremap <leader>e <cmd>TroubleToggle document_diagnostics<cr>

" >> setup nerdcomment key bindings
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims = 1

xnoremap <Leader>ci :call NERDComment('n', 'toggle')<CR>
nnoremap <Leader>ci :call NERDComment('n', 'toggle')<CR>


" >> Lsp key bindings
nnoremap <silent> gd    <cmd>Telescope lsp_definitions<CR>
nnoremap <silent> gr    <cmd>Telescope lsp_references<CR>
nnoremap <silent> gi    <cmd>Telescope lsp_implementations<CR>
nnoremap <silent> K     <cmd>Lspsaga hover_doc<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gf    <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> gn    <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>gf    <cmd>Lspsaga code_action<CR>
" xnoremap <silent> ga    <cmd>Lspsaga range_code_action<CR>
nnoremap <silent> gs    <cmd>Lspsaga signature_help<CR>
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>

" ### navigation stuff ###
" switch focus on pane with leader hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <leader>v <C-w>v
noremap <leader>h :sp<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>gb :Git blame<CR>
nnoremap <leader>gst :Git status<CR>
nnoremap <leader>w :w<CR>
" terminal
" exit to normal mode via Ctrl+O instead of CTRL+\ CTRL+n
tnoremap <Esc> <C-\><C-n>
nnoremap <leader>` :below 10sp term://$SHELL<cr>i
" Enter key in normal mode to drop line
nmap <CR> o<ESC>k
" keymaps for running tests
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

nnoremap <leader>nt :tabnew<CR>
nnoremap <leader>q :bd<CR>
" quick edit files
nnoremap <leader>gvrc :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>gvkm :e ~/.config/nvim/keymap.vim<CR> 
nnoremap <leader>gzsh :e ~/.zshrc<CR>

" remove the search highlighting 
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" https://github.com/junegunn/vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

