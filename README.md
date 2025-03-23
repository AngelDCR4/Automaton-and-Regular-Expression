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

Una vez declarado esto definí la expresión regular en mis modelos anteriores:

## **Versión 1 y 2**
### ```^b(a(k(ka$|lawa$)|z$|raka$)|idriyah$)```

### Desglose de la expresión regular `^b(a(k(ka$|lawa$)|z$|raka$)|idriyah$)`

- `^b`: La palabra comienza con la letra `b`.
- `a(...)`: Después de la `b`, puede venir una `a` seguida de diferentes combinaciones.
- `k(ka$|lawa$)`: Si después de `ba` viene una `k`, puede terminar en `ka` (→ **bakka**) o en `lawa` (→ **baklawa**).
- `z$`: O también después de `ba` puede venir una `z` y terminar con (→ **baz**).
- `raka$`: También puede terminar en `raka` para (→ **baraka**).
- `idriyah$`: O puede ir directamente de `b` a `idriyah` sin pasar por `a`  para formar(→ **bidriyah**).

## **Versión 3**
### ```^(b(a(k(ka|lawa)|z|raka)|idriyah))+$```

A comparación con la versión 1 y 2
- El caracter `^` esta al inicio indicando que puede iniciar la cadena con cualquier palabra formada según lo que dice los `"(...)"`
- Al final tenemos `+$` indicando que la cadena puede terminar varias veces con las palabras formadas según lo que dice los `"(...)"`
- 
Para poder implementar mi expresión regular dentro del código hice uso del paquete de **regex** [5]. Ya implementado mi codigo con regex quedo así:
````Prolog
% Automata V1 y V2
valid_word(Word) :-
    regex('^b(a(k(ka$|lawa$)|z$|raka$)|idriyah$)', [], Word, _).

% Automata V3
valid_word2(Word) :-
    regex('^(b(a(k(ka|lawa)|z|raka)|idriyah))+$', [], Word, _).
````

### Estructura de RE
La estructura de este código 

 - ```valid_word2(Word) :- ``` Función que solicita palabra a validar.
Esta línea se basa en esta base de la página de swi-prolog.org [6]
 - ```regex( 1, 2, 3, 4)``` 
1. Expresión Regular: Se ingresa la Expresión Regular, posteriormente se pueden colocar ciertas opciones adicionales como:
2. Arreglo Opciones: Se ingresa ciertas opciones adicionales como: ```icase```, ```dotall```, ```newline```,... .
3. Texto: Se ingresa el texto a usar para la Expresión Regular
4. Capturas: Se usa para obtener las subcadenas que coinciden con los grupos de captura (paréntesis) dentro del patrón.

## Pruebas
La programación del automata contiene 8 pruebas, siendo 5 correctas y 3 incorrectas (para aquellos posibles casos en que se ingrese una palabra invalida):
1. ```?- bakka.``` se espera -> true
2. ```?- bidriyah.``` se espera -> true
3. ```?- bakkabakka.``` se espera -> true
4. ```?- barakabaz.``` se espera -> true
5. ```?- bazbarakabidriyah.``` se espera -> true
6. ```?- abakka.``` se espera -> false
7. ```?-.baikka.``` se espera -> false
8. ```?- bakkala.``` se espera -> false

Si desea hacer una prueba personalizada puede usar el comando ```?-  transaction([Σ,Σ,...]).```, colocando letras del alfabeto en Σ para formar una palabra separado por comas.

Si desea hacer pruebas con la RE puede iniciar el programa con **swipl**, primero instale el paquete de regex con ```?- pack_install(regex).``` y luego puede mandar a llamar la funcion con la expresión regular con ```valid_word2(bakka | baz | ...).```

## Complejidad temporal y espacial
El automata que diseñe esta en el nivel del lenguaje regular, se puede representar con una expresión regular y se modela con un Autonoma Finito Determinista. Su complejidad temporal es de **O(n)** ya que **n** es la longitud de la palabra, el automata analiza cada simbolo del alfabeto uno por uno y avance de estado a estado. Su complejidad espacial es de **O(1)** porque el automata no requiere de otras estructuras como las pilas, solo mantiene su estado actual y lee las cadenas de izquierda a derecha. 

## Referencias
[1]: Lenguaje Chalkobsa - 
Colaboradores de Wikipedia. (2025, 12 enero). Chakobsa (idioma ficticio). Wikipedia, la Enciclopedia Libre. https://es.wikipedia.org/wiki/Chakobsa_(idioma_ficticio)

[2]: Automatas Incompletos - 
Fagúndez, M. (s.f.). Teoría de autómatas – Clase 3 (Clase3.doc, p. 2). https://www.geocities.ws/mfagundez24/UJAP/Discreta/TeoriadeAutomata3.pdf

[3]: Estado de Error o de Trampa - 
AUTÓMATAS FINITOS y LENGUAJES REGULARES. (s. f.). https://aconute.es/computacion/automatasFinitos/ejemplo_deter.html

[4]: Definición - 
RE INAOE. (s.f.). Autómatas, expresiones regulares y lenguajes – Capítulo 1. Instituto Nacional de Astrofísica, Óptica y Electrónica. https://posgrados.inaoep.mx/archivos/PosCsComputacionales/Curso_Propedeutico/Automatas/03_Automatas_ExpresionesRegularesLenguajes/CAPTUL1.PDF

[5]: Paquete Regex - 
«regex» pack for SWI-Prolog. (s. f.). https://www.swi-prolog.org/pack/list?p=regex

[6]: Estructura linea Regex -
Pack regex -- prolog/regex.pl. (s. f.). https://www.swi-prolog.org/pack/file_details/regex/prolog/regex.pl
### Otros enlaces
Automatas finitos y lenguajes regulares. (s. f.). https://cs.famaf.unc.edu.ar/~hoffmann/md19/09.html
