{-# LANGUAGE QuasiQuotes #-}
module ThPerf5 where

import ThPerf5.QQ

main :: IO ()
main = [test| print "Hello, world!" |]
