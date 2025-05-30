module Aoc.Years.Year2015.Day2 (
    Day2(..)
) where

import Aoc
import Data.List.Extra (splitOn)
import Data.List (sort)

data Day2 = Day2 | Input [Prism]

instance Solution Day2 where
    day _ = (2015, 2)

    parse Day2 input = Input . map prism . map (splitOn "x") $ input 
    parse _ _         = undefined

    part1 (Input xs) = [show . sum . map (\x -> surfaceArea x + smallestArea x) $ xs]
    part1 _          = undefined

    part2 (Input xs) = [show . sum . map (\x -> volume x + smallestPerimeter x) $ xs]
    part2 _          = undefined

data Prism = Prism Int Int Int

prism :: [String] -> Prism
prism [l, w, h] = Prism (read l) (read w) (read h)
prism _         = undefined 

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

