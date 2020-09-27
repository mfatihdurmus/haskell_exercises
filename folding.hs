sumfold :: (Foldable t, Num a) => t a -> a
sumfold xs = foldl (\acc x -> acc + x) 0 xs

sumfold' :: (Foldable t, Num a) => t a -> a
sumfold' = foldl (+) 0

-- >>> sumfold' [1,4,2,5]

mapfold :: Foldable t1 => (t2 -> a) -> t1 t2 -> [a]
mapfold f xs = foldr (\x acc -> f x : acc) [] xs


maxfold :: (Foldable t, Ord a, Num a) => t a -> a
maxfold xs = foldl (\x acc -> if acc > x then acc else x) 0 xs

reversefold :: Foldable t => t a -> [a]
reversefold xs = foldl (\x acc -> acc : x) [] xs


productfold :: (Foldable t, Num b) => t b -> b
productfold xs = foldl (*) 1 xs

-- accumulator status
productscan :: Num b => [b] -> [b]
productscan xs = scanl (*) 1 xs


sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1 


sumApplyCompose :: Integer
sumApplyCompose = sum . replicate 5 . max 6 $ 7

fncompose :: Double -> Integer
fncompose = ceiling . negate . tan . cos . max 50

 
oddSquareSum :: Integer  
oddSquareSum = sum . takeWhile (<10000) . filter odd . map (^2) $ [1..]  