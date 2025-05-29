module Aoc.Years.Year2015.Day2 (
    Solve(..)
) where

import Aoc
import Data.List.Extra (splitOn)
import Data.List (minimum, sort)

data Solve = Solve | Input [Prism]

instance Solution Solve where
    day _ = (2015, 2)

    parse Solve input = Input . map prism . map (splitOn "x") . lines $ input 
    parse _ _ = error "incorrect case"

    part1 (Input xs) = [show . sum . map (\x -> surfaceArea x + smallestArea x) $ xs]
    part1 _ = ["unsolved"]

    part2 (Input xs) = [show . sum . map (\x -> volume x + smallestPerimeter x) $ xs]
    part2 _ = ["unsolved"]

data Prism = Prism Int Int Int

prism :: [String] -> Prism
prism xs = Prism (read (xs !! 0) :: Int) (read (xs !! 1) :: Int) (read (xs !! 2) :: Int)

volume              :: Prism -> Int
volume (Prism l w h) = l * w * h

surfaceArea              :: Prism -> Int
surfaceArea (Prism l w h) = 2 * (l*w + w*h + h*l)

smallestArea              :: Prism -> Int
smallestArea (Prism l w h) = xs !! 0 * xs !! 1 
    where xs = sort [l, w, h]

smallestPerimeter              :: Prism -> Int
smallestPerimeter (Prism l w h) = 2 * (xs !! 0 + xs !! 1)
    where xs = sort [l, w, h]

