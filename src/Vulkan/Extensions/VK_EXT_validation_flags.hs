{-# language CPP #-}
-- | = Name
--
-- VK_EXT_validation_flags - instance extension
--
-- = Registered Extension Number
--
-- 62
--
-- = Revision
--
-- 2
--
-- = Extension and Version Dependencies
--
-- -   Requires Vulkan 1.0
--
-- = Deprecation state
--
-- -   /Deprecated/ by @VK_EXT_validation_features@ extension == Special
--     Use
--
-- -   <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#extendingvulkan-compatibility-specialuse Debugging tools>
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2019-08-19
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Contributors__]
--
--     -   Tobin Ehlis, Google
--
--     -   Courtney Goeltzenleuchter, Google
--
-- == Description
--
-- This extension provides the 'ValidationFlagsEXT' struct that can be
-- included in the @pNext@ chain of the
-- 'Vulkan.Core10.DeviceInitialization.InstanceCreateInfo' structure passed
-- as the @pCreateInfo@ parameter of
-- 'Vulkan.Core10.DeviceInitialization.createInstance'. The structure
-- contains an array of 'ValidationCheckEXT' values that will be disabled
-- by the validation layers.
--
-- == Deprecation by @VK_EXT_validation_features@
--
-- Functionality in this extension is subsumed into the
-- @VK_EXT_validation_features@ extension.
--
-- == New Structures
--
-- -   Extending 'Vulkan.Core10.DeviceInitialization.InstanceCreateInfo':
--
--     -   'ValidationFlagsEXT'
--
-- == New Enums
--
-- -   'ValidationCheckEXT'
--
-- == New Enum Constants
--
-- -   'EXT_VALIDATION_FLAGS_EXTENSION_NAME'
--
-- -   'EXT_VALIDATION_FLAGS_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_VALIDATION_FLAGS_EXT'
--
-- == Version History
--
-- -   Revision 2, 2019-08-19 (Mark Lobodzinski)
--
--     -   Marked as deprecated
--
-- -   Revision 1, 2016-08-26 (Courtney Goeltzenleuchter)
--
--     -   Initial draft
--
-- = See Also
--
-- 'ValidationCheckEXT', 'ValidationFlagsEXT'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_EXT_validation_flags Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_EXT_validation_flags  ( ValidationFlagsEXT(..)
                                                  , ValidationCheckEXT( VALIDATION_CHECK_ALL_EXT
                                                                      , VALIDATION_CHECK_SHADERS_EXT
                                                                      , ..
                                                                      )
                                                  , EXT_VALIDATION_FLAGS_SPEC_VERSION
                                                  , pattern EXT_VALIDATION_FLAGS_SPEC_VERSION
                                                  , EXT_VALIDATION_FLAGS_EXTENSION_NAME
                                                  , pattern EXT_VALIDATION_FLAGS_EXTENSION_NAME
                                                  ) where

import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import GHC.Show (showsPrec)
import Text.ParserCombinators.ReadPrec ((+++))
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Data.Vector (generateM)
import qualified Data.Vector (imapM_)
import qualified Data.Vector (length)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import GHC.Generics (Generic)
import Data.Int (Int32)
import Foreign.Ptr (Ptr)
import GHC.Read (Read(readPrec))
import Data.Word (Word32)
import Text.Read.Lex (Lexeme(Ident))
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Data.Vector (Vector)
import Vulkan.CStruct.Utils (advancePtrBytes)
import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (FromCStruct(..))
import Vulkan.Core10.Enums.StructureType (StructureType)
import Vulkan.CStruct (ToCStruct)
import Vulkan.CStruct (ToCStruct(..))
import Vulkan.Zero (Zero)
import Vulkan.Zero (Zero(..))
import Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_VALIDATION_FLAGS_EXT))
-- | VkValidationFlagsEXT - Specify validation checks to disable for a Vulkan
-- instance
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Vulkan.Core10.Enums.StructureType.StructureType', 'ValidationCheckEXT'
data ValidationFlagsEXT = ValidationFlagsEXT
  { -- | @pDisabledValidationChecks@ is a pointer to an array of
    -- 'ValidationCheckEXT' values specifying the validation checks to be
    -- disabled.
    --
    -- #VUID-VkValidationFlagsEXT-pDisabledValidationChecks-parameter#
    -- @pDisabledValidationChecks@ /must/ be a valid pointer to an array of
    -- @disabledValidationCheckCount@ valid 'ValidationCheckEXT' values
    disabledValidationChecks :: Vector ValidationCheckEXT }
  deriving (Typeable)
#if defined(GENERIC_INSTANCES)
deriving instance Generic (ValidationFlagsEXT)
#endif
deriving instance Show ValidationFlagsEXT

