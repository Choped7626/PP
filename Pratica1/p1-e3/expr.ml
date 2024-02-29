();;
(*- : unit = ()
el compilador si que detecta como
 unidad los parentesis vacios*)

2 + 5 * 3;;
(*- : int = 17
se calcula el resultado de la operación:resultado esperado = 17*)

1.25 *. 2.0;;
(*- : float = 2.5
se calcula el resultado de la operacion(multiplicacion de punto flotante):
resultado esperado = 2.5*)

(*
2 - 2.0 ;;
Da error de tipo por haber usado un entero y un punto flotante*)


(*
3.0 + 2.0;;
al usar el operador equivocado
da error de tipos pues se esperaba un int*)

5 / 3;;
(*- : int = 1
se calculará la división entera: resultado esperado = 1 *)

5 mod 3;;
(*- : int = 2
se calculará el resto de la división entera de 5 y 3:
resultado esperado = 2*) 

2.0 *. 3.0 ** 2.0;;
(*- : float = 18
la operacion se lleva acabo dando resultado
 float = 18.0*)

2.0 ** 3.0 ** 2.0;;
(*- : float = 512
se producirá la exponeciacion de flotantes: res = 512.0*)

sqrt;;
(*- : float -> float = <fun>*)

(*
sqrt 4;;
da error de tipo por ser el valor esperado un float*)

int_of_float;;
(*- : float -> int = <fun>
pasa de float a int*)

float_of_int;;
(*- : int -> float = <fun>
pasa de int a float*)

3.0 = float_of_int 3;;
(*- : bool = true
compara si es el mismo numero*)

(*
int_of_float -2.9;;
da error de tipos*)

int_of_float 2.1 + int_of_float (-2.9);;
(*- : int = 0
se ejecuta el calculo y da 0*)

truncate;;
(*- : float -> int = <fun>
truncará un numero de float a int*)

truncate 2.1 + truncate (-2.9);;
(*- : int = 0
resulta el int = 0*)

floor;;
(*- : float -> float = <fun>
se compila correctamente*)

floor 2.1 +. floor(-2.9);;
(*- : float = -1.
se redondean los numeros hacia el menor mas cercano y resulta en -1*)

ceil;;
(*- : float -> float = <fun>*)

ceil 2.1 +. ceil(-2.9);;
(*- : float = 1.
se produce la operacion redondeando hacia el entero mayor mas cercano
dando 1*)

int_of_char;;
(*- : char -> int = <fun>
compila y pasa de char a int*)

int_of_char 'A';;
(*- : int = 65
dará el valor en ASCII de 'A'*)

char_of_int;;
(*- : int -> char = <fun>
compilará y pasa de int a char*)

char_of_int 66;;
(*- : char = 'B'
compilará cambiando el int 66 al char B*)

Char.code;;
(*- : char -> int = <fun>
compila pasando de char a int*)

Char.code 'B';;
(*- : int = 66
pasa del char B a su int en ASCII*)

Char.chr;;
(*- : int -> char = <fun>
compila pasando de int a char en ASCII*)

Char.chr 67;;
(*- : char = 'C'*)

'\067';;
(*- : string = "C"
compila el valor char de la referencia en ascii*)

Char.chr(Char.code 'a' - Char.code 'A' + Char.code 'M');;
(*- : char = 'm'
operará con los valores enteros de las letras en ascii y mostrará
el resultado cambiando el int por el char correspondiente*)

Char.lowercase_ascii;;
(*- : char -> char = <fun>
compila y trata de pasar las letras en minuscula usando ascii*)

Char.lowercase_ascii 'M';;
(*- : char = 'm'
se cambiará el char M a m*)

Char.uppercase_ascii;;
(*- : char -> char = <fun>
tratará de cambiar un char a su correspondiente en mayuscula en el
alfabeto ascii*)

Char.uppercase_ascii 'm';;
(*- : char = 'M'
cambiará el char por M*)

"this is a string";;
(*- : string = "this is a string"
se compilará lo escrito como tipo de dato string*)

String.length;;
(*- : string -> int = <fun>
tratará de medir la longitud de un string teniendo como resultado un int*)

String.length "longitud";;
(*- : int = 8
medirá la longitud del string introducido = 8*)

(*
"1999" + "1";;
dará error de tipo de datos por esperar un int y recibir un string*)

"1999" ^ "1";;
(*- : string = "19991"
concatena los strings dando 19991*)

int_of_string;;
(*- : string -> int = <fun>
compila y pasa de  string a int cambiando cada letra por su valor ascii*)

int_of_string "1999" + 1;;
(*- : int = 2000
se transforma el string y se realiza la operacion = 2000*)

"\065\066";;
(* - : string = "AB"
la cadena de caracteres estará formada por las letras correspondientes
con los códigos ascii introducidos*)

string_of_int;;
(* - : int -> string = <fun>
pasa de int a string*)

string_of_int 010;;
(*- : int -> string = "10"*)

not true;;
(*- : bool = flase*)

true && false;;
(*- : bool = false*)

true || false;;
(*- : bool = true*)

(1 < 2) = false;;
(*- : bool = false*)

"1" < "2";;
(*- : bool = true*)

2 < 12;;
(*- : bool = true*)

"2" < "12";;
(*- : bool = false*)

"uno" < "dos";;
(*- : bool = false*)

if 3 = 4 then 0 else 4;;
(*- : int = 4*)

if 3 = 4 then "0" else "4";;
(*- : string ="4"*)

(*
if 3 = 4 then 0 else "4";;
error de tipos pues esperaba un int y no string*)

(if 3 < 5 then 8 else 10) + 4;;
(*- : int = 12*)
