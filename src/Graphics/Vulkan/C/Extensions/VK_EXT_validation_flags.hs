{-# language Strict #-}
{-# language CPP #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DuplicateRecordFields #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_EXT_validation_flags
  ( VkValidationCheckEXT(..)
  , pattern VK_VALIDATION_CHECK_ALL_EXT
  , pattern VK_VALIDATION_CHECK_SHADERS_EXT
  , VkValidationFlagsEXT(..)
  , pattern VK_EXT_VALIDATION_FLAGS_EXTENSION_NAME
  , pattern VK_EXT_VALIDATION_FLAGS_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT
  ) where

import Data.Int
  ( Int32
  )
import Data.String
  ( IsString
  )
import Data.Word
  ( Word32
  )
import Foreign.Ptr
  ( Ptr
  , plusPtr
  )
import Foreign.Storable
  ( Storable
  , Storable(..)
  )
import GHC.Read
  ( choose
  , expectP
  )
import Text.ParserCombinators.ReadPrec
  ( (+++)
  , prec
  , step
  )
import Text.Read
  ( Read(..)
  , parens
  )
import Text.Read.Lex
  ( Lexeme(Ident)
  )


import Graphics.Vulkan.C.Core10.Core
  ( VkStructureType(..)
  , Zero(..)
  )


-- ** VkValidationCheckEXT

-- No documentation found for TopLevel "VkValidationCheckEXT"
newtype VkValidationCheckEXT = VkValidationCheckEXT Int32
  deriving (Eq, Ord, Storable, Zero)

instance Show VkValidationCheckEXT where
  showsPrec _ VK_VALIDATION_CHECK_ALL_EXT = showString "VK_VALIDATION_CHECK_ALL_EXT"
  showsPrec _ VK_VALIDATION_CHECK_SHADERS_EXT = showString "VK_VALIDATION_CHECK_SHADERS_EXT"
  showsPrec p (VkValidationCheckEXT x) = showParen (p >= 11) (showString "VkValidationCheckEXT " . showsPrec 11 x)

instance Read VkValidationCheckEXT where
  readPrec = parens ( choose [ ("VK_VALIDATION_CHECK_ALL_EXT",     pure VK_VALIDATION_CHECK_ALL_EXT)
                             , ("VK_VALIDATION_CHECK_SHADERS_EXT", pure VK_VALIDATION_CHECK_SHADERS_EXT)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkValidationCheckEXT")
                        v <- step readPrec
                        pure (VkValidationCheckEXT v)
                        )
                    )

-- No documentation found for Nested "VkValidationCheckEXT" "VK_VALIDATION_CHECK_ALL_EXT"
pattern VK_VALIDATION_CHECK_ALL_EXT :: VkValidationCheckEXT
pattern VK_VALIDATION_CHECK_ALL_EXT = VkValidationCheckEXT 0

-- No documentation found for Nested "VkValidationCheckEXT" "VK_VALIDATION_CHECK_SHADERS_EXT"
pattern VK_VALIDATION_CHECK_SHADERS_EXT :: VkValidationCheckEXT
pattern VK_VALIDATION_CHECK_SHADERS_EXT = VkValidationCheckEXT 1
-- No documentation found for TopLevel "VkValidationFlagsEXT"
data VkValidationFlagsEXT = VkValidationFlagsEXT
  { -- No documentation found for Nested "VkValidationFlagsEXT" "sType"
  vkSType :: VkStructureType
  , -- No documentation found for Nested "VkValidationFlagsEXT" "pNext"
  vkPNext :: Ptr ()
  , -- No documentation found for Nested "VkValidationFlagsEXT" "disabledValidationCheckCount"
  vkDisabledValidationCheckCount :: Word32
  , -- No documentation found for Nested "VkValidationFlagsEXT" "pDisabledValidationChecks"
  vkPDisabledValidationChecks :: Ptr VkValidationCheckEXT
  }
  deriving (Eq, Show)

instance Storable VkValidationFlagsEXT where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek ptr = VkValidationFlagsEXT <$> peek (ptr `plusPtr` 0)
                                  <*> peek (ptr `plusPtr` 8)
                                  <*> peek (ptr `plusPtr` 16)
                                  <*> peek (ptr `plusPtr` 24)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkValidationFlagsEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkValidationFlagsEXT))
                *> poke (ptr `plusPtr` 16) (vkDisabledValidationCheckCount (poked :: VkValidationFlagsEXT))
                *> poke (ptr `plusPtr` 24) (vkPDisabledValidationChecks (poked :: VkValidationFlagsEXT))

instance Zero VkValidationFlagsEXT where
  zero = VkValidationFlagsEXT zero
                              zero
                              zero
                              zero
-- No documentation found for TopLevel "VK_EXT_VALIDATION_FLAGS_EXTENSION_NAME"
pattern VK_EXT_VALIDATION_FLAGS_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_EXT_VALIDATION_FLAGS_EXTENSION_NAME = "VK_EXT_validation_flags"
-- No documentation found for TopLevel "VK_EXT_VALIDATION_FLAGS_SPEC_VERSION"
pattern VK_EXT_VALIDATION_FLAGS_SPEC_VERSION :: Integral a => a
pattern VK_EXT_VALIDATION_FLAGS_SPEC_VERSION = 1
-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT"
pattern VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_VALIDATION_FLAGS_EXT = VkStructureType 1000061000
