{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_KHR_get_surface_capabilities2
  ( VkPhysicalDeviceSurfaceInfo2KHR(..)
  , VkSurfaceCapabilities2KHR(..)
  , VkSurfaceFormat2KHR(..)
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
  , vkGetPhysicalDeviceSurfaceCapabilities2KHR
#endif
  , FN_vkGetPhysicalDeviceSurfaceCapabilities2KHR
  , PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
  , vkGetPhysicalDeviceSurfaceFormats2KHR
#endif
  , FN_vkGetPhysicalDeviceSurfaceFormats2KHR
  , PFN_vkGetPhysicalDeviceSurfaceFormats2KHR
  , pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME
  , pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR
  , pattern VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR
  , pattern VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR
  ) where

import Data.String
  ( IsString
  )
import Data.Word
  ( Word32
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
  ( VkResult(..)
  , VkStructureType(..)
  , Zero(..)
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkPhysicalDevice
  )
import Graphics.Vulkan.C.Extensions.VK_KHR_surface
  ( VkSurfaceCapabilitiesKHR(..)
  , VkSurfaceFormatKHR(..)
  , VkSurfaceKHR
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- | VkPhysicalDeviceSurfaceInfo2KHR - Structure specifying a surface and
-- related swapchain creation parameters
--
-- = Description
--
-- The members of @VkPhysicalDeviceSurfaceInfo2KHR@ correspond to the
-- arguments to
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR',
-- with @sType@ and @pNext@ added for extensibility.
--
-- Additional capabilities of a surface /may/ be available to swapchains
-- created with different full-screen exclusive settings - particularly if
-- exclusive full-screen access is application controlled. These additional
-- capabilities /can/ be queried by including the
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VkSurfaceFullScreenExclusiveInfoEXT'
-- structure in the @pNext@ chain of this structure when used to query
-- surface properties. Additionally, for Win32 surfaces with application
-- controlled exclusive full-screen access, chaining a valid instance of
-- the
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VkSurfaceFullScreenExclusiveWin32InfoEXT'
-- structure /may/ also report additional surface capabilities. These
-- additional capabilities only apply to swapchains created with the same
-- parameters passed into the @pNext@ chain of
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.VkSwapchainCreateInfoKHR'.
--
-- == Valid Usage
--
-- -   If the @pNext@ chain includes an instance of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VkSurfaceFullScreenExclusiveInfoEXT'
--     with its @fullScreenExclusive@ member set to
--     @VK_FULL_SCREEN_EXCLUSIVE_APPLICATION_CONTROLLED_EXT@, and @surface@
--     was created using
--     'Graphics.Vulkan.C.Extensions.VK_KHR_win32_surface.vkCreateWin32SurfaceKHR',
--     an instance of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VkSurfaceFullScreenExclusiveWin32InfoEXT'
--     /must/ be present in the @pNext@ chain
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     @VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR@
--
-- -   @pNext@ /must/ be @NULL@
--
-- -   @surface@ /must/ be a valid @VkSurfaceKHR@ handle
--
-- = See Also
--
-- No cross-references are available
data VkPhysicalDeviceSurfaceInfo2KHR = VkPhysicalDeviceSurfaceInfo2KHR
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @surface@ is the surface that will be associated with the swapchain.
  vkSurface :: VkSurfaceKHR
  }
  deriving (Eq, Show)

instance Storable VkPhysicalDeviceSurfaceInfo2KHR where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkPhysicalDeviceSurfaceInfo2KHR <$> peek (ptr `plusPtr` 0)
                                             <*> peek (ptr `plusPtr` 8)
                                             <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPhysicalDeviceSurfaceInfo2KHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPhysicalDeviceSurfaceInfo2KHR))
                *> poke (ptr `plusPtr` 16) (vkSurface (poked :: VkPhysicalDeviceSurfaceInfo2KHR))

instance Zero VkPhysicalDeviceSurfaceInfo2KHR where
  zero = VkPhysicalDeviceSurfaceInfo2KHR zero
                                         zero
                                         zero
-- | VkSurfaceCapabilities2KHR - Structure describing capabilities of a
-- surface
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- No cross-references are available
data VkSurfaceCapabilities2KHR = VkSurfaceCapabilities2KHR
  { -- | @sType@ /must/ be @VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR@
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
  -- 'Graphics.Vulkan.C.Extensions.VK_KHR_shared_presentable_image.VkSharedPresentSurfaceCapabilitiesKHR'
  vkPNext :: Ptr ()
  , -- | @surfaceCapabilities@ is a structure of type
  -- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceCapabilitiesKHR'
  -- describing the capabilities of the specified surface.
  vkSurfaceCapabilities :: VkSurfaceCapabilitiesKHR
  }
  deriving (Eq, Show)

