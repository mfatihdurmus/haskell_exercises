
multThree :: Num a => a -> a -> a -> a
multThree x y z = x * y * z

multTwoWithNine :: Integer -> Integer -> Integer
multTwoWithNine = multThree 9

multWithEighteen :: Integer -> Integer
multWithEighteen = multTwoWithNine 2

divideByTen :: Double -> Double
divideByTen = (/10)
-- divideByTen x = (/10) x

tenDividedBy :: Double -> Double
tenDividedBy = (10/)
-- tenDividedBy x = 10/x

isUpperAlphaNum :: Char -> Bool
isUpperAlphaNum x = elem x ['A'..'Z']

isUpperAlphaNum' :: Char -> Bool
isUpperAlphaNum' = (`elem` ['A'..'Z'])

-- Higher order functions
applyTwice :: (t -> t) -> t -> t
applyTwice f x = f (f x)

-- applyTwice (+3) 4
-- applyTwice divideByTen 400


zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ _ [] = []
zipWith' _ [] _ = []
zipWith'  f (x:xs) (y:ys) = (f x y):zipWith' f xs ys

-- zipWith' max [534,232,454] [654,34,200]

flip' :: (t1 -> t2 -> t3) -> t2 -> t1 -> t3
flip' f x y = f y x

-- flip' zip [1,2,3,4] "Test"

-- Map Takes a function and applies to every element
map' :: (t -> a) -> [t] -> [a]
map' _ [] = []
map' f (x:xs) = f x:map f xs

-- map' (divideByTen) [1..200]

-- Filter list by f function
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)    
    | f x       = x : filter' f xs 
    | otherwise = filter' f xs 

-- filter' (>3) [1..10]

-- Quicksort implemented with filter
quicksortFilter :: Ord a => [a] -> [a]
quicksortFilter [] = []
quicksortFilter (x:xs) = quicksortFilter(filter (<=x) xs) ++ [x] ++ quicksortFilter(filter (>x) xs)

largestDivisibleWith35 :: Integer
largestDivisibleWith35 = head (filter p [1000, 999..]) 
    where p x = mod x 35 == 0

-- Collatz sequence
collatz :: Integral a => a -> [a]
collatz 1 = [1]
collatz n
    | even n = n:collatz (div n 2)
    | odd n = n:collatz (3*n + 1)

--collatz 7
--[7,22,11,34,17,52,26,13,40,20,10,5,16,8,4,2,1]

numLongChains :: Int
numLongChains = length (filter isLong (map collatz [1..100]))
    where isLong xs = length xs > 15 

--numLongChains
--66

--Lambdas
numLongChains2 :: Int
numLongChains2 = length (filter (\xs -> length xs > 15) (map collatz [1..100]))

--map (\a -> (head a, length a)) (map collatz [1..100])