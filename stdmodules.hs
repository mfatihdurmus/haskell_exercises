import Data.List

intercalateTest :: String
intercalateTest = intercalate " - " ["d1", "d2", "d3"]


intersperseTest :: String
intersperseTest = intersperse '.' "MONKEY"


concatTest :: String
concatTest = concat ["Foo", "Bar", "Baz"]


iterateTest :: [Integer]
iterateTest = take 10 $ iterate (*2) 1

splitTest :: String
splitTest = b ++ a where (a,b) = splitAt 3 "foobar"


breakTest :: ([Integer], [Integer])
breakTest = break (==4) $ take 7 [1..10]

spanTest :: ([Integer], [Integer])
spanTest = span (/=4) $ take 7 [1..10]

-- isInfixOf -> contains
-- isPrefixOf -> startswith

findTest :: Maybe Integer
findTest = find (>4) [1..7]
-- returns just int or nothing


linesTest :: [String]
linesTest = lines "hello\nFatih\nTest"
-- unlines to reverse

