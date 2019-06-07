---
title: 
keywords: 
sidebar: indicador_sidebar
toc: false
permalink: index.html
Summary:
---

<head>
 <script>
     /**
     * Array con las imagenes que se iran mostrando en la web
     */
	
     var imagenes=new Array(
        'images/fondo-44.jpg',
        'images/fondo-22.jpg',
        'images/fondo-33.jpg',
        'images/fondo-11.jpg',
		'images/fondo-55.jpg'
        );
      var conteo=0
     /**
     * Funcion para cambiar la imagen
     */
     function rotarImagenes()
     {	  
		  document.getElementById("imagen").src=imagenes[conteo];
		  if(conteo<imagenes.length-1)
           {conteo ++}
		   else
		   {conteo=0}
           
     }
 
     /**
     * Función que se ejecuta una vez cargada la página
     */
     onload=function()
     {
        // Cargamos una imagen aleatoria
        rotarImagenes();
 
        // Indicamos que cada  segundos cambie la imagen
        setInterval(rotarImagenes,3000);
     }
    </script>
	</head>


<body style="background-color:#dfe3ee;">

<h1 style="color:#bf0000;" align="center"> Plataforma de Seguimiento</h1>
<h1 style="color:#bf0000;" align="center"> Línea Base de Indicadores UNICEF</h1>

 <center> 
<img src="" id="imagen" align="center">
 </center> 
 
 <br>
 
 <h3 style="color:#011f4b" align="justify" >Unicef lleva adelante el Programa de Cooperación en Bolivia 2018 - 2022
 que tiene el objetivo de apoyar en la reducción de las brechas de 
 desigualdad, especialmente en los pueblos indígenas y lograr que los 
 niños y adolescentes constituyan un elemento fundamental para el 
 desarrollo sostenible.</h3>
 
 <br>
 
 <h3 style="color:#011f4b" align="justify" > El programa se estructura en torno a los cuatro ámbitos o resultados 
 (outcomes): 1) Todos los niños sobreviven y prosperan, 2) Todos los niños
 están protegidos contra la violencia y la explotación, 3) Todos los niños
 aprenden y 4) Todos los niños disfrutan de las mismas oportunidades en la
 vida.</h3>
 
</body>

