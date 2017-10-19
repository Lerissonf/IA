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
   (adj bike_praca_diario bike_praca_republica) (adj bike_praca_republica bike_praca_diario)
	 (adj bike_cais_apolo p_banco_brasil) (adj p_banco_brasil bike_cais_apolo)
   (adj bike_alfandega p_paco_alfandega) (adj p_paco_alfandega bike_alfandega)
	 (adj bike_mercado_sj p_mercado_sj) (adj p_mercado_sj bike_mercado_sj)
   (adj bike_praca_diario p_igreja_nsrp) (adj p_igreja_nsrp bike_praca_diario)
   (adj bike_praca_republica p_praca_republica) (adj p_praca_republica bike_praca_republica)

	 (is-agent agent_joao)
	 (at agent_joao bike_praca_diario)
   (is-agent agent_jose)
   (at agent_jose bike_cais_apolo)
   (is-agent agent_maria)
   (at agent_maria bike_alfandega)

   (is-estacao bike_praca_republica)
   (is-estacao bike_alfandega)
   (is-estacao bike_praca_diario)
   (is-estacao bike_santa_rita)
   (is-estacao bike_mercado_sj)
   (is-estacao bike_cais_apolo)

   (is-ponto-turistico p_banco_brasil)
   (is-ponto-turistico p_paco_alfandega)
   (is-ponto-turistico p_praca_republica)
   (is-ponto-turistico p_igreja_nsrp)
   (is-ponto-turistico p_mercado_sj)
	 
	 )
  
  (:goal 
    (and
      (and 
        (visited agent_joao p_banco_brasil) 
        (visited agent_joao p_paco_alfandega)
        (visited agent_joao p_praca_republica)
        (visited agent_joao p_igreja_nsrp) 
        (visited agent_joao p_mercado_sj)
      )
      (and 
        (visited agent_maria p_banco_brasil) 
        (visited agent_maria p_paco_alfandega)
        (visited agent_maria p_praca_republica)
        (visited agent_maria p_igreja_nsrp) 
        (visited agent_maria p_mercado_sj)
      )
      (and 
        (visited agent_jose p_banco_brasil) 
        (visited agent_jose p_paco_alfandega)
        (visited agent_jose p_praca_republica)
        (visited agent_jose p_igreja_nsrp) 
        (visited agent_jose p_mercado_sj)
      )
    )
  )
)