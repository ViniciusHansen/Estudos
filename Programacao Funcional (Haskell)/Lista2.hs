module Lista2 where

pertence ::  Int -> [Int] -> Bool
pertence _ [] = False
pertence n (x:xs) =
    if n == x then True
    else pertence n xs

intercessao :: [Int] -> [Int] -> [Int]
intercessao [] _ = []
intercessao _ [] = []
intercessao (x:xs) (y:ys) =
    if (pertence x (x:xs) == True && pertence x (y:ys) == True) && (pertence y (x:xs) == True && pertence y (y:ys) == True) && (x /= y) then x:y:(intercessao xs ys)
    else if pertence x (x:xs) == True && pertence x (y:ys) == True then x:(intercessao xs ys)
    else if pertence y (x:xs) == True && pertence y (y:ys) == True then y:(intercessao xs ys)
    else intercessao xs ys

inversoLista :: [a] -> [a]
inversoLista [] = []
inversoLista (x:xs) = inversoLista xs ++ [x]


nUltimos :: Int -> [a] -> [a]
nUltimos n [] = []
nUltimos n (x:xs) | n == length (x:xs) = x : xs
                  | otherwise = nUltimos n xs

enesimo :: Int -> [Int] -> Int
enesimo _ [] = -1
enesimo n (x:xs) | n > ((length xs) + 1) = -1
                 | otherwise = (x:xs)!!(n-1)

repetir :: Int -> Int -> [Int]
repetir 0 _ = []
repetir n m = m:repetir (n-1) m

intercalacao :: [Int] -> [Int] -> [Int]
intercalacao xs [] = xs
intercalacao [] ys = ys
intercalacao (x:xs) (y:ys) | x<y = x:intercalacao xs (y:ys)
                           | otherwise = y:intercalacao ys (x:xs)

menor :: [Int] -> Int
menor [x] = x
menor (x:xs) =
    if x < menor xs then x
    else menor xs


removerElem :: Int -> [Int] -> [Int]
removerElem _ [] = []
removerElem n (x:xs) | n /= x = x:removerElem n xs
                     | otherwise = xs

ordenarLista :: [Int] -> [Int]
ordenarLista [] = []
ordenarLista (x:xs) = menor (x:xs) : ordenarLista (removerElem (menor(x:xs)) (x:xs))

insereElem :: Int -> [Int] -> [Int]
insereElem n (x:xs) | pertence n (x:xs) == True = (x:xs)
                    | n > x = x:insereElem n xs
                    | n < x = n:x:xs

primeirosDuplas [] = []
primeirosDuplas ((x,y):xys) = x:primeirosDuplas xys

somaDuplas [] = []
somaDuplas ((x,y):xys) = x+y:somaDuplas xys

menoresDuplas [] = []
menoresDuplas ((x,y):xys) | x < y = (x,y): menoresDuplas xys
                          | otherwise = menoresDuplas xys

separarDuplas :: Int -> [Int] -> ([Int], [Int])
separarDuplas _ [] = ([],[])
separarDuplas v (x:xs) | x <= v = (x:a,b)
                       | otherwise = (a,x:b)
                          where (a,b) = separarDuplas v xs
                          --(a,b) == (lista a, lista b)

mdc (a,b) | b == 0 = a
          | otherwise = mdc(b, mod a b)

inversoDupla [] = []
inversoDupla ((x,y):xys) = (y,x):inversoDupla xys

simetrico [] = []
simetrico ((x,y):xys) | x == y = True:simetrico xys
                      | otherwise = False:simetrico xys

pares i = [ (a ,b) | a <- [1..100] , b <- [1..100], a<(i+1), b<(i+1), a/=b ]

inverteDNA :: [Char] -> [Char]
inverteDNA [] = []
inverteDNA (x:xs) | x == 'A' = inverteDNA xs ++ ['T']
                  | x == 'T' = inverteDNA xs ++ ['A']
                  | x == 'C' = inverteDNA xs ++ ['G']
                  | x == 'G' = inverteDNA xs ++ ['C']

--trocoCafe :: Int -> Int -> [(a,b)]
--trocoCafe total pago | troco >= 50 = (50, 1 ): trocoCafe (total - 25) (pago - 25)
--                     | troco < 50 && troco >= 20 = (20, 1): trocoCafe (total - 10) (pago - 10)
--                     | troco < 20 && troco >= 10 = (10, 1): trocoCafe (total -5) (pago - 5)
--                     | troco < 10 && troco >= 5 = (5, 1): trocoCafe (total - 2) (pago - 2)
--                     | otherwise = []
--    where troco = pago - total

magica [] =[]
magica (x:xs) = (replicate (length (x:xs)) x ):magica xs

