module Aoc.Years.Year2025.Day4
  ( Day4 (..),
  )
where

import Aoc

data Day4 = Day4 | Input String

instance Solution Day4 where
  day Day4 = (2025, 4)
  parse Day4 input = Input $ head input
  part1 (Input _) = ["unsolved"]
  part1 _ = undefined
  part2 (Input _) = ["unsolved"]
  part2 _ = undefined
