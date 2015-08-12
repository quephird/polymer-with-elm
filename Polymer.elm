module Polymer (GoogleChart(..), PieChartOptions, pieChartDefaults, render) where

import Html exposing (Html, div, node, text)
import Html.Attributes exposing (attribute, checked, class)
import List exposing (map, map2)
import String exposing (join, toLower)

type alias Labels = (String, String)
type alias Data = List (String, Int)

type alias Title = String
type alias Is3D = Bool
type alias PieHole = Float
type alias PieStartAngle = Int
type alias SliceOffsets = List (Int, Float)

type PieChartOption
  = Title' Title
  | Is3D' Is3D
  | PieHole' PieHole
  | PieStartAngle' PieStartAngle
  | SliceOffsets' SliceOffsets

type alias PieChartOptions =
  { title : Title
  , is3D : Is3D
  , pieHole : PieHole
  , pieStartAngle : PieStartAngle
  , sliceOffsets : SliceOffsets
  }

type GoogleChart = PieChart Data Labels PieChartOptions

pieChartDefaults : PieChartOptions
pieChartDefaults = PieChartOptions "" False 0.0 0 []

toJson : PieChartOption -> String
toJson option =
  case option of
    Title' t ->
      "\"title\": \"" ++ t ++ "\""
    Is3D' i ->
      "\"is3D\": " ++ (toLower <| toString i)
    PieHole' h ->
      "\"pieHole\": " ++ toString h
    PieStartAngle' a ->
      "\"pieStartAngle\": " ++ toString a
    SliceOffsets' os ->
      "\"slices\": { " ++
      (join ", " <| map (\(i,o) -> "\"" ++ toString i ++ "\": {\"offset\": " ++ toString o ++ "}") os) ++
      "}"

toOptionsString : PieChartOptions -> String
toOptionsString {title, is3D, pieHole, pieStartAngle, sliceOffsets} =
  "{" ++
  (join ", " <| map toJson [Title' title,
                            Is3D' is3D,
                            PieHole' pieHole,
                            PieStartAngle' pieStartAngle,
                            SliceOffsets' sliceOffsets]) ++
  "}"

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
    attributes = map (\[n,v] -> attribute n v) [["type", "pie"],
                                                ["options", optionsString],
                                                ["data", dataString]]
    children   = []
  in
    node "google-chart" attributes children
