import System.IO

main = do
    putStrLn "Add a task to your TO-DO list"
    hFlush stdout
    todoItem <- getLine
    appendFile "todo.txt" (todoItem ++ "\n")