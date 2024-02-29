


let rec reverse n = 
    let rec exp10 n = 
        if n > 0 
            then 10 * exp10 (n - 1) 
            else 1
in
    let rec num_cifras c = 
        if c / 10 <> 0 
            then 1 + num_cifras (c / 10) 
            else 1
in
    if n < 10
        then n 
        else (n mod 10) * exp10 ((num_cifras n) - 1) + reverse (n/10);;


let palindromo s = 
    let rec recurse (s , i , j) = 
        if(i = j || i > j)
            then true
        else
            if (s.[i] = s.[j])
                then recurse (s , i + 1 , j - 1)
            else 
                false
    in recurse (s , 0 , String.length s - 1);;


let rec mcd (a , b) = 
    if a = 0
        then b
    else
        mcd (b mod a , a);;




