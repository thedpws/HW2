(* Necessary constants *)
let value_regex = Str.regexp "[-]?[0-9]+[\\.]?[0-9]*$"
let op_regex = Str.regexp "[+-\\*\\^/]$"

let is_value s = Str.string_match value_regex s 0
let is_op s = Str.string_match op_regex s 0

type token =
    | Value of string
    | Op of string
    | Invalid of string

(* String -> Token *)
let tokenize s =
    if is_value s then Value s
    else if is_op s then Op s
    else Invalid s
    

(* [token] -> [string] *)
(*
let rec validate tokens i = match tokens with
    | []        -> []
    | Invalid s::ss -> ("Error: invalid token \"" ^ s ^ "\" at index " ^ (string_of_int i)) :: (validate ss (i+1))
    | Op s::ss      -> s :: validate ss (i+1)
    | Value s::ss   -> s :: validate ss (i+1)
*)

(* [Token] -> bool + *print* *)
let rec validate tokens i = match tokens with
    | []        -> true
    | Invalid s::ss -> print_endline  ("Error: invalid token \"" ^ s ^ "\" at word " ^ (string_of_int i)) ; validate ss (i+1) && false
    | Op s::ss      -> validate ss (i+1)
    | Value s::ss   -> validate ss (i+1)


(* Driver below *)

(* practice test *)
let untokenized = ["1"; "2"; "+"; "3"; "*"; "/"; "^"; "3"; "kys"]

(* [Token] -> *print* *)
let rec print_tokens = function
    [] -> ()
    | Value str::l -> print_endline "Value!!" ; print_tokens l
    | Op str::l -> print_endline "Op!!" ; print_tokens l
    | Invalid str::l -> print_endline "error!" ; print_tokens l
(*
let rec print_list = function
        [] -> ()
    | e::l -> print_endline e ; print_list l

let valid = validate (List.map tokenize untokenized) 0

(*let main () = (validate (List.map tokenize untokenized) 0)*)
let main () = print_endline (string_of_bool valid)

let _ = main()
*)
