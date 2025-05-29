module Main where

import Aoc
import qualified Aoc.Years.YearExample.DayExample as YearExampleDayExample
import qualified Aoc.Years.Year2015.Day1          as Year2015Day1
import qualified Aoc.Years.Year2015.Day2          as Year2015Day2
import qualified Aoc.Years.Year2015.Day3          as Year2015Day3


main :: IO ()
main = do
    let runner = Runner Last [
                    AnySolution YearExampleDayExample.Example,
                    AnySolution Year2015Day1.Day1,
                    AnySolution Year2015Day2.Day2,
                    AnySolution Year2015Day3.Day3
                ]

    run runner
