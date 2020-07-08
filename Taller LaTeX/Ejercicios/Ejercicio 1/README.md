### Ayuda

Algunas de las dimensiones que se usan en este documento son:
- *Dimensiones del papel:* 5.8 in × 4.25 in
- *Dimensiones del bloque de texto:* 5 in × 3.2 in
- *Margen superior:* 0.35 in
- *Margen inferior:* 0.35 in
- *Margen izquierdo (lomo):* 0.55 in
- *Margen derecho:* 0.5 in
- *Separación entre el encabezado y el texto:* 7 pt
- *Separación entre el pie de página y el texto:* 14 pt

Si se usa la clase `memoir`, el siguiente código funciona.
```latex
\setstocksize{5.8in}{4.25in}
\settrimmedsize{\stockheight}{\stockwidth}{*}
\settypeblocksize{5in}{3.2in}{*}
\setulmarginsandblock{0.35in}{0.35in}{*}
\setlrmarginsandblock{0.55in}{0.5in}{*}
\setlength\headsep{7pt}
\setlength\footskip{14pt}
\checkandfixthelayout
```

*Fuente:* Bitstream Charter, 9 pt.
```latex
\usepackage[bitstream-charter]{mathdesign}
```
