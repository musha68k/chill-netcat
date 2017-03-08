open Mirage

let key =
  let doc = Key.Arg.info ~doc: "Listen on port." ["port"] in
  Key.(create "port" Arg.(opt string "9000" doc))

let main =
  foreign
    ~keys:[Key.abstract key]
    "Unikernel.ChillNetcat"
    (console @-> job)

let () =
  register "chill-netcat" [ main $ default_console ]
