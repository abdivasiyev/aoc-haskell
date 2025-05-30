module Aoc.Years.YearExample.DayExample (
    Example(..)
) where
import Aoc

data Example = Example | ExampleInput String

instance Solution Example where
    day Example            = (1, 1)
    parse Example input    = ExampleInput $ head input
    part1 (ExampleInput _) = ["unsolved"]
    part1 _ = undefined
    part2 (ExampleInput _) = ["unsolved"]
    part2 _ = undefined
