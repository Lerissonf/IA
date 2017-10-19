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
    bike1
    bike2
    bike3
    bike4
    bike5
    bike6
    bike7
    bike8
  )

  (:init 
   (adj bike_cais_apolo bike_praca_republica) (adj bike_praca_republica bike_cais_apolo)
	 (adj bike_cais_apolo bike_alfandega) (adj bike_alfandega bike_cais_apolo)
	 (adj bike_alfandega bike_santa_rita) (adj bike_santa_rita bike_alfandega)
	 (adj bike_santa_rita bike_mercado_sj) (adj bike_mercado_sj bike_santa_rita)
	 (adj bike_mercado_sj bike_praca_diario ) (adj bike_praca_diario bike_mercado_sj)
	 (adj bike_santa_rita bike_praca_diario) (adj bike_praca_diario bike_santa_rita)
   (adj bike_praca_diario bike_praca_republica) (adj bike_praca_republica bike_praca_diario)
	 (adj bike_cais_apolo p_banco_brasil) (adj p_banco_brasil bike_cais_apolo)
   (adj bike_alfandega p_paco_alfandega) (adj p_paco_alfandega bike_alfandega)
	 (adj bike_mercado_sj p_mercado_sj) (adj p_mercado_sj bike_mercado_sj)
   (adj bike_praca_diario p_igreja_nsrp) (adj p_igreja_nsrp bike_praca_diario)
   (adj bike_praca_republica p_praca_republica) (adj p_praca_republica bike_praca_republica)

   (is-bike bike1)
   (is-bike bike2)
   (is-bike bike3)
   (is-bike bike4)
   (is-bike bike5)
   (is-bike bike6)
   (is-bike bike7)
   (is-bike bike8) 

	 (is-agent agent_joao)
	 (at agent_joao bike_praca_diario)
   (by-foot agent_joao)
   (not(is-agent-blocked agent_joao))
   (not(have-bike agent_joao bike1))
   (not(have-bike agent_joao bike2))
   (not(have-bike agent_joao bike3))
   (not(have-bike agent_joao bike4))
   (not(have-bike agent_joao bike5))
   (not(have-bike agent_joao bike6))
   (not(have-bike agent_joao bike7))
   (not(have-bike agent_joao bike8))

   (is-agent agent_jose)
   (at agent_jose bike_cais_apolo)
   (by-foot agent_jose)
   (not(is-agent-blocked agent_jose))
   (not(have-bike agent_jose bike1))
   (not(have-bike agent_jose bike2))
   (not(have-bike agent_jose bike3))
   (not(have-bike agent_jose bike4))
   (not(have-bike agent_jose bike5))
   (not(have-bike agent_jose bike6))
   (not(have-bike agent_jose bike7))
   (not(have-bike agent_jose bike8))

   (is-agent agent_maria)
   (at agent_maria bike_alfandega)
   (by-foot agent_maria)
   (not(is-agent-blocked agent_maria))
   (not(have-bike agent_maria bike1))
   (not(have-bike agent_maria bike2))
   (not(have-bike agent_maria bike3))
   (not(have-bike agent_maria bike4))
   (not(have-bike agent_maria bike5))
   (not(have-bike agent_maria bike6))
   (not(have-bike agent_maria bike7))
   (not(have-bike agent_maria bike8))

   (is-estacao bike_alfandega)
   (is-estacao bike_praca_diario)
   (have-estacao-bike bike_praca_diario bike1)
   (is-estacao bike_mercado_sj)
   (have-estacao-bike bike_mercado_sj bike2)
   (have-estacao-bike bike_mercado_sj bike3)
   (is-estacao bike_santa_rita)
   (have-estacao-bike bike_santa_rita bike4)
   (have-estacao-bike bike_santa_rita bike5)
   (have-estacao-bike bike_santa_rita bike6)
   (is-estacao bike_cais_apolo)
   (have-estacao-bike bike_cais_apolo bike7)
   (is-estacao bike_praca_republica)
   (have-estacao-bike bike_praca_republica bike8)

   (is-ponto-turistico p_banco_brasil)
   (is-ponto-turistico p_paco_alfandega)
   (is-ponto-turistico p_praca_republica)
   (is-ponto-turistico p_igreja_nsrp)
   (is-ponto-turistico p_mercado_sj)
	 
	 )
  
  (:goal 
    (and 
      (visited agent_joao p_banco_brasil) 
      (visited agent_joao p_paco_alfandega)
      (visited agent_joao p_praca_republica)
      (visited agent_joao p_igreja_nsrp) 
      (visited agent_joao p_mercado_sj)
    )
  )
)