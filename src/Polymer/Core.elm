module Polymer.Core ( GoogleChart(..)
                    , render) where

import Html exposing (Html, node)
import Html.Attributes exposing (attribute)
import List exposing (map)

import Polymer.PieChart exposing ( Data
                                 , Labels
                                 , PieChartOptions
                                 , toDataString
                                 , toOptionsString)

type GoogleChart = PieChart Data Labels PieChartOptions

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
