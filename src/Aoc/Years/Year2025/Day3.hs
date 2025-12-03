module Aoc.Years.Year2025.Day3
  ( Day3 (..),
  )
where

import Aoc

data Day3 = Day3 | Input String

instance Solution Day3 where
  day Day3 = (2025, 3)
  parse Day3 input = Input $ head input
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
