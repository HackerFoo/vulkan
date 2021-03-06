{-# language CPP #-}
-- No documentation found for Chapter "Extends"
module OpenXR.CStruct.Extends  ( BaseInStructure
                               , BaseOutStructure
                               , Extendss
                               , PeekChain
                               , PokeChain
                               , Chain
                               ) where

import OpenXR.CStruct (FromCStruct)
import OpenXR.CStruct (ToCStruct)
import Data.Kind (Constraint)
import Data.Kind (Type)

data BaseInStructure

instance ToCStruct BaseInStructure
instance Show BaseInStructure

instance FromCStruct BaseInStructure


data BaseOutStructure

instance ToCStruct BaseOutStructure
instance Show BaseOutStructure

instance FromCStruct BaseOutStructure


class PeekChain (xs :: [Type])
class PokeChain (xs :: [Type])
type family Extends (p :: [Type] -> Type) (x :: Type) :: Constraint
type family Extendss (p :: [Type] -> Type) (xs :: [Type]) :: Constraint where
  Extendss p '[]      = ()
  Extendss p (x : xs) = (Extends p x, Extendss p xs)
type family Chain (xs :: [a]) = (r :: a) | r -> xs where
  Chain '[]    = ()
  Chain (x:xs) = (x, Chain xs)

