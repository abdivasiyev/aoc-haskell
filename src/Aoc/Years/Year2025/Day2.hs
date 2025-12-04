module Aoc.Years.Year2025.Day2
  ( Day2 (..),
  )
where

import Aoc
import Data.List.Extra (splitOn)

data Range = Range {start :: Integer, end :: Integer} deriving (Show, Eq)

doubled :: Integer -> Bool
doubled x = even len && take (len `div` 2) x' == drop (len `div` 2) x'
  where
    x' = show x
    len = length x'

repeated :: Integer -> Bool
repeated x = or [allEqual . splitN y $ x' | y <- [1 .. len `div` 2]]
  where
    x' = show x
    len = length x'
    splitN _ [] = []
    splitN n s = take n s : splitN n (drop n s)

    allEqual [] = True
    allEqual (y : ys) = all (== y) ys

solve :: (Integer -> Bool) -> [Range] -> Integer
solve p = sum . concatMap (\r -> [x | x <- [(start r) .. (end r)], p x])

data Day2 = Day2 | Input [Range]

instance Solution Day2 where
  day Day2 = (2025, 2)
  day _ = undefined
  parse Day2 input = Input $ map list2Range $ fmap (splitOn "-") $ splitOn "," $ head input
    where
      list2Range :: [String] -> Range
      list2Range [x, y] = Range {start = read x, end = read y}
      list2Range _ = error "wrong number of items on the range"
  parse _ _ = undefined
  part1 (Input xs) = [show . solve doubled $ xs]
  part1 _ = undefined
  part2 (Input xs) = [show . solve repeated $ xs]
  part2 _ = undefined
