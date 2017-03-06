open Mirage

let main =
  foreign "Unikernel.ChillNetcat" (console @-> job)

let () =
  register "chill-netcat" [ main $ default_console ]
