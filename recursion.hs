maximum' :: Ord a => [a] -> a
maximum' [] = error "Empty List"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)


replicate' :: (Ord t, Num t) => t -> a -> [a]
replicate' n x
    | n <= 0    = []
    | otherwise = x : replicate' (n - 1) x


take' :: (Ord t, Num t, Eq a) => t -> [a] -> [a]
take' n _ | n <= 0  = []
take' _ []          = []
take' n (x:xs)      = x : take' (n - 1) xs 


reverse' :: [a] -> [a]
reverse' []     = []
reverse' (x:xs) = reverse' xs ++ [x]


repeat' :: t -> [t]
repeat' x = x:repeat' x


zip' :: [a] -> [b] -> [(a, b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys


elem' :: Eq t => t -> [t] -> Bool
elem' _ [] = False
elem' x (y:ys) 
    | x == y        = True
    | otherwise     = elem' x ys


quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = smaller ++ [x] ++ bigger
    where   smaller = quicksort [a | a <- xs, a <= x]
            bigger = quicksort[a | a <-xs, a > x]
