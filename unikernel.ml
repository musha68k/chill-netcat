open Lwt.Infix
open Mirage_types_lwt
   
module ChillNetcat (C: CONSOLE) = struct
  let start c =
    C.log c "Totally chill."
end
