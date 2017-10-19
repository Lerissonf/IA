(define (domain multimodal)
  (:requirements :strips)
  (:predicates
   (at ?what ?square)
   (adj ?square-1 ?square-2)
   (have ?who ?what)
   (is-agent ?who)
   (is-estacao ?square)
   (is-ponto-turistico ?square)
   (visited ?who ?square)
   )

  (:action caminhar
    :parameters (?who ?from ?to)
    :precondition (and (is-agent ?who)
		       (at ?who ?from)
		       (adj ?from ?to)
           (or 
              (and 
                (is-ponto-turistico ?to)
                (is-estacao ?from)
              )
              (and 
                (is-ponto-turistico ?from)
                (is-estacao ?to)
              )
           ))
    :effect (and 
        (not (at ?who ?from))
		    (at ?who ?to)
        (visited ?who ?to))
  )

  (:action pedalar
    :parameters (?who ?from ?to)
    :precondition (and (is-agent ?who)
           (at ?who ?from)
           (adj ?from ?to)
           (is-estacao ?from)
           (is-estacao ?to))
    :effect (and 
        (not (at ?who ?from))
        (at ?who ?to))
  )

  (:action esperar5min
    :parameters (?who ?where)
    :precondition (and 
      (at ?who ?where) 
      (is-estacao ?where))
    :effect (and (at ?who ?where))
  )
)

