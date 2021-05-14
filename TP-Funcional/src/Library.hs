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







cantidadDeSuenios :: Persona -> Number
cantidadDeSuenios  =  length . suenios

coeficienteDeSatisfaccion :: Persona -> Number
coeficienteDeSatisfaccion persona 
  | (( >100). felicidonios) persona = felicidonios persona * edad persona 
  | (( >50). felicidonios) persona  = cantidadDeSuenios persona * felicidonios persona 
  | otherwise                       = ((floor).( / 2).felicidonios)persona 
  
gradoDeAmbicionDeUnaPersona :: Persona -> Number
gradoDeAmbicionDeUnaPersona persona 
 | ((>100).felicidonios)persona      =  felicidonios persona * cantidadDeSuenios persona
 | ((>50) .felicidonios)persona      =  edad persona * cantidadDeSuenios persona 
 | otherwise                         =  ((*2).cantidadDeSuenios) persona







nombreLargo :: Persona -> Bool
nombreLargo  = ( >10) . length . nombre  

personaSuertuda :: Persona -> Bool
personaSuertuda  =  even . ( *3) . coeficienteDeSatisfaccion

nombreLindo :: Persona -> Bool
nombreLindo  =  ( == 'a').last.nombre









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
enamorarseDeOtraPersona personaQueAma personaAmada = personaQueAma{
  felicidonios = felicidonios personaAmada + felicidonios personaQueAma 
}

queTodoSigaIgual :: Suenio
queTodoSigaIgual persona = persona

comboPerfecto :: Suenio
comboPerfecto = ((sumarFelicidonios 100 ) . (viaja ["Berazategui","Paris"]) . (recibirseDe "medicina"))