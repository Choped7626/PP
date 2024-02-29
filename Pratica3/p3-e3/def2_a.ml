let p n = 2. *. (2.0 *. asin(1.0)) *. n;;

let area n = (2.0 *. asin(1.0)) *. (n *. n) ;;

let absf n = if n > 0. then n else -.n ;;

let even n = (n mod 2) = 0;;

let rec next3 n = if n mod 3 = 0 then n else next3(n + 1);;

let is_a_letter l = ((int_of_char(l) > 64) && (int_of_char(l) < 123));;

let string_of_bool sb = if sb then "verdadero" else "falso";;

