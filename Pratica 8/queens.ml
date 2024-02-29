 
    let come (i1 , j1) (i2 , j2) = 
            i1 = i2 || j1 = j2 || abs(i1-i2) = abs(j1-j2);;


    let compatible p l = 
        not (List.exists (come p) l);;

    let queens n = 
        let rec completa path i j = 
            if i > n then [path]
            else if j > n then []
            else if compatible (i , j) path
                    then completa ((i,j)::path) (i+1) 1 @ completa path i (j+1)
                    else completa path i (j+1)
        in completa [] 1 1;;

    let is_queens_sol dim esSol = 
        if dim <> List.length esSol then false
        else
        let rec calc esSol sol = match esSol with
            [] -> List.fold_left (fun acc elm -> acc && elm) true sol
        |   h::t -> match h with 
                    (a , b) -> if a > dim || b > dim || a <= 0 || b <= 0 then false 
                               else calc t ((compatible h t)::sol)
        in calc esSol [];;
        
