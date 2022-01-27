package main

// Return `union { Error, <type> }` for functions using this
// Ideally `code` would be defined in an enum
Error :: struct {
    message: string,
    code: int,
}
