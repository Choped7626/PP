open Bintree

    let is_bst ord arbol = 
        let rec in_order = function
            Empty -> []
        |   Node (r , i , d) -> in_order i @ r :: in_order d
        in
        let rec comprobar l sol = match l with
            [] | [_] -> sol
        |   h1::h2::t -> comprobar t ((ord h1 h2) && sol)
        in comprobar (in_order arbol) true;;
    
    let bfs arbol = match arbol with
        Empty -> []
    |   Node(_) -> [];;
    
    let bfs' arbol = match arbol with
        Empty -> []
    |   Node(_) -> [];;
    
    let perfecto arbol = 
            let rec nnodos = function
                Empty -> 0
            |   Node(_ , i , d) -> nnodos i + nnodos d + 1
            in
            let rec altura = function
                Empty -> 0
            |   Node (_ , i , d) -> 1 + max (altura i) (altura d)    
            in
            match arbol with
            Empty -> true
        |   Node(r , Empty , Empty) -> true
        |   Node(_) -> if 2. ** float_of_int(altura arbol) -. 1. = float_of_int(nnodos arbol) then true else false;; 
    
    let rec casi_completo arbol = false;;
