module Aoc.Years.Year2015.Day1 (
    Solve(..)
) where

import Aoc
import Data.List

data Solve = Solve | Parsed [Int]

instance Solution Solve where
    day _ = (2015, 1)

    parse Solve input = Parsed xs
       where xs = [x | y <- head . words $ input, let x = if y == '(' then 1 else -1]
    parse x _ = x

    part1 (Parsed xs) = [show . sum $ xs]
    part1 _ = ["unsolved"]

    part2 (Parsed xs) = [show $ go 0 0 xs]
       where go   _ i    []  = i
             go acc i (y:ys) = if acc + y == -1 then i + 1 else go (acc + y) (i + 1) ys
    part2 _ = ["unsolved"]
