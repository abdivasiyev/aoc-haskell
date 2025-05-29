{-# Language ExistentialQuantification #-}

module Aoc (
     Year
   , Day
   , Solution(..)
   , AnySolution(..)
   , RunnerMode(..)
   , Runner(..)
   , run
   , splitByPosition
) where

import Text.Printf
import Data.List
import Control.Monad

type Year = Int
type Day  = Int

class Solution a where
    day   :: a      -> (Year, Day)
    parse :: a      -> String      -> a
    part1 :: a      -> [String]
    part2 :: a      -> [String]

data AnySolution = forall s. Solution s => AnySolution s

data RunnerMode = All | Last | Single (Year, Day)

data Runner = Runner {mode :: RunnerMode, solutions :: [AnySolution]}

solve :: AnySolution -> IO ()
solve (AnySolution s) = do
    let (y, d) = day s
    let inputPath = intercalate "_" [printf "%04d" y, printf "%02d" d] <> ".txt"
    input <- readFile inputPath
    let s' = parse s input
    let p1 = part1 s'
    let p2 = part2 s'

    putStrLn $ "Year " <> show y <> ", Day " <> show d
    putStrLn $ "Part 1: " <> intercalate ", " p1
    putStrLn $ "Part 2: " <> intercalate ", " p2

dayMatches :: Year -> Day -> AnySolution -> Bool
dayMatches y d (AnySolution s) = day s == (y, d)

run :: Runner -> IO ()
run (Runner m ss) = case m of
             All -> forM_ (reverse ss) solve
             Last -> solve $ last ss
             Single (y, d) -> case find (dayMatches y d) ss of
                                   Nothing -> putStrLn "Solution not found"
                                   Just s -> solve s

splitByPosition :: [a] -> ([a], [a])
splitByPosition [] = ([], [])
splitByPosition (x:xs) = let (odds, evens) = splitByPosition xs in (x:evens, odds)
