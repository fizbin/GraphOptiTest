{-# LANGUAGE TupleSections #-}

module Main where

import Control.Exception
import Control.Monad
import Data.Graph.Inductive
import qualified Data.Graph.Inductive.PatriciaTree as Pt
import qualified MyPatriciaTree as MPt

makeGraph :: (DynGraph gr) => Int -> gr () Int
makeGraph n = mkGraph (map (,()) [1 .. n])
  (concatMap (\x -> map (\y -> (x, y, x*y)) [x .. n]) [1 .. n])

main1 :: IO ()
main1 =
  replicateM_ 200 $ let x = makeGraph 200 :: Pt.Gr () Int
                    in evaluate (length $ show x)

main2 :: IO ()
main2 =
  replicateM_ 200 $ let x = makeGraph 200 :: MPt.Gr () Int
                    in evaluate (length $ show x)

main :: IO ()
main = main1 >> main2
