{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Network.Wai.Middleware.RequestLogger
                                                ( logStdoutDev )
import           Web.Scotty                     ( matchAny
                                                , middleware
                                                , regex
                                                , scotty
                                                , text
                                                )

main :: IO ()
main = scotty 3000 $ do
  middleware logStdoutDev
  matchAny (regex ".*") $ do
    text "This is DEBUG dev server"
