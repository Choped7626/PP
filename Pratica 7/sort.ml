
    let s = Gc.get () in Gc.set {s with stack_limit = 1048576};;    
    
    let crono f x =
        let t = Sys.time () in
        let _ = f x in
        Sys.time () -. t

    let rec insert x = function
            [] -> [x]
        |   h::t -> if x <= h then x :: h :: t
            else h :: insert x t

    let rec isort = function
            [] -> []
        |   h::t -> insert h (isort t);;

    (*Stack overflow al usar isort e insert de 1_000_000*)
    let bigl = List.init 1_000_000 succ;;
    
    let insert_t x lista = 
        let rec aux lista acc = match lista with
            [] -> List.rev(x::acc) 
        |   h::t -> if (x > h) then aux t (h::acc)
                    else if (x <= h) && acc <> []
                        then List.rev_append acc (x::lista)
                    else 
                        x::h::t
        in aux lista [];;


    let isort_t l =
        let rec aux2 acc recorrer = match recorrer with
            [] -> acc
        |   h::t -> aux2 (insert_t h acc) t
            in aux2 [] l;;

    let rlist n =
        let rec random l m = match m with
            0 -> l
        |   _ -> random ((Random.int n)::l) (m-1)
        in random [] n;;

    let lc1 = List.init 10_000 succ;;
    let lc2 = List.init 20_000 succ;;
    let ld1 = List.rev lc1;;
    let ld2 = List.rev lc2;;
    let lr1 = rlist 10_000;;
    let lr2 = rlist 20_000;;
    
(*
    # crono isort lc1;;
    - : float = 0.00103400000000000714
    # crono isort lc2;;
    - : float = 0.00297500000000000542
    # crono isort ld1;;
    - : float = 0.988145000000000162
    # crono isort ld2;;
    - : float = 4.317535
    # crono isort lr1;;
    - : float = 0.472488000000000241
    # crono isort lr2;;
    - : float = 2.08211299999999966
*)


(*
    # crono isort_t lc1;;
    - : float = 1.253781
    # crono isort_t lc2;;
    - : float = 5.95562700000000333
    # crono isort_t ld1;;
    - : float = 0.00187899999999885381
    # crono isort_t ld2;;
    - : float = 0.00317700000000087357
    # crono isort_t lr1;;
    - : float = 0.614166000000000878
    # crono isort_t lr2;;
    - : float = 2.74877700000000047
*)

(*
Para las listas de valores ordenadas ascendentemente lc1 y lc2 los tiempos de ejecución de isort sobre lc2 se duplica con respecto a lc1 puesto que la lista tiene el dobre de tamaño , aunque al ser pequeños no se aprecian.
Para isort_t sus tiempos de ejecucion aumentan redicalmente (multiplicandose por 6) , esto se debe a que el número de ejecuciones recursivas en insert_t aumenta con cada ejecución recursiva de isort_t pues de cada vez que se se usa insert_t en isort_t , la lista en la que se le pide insertar el dato aumenta de tamaño y durante la ejecucion de insert_t se acceden a todos los elementos antes de devolver una solucion simepre que el valor a insertar sea mayor a la cabeza de la lista, por eso con las listas ordenadas ascendentemente el tiempo de ejecucion es tan grande

Para las listas de valores ordenadas descendentemente ld1 y ld2 el tiempo de ejecucion de isort sobre ld2 se cuadriplica con respecto a ld1.
Para isort_t los tiempos de ejecucion entre ld1 y ld2 estan cerca de duplicarse solo que en este caso son muy pequeños gracias a que en insert_t no se producen llamadas recursivas debido a ser las listas ordenadas descendientemente 

Para las listas de valores aleatorios lr1 y lr2 los tiempos de ejecucion aumentan entre las ejecuciones con lr1 y lr2 debido a su tamaño pero casi no varian entre usar isort o isort_t gracias a que las listas no siguen un criterio de ordenacion inicial
*)

    let insert_g x ord lista = 
        let rec aux lista acc = match lista with
            [] -> List.rev(x::acc) 
        |   h::t -> if ord x h then aux t (h::acc)
                    else if acc <> []
                        then List.rev_append acc (x::lista)
                    else 
                        x::h::t
        in aux lista [];;

    let isort_g ord lista =
        let rec calc recorrer sol = match recorrer with 
            [] -> List.rev(sol)
        |   h::t -> calc t (insert_g h ord sol)
        in calc lista [];; 
    




    let rec split l = match l with
        h1::h2::t -> let t1, t2 = split t
                    in h1::t1, h2::t2
    |   _ -> l, [];;

    let rec merge (l1,l2) = match l1, l2 with
        [], l | l, [] -> l
    |   h1::t1, h2::t2 -> if h1 <= h2 then h1 :: merge (t1, l2)
                            else h2 :: merge (l1, t2);;

    let rec msort l = match l with
        [] | [_] -> l
    |   _ -> let l1, l2 = split l
            in merge (msort l1, msort l2);;

    let bigl2 = List.init 1_000_000 succ;;


    let split_t l =
        let rec au acc1 acc2 iterar = match iterar with
            h1::h2::t -> au (h1::acc1) (h2::acc2) t
        |   h3::t -> au (h3::acc1) acc2 t
        |   [] -> acc1 , acc2
        in au [] [] l;;

    let merge_t (l1,l2) =
        let rec mezcla primera segunda sol = match primera , segunda with 
          [] , l -> List.rev(List.rev_append l sol)
        | l , [] -> List.rev(List.rev_append l sol)
        | h1::t1 , h2::t2 -> if h1 <= h2 then mezcla t1 segunda (h1::sol) else mezcla primera t2 (h2::sol)
        in mezcla l1 l2 [];;
    
    let bigl3 = [];;

    let rec msort' l = match l with
        [] | [_] -> l
    |   _ -> let l1 , l2 = split_t l 
            in merge_t (msort' l1 , msort' l2);;
