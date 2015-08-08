module Polymer (GoogleChart(..), PieChartOptions, pieChartDefaults, render) where

import Html exposing (Html, div, node, text)
import Html.Attributes exposing (attribute, checked, class)
import List exposing (map)
import String exposing (join, toLower)

type alias Title = String
type alias Labels = (String, String)
type alias DataTuple = (String, Int)
type alias Data = List DataTuple

type ChartType = Area
               | Bar
               | Bubble
               | Candlestick
               | Column
               | Combo
               | Geo
               | Histogram
               | Line
               | Pie
               | Scatter
               | SteppedArea

type alias PieChartOptions =
  { title : String
  , is3D : Bool
  , pieHole : Float
  , pieStartAngle : Int
  }

--type GoogleChartOptions = PieChartOptions

type GoogleChart = PieChart Data Labels PieChartOptions

pieChartDefaults : PieChartOptions
pieChartDefaults = PieChartOptions "" False 0.0 0

toOptionsString : PieChartOptions -> String
toOptionsString {title, is3D} =
                   "{\"title\": \"" ++ title ++ "\", " ++
                   "\"is3D\": false}"

toDataString : (String, String) -> List (String, Int) -> String
toDataString (xLabel, yLabel) tuples =
  let labelsString = "[\"" ++ xLabel ++ "\", \"" ++
                       yLabel ++ "\"]"
      tuplesString = join ", " <| map (\(c,v) -> "[\"" ++ c ++ "\", " ++ (toString v) ++ "]") tuples
  in
      "[" ++ labelsString ++ ", " ++ tuplesString ++ "]"

render : GoogleChart -> Html
render (PieChart data labels options) =
  let
    optionsString = toOptionsString options
    dataString = toDataString labels data
    attributes = map (\[n,v] -> attribute n v) [["type", "pie"], ["options", optionsString], ["data", dataString]]
    children   = []
  in
    node "google-chart" attributes children
