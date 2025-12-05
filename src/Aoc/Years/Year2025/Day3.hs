module Aoc.Years.Year2025.Day3
  ( Day3 (..),
  )
where

import Aoc
import Data.Char (digitToInt)

newtype Rating = Rating Int deriving (Show)

newtype Bank = Bank [[Rating]]

data Day3 = Day3 | Input Bank

instance Solution Day3 where
  day Day3 = (2025, 3)
  day _ = undefined
  parse Day3 input = Input . Bank $ map parseLine input
    where
      parseLine :: String -> [Rating]
      parseLine [] = []
      parseLine (x : xs) = Rating (digitToInt x) : parseLine xs
  parse _ _ = undefined
  part1 (Input (Bank xs)) = [show $ sum . map go $ xs]
    where
      go :: [Rating] -> Int
      go ratings =
        maximum
          [ z
          | i <- [0 .. length ratings - 2],
            let Rating x = ratings !! i,
            j <- [i + 1 .. length ratings - 1],
            let Rating y = ratings !! j,
            let z = x * 10 + y
          ]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
