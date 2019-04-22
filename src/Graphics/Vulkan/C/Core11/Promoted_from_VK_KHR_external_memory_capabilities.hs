{-# language Strict #-}
{-# language CPP #-}
{-# language DuplicateRecordFields #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}

module Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_external_memory_capabilities
  ( VkExternalBufferProperties(..)
  , VkExternalImageFormatProperties(..)
  , VkExternalMemoryFeatureFlagBits(..)
  , pattern VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT
  , pattern VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT
  , pattern VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT
  , VkExternalMemoryFeatureFlags
  , VkExternalMemoryHandleTypeFlagBits(..)
  , pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT
  , pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT
  , pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT
  , pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT
  , pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT
  , pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT
  , pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT
  , VkExternalMemoryHandleTypeFlags
  , VkExternalMemoryProperties(..)
  , VkPhysicalDeviceExternalBufferInfo(..)
  , VkPhysicalDeviceExternalImageFormatInfo(..)
  , VkPhysicalDeviceIDProperties(..)
  , FN_vkGetPhysicalDeviceExternalBufferProperties
  , PFN_vkGetPhysicalDeviceExternalBufferProperties
  , vkGetPhysicalDeviceExternalBufferProperties
  , VK_LUID_SIZE
  , pattern VK_LUID_SIZE
  , pattern VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES
  , pattern VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO
  , pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.Vector.Storable.Sized
  ( Vector
  )
import Data.Word
  ( Word32
  , Word8
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


import Graphics.Vulkan.C.Core10.Buffer
  ( VkBufferCreateFlags
  , VkBufferUsageFlags
  )
import Graphics.Vulkan.C.Core10.Core
  ( VkBool32(..)
  , VkStructureType(..)
  , Zero(..)
  , VkFlags
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VK_UUID_SIZE
  , VkPhysicalDevice
  )
import Graphics.Vulkan.C.Dynamic
  ( InstanceCmds(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- | VkExternalBufferProperties - Structure specifying supported external
-- handle capabilities
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'VkExternalMemoryProperties',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkGetPhysicalDeviceExternalBufferProperties',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_external_memory_capabilities.vkGetPhysicalDeviceExternalBufferPropertiesKHR'
data VkExternalBufferProperties = VkExternalBufferProperties
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @externalMemoryProperties@ is an instance of the
  -- 'VkExternalMemoryProperties' structure specifying various capabilities
  -- of the external handle type when used with the specified buffer creation
  -- parameters.
  vkExternalMemoryProperties :: VkExternalMemoryProperties
  }
  deriving (Eq, Show)

instance Storable VkExternalBufferProperties where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek ptr = VkExternalBufferProperties <$> peek (ptr `plusPtr` 0)
                                        <*> peek (ptr `plusPtr` 8)
                                        <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkExternalBufferProperties))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkExternalBufferProperties))
                *> poke (ptr `plusPtr` 16) (vkExternalMemoryProperties (poked :: VkExternalBufferProperties))

instance Zero VkExternalBufferProperties where
  zero = VkExternalBufferProperties VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES
                                    zero
                                    zero

-- | VkExternalImageFormatProperties - Structure specifying supported
-- external handle properties
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'VkExternalMemoryProperties',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType'
data VkExternalImageFormatProperties = VkExternalImageFormatProperties
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES'
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @externalMemoryProperties@ is an instance of the
  -- 'VkExternalMemoryProperties' structure specifying various capabilities
  -- of the external handle type when used with the specified image creation
  -- parameters.
  vkExternalMemoryProperties :: VkExternalMemoryProperties
  }
  deriving (Eq, Show)

instance Storable VkExternalImageFormatProperties where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek ptr = VkExternalImageFormatProperties <$> peek (ptr `plusPtr` 0)
                                             <*> peek (ptr `plusPtr` 8)
                                             <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkExternalImageFormatProperties))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkExternalImageFormatProperties))
                *> poke (ptr `plusPtr` 16) (vkExternalMemoryProperties (poked :: VkExternalImageFormatProperties))

instance Zero VkExternalImageFormatProperties where
  zero = VkExternalImageFormatProperties VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES
                                         zero
                                         zero

-- ** VkExternalMemoryFeatureFlagBits

