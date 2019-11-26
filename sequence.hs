-- f :: Int -> Int
f 0 = 1
f a = a - (m (f (a - 1)))

-- m :: Int -> Int
m 0 = 0
m a = a - (f (m (a - 1)))

-- fan kicks on
main :: IO ()
main = do
  putStrLn . show $ m 250
