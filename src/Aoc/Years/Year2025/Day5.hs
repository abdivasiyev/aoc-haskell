module Aoc.Years.Year2025.Day5
  ( Day5 (..),
  )
where

import Aoc

data Day5 = Day5 | Input String

instance Solution Day5 where
  day Day5 = (2025, 5)
  parse Day5 input = Input $ head input
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