-- | VkExternalMemoryFeatureFlagBits - Bitmask specifying features of an
-- external memory handle type
--
-- = Description
--
-- Because their semantics in external APIs roughly align with that of an
-- image or buffer with a dedicated allocation in Vulkan, implementations
-- are /required/ to report 'VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT'
-- for the following external handle types:
--
-- = See Also
--
-- 'VkExternalMemoryFeatureFlags'
newtype VkExternalMemoryFeatureFlagBits = VkExternalMemoryFeatureFlagBits VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkExternalMemoryFeatureFlagBits where
  showsPrec _ VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT = showString "VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT"
  showsPrec _ VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT = showString "VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT"
  showsPrec _ VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT = showString "VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT"
  showsPrec p (VkExternalMemoryFeatureFlagBits x) = showParen (p >= 11) (showString "VkExternalMemoryFeatureFlagBits " . showsPrec 11 x)

instance Read VkExternalMemoryFeatureFlagBits where
  readPrec = parens ( choose [ ("VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT", pure VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT)
                             , ("VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT",     pure VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT)
                             , ("VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT",     pure VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkExternalMemoryFeatureFlagBits")
                        v <- step readPrec
                        pure (VkExternalMemoryFeatureFlagBits v)
                        )
                    )

-- | 'VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT' specifies that images or
-- buffers created with the specified parameters and handle type /must/ use
-- the mechanisms defined by
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_dedicated_allocation.VkMemoryDedicatedRequirements'
-- and
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_dedicated_allocation.VkMemoryDedicatedAllocateInfo'
-- to create (or import) a dedicated allocation for the image or buffer.
pattern VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT :: VkExternalMemoryFeatureFlagBits
pattern VK_EXTERNAL_MEMORY_FEATURE_DEDICATED_ONLY_BIT = VkExternalMemoryFeatureFlagBits 0x00000001

-- | 'VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT' specifies that handles of
-- this type /can/ be exported from Vulkan memory objects.
pattern VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT :: VkExternalMemoryFeatureFlagBits
pattern VK_EXTERNAL_MEMORY_FEATURE_EXPORTABLE_BIT = VkExternalMemoryFeatureFlagBits 0x00000002

-- | 'VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT' specifies that handles of
-- this type /can/ be imported as Vulkan memory objects.
pattern VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT :: VkExternalMemoryFeatureFlagBits
pattern VK_EXTERNAL_MEMORY_FEATURE_IMPORTABLE_BIT = VkExternalMemoryFeatureFlagBits 0x00000004

-- | VkExternalMemoryFeatureFlags - Bitmask of
-- VkExternalMemoryFeatureFlagBits
--
-- = Description
--
-- 'VkExternalMemoryFeatureFlags' is a bitmask type for setting a mask of
-- zero or more 'VkExternalMemoryFeatureFlagBits'.
--
-- = See Also
--
-- 'VkExternalMemoryFeatureFlagBits', 'VkExternalMemoryProperties'
type VkExternalMemoryFeatureFlags = VkExternalMemoryFeatureFlagBits

-- ** VkExternalMemoryHandleTypeFlagBits

-- | VkExternalMemoryHandleTypeFlagBits - Bit specifying external memory
-- handle types
--
-- = Description
--
-- Some external memory handle types can only be shared within the same
-- underlying physical device and\/or the same driver version, as defined
-- in the following table:
--
-- > +----------------------+----------------------+-----------------------+
-- > | Handle type          | 'VkPhysicalDeviceIDP | 'VkPhysicalDeviceIDPr |
-- > |                      | roperties'::@driverU | operties'::@deviceUUI |
-- > |                      | UID@                 | D@                    |
-- > +----------------------+----------------------+-----------------------+
-- > | 'VK_EXTERNAL_MEMORY_ | Must match           | Must match            |
-- > | HANDLE_TYPE_OPAQUE_F |                      |                       |
-- > | D_BIT'               |                      |                       |
-- > +----------------------+----------------------+-----------------------+
-- > | 'VK_EXTERNAL_MEMORY_ | Must match           | Must match            |
-- > | HANDLE_TYPE_OPAQUE_W |                      |                       |
-- > | IN32_BIT'            |                      |                       |
-- > +----------------------+----------------------+-----------------------+
-- > | 'VK_EXTERNAL_MEMORY_ | Must match           | Must match            |
-- > | HANDLE_TYPE_OPAQUE_W |                      |                       |
-- > | IN32_KMT_BIT'        |                      |                       |
-- > +----------------------+----------------------+-----------------------+
-- > | 'VK_EXTERNAL_MEMORY_ | Must match           | Must match            |
-- > | HANDLE_TYPE_D3D11_TE |                      |                       |
-- > | XTURE_BIT'           |                      |                       |
-- > +----------------------+----------------------+-----------------------+
-- > | 'VK_EXTERNAL_MEMORY_ | Must match           | Must match            |
-- > | HANDLE_TYPE_D3D11_TE |                      |                       |
-- > | XTURE_KMT_BIT'       |                      |                       |
-- > +----------------------+----------------------+-----------------------+
-- > | 'VK_EXTERNAL_MEMORY_ | Must match           | Must match            |
-- > | HANDLE_TYPE_D3D12_HE |                      |                       |
-- > | AP_BIT'              |                      |                       |
-- > +----------------------+----------------------+-----------------------+
-- > | 'VK_EXTERNAL_MEMORY_ | Must match           | Must match            |
-- > | HANDLE_TYPE_D3D12_RE |                      |                       |
-- > | SOURCE_BIT'          |                      |                       |
-- > +----------------------+----------------------+-----------------------+
-- >
-- > External memory handle types compatibility
--
-- = See Also
--
-- 'VkExternalMemoryHandleTypeFlags',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_external_memory_fd.VkImportMemoryFdInfoKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_external_memory_host.VkImportMemoryHostPointerInfoEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_external_memory_win32.VkImportMemoryWin32HandleInfoKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_external_memory_fd.VkMemoryGetFdInfoKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_external_memory_win32.VkMemoryGetWin32HandleInfoKHR',
-- 'VkPhysicalDeviceExternalBufferInfo',
-- 'VkPhysicalDeviceExternalImageFormatInfo',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_external_memory_fd.vkGetMemoryFdPropertiesKHR',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_external_memory_host.vkGetMemoryHostPointerPropertiesEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_external_memory_win32.vkGetMemoryWin32HandlePropertiesKHR'
newtype VkExternalMemoryHandleTypeFlagBits = VkExternalMemoryHandleTypeFlagBits VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkExternalMemoryHandleTypeFlagBits where
  showsPrec _ VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT"
  showsPrec _ VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT"
  showsPrec _ VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT"
  showsPrec _ VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT"
  showsPrec _ VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT"
  showsPrec _ VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT"
  showsPrec _ VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT"
  -- The following values are from extensions, the patterns themselves are exported from the extension modules
  showsPrec _ (VkExternalMemoryHandleTypeFlagBits 0x00000200) = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT"
  showsPrec _ (VkExternalMemoryHandleTypeFlagBits 0x00000400) = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID"
  showsPrec _ (VkExternalMemoryHandleTypeFlagBits 0x00000080) = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT"
  showsPrec _ (VkExternalMemoryHandleTypeFlagBits 0x00000100) = showString "VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT"
  showsPrec p (VkExternalMemoryHandleTypeFlagBits x) = showParen (p >= 11) (showString "VkExternalMemoryHandleTypeFlagBits " . showsPrec 11 x)

instance Read VkExternalMemoryHandleTypeFlagBits where
  readPrec = parens ( choose [ ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT",         pure VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT)
                             , ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT",      pure VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT)
                             , ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT",  pure VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT)
                             , ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT",     pure VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT)
                             , ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT", pure VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT)
                             , ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT",        pure VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT)
                             , ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT",    pure VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT)
                             , -- The following values are from extensions, the patterns themselves are exported from the extension modules
                               ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT",                     pure (VkExternalMemoryHandleTypeFlagBits 0x00000200))
                             , ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID", pure (VkExternalMemoryHandleTypeFlagBits 0x00000400))
                             , ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_ALLOCATION_BIT_EXT",             pure (VkExternalMemoryHandleTypeFlagBits 0x00000080))
                             , ("VK_EXTERNAL_MEMORY_HANDLE_TYPE_HOST_MAPPED_FOREIGN_MEMORY_BIT_EXT",  pure (VkExternalMemoryHandleTypeFlagBits 0x00000100))
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkExternalMemoryHandleTypeFlagBits")
                        v <- step readPrec
                        pure (VkExternalMemoryHandleTypeFlagBits v)
                        )
                    )

-- | 'VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT' specifies a POSIX file
-- descriptor handle that has only limited valid usage outside of Vulkan
-- and other compatible APIs. It /must/ be compatible with the POSIX system
-- calls @dup@, @dup2@, @close@, and the non-standard system call @dup3@.
-- Additionally, it /must/ be transportable over a socket using an
-- @SCM_RIGHTS@ control message. It owns a reference to the underlying
-- memory resource represented by its Vulkan memory object.
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT :: VkExternalMemoryHandleTypeFlagBits
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT = VkExternalMemoryHandleTypeFlagBits 0x00000001

-- | 'VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT' specifies an NT handle
-- that has only limited valid usage outside of Vulkan and other compatible
-- APIs. It /must/ be compatible with the functions @DuplicateHandle@,
-- @CloseHandle@, @CompareObjectHandles@, @GetHandleInformation@, and
-- @SetHandleInformation@. It owns a reference to the underlying memory
-- resource represented by its Vulkan memory object.
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT :: VkExternalMemoryHandleTypeFlagBits
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT = VkExternalMemoryHandleTypeFlagBits 0x00000002

-- | 'VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT' specifies a global
-- share handle that has only limited valid usage outside of Vulkan and
-- other compatible APIs. It is not compatible with any native APIs. It
-- does not own a reference to the underlying memory resource represented
-- its Vulkan memory object, and will therefore become invalid when all
-- Vulkan memory objects associated with it are destroyed.
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT :: VkExternalMemoryHandleTypeFlagBits
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT = VkExternalMemoryHandleTypeFlagBits 0x00000004

-- | 'VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT' specifies an NT
-- handle returned by @IDXGIResource1@::@CreateSharedHandle@ referring to a
-- Direct3D 10 or 11 texture resource. It owns a reference to the memory
-- used by the Direct3D resource.
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT :: VkExternalMemoryHandleTypeFlagBits
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT = VkExternalMemoryHandleTypeFlagBits 0x00000008

-- | 'VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT' specifies a
-- global share handle returned by @IDXGIResource@::@GetSharedHandle@
-- referring to a Direct3D 10 or 11 texture resource. It does not own a
-- reference to the underlying Direct3D resource, and will therefore become
-- invalid when all Vulkan memory objects and Direct3D resources associated
-- with it are destroyed.
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT :: VkExternalMemoryHandleTypeFlagBits
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT = VkExternalMemoryHandleTypeFlagBits 0x00000010

-- | 'VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT' specifies an NT handle
-- returned by @ID3D12Device@::@CreateSharedHandle@ referring to a Direct3D
-- 12 heap resource. It owns a reference to the resources used by the
-- Direct3D heap.
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT :: VkExternalMemoryHandleTypeFlagBits
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT = VkExternalMemoryHandleTypeFlagBits 0x00000020

-- | 'VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT' specifies an NT
-- handle returned by @ID3D12Device@::@CreateSharedHandle@ referring to a
-- Direct3D 12 committed resource. It owns a reference to the memory used
-- by the Direct3D resource.
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT :: VkExternalMemoryHandleTypeFlagBits
pattern VK_EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT = VkExternalMemoryHandleTypeFlagBits 0x00000040

-- | VkExternalMemoryHandleTypeFlags - Bitmask of
-- VkExternalMemoryHandleTypeFlagBits
--
-- = Description
--
-- 'VkExternalMemoryHandleTypeFlags' is a bitmask type for setting a mask
-- of zero or more 'VkExternalMemoryHandleTypeFlagBits'.
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_external_memory.VkExportMemoryAllocateInfo',
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_external_memory.VkExternalMemoryBufferCreateInfo',
-- 'VkExternalMemoryHandleTypeFlagBits',
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_external_memory.VkExternalMemoryImageCreateInfo',
-- 'VkExternalMemoryProperties'
type VkExternalMemoryHandleTypeFlags = VkExternalMemoryHandleTypeFlagBits

-- | VkExternalMemoryProperties - Structure specifying external memory handle
-- type capabilities
--
-- = Description
--
-- @compatibleHandleTypes@ /must/ include at least @handleType@. Inclusion
-- of a handle type in @compatibleHandleTypes@ does not imply the values
-- returned in
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_physical_device_properties2.VkImageFormatProperties2'
-- will be the same when
-- 'VkPhysicalDeviceExternalImageFormatInfo'::@handleType@ is set to that
-- type. The application is responsible for querying the capabilities of
-- all handle types intended for concurrent use in a single image and
-- intersecting them to obtain the compatible set of capabilities.
--
-- = See Also
--
-- 'VkExternalBufferProperties', 'VkExternalImageFormatProperties',
-- 'VkExternalMemoryFeatureFlags', 'VkExternalMemoryHandleTypeFlags'
data VkExternalMemoryProperties = VkExternalMemoryProperties
  { -- | @externalMemoryFeatures@ is a bitmask of
  -- 'VkExternalMemoryFeatureFlagBits' specifying the features of
  -- @handleType@.
  vkExternalMemoryFeatures :: VkExternalMemoryFeatureFlags
  , -- | @exportFromImportedHandleTypes@ is a bitmask of
  -- 'VkExternalMemoryHandleTypeFlagBits' specifying which types of imported
  -- handle @handleType@ /can/ be exported from.
  vkExportFromImportedHandleTypes :: VkExternalMemoryHandleTypeFlags
  , -- | @compatibleHandleTypes@ is a bitmask of
  -- 'VkExternalMemoryHandleTypeFlagBits' specifying handle types which /can/
  -- be specified at the same time as @handleType@ when creating an image
  -- compatible with external memory.
  vkCompatibleHandleTypes :: VkExternalMemoryHandleTypeFlags
  }
  deriving (Eq, Show)

instance Storable VkExternalMemoryProperties where
  sizeOf ~_ = 12
  alignment ~_ = 4
  peek ptr = VkExternalMemoryProperties <$> peek (ptr `plusPtr` 0)
                                        <*> peek (ptr `plusPtr` 4)
                                        <*> peek (ptr `plusPtr` 8)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkExternalMemoryFeatures (poked :: VkExternalMemoryProperties))
                *> poke (ptr `plusPtr` 4) (vkExportFromImportedHandleTypes (poked :: VkExternalMemoryProperties))
                *> poke (ptr `plusPtr` 8) (vkCompatibleHandleTypes (poked :: VkExternalMemoryProperties))

