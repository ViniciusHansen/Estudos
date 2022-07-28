module Lista1 where

ehTriangulo a b c =
    if a >= b+c || b >= c+a || c >= a+b then False
    else True

tipoTriangulo a b c =
    if a == b && b == c then "equilatero"
    else if a == b || c == b || a == c then "isosceles"
    else "escaleno"

triangulo a b c =
    if ehTriangulo a b c == False then "nao eh um triangulo" else tipoTriangulo a b c

somaPares 0 = 0
somaPares n =
    if mod n 2 == 0 then n + somaPares (n - 1)
    else somaPares (n - 1)    

somaPot2m m 0 = m
somaPot2m m n =
    2 ^ n * m + somaPot2m m (n - 1)

primo 2 = True
primo 3 = True
primo x =
    if x < 1 then False
    else if mod x 2 == 0 || mod x 3 == 0 || mod x 5 == 0 then False
    else True

seriePI :: (RealFrac a) => a -> a
seriePI 0 = 0
seriePI n =
    if mod (round n) 2 == 0 then (-4) / (2 * n - 1) + seriePI (n - 1) else 4 / (2 * n - 1) + seriePI (n - 1)




