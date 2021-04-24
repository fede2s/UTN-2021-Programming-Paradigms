module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de calculín" $ do
    it "si el primer número es mayor al segundo debe devolver el primer número" $ do
      calculin 5 2 `shouldBe` 5
    it "si no, si el primer número es divisible por 3, devuelve el segundo número dividido el primero" $ do
      calculin 9 18 `shouldBe` 2
    it "caso contrario, debe devolver el segundo número divisible por 4 - módulo 3" $ do
      calculin 8 11 `shouldBe` 3
    it "caso contrario, debe devolver el segundo número divisible por 4 - módulo 0" $ do
      calculin 8 12 `shouldBe` 0
