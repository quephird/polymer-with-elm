module Polymer (GoogleChart(..), PieChartOptions, pieChartDefaults, render, toOffsetsString) where

import Html exposing (Html, div, node, text)
import Html.Attributes exposing (attribute, checked, class)
import List exposing (map)
import String exposing (join, toLower)

type alias Title = String
type alias Labels = (String, String)
type alias Data = List (String, Int)
type alias SliceOffsets = List (Int, Float)

type alias PieChartOptions =
  { title : String
  , is3D : Bool
  , pieHole : Float
  , pieStartAngle : Int
  , sliceOffsets : List (Int, Float)
  }

type GoogleChart = PieChart Data Labels PieChartOptions

pieChartDefaults : PieChartOptions
pieChartDefaults = PieChartOptions "" False 0.0 0 []

toOffsetsString : SliceOffsets -> String
toOffsetsString offsets =
  join ", " <| map (\(i,o) -> "\"" ++ toString i ++ "\": {\"offset\": " ++ toString o ++ "}") offsets

toOptionsString : PieChartOptions -> String
toOptionsString {title, is3D, pieHole, pieStartAngle, sliceOffsets} =
                   "{\"title\": \"" ++ title ++ "\", "
                   ++ "\"is3D\": " ++ (toLower <| toString is3D) ++ ", "
                   ++ "\"pieHole\": " ++ toString pieHole ++ ", "
                   ++ "\"pieStartAngle\": " ++ toString pieStartAngle ++ ", "
                   ++ "\"slices\": { " ++ toOffsetsString sliceOffsets ++ "}"
                   ++ "}"

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
