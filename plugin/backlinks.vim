if exists('g:loaded_backlinks') | finish | endif " prevent loading file twice

let s:save_cpo = &cpo " save user coptions
set cpo&vim           " reset them to defaults" command to run our plugin

" Command to run our plugin
" command! AlphaHelloWorld lua require("hello").sayHelloWorld()

let &cpo = s:save_cpo " and restore after
unlet s:save_cpolet 

g:loaded_backlinks = 1
