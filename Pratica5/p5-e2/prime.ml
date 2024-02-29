    let is_prime n =
        let rec check_from i =
            i >= n ||
            (n mod i <> 0 && check_from (i+1))
        in check_from 2;;

    let next_prime n =
        let rec next m = 
            if (is_prime m && m <> n) 
                then m  
                else next (m+1)
            in next n;;

    let last_prime_to n = 
        let rec prev m = 
            if (is_prime m) 
                then m  
                else prev (m-1)
            in prev n;;

    let is_prime2 p = 
        if(p mod 2 <> 0 && p mod 3 <> 0 && p mod 5 <> 0 && p mod 7 <> 0 || p = 2 || p = 3 || p = 5 || p = 7)
        then true
        else false;;
            

