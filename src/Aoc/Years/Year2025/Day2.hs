module Aoc.Years.Year2025.Day2
  ( Day2 (..),
  )
where

import Aoc

data Day2 = Day2 | Input String

instance Solution Day2 where
  day Day2 = (2025, 2)
  parse Day2 input = Input $ head input
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
