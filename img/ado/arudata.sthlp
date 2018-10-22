{smcl}
{right:version 1}
{title:Title}

{phang}
{cmd:arudata} {hline 2} Permite tener acceso al repositorio de datos de Fundación Aru, el repositorio esta conformado  por bases de Aru y de fuentes secundarias en distintas áreas. Conozca mas de Aru en {break} 
{browse "http://www.aru.org.bo":www.aru.org.bo}
 

{title:Syntax}

{p 8 16 2}
{cmd: arudata} database 
{p_end}

{marker Main}{...}
{synoptset 20 tabbed}{...}
{synopthdr:Main}
{synoptline}
{synopt:{opt database}} El código de la base de datos de interés (Ver catálogo de datos (abajo) para conocer las bases disponibles)
{synoptline}
{p2colreset}{...}


{title:Description}

{p 4 4 2}
{bf:arudata} Simplifica el acceso a las bases de datos de fuentes secundarias y de proyectos realizados por Fundación Aru.

{p 4 4 2}
Aru dispone de un repositorio que alberga las bases de datos de distintos ámbitos de Bolivia y las distribuye de forma rapida y amigable entre sus investigadores mediante el comando {bf:arudata}.


{title: Catálogo de Datos, fuentes secundarias}

{p 4 4 2}
(Actualizada a Abril - 2018) Para ver el catalogo extendido puede ver {browse "http://udata-aru.github.io/":http://udata-aru.github.io}

{p 4 4 2}
{bf:Encuestas a Hogares (eh)} Disponible de 2011 a 2017, módulos: (p) Personas, (v) Vivienda, (e) Equipamiento, (ga) Gastos alimentarios -nd 2016-, 
(gna) Gastos no alimentarios -nd 2016-, (sa) Seguridad alimentaria -d 2016, 2017-, (c) Cultura -d 2017-, (t) Turismo -d 2016-. Para acceder a los datos use 
el prefijo `eh' seguido del año de interes a dos digitos (ej: 2011=11, 2017=17) y el módulo (p, v, e, etc.).

{p 4 4 2}
{bf:Encuesta de Demografia y Salud} En construcción

{p 4 4 2}
{bf:Latinobaromentro} En construcción

{p 4 4 2}
{bf:LAPOB} En construcción

{p 4 4 2}
{bf:Encuesta Nacional Agropecuaria} En construcción

{p 4 4 2}
{bf:Censo de Poblacion y Vivienda} En construcción

{title: Catálogo de Datos, fuentes Aru}

{p 4 4 2}
(Actualizada a Abril - 2018) Para ver el catalogo extendido puede ver {browse "http://udata-aru.github.io/":http://udata-aru.github.io}

{p 4 4 2}
{bf: Comunidades Informadas} En construcción

{p 4 4 2}
{bf: BDP} En construcción

{p 4 4 2}
{bf: Jiwasa} En construcción

{p 4 4 2}
{bf: MYPES} En construcción

{p 4 4 2}
{bf: Puma Katari} En construcción


{title:Example(s)}

{p 4 4 2}
{bf:Ejemplo para las encuestas a hogares} 

    Encuesta a hogares 2017, base vivienda
    	. arudata eh17v
		
    Encuesta a hogares 2017, base cultura
    	. arudata eh17c	


{title:Author}

{p 4 4 2}
Alvaro Chirino Gutierrez {break}
Data Coordinator - Aru Foundation {break}
Lecturer - Department of Statistics, University of San Andres {break} {break}
{browse "mailto:achirino@aru.org.bo":achirino@aru.org.bo}  {break}


