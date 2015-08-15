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
import Polymer.ColumnChart exposing ( ColumnData
                                    , ColumnChartOptions )

type GoogleChart
  = PieChart Data Labels PieChartOptions
  | ColumnChart ColumnData ColumnChartOptions

toHtml : String -> String -> String -> Html
toHtml chartType optionsString dataString =
  let
    attributes = map (\[n,v] -> attribute n v) [["type", chartType],
                                                ["options", optionsString],
                                                ["data", dataString]]
    children   = []
  in
    node "google-chart" attributes children

render : GoogleChart -> Html
render chart =
  case chart of
    PieChart data labels options ->
      let
        optionsString = toOptionsString options
        dataString = toDataString labels data
      in
        toHtml "pie" optionsString dataString
    ColumnChart data options ->
      let
        optionsString = ""
        dataString = "[ [\"Category\", \"Count\"], [\"Germany\", 10], [\"United States\", 30], [\"France\", 25] ]"
      in
        toHtml "bar" optionsString dataString
