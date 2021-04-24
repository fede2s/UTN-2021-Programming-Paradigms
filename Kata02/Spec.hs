module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  
  describe "Test de funciones para recopilar datos de tuplas" $ do
    it "El modelo de (Chevrolet Prisma, 537) es Chevrolet Prisma" $ do
      modelo ("Chevrolet Prisma", 537) `shouldBe` "Chevrolet Prisma"
    it "El kilometraje desde el último cambio de aceite del (Fiat Duna, 234) es 234" $ do
      kilometraje ("Fiat Duna", 234) `shouldBe` 234

  describe "Test de función esMasDeDiezmil :: Kilometros -> Bool" $ do
    it "300 es más de 10000 es una premisa falsa." $ do
      esMasDeDiezMil 300 `shouldBe` False
    it "10000 es más de 10000 es una premisa falsa." $ do
      esMasDeDiezMil 10000 `shouldBe` False
    it "10001 es más de 10000 es una premisa verdadera." $ do
      esMasDeDiezMil 10001 `shouldBe` True
  
  describe "Test de función autoVeloz :: Auto -> Bool  // Es veloz si tiene cantidad impar de caracteres el modelo" $ do
    it "Dodge 1500 no es un auto veloz, porque tiene 10 caracteres." $ do
      autoVeloz ("Dodge 1500", 23000) `shouldBe` False
    it "Pagani Huayra es un auto veloz, porque tiene 13 caracteres." $ do
      autoVeloz ("Huayra Pagani", 7200) `shouldBe` True

  describe "Test de función cambioDeAceite :: Auto -> Bool " $ do
    it "Un auto que recorrió 10.000km o menos no necesita cambio de aceite." $ do
      cambioDeAceite ("Fiat Sienna", 10000) `shouldBe` False
      cambioDeAceite ("Ford Ka", 37) `shouldBe` False
    it "Un auto que recorrió más de 10.000km sí necesita un cambio de aceite." $ do
      cambioDeAceite ("VolksWagen Gol", 10210) `shouldBe` True


