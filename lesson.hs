-- learnyouahaskell.com execises

-- Basic Functions
doubleMe :: Num a => a -> a
doubleMe x = 2 * x

doubleUs :: Num a => a -> a -> a
doubleUs x y = x * 2 + y * 2

doubleSmallNumber :: (Ord a, Num a) => a -> a
doubleSmallNumber x = if x > 100
    then x
    else x* 2

-- Arrays
rightTriangles :: (Num c, Eq c, Enum c) => c -> [(c, c, c)]
rightTriangles h = [(a,b,c) | c <- [1..h], b <-[1..c], a <- [1..b], a^2 + b^2 == c^2]

factorial :: (Num a, Enum a) => a -> a
factorial n = product [1..n]

boomBangs :: (Integral a) => [a] -> [String]
boomBangs xs = [if x < 10 then "BOOM" else "BANG" | x <- xs, odd x]

arrLength :: Num a => [t] -> a
arrLength xs = sum [1 | _ <- xs]

-- Pattern Matching
lucky :: (Eq a, Num a) => a -> String
lucky 7 = "Lucky Number!"
lucky _ = "No luck mate."

recursiveFactorial :: (Eq p, Num p, Enum p) => p -> p
recursiveFactorial 0 = 1
recursiveFactorial n = n * factorial(n-1)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

head' :: [a] -> a
head' [] = error "Empty array"
head' (x:_) = x

recArrayLength :: Num p => [a] -> p
recArrayLength [] = 0
recArrayLength (_:xs) = 1 + recArrayLength xs

-- Guards
bmiTell :: (Ord a, Fractional a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "Underweight"
    | bmi <= 25.0 = "Normal"
    | otherwise = "Overweight"

bmiCalc :: Fractional a => a -> a -> a
bmiCalc weight height = weight / (height ^ 2)

-- Where
bmiTell' :: (Ord a, Fractional a) => a -> a -> String
bmiTell' weight height 
    | bmi <= underweight = "Underweight"
    | bmi <= normal = "Normal"
    | otherwise = "Overweight"
    where   bmi = weight / (height ^ 2)
            underweight = 18.5
            normal = 25

-- Where with tuples
bmiTellTuples :: (Ord a, Fractional a) => a -> a -> String
bmiTellTuples weight height 
    | bmi <= underweight = "Underweight"
    | bmi <= normal = "Normal"
    | otherwise = "Overweight"
    where   (bmi, underweight, normal) = (weight / (height ^ 2), 18.5, 25)

-- Pattern matching in where
initials :: [a] -> [a] -> [a]
initials firstname lastname = [f, l]
    where   (f:_) = firstname
            (l:_) = lastname

-- Define functions in where scope
calcMultipleBmi :: Fractional a => [(a, a)] -> [a]
calcMultipleBmi xs = [bmi w h | (w,h) <- xs]
    where bmi weight height = weight / (height ^ 2)

-- Let
cylinder :: Floating a => a -> a -> a
cylinder r h = 
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea

cylinder' :: Floating a => a -> a -> a
cylinder' r h = 
    sideArea + 2 * topArea
    where   sideArea = 2 * pi * r * h
            topArea = pi * r ^ 2

-- [let square x = x * x in (square 5, square 3, square 2)]

calcMultipleBmiLet :: Fractional a => [(a, a)] -> [a]
calcMultipleBmiLet xs = [bmi | (w,h) <- xs, let bmi = w / (h ^ 2)]

-- patter matching with case of 
describeList :: [a] -> String
describeList xs = "The list is " ++ what xs
    where what xs = case xs of  [] -> "Empty"
                                [_] -> "Singleton"
                                _ -> "List"

