(define (domain multimodal)
  (:requirements :strips)
  (:predicates
   (at ?what ?square)
   (adj ?local-1 ?local-2)
   (have ?who ?what)
   (is-agent ?who)
   (is-estacao ?where)
   (is-ponto-turistico ?where)
   (is-bike ?what)
   (visited ?what ?where)
   (have-bike ?who ?which)
   )

  (:action caminha
    :parameters (?who ?from ?to)
    :precondition (and (is-agent ?who)
		       (at ?who ?from)
		       (adj ?from ?to)
           (not(have-bike ?who))
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

  (:action action-name
    :parameters (?x - object)
    :precondition (and ())
    :effect (and ())
  )
)