instance Storable VkSurfaceCapabilities2KHR where
  sizeOf ~_ = 72
  alignment ~_ = 8
  peek ptr = VkSurfaceCapabilities2KHR <$> peek (ptr `plusPtr` 0)
                                       <*> peek (ptr `plusPtr` 8)
                                       <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkSurfaceCapabilities2KHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkSurfaceCapabilities2KHR))
                *> poke (ptr `plusPtr` 16) (vkSurfaceCapabilities (poked :: VkSurfaceCapabilities2KHR))

instance Zero VkSurfaceCapabilities2KHR where
  zero = VkSurfaceCapabilities2KHR zero
                                   zero
                                   zero
-- | VkSurfaceFormat2KHR - Structure describing a supported swapchain format
-- tuple
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- No cross-references are available
data VkSurfaceFormat2KHR = VkSurfaceFormat2KHR
  { -- | @sType@ /must/ be @VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR@
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @surfaceFormat@ is an instance of
  -- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.VkSurfaceFormatKHR'
  -- describing a format-color space pair that is compatible with the
  -- specified surface.
  vkSurfaceFormat :: VkSurfaceFormatKHR
  }
  deriving (Eq, Show)

instance Storable VkSurfaceFormat2KHR where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkSurfaceFormat2KHR <$> peek (ptr `plusPtr` 0)
                                 <*> peek (ptr `plusPtr` 8)
                                 <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkSurfaceFormat2KHR))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkSurfaceFormat2KHR))
                *> poke (ptr `plusPtr` 16) (vkSurfaceFormat (poked :: VkSurfaceFormat2KHR))

instance Zero VkSurfaceFormat2KHR where
  zero = VkSurfaceFormat2KHR zero
                             zero
                             zero
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
-- | vkGetPhysicalDeviceSurfaceCapabilities2KHR - Reports capabilities of a
-- surface on a physical device
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device that will be associated with
--     the swapchain to be created, as described for
--     'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.vkCreateSwapchainKHR'.
--
-- -   @pSurfaceInfo@ points to an instance of the
--     'VkPhysicalDeviceSurfaceInfo2KHR' structure, describing the surface
--     and other fixed parameters that would be consumed by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.vkCreateSwapchainKHR'.
--
-- -   @pSurfaceCapabilities@ points to an instance of the
--     'VkSurfaceCapabilities2KHR' structure in which the capabilities are
--     returned.
--
-- = Description
--
-- @vkGetPhysicalDeviceSurfaceCapabilities2KHR@ behaves similarly to
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_surface.vkGetPhysicalDeviceSurfaceCapabilitiesKHR',
-- with the ability to specify extended inputs via chained input
-- structures, and to return extended information via chained output
-- structures.
--
-- == Valid Usage
--
-- -   If an instance of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VkSurfaceCapabilitiesFullScreenExclusiveEXT'
--     is included in the @pNext@ chain of @pSurfaceCapabilities@, an
--     instance of
--     'Graphics.Vulkan.C.Extensions.VK_EXT_full_screen_exclusive.VkSurfaceFullScreenExclusiveWin32InfoEXT'
--     /must/ be included in the @pNext@ chain of @pSurfaceInfo@.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid @VkPhysicalDevice@ handle
--
-- -   @pSurfaceInfo@ /must/ be a valid pointer to a valid
--     @VkPhysicalDeviceSurfaceInfo2KHR@ structure
--
-- -   @pSurfaceCapabilities@ /must/ be a valid pointer to a
--     @VkSurfaceCapabilities2KHR@ structure
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   @VK_SUCCESS@
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   @VK_ERROR_OUT_OF_HOST_MEMORY@
--
--     -   @VK_ERROR_OUT_OF_DEVICE_MEMORY@
--
--     -   @VK_ERROR_SURFACE_LOST_KHR@
--
-- = See Also
--
-- No cross-references are available
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceSurfaceCapabilities2KHR" vkGetPhysicalDeviceSurfaceCapabilities2KHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilities2KHR) -> IO VkResult

