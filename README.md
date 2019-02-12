# RPN in OCaml

## How to build
1) Run `make` to build "main.o"
2) Run `./main.o`

## What works
* Reading from stdin
* Sum types for error handling
* RPN expressions (+, -, \*, ^, /)
* Error handling (invalid input)
* If stack ends with 1 element, prints out result, else prints error

## What doesn't work
* Unit test "test.ml"

## Assumptions
* Tokens are delimited by at least 1 space character.
* User input is on a single line only
* Only words allowed are numbers and operators
* Stack has 1 element -> print result


