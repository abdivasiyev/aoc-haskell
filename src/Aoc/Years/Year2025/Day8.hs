module Aoc.Years.Year2025.Day8
  ( Day8 (..),
  )
where

import Aoc

data Day8 = Day8 | Input String

instance Solution Day8 where
  day Day8 = (2025, 8)
  parse Day8 input = Input $ head input
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
