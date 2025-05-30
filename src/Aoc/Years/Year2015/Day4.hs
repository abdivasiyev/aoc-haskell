module Aoc.Years.Year2015.Day4 (
    Day4(..)
) where

import Aoc

data Day4 = Day4 | Input String

instance Solution Day4 where
    day _ = (2015, 4)
    parse _ input = Input $ head input

    part1 (Input xs) = [show $ findNumber xs 5]
    part1 _ = undefined

    part2 (Input xs) = [show $ findNumber xs 6]
    part2 _ = undefined

findNumber :: String -> Int -> Int
findNumber xs n = head . take 1 $ dropWhile (\x -> (take n . md5sum $ xs <> show x) /= (take n $ cycle "0")) [1..]
