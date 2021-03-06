{-# LANGUAGE OverloadedStrings #-}

module Main where

import qualified Data.ByteString.Lazy as BL
import qualified Data.ByteString.Lazy.Char8 as C8
import Pragmatic.Types
import Pragmatic.JSON.Parser()
import Data.Aeson
import Data.Monoid

main :: IO ()
main = do
    toParse <- BL.readFile "recipe.json"
    case (eitherDecode' toParse :: Either String Recipe) of
      Right r -> print r
      Left e -> C8.putStrLn $ C8.pack e <> " in " <> toParse

