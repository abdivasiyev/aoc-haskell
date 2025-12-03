module Aoc.Years.Year2025.Day6
  ( Day6 (..),
  )
where

import Aoc

data Day6 = Day6 | Input String

instance Solution Day6 where
  day Day6 = (2025, 6)
  day _ = undefined
  parse Day6 input = Input $ head input
  parse _ _ = undefined
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
