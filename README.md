# Automata Finito Determinista (AFD) y Expresiones Regulares

Ángel David Candelario Rolon

A01712387
## Introducción
El lenguaje que escogí para el desarrollo de este proyecto es el Chalkobsa. Un idioma ficticio que se usa en el universo de Dune, de acuerdo con Wikipedia (2025), el Chakobsa es 'una mezcla de idioma romaní, términos de un libro de texto de magia gitana, frases en serbocroata y varias palabras árabes'

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

