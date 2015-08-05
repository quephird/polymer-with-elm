module Main where

import Polymer exposing (GoogleChart(..), render)

main =
  let tuples = [ ("foo", 10), ("bar", 30), ("baz", 25) ]
      labels = ("Category", "Count")
      title  = "Xyzzy"
      newChart = PieChart title labels tuples
  in
    render newChart
