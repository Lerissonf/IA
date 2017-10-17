(define (problem multimodal_1)
  (:domain multimodal)
  (:objects
  	bike_cais_apolo
  	bike_praca_republica
  	bike_alfandega
  	bike_santa_rita
  	bike_mercado_sj
  	bike_praca_diario
  	agent_joao
  	agent_jose
  	agent_maria
  	p_banco_brasil
  	p_paco_alfandega
  	p_mercado_sj
  	p_igreja_nsrp
  	p_praca_republica
  	 )

  (:init 
  	 (adj bike_cais_apolo bike_praca_republica) (adj bike_praca_republica bike_cais_apolo)
	 (adj bike_cais_apolo bike_alfandega) (adj bike_alfandega bike_cais_apolo)
	 (adj bike_alfandega bike_santa_rita) (adj bike_santa_rita bike_alfandega)
	 (adj bike_santa_rita bike_mercado_sj) (adj bike_mercado_sj bike_santa_rita)
	 (adj bike_mercado_sj bike_praca_diario ) (adj bike_praca_diario bike_mercado_sj)
	 (adj bike_santa_rita bike_praca_diario) (adj bike_praca_diario bike_santa_rita)
	 (adj bike_santa_rita bike_praca_republica) (adj bike_praca_republica bike_santa_rita)
	 
	 ;;(pit sq-1-2)

	 (is-agent_1 agent_joao)
	 (at agent_joao bike_praca_diario)
	 (is-agent_2 agent_jose)
	 (at agent_jose bike_cais_apolo)
	 (is-agent_3 agent_maria)
	 (at agent_maria bike_alfandega)
	 ;;(is-arrow the-arrow)
	 ;;(have agent the-arrow)
	 ;;(is-wumpus wumpus)
	 ;;(at wumpus sq-2-3)
	 ;;(wumpus-in sq-2-3)
	 )
  
  (:goal (and (have agent the-gold) (at agent sq-1-1)))
  )