instance ToCStruct ValidationFlagsEXT where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p ValidationFlagsEXT{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_VALIDATION_FLAGS_EXT)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    lift $ poke ((p `plusPtr` 16 :: Ptr Word32)) ((fromIntegral (Data.Vector.length $ (disabledValidationChecks)) :: Word32))
    pPDisabledValidationChecks' <- ContT $ allocaBytesAligned @ValidationCheckEXT ((Data.Vector.length (disabledValidationChecks)) * 4) 4
    lift $ Data.Vector.imapM_ (\i e -> poke (pPDisabledValidationChecks' `plusPtr` (4 * (i)) :: Ptr ValidationCheckEXT) (e)) (disabledValidationChecks)
    lift $ poke ((p `plusPtr` 24 :: Ptr (Ptr ValidationCheckEXT))) (pPDisabledValidationChecks')
    lift $ f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_VALIDATION_FLAGS_EXT)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    pPDisabledValidationChecks' <- ContT $ allocaBytesAligned @ValidationCheckEXT ((Data.Vector.length (mempty)) * 4) 4
    lift $ Data.Vector.imapM_ (\i e -> poke (pPDisabledValidationChecks' `plusPtr` (4 * (i)) :: Ptr ValidationCheckEXT) (e)) (mempty)
    lift $ poke ((p `plusPtr` 24 :: Ptr (Ptr ValidationCheckEXT))) (pPDisabledValidationChecks')
    lift $ f

instance FromCStruct ValidationFlagsEXT where
  peekCStruct p = do
    disabledValidationCheckCount <- peek @Word32 ((p `plusPtr` 16 :: Ptr Word32))
    pDisabledValidationChecks <- peek @(Ptr ValidationCheckEXT) ((p `plusPtr` 24 :: Ptr (Ptr ValidationCheckEXT)))
    pDisabledValidationChecks' <- generateM (fromIntegral disabledValidationCheckCount) (\i -> peek @ValidationCheckEXT ((pDisabledValidationChecks `advancePtrBytes` (4 * (i)) :: Ptr ValidationCheckEXT)))
    pure $ ValidationFlagsEXT
             pDisabledValidationChecks'

instance Zero ValidationFlagsEXT where
  zero = ValidationFlagsEXT
           mempty


-- | VkValidationCheckEXT - Specify validation checks to disable
--
-- = See Also
--
-- 'ValidationFlagsEXT'
newtype ValidationCheckEXT = ValidationCheckEXT Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- | 'VALIDATION_CHECK_ALL_EXT' specifies that all validation checks are
-- disabled.
pattern VALIDATION_CHECK_ALL_EXT = ValidationCheckEXT 0
-- | 'VALIDATION_CHECK_SHADERS_EXT' specifies that shader validation is
-- disabled.
pattern VALIDATION_CHECK_SHADERS_EXT = ValidationCheckEXT 1
{-# complete VALIDATION_CHECK_ALL_EXT,
             VALIDATION_CHECK_SHADERS_EXT :: ValidationCheckEXT #-}

instance Show ValidationCheckEXT where
  showsPrec p = \case
    VALIDATION_CHECK_ALL_EXT -> showString "VALIDATION_CHECK_ALL_EXT"
    VALIDATION_CHECK_SHADERS_EXT -> showString "VALIDATION_CHECK_SHADERS_EXT"
    ValidationCheckEXT x -> showParen (p >= 11) (showString "ValidationCheckEXT " . showsPrec 11 x)

instance Read ValidationCheckEXT where
  readPrec = parens (choose [("VALIDATION_CHECK_ALL_EXT", pure VALIDATION_CHECK_ALL_EXT)
                            , ("VALIDATION_CHECK_SHADERS_EXT", pure VALIDATION_CHECK_SHADERS_EXT)]
                     +++
                     prec 10 (do
                       expectP (Ident "ValidationCheckEXT")
                       v <- step readPrec
                       pure (ValidationCheckEXT v)))


type EXT_VALIDATION_FLAGS_SPEC_VERSION = 2

-- No documentation found for TopLevel "VK_EXT_VALIDATION_FLAGS_SPEC_VERSION"
pattern EXT_VALIDATION_FLAGS_SPEC_VERSION :: forall a . Integral a => a
pattern EXT_VALIDATION_FLAGS_SPEC_VERSION = 2


type EXT_VALIDATION_FLAGS_EXTENSION_NAME = "VK_EXT_validation_flags"

-- No documentation found for TopLevel "VK_EXT_VALIDATION_FLAGS_EXTENSION_NAME"
pattern EXT_VALIDATION_FLAGS_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern EXT_VALIDATION_FLAGS_EXTENSION_NAME = "VK_EXT_validation_flags"

