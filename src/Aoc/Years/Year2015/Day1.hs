module Aoc.Years.Year2015.Day1 (
    Day1(..)
) where

import Aoc
import Data.List

data Day1 = Day1 | Parsed [Int]

instance Solution Day1 where
    day _ = (2015, 1)

    parse Day1 input = Parsed xs
       where xs = [x | y <- head . words $ head input, let x = if y == '(' then 1 else -1]
    parse _ _         = undefined

    part1 (Parsed xs) = [show . sum $ xs]
    part1 _           = undefined

    part2 (Parsed xs) = [show $ go 0 0 xs]
       where go   _ i    []  = i
             go acc i (y:ys) = if acc + y == -1 then i + 1 else go (acc + y) (i + 1) ys
    part2 _           = undefined
