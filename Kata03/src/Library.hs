module Library where
import PdePreludat

data Libro = Libro {
 titulo :: String,
 paginas :: Number,
 temas :: [String]
} deriving (Show)
masPaginasQue :: Libro  -> Number -> Bool
masPaginasQue libro minimo = (>minimo).paginas $ libro

librosOrdenados:: [Libro] -> Bool
librosOrdenados [] = error "No hay libros"
librosOrdenados [libro] = True
librosOrdenados (primerLibro:segundoLibro:colaLibros) = ((paginas primerLibro)<=(paginas segundoLibro)) && librosOrdenados (segundoLibro:colaLibros)

librosConMasPaginasQue:: Number -> [Libro] -> [String]
librosConMasPaginasQue minimo lista = ((map titulo).filter (flip (masPaginasQue) minimo)) lista