module Main where

import Aoc
import Aoc.Years.Year2015.Day1 qualified as Year2015Day1
import Aoc.Years.Year2015.Day2 qualified as Year2015Day2
import Aoc.Years.Year2015.Day3 qualified as Year2015Day3
import Aoc.Years.Year2015.Day4 qualified as Year2015Day4
import Aoc.Years.Year2025.Day1 qualified as Year2025Day1
import Aoc.Years.Year2025.Day2 qualified as Year2025Day2
import Aoc.Years.YearExample.DayExample qualified as YearExampleDayExample

main :: IO ()
main = do
  let runner =
        Runner
          Last
          [ AnySolution YearExampleDayExample.Example,
            AnySolution Year2015Day1.Day1,
            AnySolution Year2015Day2.Day2,
            AnySolution Year2015Day3.Day3,
            AnySolution Year2015Day4.Day4,
            AnySolution Year2025Day1.Day1,
            AnySolution Year2025Day2.Day2
          ]

  run runner
