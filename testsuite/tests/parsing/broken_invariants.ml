(* TEST_BELOW
(* Blank lines added here to preserve locations. *)







*)

let empty_tuple = [%tuple];;
let empty_record = [%record];;
let empty_apply = [%no_args f];;
let f = function [%record_with_functor_fields] -> ();;
[%%empty_let];;
[%%empty_type];;
module type s = sig
 [%%missing_rhs]
end;;

let x: [%empty_poly_binder] = 0;;

let f (x:[%empty_poly_binder]) = 0;;

let f x = (x:[%empty_poly_binder]);;
let g: int -> [%empty_poly_binder] = fun n x -> x;;

let f ([%empty_open_tuple_pat]) = ();;
let f ([%short_closed_tuple_pat]) = ();;
(* TEST
 readonly_files = "illegal_ppx.ml";
 setup-ocamlc.byte-build-env;
 all_modules = "illegal_ppx.ml";
 program = "ppx.exe";
 ocamlc.byte with ocamlcommon;
 all_modules = "broken_invariants.ml";
 flags = "-ppx '${ocamlrun} ${test_build_directory_prefix}/ocamlc.byte/ppx.exe'";
 toplevel;
*)
