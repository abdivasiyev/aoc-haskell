module Aoc.Years.Year2025.Day1
  ( Day1 (..),
  )
where

import Aoc
import Data.Bool (bool)

type Distance = Int

start :: Distance
start = 50

len :: Distance
len = 100

data Day1 = Day1 | Input [Distance]

instance Solution Day1 where
  day _ = (2025, 1)
  parse Day1 input = Input $ map parseLine input
    where
      parseLine [] = error "empty line provided"
      parseLine (x : xs) = case x of
        'L' -> -(read xs :: Distance)
        'R' -> read xs :: Distance
        _ -> error "incorrect direction on input line"
  parse _ _ = undefined

  part1 (Input rotations) = [show $ go rotations start (0 :: Int)]
    where
      go [] _ touches = touches
      go (x : xs) dist touches = go xs ((x + dist) `mod` 100) (touches + bool 0 1 (dist == 0))
  part1 _ = undefined

  part2 (Input rotations) = [show $ go rotations start (0 :: Int)]
    where
      go [] _ crosses = crosses
      go (x : xs) dist crosses = go xs ((x + dist) `mod` len) (crosses + crosses')
        where
          crosses' = abs (x + dist) `div` len + bool 0 1 (dist > 0 && x + dist < 0) + bool 0 1 (dist + x == 0)
  part2 _ = undefined
