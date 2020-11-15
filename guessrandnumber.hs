import System.IO ()
import System.Random ( getStdGen, newStdGen, Random(randomR), StdGen )
import Control.Monad (unless)

main :: IO ()
main = do
    putStrLn "Can you guess the number?"
    
    g <- getStdGen
    let (randomNumber, _) = randomR (1, 10) g :: (Int, StdGen)
    
    numberString <- getLine
    unless (null numberString) $ do
        let number = read numberString
        if number == randomNumber 
            then putStrLn "Correct!"
            else putStrLn $ "Sorry, it was " ++ show randomNumber
        newStdGen
        main 