instance Zero VkExternalMemoryProperties where
  zero = VkExternalMemoryProperties zero
                                    zero
                                    zero

-- | VkPhysicalDeviceExternalBufferInfo - Structure specifying buffer
-- creation parameters
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Buffer.VkBufferCreateFlags',
-- 'Graphics.Vulkan.C.Core10.Buffer.VkBufferUsageFlags',
-- 'VkExternalMemoryHandleTypeFlagBits',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkGetPhysicalDeviceExternalBufferProperties',
-- 'Graphics.Vulkan.C.Extensions.VK_KHR_external_memory_capabilities.vkGetPhysicalDeviceExternalBufferPropertiesKHR'
data VkPhysicalDeviceExternalBufferInfo = VkPhysicalDeviceExternalBufferInfo
  { -- | @sType@ /must/ be
  -- 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO'
  vkSType :: VkStructureType
  , -- | @pNext@ /must/ be @NULL@
  vkPNext :: Ptr ()
  , -- | @flags@ /must/ be a valid combination of
  -- 'Graphics.Vulkan.C.Core10.Buffer.VkBufferCreateFlagBits' values
  vkFlags :: VkBufferCreateFlags
  , -- | @usage@ /must/ not be @0@
  vkUsage :: VkBufferUsageFlags
  , -- | @handleType@ /must/ be a valid 'VkExternalMemoryHandleTypeFlagBits'
  -- value
  vkHandleType :: VkExternalMemoryHandleTypeFlagBits
  }
  deriving (Eq, Show)

