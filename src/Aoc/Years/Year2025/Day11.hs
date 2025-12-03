module Aoc.Years.Year2025.Day11
  ( Day11 (..),
  )
where

import Aoc

data Day11 = Day11 | Input String

instance Solution Day11 where
  day Day11 = (2025, 11)
  parse Day11 input = Input $ head input
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
