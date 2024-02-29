
    (*solo definiciones terminales*)

    let to0from n =
        let rec fromx sol n = 
            if n < 0 then List.rev(sol)
            else fromx (n::sol) (n-1)
        in fromx [] n;;

    let fromto m n =
        let rec tox m n sol =
            if m > n then List.rev(sol)
            else tox (m+1) n (m::sol)
        in tox m n [];;

    let remove x lista =
        let rec eliminar elem lista pre post = match lista with
            [] -> List.rev_append pre post
        |   h::t -> if x = h then eliminar elem [] pre (t)
                    else eliminar elem t (h::pre) post
        in eliminar x lista [] [];;

    let compress lista = 
        let rec ignorado lista sol = match lista with
            h1::h2::t -> if h1 = h2 then ignorado (h2::t) sol
                         else ignorado (h2::t) (h1::sol)
        |   [h3] -> List.rev(h3::sol)
        |   [] -> List.rev(sol)
        in ignorado lista [];;

    let append' l1 l2 = List.rev_append (List.rev l1) l2;;
    
    let map' f l = List.rev (List.rev_map f l);;

    let fold_right' f lista alfa =
        let rec tailR lista alfa = match lista with 
            [] -> alfa
        |   h::t -> tailR t (f h alfa)
        in tailR (List.rev lista) alfa;;            

    let incseg l =
        List.fold_left (fun t x -> x::List.map ((+) x) t) [] (List.rev l);;




    
        
            
