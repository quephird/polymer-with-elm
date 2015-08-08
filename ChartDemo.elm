module ChartDemo where

import Polymer exposing (GoogleChart(..), pieChartDefaults, render)

main =
  let data = [ ("Germany", 10), ("United States", 30), ("France", 25) ]
      labels = ("Category", "Count")
      title  = "Xyzzy"
      newChart = PieChart data labels pieChartDefaults
  in
    render newChart
