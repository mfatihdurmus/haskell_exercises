

phoneBook :: [(String, String)]
phoneBook =   
    [("betty","555-2938")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ]  


--without lambda
findKey :: Eq a => a -> [(a, c)] -> c
findKey key xs = snd . head . filter p $ xs
    where p x = (fst x) == key

--with lambda
findKey' :: Eq a => a -> [(a, c)] -> c
findKey' key xs = snd . head . filter (\x -> (fst x) == key) $ xs

--with matching
findkeym :: Eq t => t -> [(t, a)] -> Maybe a
findkeym _key [] = Nothing
findkeym key ((k,v):xs) 
    | key == k  = Just v
    | otherwise = findkeym key xs

--with foldr
findKeyf :: (Foldable t, Eq a1) => a1 -> t (a1, a2) -> Maybe a2
findKeyf key x = foldr (\(k,v) acc -> if k == key then Just v else acc) Nothing x 

-- lookup "patsy" phoneBook

