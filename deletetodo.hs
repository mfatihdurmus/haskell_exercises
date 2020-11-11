import System.IO (hPutStr, hGetContents, openTempFile,  hClose, openFile, IOMode(ReadMode) )
import System.Directory ( removeFile, renameFile )
import Data.List (delete)

main :: IO ()
main = do
    handle <- openFile "todo.txt" ReadMode
    (tempName, tempHandle) <- openTempFile "." "temp"

    content <- hGetContents handle
    let todoTasks = lines content
    let numberedTasks = zipWith (\n line -> show n ++ "-" ++ line) [0..] todoTasks

    putStrLn "TODO Items:"
    putStr $ unlines numberedTasks

    putStrLn "Please select task to delete:"
    numberStr <- getLine
    let number = read numberStr :: Int
    let newTodoItems = delete (todoTasks !! number) todoTasks

    hPutStr tempHandle $ unlines newTodoItems

    hClose tempHandle
    hClose handle
    removeFile "todo.txt"
    renameFile tempName "todo.txt"