{-# LANGUAGE OverloadedStrings #-}
module Main where

import           Network.Wai.Middleware.RequestLogger
                                                ( logStdoutDev )
import           Web.Scotty                     ( ActionM
                                                , json
                                                , jsonData
                                                , matchAny
                                                , middleware
                                                , scotty
                                                , text
                                                )

main :: IO ()
main = scotty 3000 $ do
  middleware logStdoutDev
  matchAny "/" $ do
    text "This is DEBUG Dev server"
