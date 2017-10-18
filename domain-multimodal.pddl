(define (domain multimodal)
  (:requirements :strips)
  (:predicates
   (at ?what ?square)
   (adj ?local-1 ?local-2)
   (have ?who ?what)
   (is-agent ?who)
   (is-estacao ?where ?what)
   (is-ponto-turistico ?where ?what)
   (is-bike ?what)
   (visited ?what ?where)
   )

  (:action caminhar
    :parameters (?who ?from ?to)
    :precondition (and (is-agent ?who)
		       (at ?who ?from)
		       (adj ?from ?to)
           (or 
              (and 
                (is-ponto-turistico ?to ?what)
                (is-estacao ?from ?what)
              )
              (and 
                (is-ponto-turistico ?from ?what)
                (is-estacao ?to ?what)
              )
           ))
    :effect (and 
        (not (at ?who ?from))
		    (at ?who ?to))
    )
)

