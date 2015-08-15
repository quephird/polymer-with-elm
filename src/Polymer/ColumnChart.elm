module Polymer.ColumnChart
  ( ColumnChartOptions
  , ColumnData
  , columnChartDefaults
  ) where

type alias ColumnData = List (String, Int)

type ColumnChartOption
  = Foo
  | Bar

type alias ColumnChartOptions =
  {
  }

columnChartDefaults = ColumnChartOptions
