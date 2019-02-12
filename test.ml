
open OUnit
open Rpn

let test_fixture = "Rpn" >:::
[
    "add" >:: ( fun () ->
            assert_equal 4.0 (Rpn.operate "+" "2.0" "2.0");
    );

    "subtract" >:: (fun () ->
            assert_equal 2.0 (Rpn.operate "-" "4.0" "2.0");
    );

]

let _ = run_test_tt test_fixture
