fib :: (Eq t1, Num t1, Num t2) => t1 -> t1 -> t2 -> t2 -> t2
fib n m a b
    | n == m = a
    | otherwise = fib n (m + 1) b (a + b)

fibonacci :: (Eq t1, Num t1, Num t2) => t1 -> t2
fibonacci n = fib n 0 0 1

main :: IO ()
main = print [fibonacci n | n <- [0..19]]

