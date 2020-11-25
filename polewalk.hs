type Birds = Int  
type Pole = (Birds,Birds) 

landLeft :: Birds -> Pole -> Maybe Pole  
landLeft n (left,right)  
    | abs ((left + n) - right) < 4 = Just (left + n, right)  
    | otherwise                    = Nothing  
  
landRight :: Birds -> Pole -> Maybe Pole  
landRight n (left,right)  
    | abs (left - (right + n)) < 4 = Just (left, right + n)  
    | otherwise                    = Nothing  


routineDo :: Maybe Pole  
routineDo = do  
    let start = (0, 0)  
    first <- landLeft 2 start
    second <- landRight 2 first
    landLeft 1 second

routine :: Maybe Pole
routine = landLeft 2 (0, 0) >> Nothing >>= landRight 2 >>= landLeft 1