module Aoc.Years.Year2025.Day7
  ( Day7 (..),
  )
where

import Aoc

data Day7 = Day7 | Input String

instance Solution Day7 where
  day Day7 = (2025, 7)
  parse Day7 input = Input $ head input
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
