module Aoc.Years.Year2025.Day12
  ( Day12 (..),
  )
where

import Aoc

data Day12 = Day12 | Input String

instance Solution Day12 where
  day Day12 = (2025, 12)
  parse Day12 input = Input $ head input
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
