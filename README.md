# Automata Finito Determinista (AFD) y Expresiones Regulares

Ángel David Candelario Rolon

A01712387
## Introducción
El lenguaje que escogí para el desarrollo de este proyecto es el Chalkobsa. Un idioma ficticio que se usa en el universo de Dune, de acuerdo con Wikipedia (2025), el Chakobsa es 'una mezcla de idioma romaní, términos de un libro de texto de magia gitana, frases en serbocroata y varias palabras árabes' [1].

Las palabras a implementar que escogí de este lenguaje son:
1. bakka - The weeper.
2. baklawa - dessert pastry. 
3. baraka - miracle worker.
4. baz - falcon.
5. bidriyah - coarse silica frit.

## Descripción
Un Automata Finito Deterministico (AFD) consta de:
 - Un **conjunto finito de estados** ->  Q
 - Un **alfabeto** (conjunto de simbolos o letras) -> Σ
 - **Transiciones** ->  **δ**
 - Un **estado inicial**
 - Uno o más **estados finales**.

Se representa gráficamente con un **grafo**, donde los nodos son los estados y las flechas las transiciones. Cada transición está etiquetada con un símbolo del alfabeto representando su condición para realizar la transición.
### ¿Por qué un AFD?
Dentro del desarrollo de este proyecto decidí hacer un AFD porque este tipo de automatas tienen unicamente transiciones definidas en todos los estados, en mi caso para formar una sola palabra del lenguaje, se necesita un orden único entre mi conjunto de simbolos o letras, es por esto que el modelo AFD es el más adecuado para poder definir cada una de las palabras a implementar dentro de mi automata, siendo mi alfabeto 
## ``` Σ = {b, a, k, l, w, r, z, i, d, y, h} ```

## Modelos

### Versión 1 
![image](https://github.com/user-attachments/assets/fb4a5802-7092-4599-ac3d-c34847b4342b)
La primera versión de mi autómata permitía reconocer cada palabra de manera individual, pero presentaba dos problemas: no aceptaba secuencias donde una palabra válida estuviera seguida de otra y algunos estados se creaban de manera innecesaria al duplicar condiciones o transiciones que ya existían, lo cual podía optimizarse reutilizando estados.

### Versión 2
![image](https://github.com/user-attachments/assets/d293ff31-5491-400e-a446-b6777c6b4aeb)
En la segunda versión optimice la cantidad de estados reutilizando algunas de las transiciones que ya estaban definidas. Pero aún presenta el problema de las palabras validas repetidas, ademas de que no se ha representado de alguna manera como termina el automata en dado caso de que se ingrese algún simbolo, provocando que ya no se genere la palabra.

Según un documento de una clase sobre la teória de autómatas dice "Las situaciones que no están definidas deben ser consideradas como situaciones de error, es decir, si una cadena hace llegar al autómata hasta la situación no definida, consideraremos que la cadena no ha sido reconocida por dicho autómata” [2].

### Versión 3
![image](https://github.com/user-attachments/assets/f51ee38e-b8b7-4d31-94c9-b7a90dad6974)

La versión final de mi automata ahora me permite:
 - Generar las palabras -> bakka | baklawa | baraka | baz | bidriyah
 - Repetir palabras validad -> bakkabakka | barakabaz | bidriyahbaz
 - Representar las situaciones de error usando un estado de captación global [3]

## Expresión regular
Otra forma de representar un automata es usando las expresiones regulares. Como se menciona en el documento CAPTUL1.pdf "Las expresiones regulares son un equivalente algebraico para un autómata, puede definir exactamente los mismos lenguajes que los autómatas puedes describir: Lenguajes regulares. Además ofrecen algo que los autómatas no: Manera declarativa de expresar las cadenas que queremos aceptar." [4].

Una vez declarado esto defini la expresión regular en mis modelos anteriores:

### **Versión 1 y 2**
```^b(a(k(ka$|lawa$)|z$|raka$)|idriyah$)```

### **Versión 3**
```^(b(a(k(ka|lawa)|z|raka)|idriyah))+$```

## Referencias
[1]: https://es.wikipedia.org/wiki/Chakobsa_(idioma_ficticio)

[2]: https://www.geocities.ws/mfagundez24/UJAP/Discreta/TeoriadeAutomata3.pdf?utm_source=chatgpt.com" (Clase3.doc, p. 2)

[3]: https://aconute.es/computacion/automatasFinitos/ejemplo_deter.html

[4]: https://posgrados.inaoep.mx/archivos/PosCsComputacionales/Curso_Propedeutico/Automatas/03_Automatas_ExpresionesRegularesLenguajes/CAPTUL1.PDF

### Otros enlaces
https://cs.famaf.unc.edu.ar/~hoffmann/md19/09.html
