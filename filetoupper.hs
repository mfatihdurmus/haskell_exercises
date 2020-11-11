import Control.Monad ( forever )  
import Data.Char ( toUpper )  
  
main :: IO ()
main = forever $ do  
    putStr "Give me some input: "  
    l <- getLine  
    putStrLn $ map toUpper l