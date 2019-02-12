(* main.ml is the driver for the rpn *)
(* This file handles i/o *)

(* print_list : ['a] -> *print* *)
let rec print_list = function
        [] -> print_endline ""; ()
    | Tokenize.Value (e)::l -> print_string (e ^ " ") ; print_list l
    | Tokenize.Op(e)::l                  -> print_string (e ^ " ") ; print_list l
    | Tokenize.Invalid(e)::l -> print_string (e ^ " ") ; print_list l

(* take in user input *)
let input = read_line()

(* Prepare user input for tokenizing *)
let input_split_by_words = Str.split (Str.regexp " +") input
let input_tokenized = List.map Tokenize.tokenize input_split_by_words

(* Validate input *)
let input_is_valid = Tokenize.validate input_tokenized 0

(* Evaluate valid input *)
let input_evaluated = if (input_is_valid) then Rpn.rpn [] input_tokenized else []

(* Driver *)
let main () =
    if (input_is_valid == false) then print_endline "Fix your errors"
    else if (List.length input_evaluated == 0) then print_endline "Supply an RPN expression"
    else print_list input_evaluated

let _ = main ()
