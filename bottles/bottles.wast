(module 
    (import "js" "print_int" (func $print_int (param i32)))
    (import "js" "print_string" (func $print_string (param i32) (param i32)))
    (import "js" "mem" (memory 1)) 

    (data (i32.const 0) " bottles of beer on the wall\n") ;; 29
    (data (i32.const 29) " bottles of beer\n") ;; 17
    (data (i32.const 46) "Take one down, pass it around\n") ;; 30
    (data (i32.const 76) " bottles of beer on the wall\n") ;; 29
    ;; 105

    (func $print_block (param $x i32)
        
        ;; 'x bottles of beer on the wall'
        get_local $x
        call $print_int
        i32.const 0
        i32.const 29
        call $print_string

        ;; 'x bottles of beer'
        get_local $x
        call $print_int
        i32.const 29
        i32.const 17
        call $print_string
    
        ;; 'Take one down, pass it around'
        i32.const 46
        i32.const 30
        call $print_string

        ;; 'x-1 bottles of beer on the wall'
        get_local $x
        i32.const 1
        i32.sub ;; subtract 1
        call $print_int
        i32.const 76
        i32.const 29
        call $print_string

        ;; Trailing newline
        i32.const 104
        i32.const 1
        call $print_string
    )
    
    (func $main (local $c i32)
 
        i32.const 99
        set_local $c
        
        (loop
            get_local $c
            call $print_block

            get_local $c
            i32.const 1
            i32.sub
            tee_local $c
            br_if 0
        )
    )

    (export "main" (func $main))
)