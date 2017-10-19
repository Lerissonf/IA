(define (domain multimodal)
  (:requirements :strips)
  (:predicates
   (at ?what ?square)
   (adj ?square-1 ?square-2)
   (have ?who ?what)
   (is-agent ?who)
   (is-agent-blocked ?who)
   (by-foot ?who)
   (is-estacao ?square)
   (is-ponto-turistico ?square)
   (is-bike ?which)
   (visited ?who ?square)
   (have-bike ?who ?which)
   (have-estacao-bike ?square ?which)
  )

  (:action caminhar
    :parameters (?who ?from ?to)
    :precondition (and 
      (is-agent ?who)
      (not(is-agent-blocked ?who))
      (by-foot ?who)
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
      (at ?who ?to))
  )

  (:action pedalar
    :parameters (?who ?which ?from ?to)
    :precondition (and 
      (is-agent ?who)
      (not(is-agent-blocked ?who))
      (have-bike ?who ?which)
      (not(by-foot ?who))
      (at ?who ?from)
      (adj ?from ?to)
      (is-estacao ?from)
      (is-estacao ?to)
      (not(have-estacao-bike ?from ?which)))
    :effect (and 
      (not (at ?who ?from))
      (at ?who ?to)
      (is-agent-blocked ?who))
  )

  (:action esperar5min
    :parameters (?who ?where)
    :precondition (and 
      (is-agent ?who)
      (is-agent-blocked ?who)
      (by-foot ?who)
      (at ?who ?where))
    :effect (and (not(is-agent-blocked ?who)))
  )

  (:action visitar-ponto
    :parameters (?who ?where)
    :precondition (and 
      (is-agent ?who)
      (at ?who ?where)
      (by-foot ?who)
      (is-ponto-turistico ?where)
      (not(visited ?who ?where)))
    :effect (and 
      (visited ?who ?where))
  )

  (:action pegar-bicicleta
    :parameters (?who ?which ?where)
    :precondition (and 
      (is-agent ?who)
      (at ?who ?where)
      (not(is-agent-blocked ?who))
      (is-bike ?which)
      (is-estacao ?where)
      (have-estacao-bike ?where ?which)
      (not(have-bike ?who ?which)))
    :effect (and 
      (not(have-estacao-bike ?where ?which))
      (have-bike ?who ?which)
      (not(by-foot ?who)))
  )

  (:action entregar-bicicleta
    :parameters (?who ?which ?where)
    :precondition (and 
      (is-agent ?who)
      (at ?who ?where)
      (is-agent-blocked ?who)
      (not(by-foot ?who))
      (is-bike ?which)
      (is-estacao ?where)
      (not(have-estacao-bike ?where ?which))
      (have-bike ?who ?which))
    :effect (and 
      (not(have-bike ?who ?which))
      (have-estacao-bike ?where ?which)
      (by-foot ?who))
  )
)

