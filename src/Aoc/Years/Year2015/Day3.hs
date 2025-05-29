module Aoc.Years.Year2015.Day3 (
    Day3(..)
) where

import Aoc
import qualified Data.Set as Set

data Day3 = Day3 | Input [Loc]

instance Solution Day3 where
    day _ = (2015, 3)

    parse Day3 input = Input [readLoc y | y <- head . lines $ input] 

    part1 (Input locs) = [show . Set.size . deliver $ locs]
    part1 _            = undefined

    part2 (Input locs) = [show . Set.size . Set.union (deliver xs) $ deliver ys]
          where (xs, ys) = splitByPosition locs
    part2 _         = undefined


data Loc = Start | North | South | West | East

readLoc :: Char -> Loc
readLoc c = case c of
                '^' -> North
                'v' -> South
                '>' -> East
                '<' -> West
                _ -> undefined


deliver :: [Loc] -> Set.Set (Int, Int)
deliver locs = go (Set.fromList [(0, 0)]) (0, 0) locs
     where go st (x, y) [] = st
           go st (x, y) (l:ls) = case l of
                                    North -> go (Set.insert (x, y+1) st) (x, y+1) ls
                                    South -> go (Set.insert (x, y-1) st) (x, y-1) ls
                                    East  -> go (Set.insert (x+1, y) st) (x+1, y) ls
                                    West  -> go (Set.insert (x-1, y) st) (x-1, y) ls
