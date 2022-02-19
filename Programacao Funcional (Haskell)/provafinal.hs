
-- 1
maioresMenores :: Ord a => [a] -> a -> ([a], [a])
maioresMenores [] _ = ([],[])
maioresMenores (x:xs) d | x < d = (x:a,b)
                        | x > d = (a,x:b)
                        | x == d = (a,b)
                            where (a,b) = maioresMenores xs d
-- 2
marcar :: [Char] -> Char -> [Char]
marcar [] _ = []
marcar (x:xs) c | x == c = ['*'] ++ marcar xs c
                | otherwise = [x] ++ marcar xs c
-- 3
inserir :: Ord a => a -> [a] -> [a]
inserir _ [] = []
inserir n (x:xs) | n > x = x:inserir n xs
                 | n < x = n:x:xs
-- 4
intercalacao :: Ord a => [a] -> [a] -> [a]
intercalacao xs [] = xs
intercalacao [] ys = ys
intercalacao (x:xs) (y:ys) | x<y = x:intercalacao xs (y:ys)
                           | otherwise = y:intercalacao ys (x:xs)
-- 5
contaPalavras :: (Num a) => [Char] -> a
count e (x:xs)= foldr (\x acc -> if e==x then acc+1 else acc ) 1 (x:xs)
contaPalavras (x:xs) = count ' ' (x:xs)

-- 6
data Arvore a = Galho a (Arvore a) (Arvore a) | Folha deriving Show
mapArv :: (a -> b) -> Arvore a -> Arvore b
mapArv func (Folha) = Folha
mapArv func (Galho e arv1 arv2) = Galho (func e) (mapArv func arv1)(mapArv func arv2)

