open Lwt.Infix
open Mirage_types_lwt

   
module ChillNetcat (C: CONSOLE) = struct
  let start c =

    let port = Key_gen.port () in
    
    C.log c port
end
