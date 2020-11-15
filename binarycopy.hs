import System.Environment ( getArgs )
import qualified Data.ByteString.Lazy as B
import Control.Exception ( catch )
import System.IO.Error ( isDoesNotExistError, isUserError)

main :: IO ()
main = catch toTry errorHandler

toTry :: IO ()
toTry = do
    (file1 : file2 : _) <- getArgs
    copyFile file1 file2

copyFile :: FilePath -> FilePath -> IO ()
copyFile source dest = do
    contents <- B.readFile source
    B.writeFile dest contents


errorHandler :: IOError -> IO ()
errorHandler e 
    | isDoesNotExistError e = putStrLn "IO Error"
    | isUserError e = putStrLn "Missing arg parameters"
    | otherwise = ioError e