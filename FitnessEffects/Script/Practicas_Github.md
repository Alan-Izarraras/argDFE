Flujo de trabajo y recomendaciónes de Git. 

Github. 
Repositorio para guardar CODIGO. 
Ojo, no es para guardar archivos pesados. 

El chiste es puedas tanto cuidar las versiones de tu proyecto 
- Ver versiones pasadas del script. 
Asi como compartir tu proyecto con otros libremente. 
- Clonar repositorios enteros en tu maquina o ambiente de trabajo. 

Hay varios niveles de uso de git. En mi experiencia las cosas que cuestan "trabajo" manual termino no 
haciendolas. Yo antes usaba git con la interfax grafica en la pagina de internet. Pero eso es muy tedioso
y es algo que terminas olvidando. 

Entonces decidi usarlo con linea de comandos, pero la cosa era que lo usaba localmente y entonces
era un show mantener tanto la version del cluster como la version local. 
Luego descubri que el cluster tiene git y que puedo trabajar y actualizar todo ahi mismo. 
Mejor aun descubri que hay procesadores de texto (VS Code) que se conectan al directorio del cluster. 
Esto es significativo porque entonces puedes tener sintaxis a color...
La otra alternativa es usar vim o personalizar tu nano u otros procesadores de linea de comandos 
para tener la sintaxis a color. 

Otras recomendaciones para eliminar fricciones en elt rabajo del laboratorio:
- Cuando vayas haciendo los scripts de tu proyecto hay varios niveles 
Nivel 1) Haces un script para generar X resultado. 
Nivel 2) Generas varios scripts alrededor de este que hacen otras cosas (formatos, guardar outputs, cambiar outputs) etc. 
Nivel 3) Tienes un proyecto con varios scripts "independientes" que tienes que correr como una pipeline
bioinformatica 
*video de secuencia faileada*
Nivel 4) Lo que queremos evitar es esto. Queremos que todo corra smoothly y sobretodo evitar contratiempos. 

Evita cambiar cosas "manualmente"
De preferencia copy paste o usar codigo para pasar parametros. 

Hay varios trucos para pasar parametros tanto en R, python, bash etc. 
No son muy complicados y una vez les agarras la onda son super utiles para hacer pipelines. 

Nivel 5) Tienes ya un programita con un pipeline bien hecho donde puedes usar varios comandos para ir 
cambiando o pasando inputs. Todo corre de principio a fin con la ejecución de uno o pocos scripts. 

Todo este flujo de trabajo es potenciado por el poder de Git. Sin el tendrias un desastre y los desastres
son donde mas ganas dan de procrastinar. Si reduces la friccion de los desastres el trabajo es mucho mas 
placentero. 

Requiere un "poco" de setup pero en esencia el flujo de trabajo se convierte en...
git add . 
git commit -m "esto fue lo que hice hoy"
git push. 

Recombiendo trabajar en una rama "experimental"
y cuando la tengas bien fusionar con la rama "main"

Entonces tienes una version que ya sabes que funciona y una version que es trabajo en progreso. 
Cuando el trabajo en progreso ya esta bien puesto, la unes al trabajo principal. 

Setup:
1) Una cuenta 
2) Conectar tu cuenta al cluster (llave ssh)
3) Clonar / pasar tu trabajo (en esta ocasion subir cosas a github)
4) ya. 

El problema más latoso del mundo:
- Se te fue y subiste un archivo pesado. 
- Pusheaste ese cambio
- Como ya no tienes espacio no puedes hacer nada 
- Borras los archivos 
- Dices a bueno ya está y procedes 
- Problema: No te deja actualizar porque tienes un archivo faltante que esta en tu historial pero no en tu 
directorio
- Es bien molesto esto y tienes que tener una buena sesion con chatgpt para arreglarlo. 

gitigore:
- Aqui pones las rutas a directorios que deseas que sean ignorados. 
- En mi caso, directorios donde guardo archivos intermedios o outputs pesados. 
- Todos mis arboles, archivos de parametro, etc NO los subo a github. 
- subo los directorios vacios. 


