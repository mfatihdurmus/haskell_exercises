import Data.Char ( toUpper )
import Data.List ( intersperse )

main :: IO ()
main = do
    putStr "Enter a word to reverse:"
    line <- intersperse '-' . reverse . map toUpper <$> getLine
    putStrLn $ "Reversed line:" ++ line
    return ()