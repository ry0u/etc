function MyTest(val)
    let i = 0
    while i < a:val
        echo "Hello,World"
        let i += 1
    endwhile
endfunction

command! -nargs=1 Ry0u call MyTest(<q-args>)
