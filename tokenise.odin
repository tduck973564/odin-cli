package main

import "core:math"

Errors :: enum {
    NotNumeric = 0,
}

Literal :: union { int, f64, string, bool }

parse_to_literal :: proc(literal: string) -> Literal {
    
    if literal == "true" {
        return true
    } else if literal == "false" {
        return false
    }
    
    index := 0
    
    for index < len(literal) {

        // Integers
        if is_numeric(rune(literal[index])) {
            ret := true
            output := 0

            for index < len(literal) {

                if !is_numeric(rune(literal[index])) {
                    index = 0
                    ret = false
                    break 
                }

                output += rune_to_int(rune(literal[index]), index, len(literal)).(int)
                index += 1
            }

            if ret { return output/10 }
        }

        // TODO: Strings, Floats, Booleans
    }

    return true
}

is_numeric :: proc(i: rune) -> bool {
    return i == '1'|| i == '2'|| i == '3'|| i == '4'|| i == '5'|| i == '6'|| i == '7'|| i == '8'|| i == '9'|| i == '0'
}


rune_to_int :: proc(i: rune, index: int, max: int) -> union { int, Error } {
    switch i {
        case '1': return 1 * pow(10, max - index)
        case '2': return 2 * pow(10, max - index)
        case '3': return 3 * pow(10, max - index)
        case '4': return 4 * pow(10, max - index)
        case '5': return 5 * pow(10, max - index)
        case '6': return 6 * pow(10, max - index)
        case '7': return 7 * pow(10, max - index)
        case '8': return 8 * pow(10, max - index)
        case '9': return 9 * pow(10, max - index)
        case '0': return 0
        case: return Error { "The rune is not a numeral.", int(Errors.NotNumeric) }
    }

    return ---
}

pow :: proc(value: int, exponent: int) -> int {
    o := value
    for i := 1; i < exponent; i += 1 {
        o *= value
    }
    return o
}