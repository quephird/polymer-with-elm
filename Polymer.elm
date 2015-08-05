module Polymer (GoogleChart(..), render) where

import Html exposing (Html, div, node, text)
import Html.Attributes exposing (attribute, checked, class)
import List exposing (map)
import String exposing (join)

type alias Title = String
type alias Labels = (String, String)
type alias DataTuple = (String, Int)
type alias Data = List DataTuple

type GoogleChart = PieChart Title Labels Data

toData : (String, String) -> List (String, Int) -> String
toData (xLabel, yLabel) tuples =
  let labelsString = "[\"" ++ xLabel ++ "\", \"" ++
                       yLabel ++ "\"]"
      tuplesString = join ", " <| map (\(c,v) -> "[\"" ++ c ++ "\", " ++ (toString v) ++ "]") tuples
  in
      "[" ++ labelsString ++ ", " ++ tuplesString ++ "]"

render : GoogleChart -> Html
render (PieChart title labels tuples) =
  let
    options    = "{\"title\": \"" ++ title ++ "\"}"
    data       = toData labels tuples
    attributes = map (\[n,v] -> attribute n v) [["type", "pie"], ["options", options], ["data", data]]
    children   = []
  in
    node "google-chart" attributes children
