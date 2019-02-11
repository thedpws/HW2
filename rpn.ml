(* see an op -> pop 2 from stack, compute, push back onto stack, continue *)
(* rpn : String list -> String list -> String list *)

(* Errors
 * invalid input
 * Missing operators / empty stack (mismatched rpn)
 * bad tokens
 *)
let rec rpn numbers unparsed = match unparsed with
    | []            -> numbers
    | "+"::xs       ->  
                        let operand1 = List.hd numbers in
                        let operand2 = List.hd (List.tl numbers) in
                        let numbers2 = (string_of_float(float_of_string operand1 +. float_of_string operand2))::(List.tl (List.tl numbers)) in
                    let unparsed2 = xs in
                    rpn numbers2 unparsed2
    | "-"::xs       ->  
                        let operand1 = List.hd numbers in
                        let operand2 = List.hd (List.tl numbers) in
                        let numbers2 = (string_of_float(float_of_string operand2 -. float_of_string operand1))::(List.tl (List.tl numbers)) in
                    let unparsed2 = xs in
                    rpn numbers2 unparsed2
    | "^"::xs       ->  
                        let operand1 = List.hd numbers in
                        let operand2 = List.hd (List.tl numbers) in
                        let numbers2 = (string_of_float(float_of_string operand2 **float_of_string operand1))::(List.tl (List.tl numbers)) in
                    let unparsed2 = xs in
                    rpn numbers2 unparsed2
    | "*"::xs       ->  
                        let operand1 = List.hd numbers in
                        let operand2 = List.hd (List.tl numbers) in
                        let numbers2 = (string_of_float(float_of_string operand1 *. float_of_string operand2))::(List.tl (List.tl numbers)) in
                    let unparsed2 = xs in
                    rpn numbers2 unparsed2
    | "/"::xs       ->  
                        let operand1 = List.hd numbers in
                        let operand2 = List.hd (List.tl numbers) in
                        let numbers2 = (string_of_float(float_of_string operand2 /. float_of_string operand1))::(List.tl (List.tl numbers)) in
                    let unparsed2 = xs in
                    rpn numbers2 unparsed2
    | _             -> 
                        let numbers2 = (List.hd unparsed) :: numbers in
                        let unparsed2 = List.tl unparsed in
                        rpn numbers2 unparsed2
let hard5 = ["2"; "6"; "-"; "4"; "+"]

let death1 = ["2"; "5"; "8"; "-"; "-"]
let hard4 =  ["2"; "6"; "+"; "4"; "+"]
let hard3 =  ["5"; "5"; "3"; "*"; "+"]
let hard2 =  ["2"; "3"; "4"; "+"; "5"; "6"; "-"; "-"; "*"]
let hard =  ["5"; "6"; "5";"+"; "+"]

let easy1 = ["-2"; "-6"; "-"]
let easy =  ["5"; "6"; "+"]

let rec print_list = function 
        [] -> ()
      | e::l -> print_endline e ; print_list l

let input = read_line()
let tokenized_input = Str.split (Str.regexp " +") input

let main () = print_list (rpn [] tokenized_input)

let _ = main ()
