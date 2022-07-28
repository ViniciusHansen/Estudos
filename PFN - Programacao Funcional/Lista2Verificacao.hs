import Lista2

-- 1
pertenceTest = 
  [pertence 3 [1, 4, 3, 2], 
  pertence 10 [1, 4, 3, 2] == False]

-- 2
intercessaoTest = 
  [intercessao [1, 3, 5, 7, 9] [2, 5, 3, 6, 9] == [3, 5, 9], 
  intercessao [1, 2] [4,5] == []]

-- 3
inversoListaTest = 
  [inversoLista [1, 2, 3, 4] == [4, 3, 2, 1], 
  inversoLista [20..30] == reverse [20..30]]

-- 4
nUltimosTest = 
  [nUltimos 3 [1, 2, 3, 4, 5, 6] == [4, 5, 6],
  nUltimos 3 [1, 2] == [1,2],
  nUltimos 0 [1, 2, 3, 4, 5, 6] == []]

-- 5
enesimoTest = 
  [enesimo 3 [10, 20, 30, 40, 50] == 30,
  enesimo 0 [1..10] == -1,
  enesimo 10 [10, 20, 30, 40, 50] == -1,
  enesimo 10 [1..10] == 10,
  enesimo 1 [1..10] == 1]

-- 6
repetirTest = 
  [repetir 4 10 == [10, 10, 10, 10],
  repetir 0 10 == [],
  repetir 100 1 == take 100 (repeat 1)]

-- 7
intercalacaoTest = 
  [intercalacao [10, 15, 17, 20] [1, 2, 13, 15, 22] == [1, 2, 10, 13, 15, 15, 17, 20, 22],
  intercalacao [1..10] [11..20] == [1..20],
  intercalacao [11..20] [1..10] == [1..20]]

-- 8
menorTest = 
  [menor [10, 4, 5, 3, 12] == 3,
  menor [1..10] == 1,
  menor (take 10 (repeat 1)) == 1]

-- 9
removerElemTest = 
  [removerElem 1 [2, 4, 1, 3, 2, 1] == [2, 4, 3, 2, 1],
  removerElem 10 [1..9] == [1..9],
  removerElem 9 [1..9] == [1..8],
  removerElem 1 [1..9] == [2..9]]

-- 10
ordenarListaTest = 
  [ordenarLista [32, 10, 23, 10, 12, 4] == [4, 10, 10, 12, 23, 32],
  ordenarLista [10,9..1] == [1..10]]

-- 11
insereElemTest = [insereElem 12 [6, 9, 10, 15, 20] == [6,9,10,12,15,20],
  insereElem 15 [6, 9, 10, 15, 20] == [6,9,10,15,20],
  insereElem 5 [6, 9, 10, 15, 20] == [5,6,9,10,15,20],
  insereElem 21 [6, 9, 10, 15, 20] == [6,9,10,15,20,21]]

-- 12
primeirosDuplasTest = 
  [primeirosDuplas [("a", 34), ("b", 80), ("c", 180)] == ["a","b","c"],
  primeirosDuplas (zip ['a'..'z'] [1..15]) == take 15 ['a'..'z']]

-- 13
somaDuplasTest = 
  [somaDuplas [(1,2), (3,4), (10, 23)] == [3, 7, 33],
  somaDuplas (zip [1..10] [1..10]) == [2*x | x <- [1..10]]]

-- 14
menoresDuplasTest = 
  [menoresDuplas [(1, 3), (5, 3), (8, 10), (3, 3)] == [(1, 3), (8, 10)],
  menoresDuplas [(2,1)] == []]

-- 15
separarDuplasTest = 
  [separarDuplas 9 [10, 3, 5, 17, 12, 4, 9 ] == ([3, 5, 4, 9], [10, 17, 12]),
  separarDuplas 0 [1..10] == ([],[1..10]),
  separarDuplas 11 [1..10] == ([1..10],[]),
  separarDuplas 9 [1..10] == ([1..9],[10])]

-- 16
mdcTest = 
  [mdc(120,23) == 1,
  mdc(10,20) == 10,
  mdc(7,14) == 7]

-- 17
inversoDuplaTest = 
  [inversoDupla [(1,2),(6,1),(4,11)] == [(2,1),(1,6),(11,4)],
  inversoDupla (zip [1..10] ['a'..'z']) == zip ['a'..'z'] [1..10]]

-- 18
simetricoTest = 
  [simetrico [(1,2),(4,4),(3,2)] == [False,True,False],
  simetrico (zip [1..10] [1..10]) == take 10 (repeat True)]

-- 19
paresTest = 
  [pares 3 == [(1, 2),(1, 3),(2, 1),(2, 3),(3, 1),(3, 2)],
  pares 0 == [],
  pares 10 == [(1,2),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(2,1),(2,3),(2,4),(2,5),(2,6),(2,7),(2,8),(2,9),(2,10),(3,1),(3,2),(3,4),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(4,1),(4,2),(4,3),(4,5),(4,6),(4,7),(4,8),(4,9),(4,10),(5,1),(5,2),(5,3),(5,4),(5,6),(5,7),(5,8),(5,9),(5,10),(6,1),(6,2),(6,3),(6,4),(6,5),(6,7),(6,8),(6,9),(6,10),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,8),(7,9),(7,10),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,9),(8,10),(9,1),(9,2),(9,3),(9,4),(9,5),(9,6),(9,7),(9,8),(9,10),(10,1),(10,2),(10,3),(10,4),(10,5),(10,6),(10,7),(10,8),(10,9)]]

-- 20
inverteDNATest = 
  [inverteDNA "TAGCCGTGCA" == "TGCACGGCTA",
  inverteDNA "ATCG" == "CGAT"]

-- 21
trocoCafeTest = 
  [trocoCafe 65 110 == [(20,2),(5,1)],
  trocoCafe 30 128 == [(50,1),(20,2),(5,1)],
  trocoCafe 100 500 == [(50,8)]]

-- 22
magicaTest = [magica "AB" == "AABAA", 
  magica "ABC" == "AAABBCBBAAA", 
  magica "abC" == "aaabbCbbaaa", 
  magica "ABCD" == "AAAABBBCCDCCBBBAAAA"]
  
ex = zip [1..] $ map (foldr (&&) True) 
 [
   pertenceTest,
   intercessaoTest,
   inversoListaTest,
   nUltimosTest,
   enesimoTest,
   repetirTest,
   intercalacaoTest,
   menorTest,
   removerElemTest,
   ordenarListaTest,
   insereElemTest,
   primeirosDuplasTest,
   somaDuplasTest,
   menoresDuplasTest,
   separarDuplasTest,
   mdcTest,
   inversoDuplaTest,
   simetricoTest,
   paresTest,
   inverteDNATest,
   trocoCafeTest,
   magicaTest
 ]
  
verifica [] = putStrLn ""
verifica ((n, t): nts) = do putStrLn ("Exercicio " ++ show n ++
                                        if t then " Ok" else " Falhou")
                            verifica nts                                        
      
main = verifica ex 