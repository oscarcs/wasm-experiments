(module 
    (import "js" "print_int" (func $print_int (param i32)))
    (func $main
        i32.const 13
        call $print_int
    )
    (export "main" (func $main))
)