instance Storable VkPhysicalDeviceExternalBufferInfo where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek ptr = VkPhysicalDeviceExternalBufferInfo <$> peek (ptr `plusPtr` 0)
                                                <*> peek (ptr `plusPtr` 8)
                                                <*> peek (ptr `plusPtr` 16)
                                                <*> peek (ptr `plusPtr` 20)
                                                <*> peek (ptr `plusPtr` 24)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPhysicalDeviceExternalBufferInfo))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPhysicalDeviceExternalBufferInfo))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkPhysicalDeviceExternalBufferInfo))
                *> poke (ptr `plusPtr` 20) (vkUsage (poked :: VkPhysicalDeviceExternalBufferInfo))
                *> poke (ptr `plusPtr` 24) (vkHandleType (poked :: VkPhysicalDeviceExternalBufferInfo))

instance Zero VkPhysicalDeviceExternalBufferInfo where
  zero = VkPhysicalDeviceExternalBufferInfo VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO
                                            zero
                                            zero
                                            zero
                                            zero

-- | VkPhysicalDeviceExternalImageFormatInfo - Structure specifying external
-- image creation parameters
--
-- = Description
--
-- If @handleType@ is 0,
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_physical_device_properties2.vkGetPhysicalDeviceImageFormatProperties2'
-- will behave as if 'VkPhysicalDeviceExternalImageFormatInfo' was not
-- present, and 'VkExternalImageFormatProperties' will be ignored.
--
-- If @handleType@ is not compatible with the @format@, @type@, @tiling@,
-- @usage@, and @flags@ specified in
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_physical_device_properties2.VkPhysicalDeviceImageFormatInfo2',
-- then
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_physical_device_properties2.vkGetPhysicalDeviceImageFormatProperties2'
-- returns 'Graphics.Vulkan.C.Core10.Core.VK_ERROR_FORMAT_NOT_SUPPORTED'.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO'
--
-- -   If @handleType@ is not @0@, @handleType@ /must/ be a valid
--     'VkExternalMemoryHandleTypeFlagBits' value
--
-- = See Also
--
-- 'VkExternalMemoryHandleTypeFlagBits',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType'
data VkPhysicalDeviceExternalImageFormatInfo = VkPhysicalDeviceExternalImageFormatInfo
  { -- | @sType@ is the type of this structure.
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @handleType@ is a 'VkExternalMemoryHandleTypeFlagBits' value specifying
  -- the memory handle type that will be used with the memory associated with
  -- the image.
  vkHandleType :: VkExternalMemoryHandleTypeFlagBits
  }
  deriving (Eq, Show)

