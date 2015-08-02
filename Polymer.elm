module Polymer where

import Html exposing (..)
import Html.Attributes exposing (..)
import List exposing (map, foldr)

paperCheckbox : String -> List Html
paperCheckbox label =
  [ node "paper-checkbox" [ checked False ] []
  , text label ]

main =
  div [ class "checkbox-group"]
        <| foldr (++) [] <| map paperCheckbox [ "ZOMG", "OMFG", "AAAA" ]
