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
