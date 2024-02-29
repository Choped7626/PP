
    let append a1 a2 =
        let lena1 = ref (Array.length a1) in
        let len = ref (Array.length a1 + Array.length a2) in
        let arr = ref (Array.init !len (fun x -> a1.(0))) in
        for i = 0 to !lena1 - 1 do 
            !arr.(i) <- a1.(i)
        done;
        for i = !lena1 to !len - 1 do
            !arr.(i) <- a2.(i - !lena1)
        done;
            !arr;;

    let sub arr ini fin = 
        let sol = ref (Array.init fin (fun x -> arr.(0))) in
        for i = ini to ini + fin - 1 do 
            !sol.(i-ini) <- arr.(i)
        done;
            !sol;;
   
    let copy arr =
        let cop = ref (Array.init (Array.length arr) (fun x -> arr.(0))) in
        for i = 0 to (Array.length arr) - 1 do
            !cop.(i) <- arr.(i)
        done;
            !cop;;
    
    let fill a pos len x = 
        let sol = ref a in
        for i = pos to pos+len-1 do 
             !sol.(i) <- x
        done;;

    let blit source posA dest posB tam = 
        let sol = ref dest in
        for i = 0 to tam - 1 do
            !sol.(posB+i) <- source.(posA+i)
        done;;

    let to_list arr = 
        let lista = ref [] in
        let i = ref (Array.length arr - 1) in
        while !i <> 0 do
            lista := (arr.(!i))::(!lista);
            i := !i - 1
        done;
            lista := (arr.(!i))::(!lista);
            !lista;;

    let iter f arr = 
        for i = 0 to Array.length arr - 1 do
            f arr.(i)
        done;;
        
    let fold_left f ini arr =
        let sol = ref (f ini arr.(0)) in
        for i = 1 to Array.length arr - 1 do
            sol := (f !sol arr.(i))
        done;
            !sol;;
    
    let for_all f arr = 
        let sol = ref true in
        for i = 0 to Array.length arr - 1 do 
            sol := !sol && (f arr.(i))
        done;
            !sol;;

    let exists f arr = 
        let sol = ref false in
        for i = 0 to Array.length arr - 1 do 
            sol := !sol || (f arr.(i))
        done;
            !sol;;
    
    let find_opt f arr = 
        let sol = ref None in
        for i = 0 to Array.length arr - 1 do 
            if f arr.(i) && !sol = None then sol := Some arr.(i)
            else ()
        done;
            !sol;;
