# Kata 3 individual

- Federico dos Santos (fede2s)

> **Nota**: no es necesaria la integración con Travis, GitHub Actions ni el badge.

## Enunciado

Dado este código base que modela un *Libro* y la función *masPaginasQue*
```haskell
data Libro = Libro {
 titulo :: String,
 paginas :: Number,
 temas :: [String]
}
masPaginasQue :: Libro -> Number -> Bool
masPaginasQue libro minimo = (>minimo).paginas $ libro
```

- Resolver la función *librosOrdenados* que recibe una lista de libros y evalúa si la misma está ordenada en forma creciente por la cantidad de páginas que tiene cada libro. Este punto se tiene que resolver utilizando **recursividad**.

- Resolver la función *librosConMasPaginasQue* que recibe un número de páginas, una lista de libros y nos devuelve una lista de los títulos que tienen más páginas que las especificadas. Pueden utilizar la función auxiliar *masPaginasQue* para la resolución de este punto.

## Scoring

Puntos totales: 2

- [ ] Resolución de código y prueba con el testeo unitario dado.
- [ ] Push a github.
- [ ] README actualizado con integrantes.