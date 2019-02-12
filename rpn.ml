(* see an op -> pop 2 from stack, compute, push back onto stack, continue *)
(* rpn : String list -> String list -> String list *)

(* Errors
 * invalid input
 * Missing operators / empty stack (mismatched rpn)
 * bad tokens
 *)
open Tokenize

(* operate : String op -> String f1 -> String f2 -> String result *)
let operate op f1 f2 = match op with
    | "+" -> string_of_float(float_of_string f1 +. float_of_string f2)
    | "-" -> string_of_float(float_of_string f1 -. float_of_string f2)
    | "*" -> string_of_float(float_of_string f1 *. float_of_string f2)
    | "/" -> string_of_float(float_of_string f1 /. float_of_string f2)
    | "^" -> string_of_float(float_of_string f1 ** float_of_string f2)
    | _   -> "1.0"

(* [Token] -> [Token] -> [Token] *)
let rec rpn numbers unparsed = match unparsed with
    | []            -> numbers
    | Tokenize.Op (op)::xs       ->  
                    if (List.length numbers < 2) then (
                            print_endline "Not enough operands";
                            numbers @ unparsed
                    ) else (
                        let Tokenize.Value (operand1) = List.hd numbers in
                        let Tokenize.Value (operand2) = List.hd (List.tl numbers) in
                        let numbers2 = (Tokenize.Value (operate op operand2 operand1) )::(List.tl (List.tl numbers)) in
                        let unparsed2 = xs in
                        rpn numbers2 unparsed2
                    )
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

