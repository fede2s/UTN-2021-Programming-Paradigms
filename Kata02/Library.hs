module Library where
import PdePreludat

type Modelo = String
type Kilometros = Number
type Auto = (Modelo, Kilometros)
type CantidadDeCaracteres = Number
 

modelo :: Auto -> Modelo
modelo = fst

largoDeCadena :: Modelo -> CantidadDeCaracteres
largoDeCadena = length

esImpar :: CantidadDeCaracteres -> Bool
esImpar = odd


kilometraje :: Auto -> Kilometros
kilometraje = snd

esMasDeDiezMil :: Kilometros -> Bool
esMasDeDiezMil = (    > 10000 )


-- Punto 1
autoVeloz :: Auto -> Bool
autoVeloz = esImpar.largoDeCadena.modelo

-- Punto 2
cambioDeAceite :: Auto -> Bool
cambioDeAceite = esMasDeDiezMil.kilometraje
