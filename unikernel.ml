open Lwt.Infix
open Mirage_types_lwt

module ChillNetcat (C: CONSOLE) (N: NETWORK) (E: ETHIF) (I: IPV4) = struct
  let start c n e i =
    let port = Key_gen.port () in
    N.listen n
            (E.input
                ~arpv4:(fun _ -> C.log c "ARPV4 package registered")
                ~ipv4:(I.input
                            ~tcp:(fun ~src:_ ~dst:_ _ -> C.log c "TCP package registered")
                            ~udp:(fun ~src:_ ~dst:_ packet -> C.write c packet
                                                              >>= function
                                                              | Result.Ok () -> C.log c "CONSOLE WRITE OK"
                                                              | Result.Error _ -> C.log c "CONSOLE WRITE ERROR")
                            ~default:(fun ~proto ~src:_ ~dst:_ _data -> C.log c (string_of_int proto))
                            i)
                ~ipv6:(fun _ -> C.log c "IPV6 package registered")
                e)
    >>= function
    | Result.Ok () -> C.log c "done!"
    | Result.Error _ -> C.log c "failed"
end
