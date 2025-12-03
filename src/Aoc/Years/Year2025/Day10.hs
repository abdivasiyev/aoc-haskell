module Aoc.Years.Year2025.Day10
  ( Day10 (..),
  )
where

import Aoc

data Day10 = Day10 | Input String

instance Solution Day10 where
  day Day10 = (2025, 10)
  day _ = undefined
  parse Day10 input = Input $ head input
  parse _ _ = undefined
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
