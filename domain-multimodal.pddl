(define (domain multimodal)
  (:requirements :strips)
  (:predicates
   (at ?what ?place)
   (adj ?place-1 ?place-2)
   (have ?who ?what)
   (is-agent ?who)
   (is-agent-blocked ?who);;quando ele vai para uma estão para a outra e fica parado
   (by-foot ?who);; está a andar a pé 
   (is-estacao ?place) ;; se é uma estação o local 
   (is-ponto-turistico ?place);; se é um ponto turistico 
   (is-bike ?which);; se é uma bike 
   (visited ?who ?place) ;; se visitou aquele local
   (have-bike ?who ?which);; qual a bike que ele pegou na estação
   (have-estacao-bike ?place ?which) ;;quais bikes a estação tem  
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
;; caminhar um agente o lugar que ele esta e o lugar q ele vai
;; que who seja um agente, e que ele não esteja bloqueado, 
;;que ele esteja a pé, esteja no local selecionado, os dois lugares sejam adj, ou o ponto que ele etá é um ponto turistico e o que ele quer ir é uma estação ou o inverso
;;ele não estará no lugar que ele começou e ele estará no lugar que quer ir     
  (:action pedalar
    :parameters (?who ?which ?from ?to)
    :precondition (and 
      (is-agent ?who)
      (not(is-agent-blocked ?who))
      (is-bike ?which)
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
;; alguem, uma coisa, o lugar onde ele estar e o lugar onde ele quer ir
;; o alguem é um agente, o mesmo não está bloqueado para andar, se a coisa é uma bike e esse agente possui a bike, por conseguite ele não tá a pé
;; esteja no local selecionado, os dois lugares sejam adj, e o lugar onde se encontra é uma estação e o lugar de destino também 
;; o lugar onde ele está não possui a bike que o agente tem
;; ele não estará no lugar que ele começou e ele estará no lugar que quer ir e o agente estará bloqueado para andar 
  (:action esperar5min
    :parameters (?who ?where)
    :precondition (and 
      (is-agent ?who)
      (is-agent-blocked ?who)
      (by-foot ?who)
      (at ?who ?where))
    :effect (and (not(is-agent-blocked ?who)))
  )

;;alguem e um lugar
;; que o alguem seja um agente e ele esteja bloqueado para andar e esteja a pé
;; e ele que ele esteja no lugar
;; o agente não estará bloqueado para andar

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
;;alguem e um lugar
;; que o alguem seja um agente e ele esteja no lugar que esteja a pé e o lugar seja um ponto turistico
;; e que ele ainda não tenha visitado esse lugar 
;; o agente visitou o lugar 
  (:action pegar-bicicleta
    :parameters (?who ?which ?where)
    :precondition (and 
      (is-agent ?who)
      (at ?who ?where)
      (by-foot ?who)
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
;; alguem, uma coisa e um lugar
;; o alguem é um agente está no referido local e está a pé, não se encontra bloqueado pra andar a referida coisa é uma bike 
;; o local é uma estação e a mesma tem pelo menos uma bike, e o agente não tem bike.
;; a estação não terá mais a referida bike o agente terá a bike e o mesmo não estará mais a pé. 
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
  ;; alguem, uma coisa e um lugar
  ;; o alguem é um agente está no referido local e não está a pé, 
  ;;não se encontra bloqueado pra andar a referida coisa é uma bike
  ;; a coisa é uma bike e o lugar é uma estação
  ;; essa estação não possui a referida bike e o agente à possui
  ;; que o agente não tenha a bike e a estação à tenha e o agente fique a pé. 
)