

type PhoneNumber = String  
type Name = String  
type PhoneBook = [(Name,PhoneNumber)]  
phoneBook :: PhoneBook
phoneBook =   
    [("betty","555-2938")  
    ,("bonnie","452-2928")  
    ,("patsy","493-2928")  
    ,("lucille","205-2928")  
    ,("wendy","939-8282")  
    ,("penny","853-2492")  
    ]  


--without lambda
findKey :: Name -> PhoneBook -> PhoneNumber
findKey key = snd . head . filter p
    where p x = fst x == key

--with lambda
findKey' :: Name -> PhoneBook -> PhoneNumber
findKey' key = snd . head . filter (\ x -> fst x == key)

--with matching
findkeym :: Name -> PhoneBook -> Maybe PhoneNumber
findkeym _key [] = Nothing
findkeym key ((k,v):xs) 
    | key == k  = Just v
    | otherwise = findkeym key xs

--with foldr
findKeyf :: Name -> PhoneBook -> Maybe PhoneNumber
findKeyf key = foldr (\(k,v) acc -> if k == key then Just v else acc) Nothing

-- lookup "patsy" phoneBook

inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool  
inPhoneBook name number pbook = (name, number) `elem` pbook

-- findKeyf "betty" phoneBook