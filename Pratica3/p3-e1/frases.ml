(*x - y;;*)
(*
Error: Unbound value x
error de tipos , pues no tiene ningun valor vinculado
*)

let x = 1;;
(* reserva el caracter 'x' y guarda el valor 1
val x : int = 1
*)
(*x - y;;*)
(*
Error:Unbound value y
error de tipos , pues no tiene ningun valor vinculado
*)
let y = 2;;
(*
val y : int = 2
reserva el caracter 'y' y guarda el valor 2
*)
x - y;;
(*
- : int = -1
*)
let x = y in x - y;;
(*
- : int = 0
*)
x - y;;
(*
- : int = -1
*)
(*z;;*)
(*
Error: Unbound value z
error de tipos , pues no tiene ningun valor vinculado
*)
let z = x + y;;
(*
val z = int = 3
*)
z;;
(*
- : int = 3
*)
let x = 5;;
(*
val x : int = 5
*)
x + y;;
(*
- : int = 7
*)
z;;
(*
- : int = 3
*)
let y = 5 in x + y;;
(*
- : int = 10
*)
x + y;;
(*
- : int = 7
*)
let x = x + y in let y = x * y in x + y + z;;
(*
- : int = 24
*)
x + y + z;;
(*
- : int = 10
*)
function x -> 2 * x;;
(*
- : int -> int = <fun>
*)
(function x -> 2 * x)(2 + 1);;
(*
- : int = 6
*)
(function x -> 2 *x)  2 + 1;;
(*
- : int = 5
*)
let f = function x -> 2 * x;;
(*
val f : int -> int = <fun>
*)
f;;
(*
- : int -> int = <fun>
*)
f (2 + 1);;
(*
- : int = 6
*)
f 2 + 1;;
(*
- : int = 5
*)
f x;;
(*
- : int = 10
*)
let x = 100;;
(*
val x : int = 100
*)
f x;;
(*
- : int = 200
*)
let m = 1000;;
(*
val m : int = 1000
*)
let g = function x -> x + m;;
(*
val g : int -> int = <fun>
*)
g;;
(*
- : int -> int = <fun>
*)
g 3;;
(*
- : int = 1003
*)
(*g 3.0;;*)
(*
Error: es tipo float y se esperaba un int , error de tipos
*)
let m = 7;;
(*
val m : int = 7
*)
g 3;;
(*
- : int = 1003
ainda q cambiemos oo valor de m a funcion colle usa o valor q tiña cando foi declarada
*)
let istrue = function true -> true;;
(*
val istrue : bool -> bool = <fun>
da un warning de q non esta contemplada un resultado para a entrada false
*)
istrue;;
(*
- : bool -> bool = <fun>
*)
istrue (1 < 2);;
(*
- : bool = true
*)

(*istrue (2 < 1);;*)
(*
error de ejecucion por fallo de match  por non haber declarado las reglas de la  funcion de forma q contemplara toda entrada posible
*)

(*istrue 0

Error de tipos , se esperaba un bool pero é  un int
*)
let iscero_v1 = function 0 -> true;;
(*
da un warning por no contemplar todo escenario posible
val iscerio_v1 : int -> bool = <fun>
*)
iscero_v1 0;;
(*
- : bool = true
*)
(*iscero_v1 0.;;*)
(*
error de tipos , esperaba un int pero recibe un float
*)
(*iscero_v1 1;;*)
(*
error de ejecucion por fallo de match por culpa de no haber contemplado todo escenario posible al declarar las reglas de la funcion iscero_v1
*)
let iscero_v2 = function 0 -> true |  _ -> false;;
(*
el '_' significa cualquier valor q pueda recibir
val iscero_v2 : int -> bool = <fun>
*)
iscero_v2 0;;
(*
- : bool = true
*)
iscero_v2 1;;
(*
- : bool = false
*)
(*iscero_v2 0.;;*)
(*
error de tipos pues esperaba un int
*)
let all_to_true = function true -> true | false -> true;;
(*
val all_to_true : bool -> bool = <fun>
*)
all_to_true (1 < 2);;
(*
- : bool = true
*)
all_to_true (2 < 1);;
(*
- : bool = true
*)
(*all_to_true 0;;*)
(*
error de tipos pues esperaba un bool 
*)
let first_all_to_true = all_to_true;;
(*
val first_all_to_true : bool -> bool = <fun>
*)
let all_to_true = function x -> true;;
(*
val all_to_true : 'a -> bool = <fun>
*)
all_to_true (1 < 2);;
(*
- : bool = true
*)
all_to_true (2 < 1);;
(*
- : bool = true
*)
all_to_true 0;;
(*
-: bool = true
*)
(*first_all_to_true 0;;*)
(*
error de tipos pues esperaba un bool y hay un int
la funcion no cambia su funcionamiento al cambiar all_to_true
*)
