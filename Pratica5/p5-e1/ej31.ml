(*let g n = (n >= 0 && n mod 2 = 0) || n mod 2 = -1;;*)

    let g1 n = 
        if(n >= 0) 
            then 
                (if(n mod 2 = 0) 
                    then 
                        (n mod 2 = 0) 
                 else 
                    (n mod 2 = -1))   
        else    
            (n mod 2 = -1);;


    let g2 n = (function true -> 
                                (function true -> n mod 2 = 0    |
                                          false -> n mod 2 = -1) |
                        false -> 
                                (function true -> n mod 2 = -1   | 
                                          false -> n mod 2 = -1 ))   (n >= 0) (n mod 2 = 0);;


