import System.Environment ( getArgs )

-- runhaskell solveRPN.hs "10 4 3 + 2 * -"

main :: IO ()
main = do
    (expression:_) <- getArgs
    print (solveRPN expression)

solveRPN :: String -> Float
solveRPN e = head . foldl foldingFunction [] $ words e
    where   foldingFunction (x:y:ys) "*" = (x * y):ys
            foldingFunction (x:y:ys) "+" = (x + y):ys  
            foldingFunction (x:y:ys) "-" = (y - x):ys
            foldingFunction (x:y:ys) "/" = (y / x):ys
            foldingFunction xs numberString = read numberString:xs  