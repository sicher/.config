" Little Computer People
set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "LittleComputerPeople"

let s:palette = {
      \ 'fg'   : [  "black", '#4a4232'],
      \ 'bg'   : [  "white", '#fdf6e4'],
      \ 'mark' : [  "red", '#f44336'],
      \ }

function! s:Clear(group)
  execute 'highlight! clear ' . a:group
  execute 'highlight ' . a:group . ' NONE'
endfunction

function! s:Define(group, fg, bg, style)
  call s:Clear(a:group)

  let [l:ctermfg, l:guifg] = s:palette[a:fg]
  let [l:ctermbg, l:guibg] = s:palette[a:bg]

  let l:hi_expr = 'highlight ' . a:group
  let l:hi_expr .= ' cterm=' . a:style
  let l:hi_expr .= ' ctermfg=' . l:ctermfg
  let l:hi_expr .= ' ctermbg=' . l:ctermbg
  let l:hi_expr .= ' gui=' . a:style
  let l:hi_expr .= ' guifg=' . l:guifg
  let l:hi_expr .= ' guibg=' . l:guibg

  execute l:hi_expr
endfunction

function! s:Link(from, to)
  call s:Clear(a:from)
  execute 'highlight link ' . a:from . ' ' . a:to
endfunction 

call s:Define('Normal',		'fg',	'bg',	'NONE')
call s:Define('PreProc',	'fg',	'bg',	'NONE')
call s:Define('Constant',	'fg',	'bg',	'bold')
call s:Define('String',		'fg',	'bg',	'italic')
call s:Define('Comment',	'mark',	'bg',	'italic')
call s:Define('TODO',		'mark',	'bg',	'bold')
call s:Define('IncSearch',	'mark',	'bg',	'inverse')
call s:Define('Search',		'mark',	'bg',	'inverse')
call s:Define('SpecialKey',	'mark',	'bg',	'NONE')
call s:Define('Folded',		'fg',	'bg',	'inverse')
call s:Define('Title',		'fg',	'bg',	'bold')
call s:Define('Underlined',	'fg',	'bg',	'underline')
call s:Define('Pmenu	',	'fg',	'bg',	'inverse')
call s:Define('PmenuSel',	'mark',	'bg',	'inverse')
call s:Define('PmenuThumb',	'mark',	'bg',	'inverse')
call s:Define('MatchParen',	'fg',	'bg',	'bold')
call s:Define('DiffAdd',	'mark',	'bg',	'NONE')
call s:Define('DiffChange',	'mark',	'bg',	'NONE')
call s:Define('DiffDelete',	'mark',	'bg',	'NONE')
call s:Define('mkdHeading',	'mark',	'bg',	'bold')

call s:Clear('Identifier')
call s:Clear('Special')
call s:Clear('Statement')
call s:Clear('Type')
call s:Clear('WarningMsg')
call s:Clear('Wildmenu')
call s:Clear('Directory')
call s:Clear('LineNr')
call s:Clear('SignColumn')

call s:Link('NonText', 'SpecialKey')
call s:Link('Error', 'Search')
call s:Link('ErrorMsg', 'Search')
call s:Link('FoldColumn', 'Folded')
