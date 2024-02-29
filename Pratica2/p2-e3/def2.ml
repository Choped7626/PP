let p = function p -> 2. *. (2.0 *. asin(1.0)) *. p ;;

let area = function area -> (2.0 *. asin(1.0)) *. (area *. area) ;;

let absf = function absf -> if absf > 0. then absf else -.absf ;;

let even = function even -> (even mod 2) = 0;;

let rec next3 = function nes3 -> if nes3 mod 3 = 0 then nes3 else next3(nes3 + 1);; 

let is_a_letter = function is_a_letter -> ((int_of_char(is_a_letter) > 64) && (int_of_char(is_a_letter) < 123));;

let string_of_bool = function string_of_bool -> if string_of_bool then "verdadero" else "falso";;

