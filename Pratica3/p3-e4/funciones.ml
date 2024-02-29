let rec sumto s = if s > 0 then s + sumto(s - 1) else 0;;

let rec exp10 n = if n > 0 then 10 * exp10(n - 1) else 1;; 

let rec num_cifras c = if c / 10 != 0 then 1 + num_cifras(c / 10) else 1;;(*caso 0*)

let rec sum_cifras sc = if (sc > 0) then ((sc mod 10) + sum_cifras(sc/10)) else (if sc < 0 then ((-sc mod 10) + sum_cifras(sc/10)) else 0);;
