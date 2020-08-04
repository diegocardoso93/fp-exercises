let repeat ~f ~n =
    for i = 1 to n do
        f()
    done

let print_hello() =
    print_endline "Hello World"
 
let () =
    let n = read_int() in
    repeat ~n:n ~f:print_hello
