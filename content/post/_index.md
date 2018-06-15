+++
title = "ERRE"
date = 2018-06-01
math = false
highlight = true

# Optional featured image (relative to `static/img/` folder).
[header]
image = ""
caption = ""

+++

<a href="https://github.com/jcvdav/villasenor-derbez"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_gray_6d6d6d.png" alt="Fork me on GitHub"></a>

# Sobre el blog

**Bienvenido a `ERRE` (R en Español)!** Inicié este blog para ayudar a la comunidad hispanohablante a navegar el mundo de la programación en R, que tiene la fama de no ser muy intuitivo [^1]. La documentación en R puede ser ambigua, y generalmente recurrimos a sitios como [StackOverflow](https://es.stackoverflow.com/) o [GitHub](https://github.com/) para encontrar información más detallada. Estos son muy buenos recursos, pero la mayoría de la información está en inglés y traducir R - Inglés - Español - R puede ser más largo. Trataré de usar mis horas de sufrimiento para explicar los conceptos de la manera en que yo lo entiendo (probablemente no sea la más correcta, pero por lo menos estará en español).

El enfoque principal de `ERRE` no será la estadística, aunque habrá posts sobre eso. Además, no intentaré convencerte de que R es mejor que otro lenguaje. Si estás aquí, asumo que es porque ya estás interesado en usar R. El enfoque será en comprender el lenguaje de programación para que puedas después aplicar las pruebas estadísticas y análisis que sean de tu interés. También habrá un enfoque en manipulación y visualización de datos, que considero habilidades transferibles através de disciplinas. Es recomendable que uses [R](https://cran.r-project.org/bin/windows/base/) desde [R Studio](https://www.rstudio.com/products/rstudio/download/).

# Antes de empezar

En los diferentes posts notarás palabras en *itálicas*. Trataré de limitar utilizar este énfasis únicamente para palabras en inglés que no valdría la pena traducir, que al traducir perderían contexto, o que suenan mejor. Por ejemplo, yo prefiero *data science* que "ciencia de los datos". También verás texto en `monospace`, que representará código. Por ejemplo, si quiero hacer referencia a una variaable multiplicada por dos verás: `mi_variable * 2`. A veces bloques de texto tendrán el mismo, lo que indicará que son bloques de código, Por ejemplo:

```
# Sumar dos variables
a <- 2
b <- 3

a + b
```

Finalmente, a veces usaremos funciones de R que pertenecen a algún paquete. Cuando sea posible, especificaré de dónde viene la función usando el `namespace` diciendo `paquete::función()`. Esto sería el equivalente a decir `apellido::nombre`, donde el paquete contiene muchas funciones de la misma manera en que un apellido (o familia) puede contener a varias personas.

# Temas

En esta sección verás los temas que cubriré en la primera sección. Muy probablemente agregue más mientras se desarrolle el blog. Los temas para los cuales existe un post se verán en azul, y tendrán un enlace al post. Si un tema no está disponible, puedes [ofrecer una contribución](https://github.com/jcvdav/villasenor-derbez)!

<div class = "row">
<div class = "col-md-6">

<h3> Introducción a la programación en R </h3>

<ul>
<li> <a href = "/post/r-y-r-studio/"> R y RStudio para <i>Data Science</i> </a> </li>

<li> Guardando valores: variables, vectores, matrices, listas y tablas de datos </li>

<li> Sequencas de control: Ciclos y condicionales </li>

<li> Mensajes de error </li>

<li> Estadística paramétrica en R </li>

<li> Manejo de datos con <code>tidyr</code> y <code>dplyr</code> </li>

<li> Visualización con <code>ggplot2</code> </li>

<li> Colaborando con Git y GitHub </li>

</ul>
</div>
<div class = "col-md-6">

<h3> Programación aplicada </h3>

<ul>
<li> Modelación numérica con <code>deSolve</code> </li>

<li> <code>rmarkdown</code> avanzado </li>

<li> Aplicaicones web con <code>shiny</code> </li>

<li> Crea tus paquetes con <code>devtools</code> y <code>testthat</code> </li>

<li> Análisis espaciales en R </li>

<li> Manejo de paquetes con <code>packrat</code> </li>

<li> Computación paralela </li>

<li> BIG data en R </li>

<li> R desde la línea de comando </li>
</ul>
</div>
</div>


[^1]: [aRrgh: a newcomer’s (angry) guide to R](http://arrgh.tim-smith.us)






















