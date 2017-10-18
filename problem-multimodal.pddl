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
	 (adj bike_santa_rita bike_praca_republica) (adj bike_praca_republica bike_santa_rita)
	 (adj bike_cais_apolo p_banco_brasil) (adj p_banco_brasil bike_cais_apolo)
   (adj bike_alfandega p_paco_alfandega) (adj p_paco_alfandega bike_alfandega)
	 (adj bike_mercado_sj p_mercado_sj) (adj p_mercado_sj bike_mercado_sj)
   (adj bike_praca_diario p_igreja_nsrp) (adj p_igreja_nsrp bike_praca_diario)
   (adj bike_praca_republica p_praca_republica) (adj p_praca_republica bike_praca_republica)

	 (is-agent_1 agent_joao)
	 (at agent_joao bike_praca_diario)
	 (is-agent_2 agent_jose)
	 (at agent_jose bike_cais_apolo)
	 (is-agent_3 agent_maria)
	 (at agent_maria bike_alfandega)

   (is_estacao bike_praca_republica)
   (is_estacao bike_alfandega)
   (is_estacao bike_praca_diario)
   (is_estacao bike_santa_rita)
   (is_estacao bike_mercado_sj)
   (is_estacao bike_cais_apolo)

   (is-ponto_turistico p_banco_brasil)
   (is-ponto_turistico p_paco_alfandega)
   (is-ponto_turistico p_praca_republica)
   (is-ponto_turistico p_igreja_nsrp)
   (is--ponto_turistico p_mercado_sj)
   
	 (is-bike bike1)
	 (have bike1 bike_praca_diario )
   (is-bike bike2)
   (have bike2 bike_mercado_sj)
   (is-bike bike3)
   (have bike3 bike_mercado_sj)
   (is-bike bike4)
   (have bike4 bike_santa_rita)
   (is-bike bike5)
   (have bike5 bike_santa_rita)
   (is-bike bike6)
   (have bike6 bike_santa_rita )
   (is-bike bike7)
   (have bike7 bike_cais_apolo)
   (is-bike bike8)
   (have bike8 bike_praca_republica)

	 
	 )
  
  (:goal 
    (and
      (and 
        (visitou agent_joao p_banco_brasil) 
        (visitou agent_joao p_paco_alfandega)
        (visitou agent_joao p_praca_republica)
        (visitou agent_joao p_igreja_nsrp) 
        (visitou agent_joao p_mercado_sj)
      )
      (and 
        (visitou agent_maria p_banco_brasil) 
        (visitou agent_maria p_paco_alfandega)
        (visitou agent_maria p_praca_republica)
        (visitou agent_maria p_igreja_nsrp) 
        (visitou agent_maria p_mercado_sj)
      )
      (and 
        (visitou agent_jose p_banco_brasil) 
        (visitou agent_jose p_paco_alfandega)
        (visitou agent_jose p_praca_republica)
        (visitou agent_jose p_igreja_nsrp) 
        (visitou agent_jose p_mercado_sj)
      )
    )
  )
)