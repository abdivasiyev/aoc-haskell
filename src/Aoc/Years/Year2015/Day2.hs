module Aoc.Years.Year2015.Day2 (
    Solve(..)
) where

import Aoc
import Data.List.Extra (splitOn)
import Data.List (sort)

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
prism [l, w, h] = Prism (read l) (read w) (read h)
prism _ = error "invalid prism dimensions"

volume              :: Prism -> Int
volume (Prism l w h) = l * w * h

surfaceArea              :: Prism -> Int
surfaceArea (Prism l w h) = 2 * (l*w + w*h + h*l)

smallestArea              :: Prism -> Int
smallestArea (Prism l w h) = 
    let [a, b, _] = sort [l, w, h] in a * b

smallestPerimeter              :: Prism -> Int
smallestPerimeter (Prism l w h) =
    let [a, b, _] = sort [l, w, h] in 2 * (a+b)

