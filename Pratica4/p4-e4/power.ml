    let rec power x y = 
        if (y <= 0)
            then 1
        else
            x * power x (y-1);;

    let rec power' x y = 
        if (y = 0)
            then 1
        else 
            if(y mod 2 = 0)
                then power' (x * x) (y/2)
            else 
                power' (x * x) (y/2) * x;;
(*esta es una version más eficiente de la definicion anterior ya q no deja cuentas pendientes y realiza un menor numero de llamadas recursivas , debido a la naturaleza de int la ganacia obteida para ese conjunto es casi imperceptible , pero si se realizase sobre Z esta sería mucho más apreciable debido a la infinidad de valores existentes en el conjunto*)

    let rec powerf x n = 
            if (n <= 0)
                then 1.0
            else
                x *. powerf x (n-1);;
           
     let rec powerf x n = 
            if (n = 0)
                then 1.0
            else 
                if(n mod 2 = 0)
                    then powerf (x *. x) (n/2)
                else 
                    powerf (x *. x) (n/2) *. x;;
