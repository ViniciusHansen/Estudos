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
                  | n > length (x:xs) = (x:xs)
                  | otherwise = nUltimos n xs

enesimo :: Int -> [Int] -> Int
enesimo 0 _ = -1
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
insereElem _ [] = []
insereElem n (x:xs) | pertence n (x:xs) == True = (x:xs)
                    | n > last (x:xs) = (x:xs) ++ [n]
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

trocoCafe :: Int -> Int -> [(Int, Int)]
trocoCafe v p = troco (p - v) [50,20,10,5]

troco :: Int -> [Int] -> [(Int, Int)]
troco _ [] = []
troco v (x:xs) | div v x > 0 = (x, div v x):troco (rem v x) xs
               | otherwise = troco v xs


magica :: [Char] -> [Char]
magica (x:xs) = concat (magica1 (x:xs) ++ tail (magica2 (x:xs)))
magica1 [] =[]
magica1 (x:xs) = (replicate (length (x:xs)) x ):magica1 xs
magica2 [] =[]
magica2 (x:xs) = inversoLista (magica1 (x:xs))



