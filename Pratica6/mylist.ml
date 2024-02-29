let hd (h :: _) = h;;

let tl (_ :: t) = t;;

let rec rev_append l1 l2 = match l1 with
            [] -> l2 
        |   h::t -> rev_append t (h::l2);;


    (*no recursiva terminal*)
(*
    let rec append l1 l2 = match l1 with
            [] -> l2
        |   h::t -> h :: append t l2;;
*)


    let rev l = rev_append l [];;

    (*recursiva terminal*)
    let append l1 l2 = rev_append (rev l1) l2;;

(*no terminal*)
(*
    let rec length = function
        [] -> 0
      | _ :: t -> 1 + length t
*)

(*terminal*)
    let length l = 
        let rec aux = function
              [] , i -> i
            | _ :: t , i -> aux (t , i + 1)
        in aux (l , 0);;  


    let rec compare_lengths l1 l2 = match (l1 , l2) with 
        [] , [] -> 0
      | [] , _  -> -1
      | _ , []  -> 1
      | _ :: t1 , _ :: t2 -> compare_lengths t1 t2;;


    let compare_length_with l i =
        if (length l = i)
            then 0
        else if (length l > i)
            then 1
        else 
                -1;;


    let init e f = 
        let rec recurs i n lista = 
            if  i = 0  
                then rev lista
            else 
                recurs (i-1) (n+1) ((f n):: lista)
        in recurs e (0) [];;
            

    let rec nth l i =
        if(i = 0)
            then (hd l)
        else 
            nth (tl l) (i - 1);;
    
    let rec concat l =
        if (l = [])
            then
                []
        else
            if (hd l = [])
                then
                    concat (tl l)
            else
                    hd (hd l)::concat (tl (hd l)::tl l);;

    let rec flatten l =
        if (l = [])
            then
                []
        else
            if (hd l = [])
                then
                    concat (tl l)
            else
                    hd (hd l)::concat (tl (hd l)::tl l);;


    let rec split pair= 
        if pair = []
            then 
                [] , []
        else 
                (fst (hd pair)::fst (split (tl pair)) , snd (hd pair):: snd(split (tl pair)));;


    let rec combine l1 l2 = 
        if l1 = [] && l2 = []
            then 
                []
        else
                (hd l1 , hd l2):: combine (tl l1) (tl l2);;
    

    let rec map f lista =
         if lista = [] 
            then
                []
         else 
                f (hd lista) :: map f (tl lista);;


    let rec map2 f lista1 lista2 =
             if lista1 = [] && lista2 = []
                then
                    []
             else 
                    f (hd lista1) (hd lista2) :: map2 f (tl lista1) (tl lista2);;

(*non tail recursive*)
(*
    let rec rev_map f lista =
         let listaRev = rev lista in
         if lista = [] 
            then
                []
         else 
                f (hd listaRev) :: map f (tl listaRev);;
 *) 

    let rev_map f lista =
         let rec listaRev lis = function
            | [] -> lis
            | h :: t -> listaRev (f h :: lis) t
         in listaRev [] lista;;
        

    let rec for_all f lista =
        if lista = []
            then 
                true
        else
            f (hd lista) && for_all f (tl lista);;
    

    let rec exists f lista =
        if lista = []
            then 
                true
        else
            f (hd lista) || exists f (tl lista);;


    let rec mem a lista =
        if lista = []
            then
                false
        else
            if a = hd lista
                then 
                    true
            else 
                mem a (tl lista);;
        

    let rec find f lista = 
        if lista = []
            then
                raise (Failure "Not_found")
        else
            if f (hd lista)
                then 
                    hd lista
            else        
                find f (tl lista);;

    let filter p =
        let rec find accu = function
            | [] -> rev accu
            | h :: t -> if p h 
                            then 
                                find (h :: accu) t 
                        else find accu t 
        in find [];;
            
    let find_all f lista = filter f lista;;

    let partition f lista =
        let rec partition_aux acc_true acc_false lista = 
            if lista = []
                then 
                    rev acc_true , rev acc_false
            else
                if f (hd lista)
                    then
                        partition_aux ((hd lista) :: acc_true) acc_false (tl lista)
                else
                    partition_aux acc_true ((hd lista) :: acc_false) (tl lista)
        in partition_aux [] [] lista;;


    let rec fold_left op f lista = match lista with
        | [] -> f
        | h::t -> fold_left op (op f h) t;;


    let rec fold_right op lista f = match lista with
        | [] -> f
        | h::t -> op h (fold_right op t f);;


    let rec assoc a lista = 
        if lista = []
            then 
                raise (Failure "Not_found")
        else
            if (fst (hd lista)) = a
                then 
                    snd (hd lista)
            else 
                assoc a (tl lista);;
            
     
    let rec mem_assoc a lista = 
        if lista = []
            then 
                false
        else
            if (fst (hd lista)) = a
                then 
                    true
            else 
                mem_assoc a (tl lista);;


    let rec remove_assoc a lista =
        if lista = []
            then 
                []
        else
            if (fst (hd lista)) = a
                then
                    (tl lista)
            else
                (hd lista)::(remove_assoc a (tl lista));;


