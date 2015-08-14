module Polymer.ChartDemo where

import Html exposing (div)
import List exposing (map)

import Polymer.Core exposing ( GoogleChart(..)
                             , render)
import Polymer.PieChart exposing ( SliceColor(..)
                                 , pieChartDefaults
                                 , sliceDefaults)

main =
  let data = [ ("Germany", 10), ("United States", 30), ("France", 25) ]
      labels = ("Category", "Count")
      title  = "Xyzzy"
  in
    div []
      <| map render
      <| map (PieChart data labels) [ pieChartDefaults
                                    , { pieChartDefaults | title <- "Countries" }
                                    , { pieChartDefaults | pieHole <- 0.5}
                                    , { pieChartDefaults | pieStartAngle <- 45 }
                                    , { pieChartDefaults | is3D <- True
                                                         , slices <- [(0, { sliceDefaults | offset <- 0.1 })
                                                                     ,(1, { sliceDefaults | color <- (Color "green") })
                                                                     ,(2, { sliceDefaults | offset <- 0.2
                                                                                          , color <- (Color "#FF0077") }) ] }
                                    ]
