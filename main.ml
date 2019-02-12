let rec print_list = function
        [] -> print_endline ""; ()
    | Tokenize.Value (e)::l -> print_string (e ^ " ") ; print_list l
    | Tokenize.Op(e)::l                  -> print_string (e ^ " ") ; print_list l
    | Tokenize.Invalid(e)::l -> print_string (e ^ " ") ; print_list l

let input = read_line()
let input_split_by_words = Str.split (Str.regexp " +") input
let input_tokenized = List.map Tokenize.tokenize input_split_by_words
(* debug purposes *)
(*
let printt () = Tokenize.print_tokens input_tokenized
let _ = printt()
*)
let input_is_valid = Tokenize.validate input_tokenized 0
let input_evaluated = if (input_is_valid) then Rpn.rpn [] input_tokenized else []
let main () =
    if (input_is_valid == false) then print_endline "Fix your errors"
    else if (List.length input_evaluated == 0) then print_endline "Supply an RPN expression"
    else print_list input_evaluated

let _ = main ()
