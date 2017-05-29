let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/blog
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +2 app/controllers/articles_controller.rb
badd +2 app/models/article.rb
badd +1 app/controllers/welcome_controller.rb
badd +1 app/controllers
badd +5 app/views/articles/new.html.erb
badd +1 app/views/articles
badd +1 app/views/layouts/mailer.text.erb
badd +15 app/views/articles/show.html.erb
badd +17 app/views/articles/index.html.erb
badd +387 ~/.vimrc
badd +3 app/views/welcome/index.html.erb
badd +1 app/views/articles/edit.html.erb
badd +1 ~/.dotfiles/UltiSnips/eruby.snippets
badd +8 ~/.dotfiles/UltiSnips/ruby.snippets
badd +11 app/views/articles/_form.html.erb
badd +3 app/models/comment.rb
badd +5 config/routes.rb
badd +2 app/controllers/comments_controller.rb
badd +14 app/views/comments/_comment.html.erb
badd +1 app/views/comments/_form.html.erb
argglobal
silent! argdel *
edit app/controllers/comments_controller.rb
set splitbelow splitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=8
setlocal fen
3
normal! zo
let s:l = 2 - ((1 * winheight(0) + 12) / 24)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
2
normal! 0
lcd ~/dev/blog
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOc
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
let g:this_obsession_status = 2
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
