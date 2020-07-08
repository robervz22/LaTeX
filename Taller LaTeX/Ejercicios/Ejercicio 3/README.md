### Ayuda

Algunas de las dimensiones que se usan en este documento son:
- *Dimensiones del papel:* 8.5 in × 6 in
- *Dimensiones del bloque de texto:* 6.45 in × 4.8 in
- *Margen superior:* 1.15 in
- *Margen inferior:* 1 in
- *Margen izquierdo (lomo):* 0.7 in
- *Margen derecho:* 0.5 in
- *Separación entre el encabezado y el texto:* 0.3 in

Si se usa la clase `memoir`, el siguiente código funciona.
```latex
\setstocksize{8.5in}{6in}
\settrimmedsize{\stockheight}{\stockwidth}{*}
\settypeblocksize{6.45in}{4.8in}{*}
\setulmarginsandblock{1.15in}{1in}{*}
\setlrmarginsandblock{0.7in}{0.5in}{*}
\setlength\headsep{0.3in}
\checkandfixthelayout
```

*Fuente:* Stix, 10 pt.
