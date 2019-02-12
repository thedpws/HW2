(* Necessary constants *)
let value_regex = Str.regexp "[-]?[0-9]+[\\.]?[0-9]*$"
let op_regex = Str.regexp "[+-\\*\\^/]$"

(* Matching strings on regex *)
let is_value s = Str.string_match value_regex s 0
let is_op s = Str.string_match op_regex s 0

(* Elements of the stack are tokens *)
type token =
    | Value of string
    | Op of string
    | Invalid of string


(* tokenize : String -> Token *)
(* Turns a String into a Value, Op(erator), or Invalid token based on regex *)
let tokenize s =
    if is_value s then Value s
    else if is_op s then Op s
    else Invalid s
    


(* validate : [Token] -> bool + *print* *)
(* returns true if valid, returns false otherwise *)
let rec validate tokens i = match tokens with
    | []            -> true
    | Invalid s::ss -> print_endline  ("Error: invalid token \"" ^ s ^ "\" at word " ^ (string_of_int i)) ; validate ss (i+1) && false
    | Op s::ss      -> validate ss (i+1)
    | Value s::ss   -> validate ss (i+1)

let rec one_value ls i = match ls with
    | []            -> i == 1
    | Value v::vs   -> one_value vs (i+1)
    | _             -> false

