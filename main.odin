package main

import "core:fmt"
import "core:os"

main :: proc() {
    // This is all testing, ignore
    args := os.args
    fmt.println(args)
    h := "hello"
    fmt.println(h[1])
    fmt.println(is_numeric('1'))
    fmt.println(is_numeric('d'))
    fmt.println(pow(10, 3))
    fmt.println(rune_to_int('3', 4, 10))
    fmt.println(parse_to_literal("34634356"))
}

