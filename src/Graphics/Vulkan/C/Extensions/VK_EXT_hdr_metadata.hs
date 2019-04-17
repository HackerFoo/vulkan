{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_EXT_hdr_metadata
  ( VkHdrMetadataEXT(..)
  , VkXYColorEXT(..)
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
  , vkSetHdrMetadataEXT
#endif
  , FN_vkSetHdrMetadataEXT
  , PFN_vkSetHdrMetadataEXT
  , pattern VK_EXT_HDR_METADATA_EXTENSION_NAME
  , pattern VK_EXT_HDR_METADATA_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_HDR_METADATA_EXT
  ) where

import Data.String
  ( IsString
  )
import Data.Word
  ( Word32
  )
import Foreign.C.Types
  ( CFloat(..)
  )
import Foreign.Ptr
  ( FunPtr
  , Ptr
  , plusPtr
  )
import Foreign.Storable
  ( Storable
  , Storable(..)
  )


import Graphics.Vulkan.C.Core10.Core
  ( VkStructureType(..)
  , Zero(..)
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkDevice
  )
import Graphics.Vulkan.C.Extensions.VK_KHR_swapchain
  ( VkSwapchainKHR
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- | VkHdrMetadataEXT - structure to specify Hdr metadata
--
-- == Valid Usage (Implicit)
--
-- __Note__
--
-- The validity and use of this data is outside the scope of Vulkan.
--
-- = See Also
--
-- No cross-references are available
data VkHdrMetadataEXT = VkHdrMetadataEXT
  { -- | @sType@ /must/ be @VK_STRUCTURE_TYPE_HDR_METADATA_EXT@
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @displayPrimaryRed@ is the mastering display’s red primary in
  -- chromaticity coordinates
  vkDisplayPrimaryRed :: VkXYColorEXT
  , -- | @displayPrimaryGreen@ is the mastering display’s green primary in
  -- chromaticity coordinates
  vkDisplayPrimaryGreen :: VkXYColorEXT
  , -- | @displayPrimaryBlue@ is the mastering display’s blue primary in
  -- chromaticity coordinates
  vkDisplayPrimaryBlue :: VkXYColorEXT
  , -- | @whitePoint@ is the mastering display’s white-point in chromaticity
  -- coordinates
  vkWhitePoint :: VkXYColorEXT
  , -- | @maxLuminance@ is the maximum luminance of the mastering display in nits
  vkMaxLuminance :: CFloat
  , -- | @minLuminance@ is the minimum luminance of the mastering display in nits
  vkMinLuminance :: CFloat
  , -- | @maxContentLightLevel@ is content’s maximum luminance in nits
  vkMaxContentLightLevel :: CFloat
  , -- | @maxFrameAverageLightLevel@ is the maximum frame average light level in
  -- nits
  vkMaxFrameAverageLightLevel :: CFloat
  }
  deriving (Eq, Show)

instance Storable VkHdrMetadataEXT where
  sizeOf ~_ = 64
  alignment ~_ = 8
  peek ptr = VkHdrMetadataEXT <$> peek (ptr `plusPtr` 0)
                              <*> peek (ptr `plusPtr` 8)
                              <*> peek (ptr `plusPtr` 16)
                              <*> peek (ptr `plusPtr` 24)
                              <*> peek (ptr `plusPtr` 32)
                              <*> peek (ptr `plusPtr` 40)
                              <*> peek (ptr `plusPtr` 48)
                              <*> peek (ptr `plusPtr` 52)
                              <*> peek (ptr `plusPtr` 56)
                              <*> peek (ptr `plusPtr` 60)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkHdrMetadataEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkHdrMetadataEXT))
                *> poke (ptr `plusPtr` 16) (vkDisplayPrimaryRed (poked :: VkHdrMetadataEXT))
                *> poke (ptr `plusPtr` 24) (vkDisplayPrimaryGreen (poked :: VkHdrMetadataEXT))
                *> poke (ptr `plusPtr` 32) (vkDisplayPrimaryBlue (poked :: VkHdrMetadataEXT))
                *> poke (ptr `plusPtr` 40) (vkWhitePoint (poked :: VkHdrMetadataEXT))
                *> poke (ptr `plusPtr` 48) (vkMaxLuminance (poked :: VkHdrMetadataEXT))
                *> poke (ptr `plusPtr` 52) (vkMinLuminance (poked :: VkHdrMetadataEXT))
                *> poke (ptr `plusPtr` 56) (vkMaxContentLightLevel (poked :: VkHdrMetadataEXT))
                *> poke (ptr `plusPtr` 60) (vkMaxFrameAverageLightLevel (poked :: VkHdrMetadataEXT))

