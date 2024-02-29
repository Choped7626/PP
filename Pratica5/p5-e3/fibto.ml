        let rec fib n =
                if n <= 1 
                then n
                else fib (n-1) + fib (n-2);;                
        
        let () =
                if(Array.length Sys.argv <> 2)
                    then 
                        print_endline("fibto: Invalid number of arguments")
                else 
                     let rec bucle i = 
                        if fib i <= int_of_string Sys.argv.(1)
                            then
                                if(int_of_string Sys.argv.(1) >= 0)
                                    then 
                                        (print_endline (string_of_int (fib i));
                                        bucle (i+1))
                                else 
                                    print_endline("argumento invalido")
                     in bucle 0;;
