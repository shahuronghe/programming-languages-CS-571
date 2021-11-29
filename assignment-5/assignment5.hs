replace :: Eq t => t -> t -> [t] -> [t]
replace _ _ [] = []
replace x y (h:t) | x == h = y : tl | otherwise = h : tl
    where tl = replace x y t


delete :: Int -> [Int] -> [Int]
delete k [] = []
delete k xs = take (k-1) xs ++ delete k (drop k xs)

maxodd :: [Int] -> Int
maxodd [x] = x
maxodd [x,y] = x
maxodd (x:y:xs)
    | x < (maxodd xs) = maxodd xs
    | otherwise = x



union :: [Int] -> [Int] -> [Int]
union [] [] = []
union (x:xs) (y:ys)
  | (elem x xs || elem x ys) && (elem y xs || elem y ys) = union xs ys
  | (elem x xs || elem x ys) && not(elem y xs || elem y ys) = y:union xs ys
  | not(elem x xs || elem x ys) && (elem y xs || elem y ys) = x:union xs ys
  | x==y = x:union xs ys
  | otherwise = x:y:union xs ys
