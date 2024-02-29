

    (* Función auxiliar para encontrar el vértice con la distancia mínima *)
    let min_distance dist_list visited n =
      let min_index = ref (-1) in
      let min_dist = ref max_int in
      for i = 0 to n - 1 do
        if not visited.(i) && match dist_list.(i) with Some d -> d < !min_dist | None -> false then (
          min_dist := Option.get dist_list.(i);
          min_index := i
        )
      done;
      !min_index

    (* Función principal de Dijkstra *)
    let dijkstra w =
      let n = Array.length w in
      (* Verificar si la matriz es cuadrada *)
      if n = 0 || Array.exists (fun row -> Array.length row <> n) w then
        raise (Invalid_argument "Matriz no cuadrada")
      else (
        (* Verificar si la matriz contiene valores negativos *)
        let contains_negative = ref false in
        for i = 0 to n - 1 do
          for j = 0 to n - 1 do
            match w.(i).(j) with
            | Some weight when weight < 0 -> contains_negative := true
            | _ -> ()
          done;
        done;
        if !contains_negative then raise (Invalid_argument "Matriz con valores negativos")
        else (
          (* Inicializar la matriz de distancias *)
          let dist = Array.make_matrix n n None in
          (* Iterar sobre los nodos *)
          for src = 0 to n - 1 do
            let visited = Array.make n false in
            dist.(src).(src) <- Some 0; (* La distancia de un nodo a sí mismo es 0 *)
            for _ = 0 to n - 1 do
              let u = min_distance dist.(src) visited n in
              visited.(u) <- true;
              for v = 0 to n - 1 do
                (* Actualizar la distancia si existe un camino más corto *)
                match (dist.(src).(u), w.(u).(v)) with
                | Some du, Some weight ->
                    let new_dist = du + weight in
                    if not visited.(v) &&
                       (match dist.(src).(v) with Some dv -> new_dist < dv | None -> true) then
                      dist.(src).(v) <- Some new_dist
                | _ -> ()
              done;
            done;
          done;
          dist (* Devolver la matriz de distancias mínimas *)
        )
      )
            ;;