(*
Aunque msort' no es recursiva terminal , esta no produce Stack Overflow gracias a la funcion split_t pues esta divide a la mitad una lista , gracias a ella entonces el numero de llamadas recursivas se reduce muchísimo por ese mismo motivo gracias a eso entocnes nos permite trabajar con listas de tamaños inmensos y aun así no producir stack overflow pues el numero de llamadas recursivas. Para poder calcular el numero de llamadas recursivas solo hay que calcular el logaritmo de base 2 del tamaño de la lista , haciendo esto podemos observar como para una lista de tamaño max_int el numero de llamadas recursivas serían 62 , logicamente podemos concluir que no existe una lista de tamaño suficiente para producir Stack Overflow
*)


(*
# crono msort lc1;;
- : float = 0.0114329999999998044
# crono msort lc2;;
- : float = 0.0196800000000001418
# crono msort ld1;;
- : float = 0.00954799999999966786
# crono msort ld2;;  
- : float = 0.0181110000000002103
# crono msort lr1;;
- : float = 0.0102540000000002074
# crono msort lr2;;
- : float = 0.0230120000000000324

*)

(*
# crono msort' lc1;;
- : float = 0.0104090000000001126
# crono msort' lc2;;
- : float = 0.0189849999999998076
# crono msort' ld1;;
- : float = 0.0105649999999997135
# crono msort' ld2;;
- : float = 0.0194800000000001639
# crono msort' lr1;;
- : float = 0.0106839999999999158
# crono msort' lr2;;
- : float = 0.022073999999999927
*)

(*
En este caso al ejecutar msort y msort' con lc1 , lc2 , ld1 , ld2 , lr1 y lr2 los tiempos de ejecución no varían prácticamente nada gracias a la forma de funcionar del algoritmo de fusion que es el que estas funciones estan implementando. Se sigue notando obviamente la diferencia de tiempos entre las listas de mayor y menor tamaño ordenadas de la misma forma.
*)
    
    let merge_g ord (l1,l2) =
        let rec mezcla primera segunda sol = match primera , segunda with 
          [] , l -> List.rev(List.rev_append l sol)
        | l , [] -> List.rev(List.rev_append l sol)
        | h1::t1 , h2::t2 -> if ord h1 h2 then mezcla t1 segunda (h1::sol) else mezcla primera t2 (h2::sol)
        in mezcla l1 l2 [];;
 
    let rec msort_g ord lista = match lista with
        [] | [_] -> lista
    |   _ -> let l1 , l2 = split_t lista 
            in merge_g ord (msort_g ord l1 , msort_g ord l2);;

