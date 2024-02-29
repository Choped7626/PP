let crono f x = 
    let t = Sys.time() in
    let _ = f x in  
    Sys.time () -. t;;

    let next (x , y)= 
            if((x + y - 1) mod 2 = 0)
                then 
                    if(y = 1)
                        then (x + 1 , y)
                    else
                             (x + 1 , y - 1)
            else
                if(x = 1)
                    then (x , y + 1)
                else    
                         (x - 1 , y + 1);;

    let rec steps_from (x , y) n = 
        if(n = 0)
            then (x , y)
        else
            steps_from (next(x , y)) (n - 1) ;;

    let pair x =
        steps_from (1,1) (x - 1);;

let pair_i p =
        let rec find i =
            if pair i = p then i
            else find (i+1)
        in find 1;;

(*el calculo de pair_i(12,130) tarda 1.18s y el de pair_i(100,101) 4.17s esto se debe a que la funcion pair_i hace muchas llamadas recursivas a distintas funciones tambien recursivas pudiendo conseguir el mismo resultado llamando únicamente a la función next*)


    let pair_i' p =
            let rec find x i =
                if next x = p then i + 1
                else find (next (x)) (i + 1)
            in find (1,1) 1;;
