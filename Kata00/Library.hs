module Library where
import PdePreludat

f :: Number -> Number
f x
 |x>5           =x
 |x>=0 && x<=5  =x-1
 |otherwise     =2*x+3
