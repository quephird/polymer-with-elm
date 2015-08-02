module Polymer where

import Html exposing (Html, div, node, text)
import Html.Attributes exposing (checked, class)
import List exposing (map, foldr)

paperCheckbox : String -> List Html
paperCheckbox label =
  [ node "paper-checkbox" [ checked False ] []
  , text label ]

main =
  div [ class "checkbox-group"]
        <| foldr (++) [] <| map paperCheckbox [ "ZOMG", "OMFG", "AAAA" ]
