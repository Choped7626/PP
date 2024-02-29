
    let length l = 
        let cnt = ref 0 in
        let lista = ref l in
        while List.tl !lista <> [] do
            lista := List.tl !lista;
            cnt := !cnt + 1
        done;
            cnt := !cnt + 1; 
            !cnt;;
    
    let last l = 
        let lista = ref l in
        while List.tl !lista <> [] do
            lista := List.tl !lista;
        done;
            List.hd !lista;;

    let nth l pos = 
        let cnt = ref 0 in
        let lista = ref l in
        while !cnt <> pos do
            lista := List.tl !lista;
            cnt := !cnt + 1;
        done;
            List.hd !lista;;
    
    let rev l = 
        let sol = ref [] in
        let lista = ref l in
        while List.tl !lista <> [] do
            sol := List.hd !lista :: !sol;
            lista := List.tl !lista;
        done;
            sol := List.hd !lista :: !sol;
            !sol;;
    
    let append l1 l2 = 
        let cambiar = ref l1 in
        let sol = ref l2 in
        while List.tl !cambiar <> [] do
            sol := List.hd (rev !cambiar) :: !sol;
            cambiar := rev (List.tl (rev !cambiar))
        done;
            sol := List.hd (rev !cambiar) :: !sol;
            !sol;;

    let concat l = 
        let aux = ref (rev l) in
        let sol = ref [] in
        while List.tl !aux <> [] do 
            sol := append (List.hd !aux) !sol;
            aux := List.tl !aux;
        done;
            sol := append (List.hd !aux) !sol;
            !sol;;

    let for_all siOno l =
        let base = ref true in
        let aux = ref l in
        if !aux = [] then !base else(
        while List.tl !aux <> [] do
            base := !base && (siOno (List.hd !aux));
            aux := List.tl !aux
        done;
            base := !base && (siOno (List.hd !aux));
            !base);;
    
    let exists siOno l =
        let base = ref false in
        let aux = ref l in
        if !aux = [] then !base else(
        while List.tl !aux <> [] do
            base := !base || (siOno (List.hd !aux));
            aux := List.tl !aux
        done;
            base := !base || (siOno (List.hd !aux));
            !base);;
    
    let find_opt opt l =
        let lista = ref l in
        let sol = ref None in
        while !lista <> [] && !sol = None do
            if opt (List.hd !lista) then sol := Some (List.hd !lista)
            else lista := List.tl !lista
      done;
        !sol;;

    let iter f l =
        let len = length l in
        for i = 0 to len - 1 do
            f (nth l i)
        done;;
            
    let fold_left operacion ini l =
        let sol = ref ini in
        let len = length l in        
        for i = 0 to len - 1 do
            sol := operacion !sol (nth l i)
        done;
            !sol;;
