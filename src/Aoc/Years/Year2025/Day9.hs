module Aoc.Years.Year2025.Day9
  ( Day9 (..),
  )
where

import Aoc

data Day9 = Day9 | Input String

instance Solution Day9 where
  day Day9 = (2025, 9)
  day _ = undefined
  parse Day9 input = Input $ head input
  parse _ _ = undefined
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
