module Spec where
import Control.Exception
import Library
import PdePreludat
import Test.Hspec
 
sistemasOperativos = Libro {
 titulo = "Sistemas operativos",
 paginas = 805,
 temas = ["Planificadores", "Gestión de almacenamiento", "Gestión de memoria", "I/O"]
}
 
microservices = Libro {
 titulo = "Building Microservices",
 paginas = 260,
 temas = ["Microservicios","Arquitectura", "Modelado", "Ley de Conway", "Seguridad"]
}
 
choqueDeReyes = Libro {
 titulo = "Choque de reyes",
 paginas = 924,
 temas = ["Guerra","Poder"]
}
 
libros = [sistemasOperativos, microservices, choqueDeReyes]
 
correrTests :: IO ()
correrTests = hspec $ do
 describe "Tests de Kata 3 para" $ do
   describe "función libros ordenados si" $ do
     it "Dada una lista vacía entonces es imposible saber si están ordenadas" $ do
       evaluate (librosOrdenados []) `shouldThrow`  anyException
     it "Dada una lista de un libro entonces está ordenada" $ do
        [choqueDeReyes] `shouldSatisfy` librosOrdenados
     it "Dada una lista de libros ordenada entonces está ordenada" $ do
       [microservices, sistemasOperativos, choqueDeReyes] `shouldSatisfy` librosOrdenados
     it "Dada una lista de libros no ordenada entonces NO está ordenada" $ do
       libros `shouldNotSatisfy` librosOrdenados
   describe "función libros con más páginas que si" $ do
     it "dada una lista de libros vacía, no hay títulos que la satisfacen" $ do
       librosConMasPaginasQue 10 [] `shouldBe` []
     it "dada una lista de libros y un límite suficientemente alto, no hay títulos que la satisfacen" $ do
       librosConMasPaginasQue 1000 libros `shouldBe` []
     it "dada una lista de libros y un límite de páginas, entonces solo obtenemos los nombres de los libros que cumplen con la condición" $ do
       librosConMasPaginasQue 300 libros `shouldMatchList` ["Choque de reyes", "Sistemas operativos"]