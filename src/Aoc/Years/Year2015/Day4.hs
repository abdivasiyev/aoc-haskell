module Aoc.Years.Year2015.Day4 (
    Day4(..)
) where

import Aoc

data Day4 = Day4 | Input String

instance Solution Day4 where
    day _ = (2015, 4)
    parse _ input = Input input
    part1 (Input xs) = [show $ findNumber (head . lines $ xs) 5]
    part2 (Input xs) = [show $ findNumber (head . lines $ xs) 6]

findNumber :: String -> Int -> Int
findNumber xs n = head . take 1 $ dropWhile (\x -> (take n . md5sum $ xs <> show x) /= (take n $ cycle "0")) [1..]
