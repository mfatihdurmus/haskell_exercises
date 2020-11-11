import System.IO
    ( hClose, openFile, hGetContents, IOMode(ReadMode) )
import Data.Char (isSpace)


main :: IO ()
main = do  
    handle <- openFile "palindromes.txt" ReadMode  
    contents <- hGetContents handle
    putStr $ unlines $ map (\s -> s ++ "\t\t" ++ isPalindrome (strip s)) (lines contents)
    hClose handle  


isPalindrome :: String -> String
isPalindrome word = if word == reverse word 
    then "Palindrome"
    else "Not a palindrome"

strip :: String -> String
strip [] = []
strip (x:xs) | isSpace x =  strip xs
    | otherwise = x : strip xs