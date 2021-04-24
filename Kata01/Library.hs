module Library where
import PdePreludat

calculin :: Number -> Number -> Number
calculin a b
 | a>b              = a
 | (rem a 3) ==0    = b/a
 | otherwise        = rem b 4