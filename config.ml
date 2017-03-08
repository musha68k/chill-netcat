open Mirage

let key =
  let doc = Key.Arg.info ~doc: "Listen on port." ["port"] in
  Key.(create "port" Arg.(opt string "9000" doc))

let main =
  foreign
    ~keys:[Key.abstract key]
    "Unikernel.ChillNetcat"
    (console @-> network @-> ethernet @-> ipv4 @-> job)

let ethif = etif default_network

let ipv4 =
  let config = {
      network = Ipaddr.V4.Prefix.of_string_exn "127.0.0.0/24", Ipaddr.V4.of_string_exn "127.0.0.1" ;
      gateway = Ipaddr.V4.of_string "192.168.1.1";
    } in
  create_ipv4 ~config ethif (Mirage.farp ethif)

let () =
  register "chill-netcat" [ main $ default_console $ default_network $ ethif $ ipv4 ]
