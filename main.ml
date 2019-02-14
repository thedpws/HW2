(* main.ml is the driver for the rpn *)
(* This file handles i/o *)

(* print_list : ['a] -> *print* *)
let rec print_list = function
  [] -> print_endline ""; ()
  | Tokenize.Value (e)::l -> 
     print_string (e ^ " ") ; 
     print_list l
  | Tokenize.Op(e)::l -> print_string (e ^ " ") ; print_list l
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
        (* if no expression (list is []) print no rpn expression *)
        (* else if bad expression, print bad expression *)
        (* more than 1 elem in stack -> bad *)
        (* opertor in stack -> bad *)

let main () =
    print_string "Stack: ";
    print_list (input_evaluated);
    if not input_is_valid then print_endline "Exit: invalid tokens"
    else if (List.length input_evaluated == 0) then print_endline "Exit: No RPN expression provided"
    else if (List.length input_evaluated != 1) then print_endline "Exit: Bad RPN expression"
    else () (* Good exit *)

let _ = main ()
