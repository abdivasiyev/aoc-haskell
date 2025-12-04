module Aoc.Years.Year2025.Day2
  ( Day2 (..),
  )
where

import Aoc
import Data.List.Extra (splitOn)

type ID = Integer

data Range = Range {start :: ID, end :: ID} deriving (Show, Eq)

solve :: (ID -> Bool) -> [Range] -> ID
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
    where
      doubled :: ID -> Bool
      doubled x = even len && take (len `div` 2) x' == drop (len `div` 2) x'
        where
          x' = show x
          len = length x'
  part1 _ = undefined
  part2 (Input xs) = [show . solve repeated $ xs]
    where
      repeated :: ID -> Bool
      repeated x = or [allEqual . splitN y $ x' | y <- [1 .. len `div` 2]]
        where
          x' :: String
          x' = show x

          len :: Int
          len = length x'

          splitN :: Int -> String -> [String]
          splitN _ [] = []
          splitN n s = take n s : splitN n (drop n s)

          allEqual :: (Ord a) => [a] -> Bool
          allEqual [] = True
          allEqual (y : ys) = all (== y) ys
  part2 _ = undefined
