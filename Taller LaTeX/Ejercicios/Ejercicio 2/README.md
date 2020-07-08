### Ayuda

Algunas de las dimensiones que se usan en este documento son:
- *Dimensiones del papel:* 8.45 in × 5.4 in
- *Dimensiones del bloque de texto:* 7 in × 4.25 in
- *Margen superior:* 0.8 in
- *Margen inferior:* 0.6 in
- *Margen izquierdo (lomo):* 0.55 in
- *Margen derecho:* 0.6 in
- *Separación entre el encabezado y el texto:* 7 pt

Si se usa la clase `memoir`, el siguiente código funciona.
```latex
\setstocksize{8.45in}{5.4in}
\settrimmedsize{\stockheight}{\stockwidth}{*}
\settypeblocksize{7in}{4.25in}{*}
\setulmarginsandblock{0.8in}{0.6in}{*}
\setlrmarginsandblock{0.55in}{0.6in}{*}
\setlength\headsep{7pt}
\checkandfixthelayout
```

*Fuente:* Computer Modern, 10 pt.
