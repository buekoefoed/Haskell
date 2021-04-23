import Control.Exception
import Control.Monad
import Data.Char
import Data.List
import System.Directory
import System.Environment
import System.IO

main = do
    putStrLn "Enter filename:"
    hFlush stdout
    file <- getLine
    contents <- readFile file
    writeFile ("output-" ++ file) $ map toUpper contents
    appendFile "log.txt" ("\n" ++ file)
    contents <- readFile "log.txt"
    let logEvents = lines contents
        numberedEvents = zipWith (\n line -> show n ++ " - " ++ line)
            [0..] logEvents
    putStrLn "Log events:"
    mapM_ putStrLn numberedEvents

{-
main = do
    putStrLn "Enter filename:"
    hFlush stdout
    file <- getLine
    withFile file ReadMode (\handle -> do
        contents <- hGetContents handle
        putStrLn $ map toUpper contents)
-}

{-
main = do
    putStrLn "Enter filename:"
    hFlush stdout
    file <- getLine
    handle <- openFile file ReadMode
    contents <- hGetContents handle
    putStr $ map toUpper contents
    hClose handle
-}

{-
main = do
    putStrLn "Hello, what's your first name?"
    hFlush stdout
    firstName <- getLine
    putStrLn "What's your last name?"
    hFlush stdout
    lastName <- getLine
    let upperName = map toUpper (firstName ++ " " ++ lastName)
    putStrLn ("welcome " ++ upperName)
-}