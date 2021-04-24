module Spec where
import PdePreludat
import Library
import Test.Hspec

correrTests :: IO ()
correrTests = hspec $ do
  describe "Test de Kata 0" $ do
    it "Test de prueba" $ do
      1 + 1 `shouldBe` 2

    it "Test numeros grandes" $ do
      f 6 `shouldBe` 6

    it "Test de numeros medios - extremo mayor" $ do
      f 5 `shouldBe` 4

    it "Test de numeros medios - extremo inferior" $ do
      f 0 `shouldBe` (-1)

    it "Test de numeros negativos" $ do
      f(-5) `shouldBe` (-7)