#endif
type FN_vkGetPhysicalDeviceSurfaceCapabilities2KHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceCapabilities" ::: Ptr VkSurfaceCapabilities2KHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceCapabilities2KHR = FunPtr FN_vkGetPhysicalDeviceSurfaceCapabilities2KHR
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
-- | vkGetPhysicalDeviceSurfaceFormats2KHR - Query color formats supported by
-- surface
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device that will be associated with
--     the swapchain to be created, as described for
--     'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.vkCreateSwapchainKHR'.
--
-- -   @pSurfaceInfo@ points to an instance of the
--     'VkPhysicalDeviceSurfaceInfo2KHR' structure, describing the surface
--     and other fixed parameters that would be consumed by
--     'Graphics.Vulkan.C.Extensions.VK_KHR_swapchain.vkCreateSwapchainKHR'.
--
-- -   @pSurfaceFormatCount@ is a pointer to an integer related to the
--     number of format tuples available or queried, as described below.
--
-- -   @pSurfaceFormats@ is either @NULL@ or a pointer to an array of
--     'VkSurfaceFormat2KHR' structures.
--
-- = Description
--
-- If @pSurfaceFormats@ is @NULL@, then the number of format tuples
-- supported for the given @surface@ is returned in @pSurfaceFormatCount@.
-- The number of format tuples supported will be greater than or equal to
-- 1. Otherwise, @pSurfaceFormatCount@ /must/ point to a variable set by
-- the user to the number of elements in the @pSurfaceFormats@ array, and
-- on return the variable is overwritten with the number of structures
-- actually written to @pSurfaceFormats@. If the value of
-- @pSurfaceFormatCount@ is less than the number of format tuples
-- supported, at most @pSurfaceFormatCount@ structures will be written. If
-- @pSurfaceFormatCount@ is smaller than the number of format tuples
-- supported for the surface parameters described in @pSurfaceInfo@,
-- @VK_INCOMPLETE@ will be returned instead of @VK_SUCCESS@ to indicate
-- that not all the available values were returned.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid @VkPhysicalDevice@ handle
--
-- -   @pSurfaceInfo@ /must/ be a valid pointer to a valid
--     @VkPhysicalDeviceSurfaceInfo2KHR@ structure
--
-- -   @pSurfaceFormatCount@ /must/ be a valid pointer to a @uint32_t@
--     value
--
-- -   If the value referenced by @pSurfaceFormatCount@ is not @0@, and
--     @pSurfaceFormats@ is not @NULL@, @pSurfaceFormats@ /must/ be a valid
--     pointer to an array of @pSurfaceFormatCount@ @VkSurfaceFormat2KHR@
--     structures
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   @VK_SUCCESS@
--
--     -   @VK_INCOMPLETE@
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   @VK_ERROR_OUT_OF_HOST_MEMORY@
--
--     -   @VK_ERROR_OUT_OF_DEVICE_MEMORY@
--
--     -   @VK_ERROR_SURFACE_LOST_KHR@
--
-- = See Also
--
-- No cross-references are available
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceSurfaceFormats2KHR" vkGetPhysicalDeviceSurfaceFormats2KHR :: ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormat2KHR) -> IO VkResult

#endif
type FN_vkGetPhysicalDeviceSurfaceFormats2KHR = ("physicalDevice" ::: VkPhysicalDevice) -> ("pSurfaceInfo" ::: Ptr VkPhysicalDeviceSurfaceInfo2KHR) -> ("pSurfaceFormatCount" ::: Ptr Word32) -> ("pSurfaceFormats" ::: Ptr VkSurfaceFormat2KHR) -> IO VkResult
type PFN_vkGetPhysicalDeviceSurfaceFormats2KHR = FunPtr FN_vkGetPhysicalDeviceSurfaceFormats2KHR
-- No documentation found for TopLevel "VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME"
pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_EXTENSION_NAME = "VK_KHR_get_surface_capabilities2"
-- No documentation found for TopLevel "VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION"
pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION :: Integral a => a
pattern VK_KHR_GET_SURFACE_CAPABILITIES_2_SPEC_VERSION = 1
-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_SURFACE_INFO_2_KHR = VkStructureType 1000119000
-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR"
pattern VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_SURFACE_CAPABILITIES_2_KHR = VkStructureType 1000119001
-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR"
pattern VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR :: VkStructureType
pattern VK_STRUCTURE_TYPE_SURFACE_FORMAT_2_KHR = VkStructureType 1000119002
