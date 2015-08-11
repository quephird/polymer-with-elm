module ChartDemo where

import Html exposing (div)
import List exposing (map)

import Polymer exposing (GoogleChart(..), pieChartDefaults, render)

main =
  let data = [ ("Germany", 10), ("United States", 30), ("France", 25) ]
      labels = ("Category", "Count")
      title  = "Xyzzy"
  in
    div []
      <| map render
      <| map (PieChart data labels) [ pieChartDefaults
                                    , { pieChartDefaults | title <- "Countries" }
                                    , { pieChartDefaults | is3D <- True }
                                    , { pieChartDefaults | pieHole <- 0.5}
                                    , { pieChartDefaults | pieStartAngle <- 45 }
                                    , { pieChartDefaults | sliceOffsets <- [(1,0.2), (2, 0.3)] }
                                    ]
