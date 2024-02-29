    let f n =
        if n mod 2 = 0
            then n / 2
        else
            3 * n + 1;;
    

    let orbit n =
        let rec auxString m sol = 
            let s1 = string_of_int m in
                if m = 1
                    then String.cat sol s1
                else if m mod 2 = 0
                    then auxString(m / 2) (sol ^ s1 ^ " , ")
                else
                    auxString(3 * m + 1) (sol ^ s1 ^ " , ")
            in auxString n "";;


    let length n = 
        let rec lengthAux m pasos =
                if m = 1
                    then pasos
                else if m mod 2 = 0
                    then lengthAux(m / 2) pasos + 1
                else
                    lengthAux(3 * m + 1) pasos + 1
            in lengthAux n 0;;


    let top n = 
        let rec topAux m max =
                if m = 1
                    then max
                else if m mod 2 = 0
                    then
                        if m > max 
                            then topAux(m / 2) m
                        else 
                                 topAux(m / 2) max
                else
                    if m > max
                        then topAux(3 * m + 1) m
                    else 
                            topAux(3 * m + 1) max
            in topAux n n;;


    let length'n'top n =
        let rec length'n'topAux m max pasos =
                if m = 1
                    then pasos , max
                else if m mod 2 = 0
                    then
                        if m > max 
                            then length'n'topAux(m / 2) m (pasos + 1)
                        else 
                                 length'n'topAux(m / 2) max (pasos + 1)
                else
                    if m > max
                        then length'n'topAux(3 * m + 1) m (pasos + 1)
                    else 
                            length'n'topAux(3 * m + 1) max (pasos + 1)
            in length'n'topAux n n 0;;


    let longest_in m n = 
        let rec longestAux inf sup max =
                if inf > sup
                    then (max , length max)
                else if length inf > length max
                    then longestAux (inf+1) sup inf
                else
                         longestAux (inf+1) sup max
            in longestAux m n n;;


    let highest_in m n = 
        let rec highestAux inf sup max =
                if inf > sup
                    then (max , top max)
                else if top inf > top max
                    then highestAux (inf+1) sup inf
                else
                         highestAux (inf+1) sup max
            in highestAux m n n;;
