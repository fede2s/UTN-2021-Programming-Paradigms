module Library where
import PdePreludat
 
type Nombre = String
type Edad = Number
type Felicidonios = Number
type Habilidades = [String]
type Suenio = Persona -> Persona


data Persona = Persona {
  nombre       :: Nombre,
  edad         :: Edad,
  suenios      :: [Suenio],
  felicidonios :: Felicidonios,
  habilidades  :: Habilidades
}deriving(Show)


fede :: Persona
fede = Persona {
  nombre = "Fede",
  edad = 24,
  felicidonios = 50,
  habilidades = ["Cantar"," Dibujar", " Programar"],
  suenios = [recibirseDe "Ingienieria",recibirseDe "Pepito",viaja ["Montevideo"]]
}



muyFeliz :: Persona -> Bool
muyFeliz = (>100) . felicidonios

moderadamenteFeliz :: Persona -> Bool
moderadamenteFeliz persona = felicidonios persona <= 100 && felicidonios persona > 50

-- Punto 1
cantidadDeSuenios :: Persona -> Number
cantidadDeSuenios  =  length . suenios

coeficienteDeSatisfaccion :: Persona -> Number
coeficienteDeSatisfaccion persona 
  | muyFeliz persona                = felicidonios persona * edad persona 
  | moderadamenteFeliz persona      = cantidadDeSuenios persona * felicidonios persona 
  | otherwise                       = felicidonios persona `div` 2
  
gradoDeAmbicionDeUnaPersona :: Persona -> Number
gradoDeAmbicionDeUnaPersona persona 
 | muyFeliz persona                  =  felicidonios persona * cantidadDeSuenios persona
 | moderadamenteFeliz persona        =  edad persona * cantidadDeSuenios persona 
 | otherwise                         =  ((*2).cantidadDeSuenios) persona






-- Punto 2
nombreLargo :: Persona -> Bool
nombreLargo  = ( >10) . length . nombre  

personaSuertuda :: Persona -> Bool
personaSuertuda  =  even . ( *3) . coeficienteDeSatisfaccion

nombreLindo :: Persona -> Bool
nombreLindo  =  ( == 'a').last.nombre








-- Punto 3
agregarHabilidad :: String -> Suenio
agregarHabilidad habilidad persona = persona{
  habilidades = ((++ [habilidad]). habilidades) persona 
}

sumarFelicidonios :: Number -> Suenio
sumarFelicidonios felicidoniosASumar persona = persona{
  felicidonios = felicidonios persona + felicidoniosASumar
}

sumarEdad :: Suenio
sumarEdad persona = persona{
  edad = ((+1). edad )persona
}



recibirseDe :: String -> Suenio
recibirseDe carrera =  agregarHabilidad carrera . sumarFelicidonios (((*1000) . length) carrera) 

viaja :: [String] -> Suenio
viaja ciudades = sumarEdad . sumarFelicidonios (((*100) . length) ciudades)

enamorarseDeOtraPersona :: Persona -> Suenio
enamorarseDeOtraPersona personaQueAma = sumarFelicidonios (felicidonios personaQueAma)

queTodoSigaIgual :: Suenio
queTodoSigaIgual = id

comboPerfecto :: Suenio
comboPerfecto = (sumarFelicidonios 100 ) . (viaja ["Berazategui","Paris"]) . (recibirseDe "medicina")