instance Zero VkHdrMetadataEXT where
  zero = VkHdrMetadataEXT zero
                          zero
                          zero
                          zero
                          zero
                          zero
                          zero
                          zero
                          zero
                          zero
-- | VkXYColorEXT - structure to specify X,Y chromaticity coordinates
--
-- = See Also
--
-- No cross-references are available
data VkXYColorEXT = VkXYColorEXT
  { -- No documentation found for Nested "VkXYColorEXT" "x"
  vkX :: CFloat
  , -- No documentation found for Nested "VkXYColorEXT" "y"
  vkY :: CFloat
  }
  deriving (Eq, Show)

instance Storable VkXYColorEXT where
  sizeOf ~_ = 8
  alignment ~_ = 4
  peek ptr = VkXYColorEXT <$> peek (ptr `plusPtr` 0)
                          <*> peek (ptr `plusPtr` 4)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkX (poked :: VkXYColorEXT))
                *> poke (ptr `plusPtr` 4) (vkY (poked :: VkXYColorEXT))

instance Zero VkXYColorEXT where
  zero = VkXYColorEXT zero
                      zero
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
-- | vkSetHdrMetadataEXT - function to set Hdr metadata
--
-- = Parameters
--
-- -   @device@ is the logical device where the swapchain(s) were created.
--
-- -   @swapchainCount@ is the number of swapchains included in
--     @pSwapchains@.
--
-- -   @pSwapchains@ is a pointer to the array of @swapchainCount@
--     @VkSwapchainKHR@ handles.
--
-- -   @pMetadata@ is a pointer to the array of @swapchainCount@
--     @VkHdrMetadataEXT@ structures.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid @VkDevice@ handle
--
-- -   @pSwapchains@ /must/ be a valid pointer to an array of
--     @swapchainCount@ valid @VkSwapchainKHR@ handles
--
-- -   @pMetadata@ /must/ be a valid pointer to an array of
--     @swapchainCount@ valid @VkHdrMetadataEXT@ structures
--
-- -   @swapchainCount@ /must/ be greater than @0@
--
-- -   Both of @device@, and the elements of @pSwapchains@ /must/ have been
--     created, allocated, or retrieved from the same @VkInstance@
--
-- = See Also
--
-- No cross-references are available
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkSetHdrMetadataEXT" vkSetHdrMetadataEXT :: ("device" ::: VkDevice) -> ("swapchainCount" ::: Word32) -> ("pSwapchains" ::: Ptr VkSwapchainKHR) -> ("pMetadata" ::: Ptr VkHdrMetadataEXT) -> IO ()

#endif
type FN_vkSetHdrMetadataEXT = ("device" ::: VkDevice) -> ("swapchainCount" ::: Word32) -> ("pSwapchains" ::: Ptr VkSwapchainKHR) -> ("pMetadata" ::: Ptr VkHdrMetadataEXT) -> IO ()
type PFN_vkSetHdrMetadataEXT = FunPtr FN_vkSetHdrMetadataEXT
-- No documentation found for TopLevel "VK_EXT_HDR_METADATA_EXTENSION_NAME"
pattern VK_EXT_HDR_METADATA_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_EXT_HDR_METADATA_EXTENSION_NAME = "VK_EXT_hdr_metadata"
-- No documentation found for TopLevel "VK_EXT_HDR_METADATA_SPEC_VERSION"
pattern VK_EXT_HDR_METADATA_SPEC_VERSION :: Integral a => a
pattern VK_EXT_HDR_METADATA_SPEC_VERSION = 1
-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_HDR_METADATA_EXT"
pattern VK_STRUCTURE_TYPE_HDR_METADATA_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_HDR_METADATA_EXT = VkStructureType 1000105000
