#Checks and balances: 
#1) Check both kinds of matrices, make sure they make sense. 
    - Probabilities sum 1 
    - number of mutations correspond to theta and the selection coef. 
    - That I did simulate with correct parameters
    - That I am indeed using the most recent simulations
    - That l matches all trees.
#2) Check 

Ok no funciona con los parametros anteriores tampoco. sale 0.14 y 90. 
Entonces algo is going on. 

Entonces que procede?
 matrices simualdas. 28.9k variacion. 28.7k 
 19350857
 28943,

l = 19379845



Ideas:
1) Intentar con la matriz 20x8. Ya
2) Intentar sin la 9na columna. 
3) Volver a correr mini matrices para DFE. Ya
4) Ahora que mande las de 20 movi los rangos y salio error que repare pero eso me hace pensar que quizas los estaba dando mal para 200. Ya
5) La matriz gamma no está bien construida. No se ve "natural"
6) Vamos a aislar la parte que construye la matriz gamma Ya
7) Las matrices de prob se estan ciclando mal 
8) La multiplicación esta teniendo efectos inesperados (matriz_gamma * matriz_prob)

2)Hay forma de verificar cuanta variacion esperaria de una matriz DFE? 
- Si, genero la matriz gamma de los parametros target 
- El unico tema es que está en probabilidad y seria mas facil comparar con conteos. 
- busque los conteos de mi simulacion y lo multiplique por eso. No es exacto pero es un aprox de lo que deberia estar viendo.

Ya revise
- La variación esperada en las matrices set2 se ve bien. 
- Ya intente correr inferencias con los parametros originales (Salio mal... 0.14 alfa y 90 Beta)
- Las probabilidades ya estan bien hechas para las amtrices set2. 
- En general las amtrices set2 se ven bien. 
- Ya volvi a generar mas amtrices dfe porque tenian la discordancia pequeña de la l total.
- Ya mande con 20 freqs y salio peor.
- Ya revise la construccion de las probabilidades gamma, suman a 1 y se ven bien. 


Descubri 
- Que el script dfe_count_merge.R que se encarga de generar las amtrices KimDFE. No tiene bien puesta la l, por el error decimal. 
- Utilizar 20 frecuencias y 9 tiempos salio peor. Esto fue corrigiendo las cuentas de l para aceptar decimales
- probe la hipotesis de los rangos mal dados y definitivamente no es eso. salen NAs. 
- Descubri que resolver las inconsistencias de l sirve pero sigue sin cuadrar. 
- La matriz gamma de cuentas reconstruida se ve muy rara. Las cuentas casi no cambian de freq en freq. 

Mañana me adentro al algoritmo dado que ambas amtrices se ven bien... 
- Asegurar que la dfe se este simulando bien. Como? 

Creo que ya vi mi error. 
Cada matriz prob se multiplica por los intervalos gammas. 
Asi obtengo 27 matrices multiplicadas. 
Luego apra esas 27 las sumo todas. 
asi obtengo la matriz gamma. 
En el codigo nuevo no estoy haciendo eso, solo las estoy multiplicando continuamente. 

logica 1:
Para cada valor 2Ns tomo la matriz de prob correspondiente y la multiplico por cada intervalo pgamma.
Pero lo voy acumulando y se va sumando matriz gamma. 
Al final tengo la matriz gamma multiplicada por cada intervalo por cada valor 2ns y todas sumadas. 

logica 2: 
Leo cada matriz prob 2ns y la multiplico por los intervalos 
Esa multiplicacion de matrices la guardo. 
Al final sumo todas las matrices multiplicadas. 


Ideas
1) Discreetizacion de la integración. 
2) 


Las estan bien -- DFE como las discrfetas estan bien ehchas. 
El codigo esta bien -- Integracion lo que es. 

La logical de nuestra formula. 

1) matriz_gamma --> Cuentas


a ver entonces cambio por cuentas y entonces las cuentas las "integro". 
Una vez integradas aka multiplicadas por la probabilidad