instance Storable VkPhysicalDeviceExternalImageFormatInfo where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek ptr = VkPhysicalDeviceExternalImageFormatInfo <$> peek (ptr `plusPtr` 0)
                                                     <*> peek (ptr `plusPtr` 8)
                                                     <*> peek (ptr `plusPtr` 16)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPhysicalDeviceExternalImageFormatInfo))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPhysicalDeviceExternalImageFormatInfo))
                *> poke (ptr `plusPtr` 16) (vkHandleType (poked :: VkPhysicalDeviceExternalImageFormatInfo))

instance Zero VkPhysicalDeviceExternalImageFormatInfo where
  zero = VkPhysicalDeviceExternalImageFormatInfo VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO
                                                 zero
                                                 zero

-- | VkPhysicalDeviceIDProperties - Structure specifying IDs related to the
-- physical device
--
-- = Description
--
-- @deviceUUID@ /must/ be immutable for a given device across instances,
-- processes, driver APIs, driver versions, and system reboots.
--
-- Applications /can/ compare the @driverUUID@ value across instance and
-- process boundaries, and /can/ make similar queries in external APIs to
-- determine whether they are capable of sharing memory objects and
-- resources using them with the device.
--
-- @deviceUUID@ and\/or @driverUUID@ /must/ be used to determine whether a
-- particular external object can be shared between driver components,
-- where such a restriction exists as defined in the compatibility table
-- for the particular object type:
--
-- If @deviceLUIDValid@ is 'Graphics.Vulkan.C.Core10.Core.VK_FALSE', the
-- values of @deviceLUID@ and @deviceNodeMask@ are undefined. If
-- @deviceLUIDValid@ is 'Graphics.Vulkan.C.Core10.Core.VK_TRUE' and Vulkan
-- is running on the Windows operating system, the contents of @deviceLUID@
-- /can/ be cast to an @LUID@ object and /must/ be equal to the locally
-- unique identifier of a @IDXGIAdapter1@ object that corresponds to
-- @physicalDevice@. If @deviceLUIDValid@ is
-- 'Graphics.Vulkan.C.Core10.Core.VK_TRUE', @deviceNodeMask@ /must/ contain
-- exactly one bit. If Vulkan is running on an operating system that
-- supports the Direct3D 12 API and @physicalDevice@ corresponds to an
-- individual device in a linked device adapter, @deviceNodeMask@
-- identifies the Direct3D 12 node corresponding to @physicalDevice@.
-- Otherwise, @deviceNodeMask@ /must/ be @1@.
--
-- __Note__
--
-- Although they have identical descriptions,
-- 'VkPhysicalDeviceIDProperties'::@deviceUUID@ may differ from
-- 'Graphics.Vulkan.C.Core11.Promoted_from_VK_KHR_get_physical_device_properties2.VkPhysicalDeviceProperties2'::@pipelineCacheUUID@.
-- The former is intended to identify and correlate devices across API and
-- driver boundaries, while the latter is used to identify a compatible
-- device and driver combination to use when serializing and de-serializing
-- pipeline state.
--
-- __Note__
--
-- While 'VkPhysicalDeviceIDProperties'::@deviceUUID@ is specified to
-- remain consistent across driver versions and system reboots, it is not
-- intended to be usable as a serializable persistent identifier for a
-- device. It may change when a device is physically added to, removed
-- from, or moved to a different connector in a system while that system is
-- powered down. Further, there is no reasonable way to verify with
-- conformance testing that a given device retains the same UUID in a given
-- system across all driver versions supported in that system. While
-- implementations should make every effort to report consistent device
-- UUIDs across driver versions, applications should avoid relying on the
-- persistence of this value for uses other than identifying compatible
-- devices for external object sharing purposes.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.Core.VkBool32',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType'
data VkPhysicalDeviceIDProperties = VkPhysicalDeviceIDProperties
  { -- | @sType@ /must/ be 'VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES'
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @deviceUUID@ is an array of size
  -- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_UUID_SIZE', containing
  -- 8-bit values that represent a universally unique identifier for the
  -- device.
  vkDeviceUUID :: Vector VK_UUID_SIZE Word8
  , -- | @driverUUID@ is an array of size
  -- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VK_UUID_SIZE', containing
  -- 8-bit values that represent a universally unique identifier for the
  -- driver build in use by the device.
  vkDriverUUID :: Vector VK_UUID_SIZE Word8
  , -- | @deviceLUID@ is an array of size 'VK_LUID_SIZE', containing 8-bit values
  -- that represent a locally unique identifier for the device.
  vkDeviceLUID :: Vector VK_LUID_SIZE Word8
  , -- | @deviceNodeMask@ is a bitfield identifying the node within a linked
  -- device adapter corresponding to the device.
  vkDeviceNodeMask :: Word32
  , -- | @deviceLUIDValid@ is a boolean value that will be
  -- 'Graphics.Vulkan.C.Core10.Core.VK_TRUE' if @deviceLUID@ contains a valid
  -- LUID and @deviceNodeMask@ contains a valid node mask, and
  -- 'Graphics.Vulkan.C.Core10.Core.VK_FALSE' if they do not.
  vkDeviceLUIDValid :: VkBool32
  }
  deriving (Eq, Show)

