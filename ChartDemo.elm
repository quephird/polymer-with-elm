module ChartDemo where

import Html exposing (div)
import List exposing (map)

import Polymer exposing (SliceColor(..), GoogleChart(..), pieChartDefaults, render, sliceDefaults)

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
                                    , { pieChartDefaults | is3D <- True }
                                    , { pieChartDefaults | slices <- [(0, { sliceDefaults | offset <- 0.1 })
                                                                     ,(1, { sliceDefaults | color <- (Color "green") })
                                                                     ,(2, { sliceDefaults | offset <- 0.2
                                                                                          , color <- (Color "#FF0077") }) ] }
                                    ]
