    
    type 'a bintree = Empty | Node of 'a * 'a bintree * 'a bintree;;

    let rec in_order = function
        Empty -> []
    |   Node (r , i , d) -> in_order i @ r :: in_order d;;

    let hoja x = Node (x , Empty , Empty);;

    let insert ord tree x = 
        let rec aux recorrer = match recorrer with
        Empty -> Node (x , Empty , Empty)
    |   Node (r , i , d) -> if ord x r then Node (r , aux i , d)
                            else Node(r , i , aux d)
        in aux tree;;

    let bst ord l = 
        let rec crearArbol lista arbol = match lista with
            [] -> arbol
        |   h::t -> crearArbol t (insert ord arbol h)
        in crearArbol l Empty;; 

    let qsort ord l = 
        in_order(bst ord l);;