instance Storable VkPhysicalDeviceIDProperties where
  sizeOf ~_ = 64
  alignment ~_ = 8
  peek ptr = VkPhysicalDeviceIDProperties <$> peek (ptr `plusPtr` 0)
                                          <*> peek (ptr `plusPtr` 8)
                                          <*> peek (ptr `plusPtr` 16)
                                          <*> peek (ptr `plusPtr` 32)
                                          <*> peek (ptr `plusPtr` 48)
                                          <*> peek (ptr `plusPtr` 56)
                                          <*> peek (ptr `plusPtr` 60)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkPhysicalDeviceIDProperties))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkPhysicalDeviceIDProperties))
                *> poke (ptr `plusPtr` 16) (vkDeviceUUID (poked :: VkPhysicalDeviceIDProperties))
                *> poke (ptr `plusPtr` 32) (vkDriverUUID (poked :: VkPhysicalDeviceIDProperties))
                *> poke (ptr `plusPtr` 48) (vkDeviceLUID (poked :: VkPhysicalDeviceIDProperties))
                *> poke (ptr `plusPtr` 56) (vkDeviceNodeMask (poked :: VkPhysicalDeviceIDProperties))
                *> poke (ptr `plusPtr` 60) (vkDeviceLUIDValid (poked :: VkPhysicalDeviceIDProperties))

