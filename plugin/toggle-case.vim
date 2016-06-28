" ToggleCase.vim - A plugin to toggle variable case
" Maintainer: Brendan Ritchie <https://github.com/bhritchie>
" Version:    0.1.0

" ANTIDISESTABLISHMENTARIANISM
" thisIsMultipleWords

" if exists("g:loaded_toggle_case") || &compatible || v:version < 700
"     finish
" endif

function! s:transform(str)
    echo a:str
    if a:str =~# '\v\C^[_]*[a-z]*$' " lower
        return substitute(
                    \ a:str,
                    \ '\v\C^([_]*)([a-z])(.*)$',
                    \ '\=submatch(1) . toupper(submatch(2)) . submatch(3)',
                    \ 'g'
                    \ )
    elseif a:str =~# '\v\C^[_]*[A-Z][a-z]*$' " Capitalized
        echo "matcch here"
        return toupper(a:str)
    elseif a:str =~# '\v\C^[_]*[A-Z]*$' " UPPER
        return tolower(a:str)
    elseif a:str =~# '\v\C^[_]*[a-z]\+([A-Z][a-z]*)*$' " camelCase
        echo "matched camelCase"
        return substitute(
                    \ a:str,
                    \ '\v\C^([_]*)([a-z])',
                    \ '\=submatch(1) . toupper(submatch(2))',
                    \ ''
                    \ )
    elseif a:str =~# '\v\C^[_]*([A-Z][a-z]*)*$' " CamelCaseWithInitialCapital
        echo "matced InitialCamelCase"
        return tolower(substitute(
                    \ a:str,
                    \ '\v\C([a-z])([A-Z])',
                    \ '\=submatch(1) . "_" . submatch(2)',
                    \ 'g'
                    \ ))
    elseif a:str =~# '\v\C^([_]*[a-z]*)*$' " snake_case
        return toupper(a:str)
    elseif a:str =~# '\v\C^([_]*[A-Z]*)*$' " UPPER_SNAKE_CASE
        return substitute(
                    \ a:str,
                    \ '\v\C([A-Z]*)_([A-Z])([A-Z]*)',
                    \ '\=tolower(submatch(1)) . submatch(2) . tolower(submatch(3))',
                    \ 'g'
                    \ )
    endif
    return a:str
endfunction

function! s:togglecase()
    let clipboard = &clipboard
    normal! mq
    try
        normal! yiw
        let word = @@
        let @@ = s:transform(word)
        if word !=# @@
            normal! viwp
        endif
    finally
        let &clipboard = clipboard
        normal! `q
    endtry
endfunction

nnoremap <silent> <Plug>ToggleCase :<C-U>call <SID>togglecase()<CR>

if !hasmapto("<Plug>ToggleCase")
    nmap tt <Plug>ToggleCase
endif

let g:loaded_toggle_case = 1