instance Zero VkPhysicalDeviceIDProperties where
  zero = VkPhysicalDeviceIDProperties VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES
                                      zero
                                      zero
                                      zero
                                      zero
                                      zero
                                      zero

-- | vkGetPhysicalDeviceExternalBufferProperties - Query external handle
-- types supported by buffers
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device from which to query the
--     buffer capabilities.
--
-- -   @pExternalBufferInfo@ points to an instance of the
--     'VkPhysicalDeviceExternalBufferInfo' structure, describing the
--     parameters that would be consumed by
--     'Graphics.Vulkan.C.Core10.Buffer.vkCreateBuffer'.
--
-- -   @pExternalBufferProperties@ points to an instance of the
--     'VkExternalBufferProperties' structure in which capabilities are
--     returned.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'VkExternalBufferProperties',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkPhysicalDevice',
-- 'VkPhysicalDeviceExternalBufferInfo'
#if defined(EXPOSE_CORE11_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkGetPhysicalDeviceExternalBufferProperties" vkGetPhysicalDeviceExternalBufferProperties :: ("physicalDevice" ::: VkPhysicalDevice) -> ("pExternalBufferInfo" ::: Ptr VkPhysicalDeviceExternalBufferInfo) -> ("pExternalBufferProperties" ::: Ptr VkExternalBufferProperties) -> IO ()
#else
vkGetPhysicalDeviceExternalBufferProperties :: InstanceCmds -> ("physicalDevice" ::: VkPhysicalDevice) -> ("pExternalBufferInfo" ::: Ptr VkPhysicalDeviceExternalBufferInfo) -> ("pExternalBufferProperties" ::: Ptr VkExternalBufferProperties) -> IO ()
vkGetPhysicalDeviceExternalBufferProperties deviceCmds = mkVkGetPhysicalDeviceExternalBufferProperties (pVkGetPhysicalDeviceExternalBufferProperties deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceExternalBufferProperties
  :: FunPtr (("physicalDevice" ::: VkPhysicalDevice) -> ("pExternalBufferInfo" ::: Ptr VkPhysicalDeviceExternalBufferInfo) -> ("pExternalBufferProperties" ::: Ptr VkExternalBufferProperties) -> IO ()) -> (("physicalDevice" ::: VkPhysicalDevice) -> ("pExternalBufferInfo" ::: Ptr VkPhysicalDeviceExternalBufferInfo) -> ("pExternalBufferProperties" ::: Ptr VkExternalBufferProperties) -> IO ())
#endif

type FN_vkGetPhysicalDeviceExternalBufferProperties = ("physicalDevice" ::: VkPhysicalDevice) -> ("pExternalBufferInfo" ::: Ptr VkPhysicalDeviceExternalBufferInfo) -> ("pExternalBufferProperties" ::: Ptr VkExternalBufferProperties) -> IO ()
type PFN_vkGetPhysicalDeviceExternalBufferProperties = FunPtr FN_vkGetPhysicalDeviceExternalBufferProperties

-- No documentation found for TopLevel "VK_LUID_SIZE"
type VK_LUID_SIZE = 8
-- No documentation found for Nested "Integral a => a" "VK_LUID_SIZE"
pattern VK_LUID_SIZE :: Integral a => a
pattern VK_LUID_SIZE = 8

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES"
pattern VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES :: VkStructureType
pattern VK_STRUCTURE_TYPE_EXTERNAL_BUFFER_PROPERTIES = VkStructureType 1000071003

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES"
pattern VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES :: VkStructureType
pattern VK_STRUCTURE_TYPE_EXTERNAL_IMAGE_FORMAT_PROPERTIES = VkStructureType 1000071001

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO = VkStructureType 1000071002

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO = VkStructureType 1000071000

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES"
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES :: VkStructureType
pattern VK_STRUCTURE_TYPE_PHYSICAL_DEVICE_ID_PROPERTIES = VkStructureType 1000071004
