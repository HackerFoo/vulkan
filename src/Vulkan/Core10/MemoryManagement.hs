{-# language CPP #-}
module Vulkan.Core10.MemoryManagement  ( getBufferMemoryRequirements
                                       , bindBufferMemory
                                       , getImageMemoryRequirements
                                       , bindImageMemory
                                       , MemoryRequirements(..)
                                       ) where

import Control.Monad (unless)
import Control.Monad.IO.Class (liftIO)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import GHC.Base (when)
import GHC.IO (throwIO)
import GHC.Ptr (nullFunPtr)
import Foreign.Ptr (plusPtr)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Control.Monad.IO.Class (MonadIO)
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import GHC.IO.Exception (IOErrorType(..))
import GHC.IO.Exception (IOException(..))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Data.Word (Word32)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Vulkan.NamedType ((:::))
import Vulkan.Core10.Handles (Buffer)
import Vulkan.Core10.Handles (Buffer(..))
import Vulkan.Core10.Handles (Device)
import Vulkan.Core10.Handles (Device(..))
import Vulkan.Dynamic (DeviceCmds(pVkBindBufferMemory))
import Vulkan.Dynamic (DeviceCmds(pVkBindImageMemory))
import Vulkan.Dynamic (DeviceCmds(pVkGetBufferMemoryRequirements))
import Vulkan.Dynamic (DeviceCmds(pVkGetImageMemoryRequirements))
import Vulkan.Core10.Handles (DeviceMemory)
import Vulkan.Core10.Handles (DeviceMemory(..))
import Vulkan.Core10.BaseType (DeviceSize)
import Vulkan.Core10.Handles (Device_T)
import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (FromCStruct(..))
import Vulkan.Core10.Handles (Image)
import Vulkan.Core10.Handles (Image(..))
import Vulkan.Core10.Enums.Result (Result)
import Vulkan.Core10.Enums.Result (Result(..))
import Vulkan.CStruct (ToCStruct)
import Vulkan.CStruct (ToCStruct(..))
import Vulkan.Exception (VulkanException(..))
import Vulkan.Zero (Zero(..))
import Vulkan.Core10.Enums.Result (Result(SUCCESS))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetBufferMemoryRequirements
  :: FunPtr (Ptr Device_T -> Buffer -> Ptr MemoryRequirements -> IO ()) -> Ptr Device_T -> Buffer -> Ptr MemoryRequirements -> IO ()

-- | vkGetBufferMemoryRequirements - Returns the memory requirements for
-- specified Vulkan object
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the buffer.
--
-- -   @buffer@ is the buffer to query.
--
-- -   @pMemoryRequirements@ is a pointer to a 'MemoryRequirements'
--     structure in which the memory requirements of the buffer object are
--     returned.
--
-- == Valid Usage
--
-- -   If @buffer@ was created with the
--     'Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID'
--     external memory handle type, then @buffer@ /must/ be bound to memory
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid 'Vulkan.Core10.Handles.Device' handle
--
-- -   @buffer@ /must/ be a valid 'Vulkan.Core10.Handles.Buffer' handle
--
-- -   @pMemoryRequirements@ /must/ be a valid pointer to a
--     'MemoryRequirements' structure
--
-- -   @buffer@ /must/ have been created, allocated, or retrieved from
--     @device@
--
-- = See Also
--
-- 'Vulkan.Core10.Handles.Buffer', 'Vulkan.Core10.Handles.Device',
-- 'MemoryRequirements'
getBufferMemoryRequirements :: forall io . MonadIO io => Device -> Buffer -> io (MemoryRequirements)
getBufferMemoryRequirements device buffer = liftIO . evalContT $ do
  let vkGetBufferMemoryRequirementsPtr = pVkGetBufferMemoryRequirements (deviceCmds (device :: Device))
  lift $ unless (vkGetBufferMemoryRequirementsPtr /= nullFunPtr) $
    throwIO $ IOError Nothing InvalidArgument "" "The function pointer for vkGetBufferMemoryRequirements is null" Nothing Nothing
  let vkGetBufferMemoryRequirements' = mkVkGetBufferMemoryRequirements vkGetBufferMemoryRequirementsPtr
  pPMemoryRequirements <- ContT (withZeroCStruct @MemoryRequirements)
  lift $ vkGetBufferMemoryRequirements' (deviceHandle (device)) (buffer) (pPMemoryRequirements)
  pMemoryRequirements <- lift $ peekCStruct @MemoryRequirements pPMemoryRequirements
  pure $ (pMemoryRequirements)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkBindBufferMemory
  :: FunPtr (Ptr Device_T -> Buffer -> DeviceMemory -> DeviceSize -> IO Result) -> Ptr Device_T -> Buffer -> DeviceMemory -> DeviceSize -> IO Result

-- | vkBindBufferMemory - Bind device memory to a buffer object
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the buffer and memory.
--
-- -   @buffer@ is the buffer to be attached to memory.
--
-- -   @memory@ is a 'Vulkan.Core10.Handles.DeviceMemory' object describing
--     the device memory to attach.
--
-- -   @memoryOffset@ is the start offset of the region of @memory@ which
--     is to be bound to the buffer. The number of bytes returned in the
--     'MemoryRequirements'::@size@ member in @memory@, starting from
--     @memoryOffset@ bytes, will be bound to the specified buffer.
--
-- = Description
--
-- 'bindBufferMemory' is equivalent to passing the same parameters through
-- 'Vulkan.Core11.Promoted_From_VK_KHR_bind_memory2.BindBufferMemoryInfo'
-- to 'Vulkan.Core11.Promoted_From_VK_KHR_bind_memory2.bindBufferMemory2'.
--
-- == Valid Usage
--
-- -   @buffer@ /must/ not already be backed by a memory object
--
-- -   @buffer@ /must/ not have been created with any sparse memory binding
--     flags
--
-- -   @memoryOffset@ /must/ be less than the size of @memory@
--
-- -   @memory@ /must/ have been allocated using one of the memory types
--     allowed in the @memoryTypeBits@ member of the 'MemoryRequirements'
--     structure returned from a call to 'getBufferMemoryRequirements' with
--     @buffer@
--
-- -   @memoryOffset@ /must/ be an integer multiple of the @alignment@
--     member of the 'MemoryRequirements' structure returned from a call to
--     'getBufferMemoryRequirements' with @buffer@
--
-- -   The @size@ member of the 'MemoryRequirements' structure returned
--     from a call to 'getBufferMemoryRequirements' with @buffer@ /must/ be
--     less than or equal to the size of @memory@ minus @memoryOffset@
--
-- -   If @buffer@ requires a dedicated allocation(as reported by
--     'Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.getBufferMemoryRequirements2'
--     in
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedRequirements'::requiresDedicatedAllocation
--     for @buffer@), @memory@ /must/ have been created with
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'::@buffer@
--     equal to @buffer@
--
-- -   If the 'Vulkan.Core10.Memory.MemoryAllocateInfo' provided when
--     @memory@ was allocated included a
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure in its @pNext@ chain, and
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'::@buffer@
--     was not 'Vulkan.Core10.APIConstants.NULL_HANDLE', then @buffer@
--     /must/ equal
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'::@buffer@,
--     and @memoryOffset@ /must/ be zero
--
-- -   If buffer was created with the
--     'Vulkan.Core10.Enums.BufferCreateFlagBits.BUFFER_CREATE_PROTECTED_BIT'
--     bit set, the buffer /must/ be bound to a memory object allocated
--     with a memory type that reports
--     'Vulkan.Core10.Enums.MemoryPropertyFlagBits.MEMORY_PROPERTY_PROTECTED_BIT'
--
-- -   If buffer was created with the
--     'Vulkan.Core10.Enums.BufferCreateFlagBits.BUFFER_CREATE_PROTECTED_BIT'
--     bit not set, the buffer /must/ not be bound to a memory object
--     created with a memory type that reports
--     'Vulkan.Core10.Enums.MemoryPropertyFlagBits.MEMORY_PROPERTY_PROTECTED_BIT'
--
-- -   If @buffer@ was created with
--     'Vulkan.Extensions.VK_NV_dedicated_allocation.DedicatedAllocationBufferCreateInfoNV'::@dedicatedAllocation@
--     equal to 'Vulkan.Core10.BaseType.TRUE', @memory@ /must/ have been
--     created with
--     'Vulkan.Extensions.VK_NV_dedicated_allocation.DedicatedAllocationMemoryAllocateInfoNV'::@buffer@
--     equal to a buffer handle created with identical creation parameters
--     to @buffer@ and @memoryOffset@ /must/ be zero
--
-- -   If the value of
--     'Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExportMemoryAllocateInfo'::@handleTypes@
--     used to allocate @memory@ is not @0@, it /must/ include at least one
--     of the handles set in
--     'Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryBufferCreateInfo'::@handleTypes@
--     when @buffer@ was created
--
-- -   If @memory@ was created by a memory import operation, that is not
--     'Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.ImportAndroidHardwareBufferInfoANDROID'
--     with a non-@NULL@ @buffer@ value, the external handle type of the
--     imported memory /must/ also have been set in
--     'Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryBufferCreateInfo'::@handleTypes@
--     when @buffer@ was created
--
-- -   If @memory@ was created with the
--     'Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.ImportAndroidHardwareBufferInfoANDROID'
--     memory import operation with a non-@NULL@ @buffer@ value,
--     'Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID'
--     /must/ also have been set in
--     'Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryBufferCreateInfo'::@handleTypes@
--     when @buffer@ was created
--
-- -   If the
--     'Vulkan.Core12.Promoted_From_VK_KHR_buffer_device_address.PhysicalDeviceBufferDeviceAddressFeatures'::@bufferDeviceAddress@
--     feature is enabled and @buffer@ was created with the
--     'Vulkan.Core10.Enums.BufferUsageFlagBits.BUFFER_USAGE_SHADER_DEVICE_ADDRESS_BIT'
--     bit set, @memory@ /must/ have been allocated with the
--     'Vulkan.Core11.Enums.MemoryAllocateFlagBits.MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT'
--     bit set
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid 'Vulkan.Core10.Handles.Device' handle
--
-- -   @buffer@ /must/ be a valid 'Vulkan.Core10.Handles.Buffer' handle
--
-- -   @memory@ /must/ be a valid 'Vulkan.Core10.Handles.DeviceMemory'
--     handle
--
-- -   @buffer@ /must/ have been created, allocated, or retrieved from
--     @device@
--
-- -   @memory@ /must/ have been created, allocated, or retrieved from
--     @device@
--
-- == Host Synchronization
--
-- -   Host access to @buffer@ /must/ be externally synchronized
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'Vulkan.Extensions.VK_KHR_buffer_device_address.ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS_KHR'
--
-- = See Also
--
-- 'Vulkan.Core10.Handles.Buffer', 'Vulkan.Core10.Handles.Device',
-- 'Vulkan.Core10.Handles.DeviceMemory',
-- 'Vulkan.Core10.BaseType.DeviceSize'
bindBufferMemory :: forall io . MonadIO io => Device -> Buffer -> DeviceMemory -> ("memoryOffset" ::: DeviceSize) -> io ()
bindBufferMemory device buffer memory memoryOffset = liftIO $ do
  let vkBindBufferMemoryPtr = pVkBindBufferMemory (deviceCmds (device :: Device))
  unless (vkBindBufferMemoryPtr /= nullFunPtr) $
    throwIO $ IOError Nothing InvalidArgument "" "The function pointer for vkBindBufferMemory is null" Nothing Nothing
  let vkBindBufferMemory' = mkVkBindBufferMemory vkBindBufferMemoryPtr
  r <- vkBindBufferMemory' (deviceHandle (device)) (buffer) (memory) (memoryOffset)
  when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetImageMemoryRequirements
  :: FunPtr (Ptr Device_T -> Image -> Ptr MemoryRequirements -> IO ()) -> Ptr Device_T -> Image -> Ptr MemoryRequirements -> IO ()

-- | vkGetImageMemoryRequirements - Returns the memory requirements for
-- specified Vulkan object
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the image.
--
-- -   @image@ is the image to query.
--
-- -   @pMemoryRequirements@ is a pointer to a 'MemoryRequirements'
--     structure in which the memory requirements of the image object are
--     returned.
--
-- == Valid Usage
--
-- -   @image@ /must/ not have been created with the
--     'Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_DISJOINT_BIT'
--     flag set
--
-- -   If @image@ was created with the
--     'Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID'
--     external memory handle type, then @image@ /must/ be bound to memory
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid 'Vulkan.Core10.Handles.Device' handle
--
-- -   @image@ /must/ be a valid 'Vulkan.Core10.Handles.Image' handle
--
-- -   @pMemoryRequirements@ /must/ be a valid pointer to a
--     'MemoryRequirements' structure
--
-- -   @image@ /must/ have been created, allocated, or retrieved from
--     @device@
--
-- = See Also
--
-- 'Vulkan.Core10.Handles.Device', 'Vulkan.Core10.Handles.Image',
-- 'MemoryRequirements'
getImageMemoryRequirements :: forall io . MonadIO io => Device -> Image -> io (MemoryRequirements)
getImageMemoryRequirements device image = liftIO . evalContT $ do
  let vkGetImageMemoryRequirementsPtr = pVkGetImageMemoryRequirements (deviceCmds (device :: Device))
  lift $ unless (vkGetImageMemoryRequirementsPtr /= nullFunPtr) $
    throwIO $ IOError Nothing InvalidArgument "" "The function pointer for vkGetImageMemoryRequirements is null" Nothing Nothing
  let vkGetImageMemoryRequirements' = mkVkGetImageMemoryRequirements vkGetImageMemoryRequirementsPtr
  pPMemoryRequirements <- ContT (withZeroCStruct @MemoryRequirements)
  lift $ vkGetImageMemoryRequirements' (deviceHandle (device)) (image) (pPMemoryRequirements)
  pMemoryRequirements <- lift $ peekCStruct @MemoryRequirements pPMemoryRequirements
  pure $ (pMemoryRequirements)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkBindImageMemory
  :: FunPtr (Ptr Device_T -> Image -> DeviceMemory -> DeviceSize -> IO Result) -> Ptr Device_T -> Image -> DeviceMemory -> DeviceSize -> IO Result

-- | vkBindImageMemory - Bind device memory to an image object
--
-- = Parameters
--
-- -   @device@ is the logical device that owns the image and memory.
--
-- -   @image@ is the image.
--
-- -   @memory@ is the 'Vulkan.Core10.Handles.DeviceMemory' object
--     describing the device memory to attach.
--
-- -   @memoryOffset@ is the start offset of the region of @memory@ which
--     is to be bound to the image. The number of bytes returned in the
--     'MemoryRequirements'::@size@ member in @memory@, starting from
--     @memoryOffset@ bytes, will be bound to the specified image.
--
-- = Description
--
-- 'bindImageMemory' is equivalent to passing the same parameters through
-- 'Vulkan.Core11.Promoted_From_VK_KHR_bind_memory2.BindImageMemoryInfo' to
-- 'Vulkan.Core11.Promoted_From_VK_KHR_bind_memory2.bindImageMemory2'.
--
-- == Valid Usage
--
-- -   @image@ /must/ not have been created with the
--     'Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_DISJOINT_BIT'
--     set
--
-- -   @image@ /must/ not already be backed by a memory object
--
-- -   @image@ /must/ not have been created with any sparse memory binding
--     flags
--
-- -   @memoryOffset@ /must/ be less than the size of @memory@
--
-- -   @memory@ /must/ have been allocated using one of the memory types
--     allowed in the @memoryTypeBits@ member of the 'MemoryRequirements'
--     structure returned from a call to 'getImageMemoryRequirements' with
--     @image@
--
-- -   @memoryOffset@ /must/ be an integer multiple of the @alignment@
--     member of the 'MemoryRequirements' structure returned from a call to
--     'getImageMemoryRequirements' with @image@
--
-- -   The difference of the size of @memory@ and @memoryOffset@ /must/ be
--     greater than or equal to the @size@ member of the
--     'MemoryRequirements' structure returned from a call to
--     'getImageMemoryRequirements' with the same @image@
--
-- -   If @image@ requires a dedicated allocation (as reported by
--     'Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.getImageMemoryRequirements2'
--     in
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedRequirements'::requiresDedicatedAllocation
--     for @image@), @memory@ /must/ have been created with
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'::@image@
--     equal to @image@
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-dedicatedAllocationImageAliasing dedicated allocation image aliasing>
--     feature is not enabled, and the
--     'Vulkan.Core10.Memory.MemoryAllocateInfo' provided when @memory@ was
--     allocated included a
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure in its @pNext@ chain, and
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'::@image@
--     was not 'Vulkan.Core10.APIConstants.NULL_HANDLE', then @image@
--     /must/ equal
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'::@image@
--     and @memoryOffset@ /must/ be zero
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-dedicatedAllocationImageAliasing dedicated allocation image aliasing>
--     feature is enabled, and the
--     'Vulkan.Core10.Memory.MemoryAllocateInfo' provided when @memory@ was
--     allocated included a
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure in its @pNext@ chain, and
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'::@image@
--     was not 'Vulkan.Core10.APIConstants.NULL_HANDLE', then
--     @memoryOffset@ /must/ be zero, and @image@ /must/ be either equal to
--     'Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'::@image@
--     or an image that was created using the same parameters in
--     'Vulkan.Core10.Image.ImageCreateInfo', with the exception that
--     @extent@ and @arrayLayers@ /may/ differ subject to the following
--     restrictions: every dimension in the @extent@ parameter of the image
--     being bound /must/ be equal to or smaller than the original image
--     for which the allocation was created; and the @arrayLayers@
--     parameter of the image being bound /must/ be equal to or smaller
--     than the original image for which the allocation was created
--
-- -   If image was created with the
--     'Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_PROTECTED_BIT'
--     bit set, the image /must/ be bound to a memory object allocated with
--     a memory type that reports
--     'Vulkan.Core10.Enums.MemoryPropertyFlagBits.MEMORY_PROPERTY_PROTECTED_BIT'
--
-- -   If image was created with the
--     'Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_PROTECTED_BIT'
--     bit not set, the image /must/ not be bound to a memory object
--     created with a memory type that reports
--     'Vulkan.Core10.Enums.MemoryPropertyFlagBits.MEMORY_PROPERTY_PROTECTED_BIT'
--
-- -   If @image@ was created with
--     'Vulkan.Extensions.VK_NV_dedicated_allocation.DedicatedAllocationImageCreateInfoNV'::@dedicatedAllocation@
--     equal to 'Vulkan.Core10.BaseType.TRUE', @memory@ /must/ have been
--     created with
--     'Vulkan.Extensions.VK_NV_dedicated_allocation.DedicatedAllocationMemoryAllocateInfoNV'::@image@
--     equal to an image handle created with identical creation parameters
--     to @image@ and @memoryOffset@ /must/ be zero
--
-- -   If the value of
--     'Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExportMemoryAllocateInfo'::@handleTypes@
--     used to allocate @memory@ is not @0@, it /must/ include at least one
--     of the handles set in
--     'Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryImageCreateInfo'::@handleTypes@
--     when @image@ was created
--
-- -   If @memory@ was created by a memory import operation, that is not
--     'Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.ImportAndroidHardwareBufferInfoANDROID'
--     with a non-@NULL@ @buffer@ value, the external handle type of the
--     imported memory /must/ also have been set in
--     'Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryImageCreateInfo'::@handleTypes@
--     when @image@ was created
--
-- -   If @memory@ was created with the
--     'Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.ImportAndroidHardwareBufferInfoANDROID'
--     memory import operation with a non-@NULL@ @buffer@ value,
--     'Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID'
--     /must/ also have been set in
--     'Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExternalMemoryImageCreateInfo'::@handleTypes@
--     when @image@ was created
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid 'Vulkan.Core10.Handles.Device' handle
--
-- -   @image@ /must/ be a valid 'Vulkan.Core10.Handles.Image' handle
--
-- -   @memory@ /must/ be a valid 'Vulkan.Core10.Handles.DeviceMemory'
--     handle
--
-- -   @image@ /must/ have been created, allocated, or retrieved from
--     @device@
--
-- -   @memory@ /must/ have been created, allocated, or retrieved from
--     @device@
--
-- == Host Synchronization
--
-- -   Host access to @image@ /must/ be externally synchronized
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Vulkan.Core10.Handles.Device', 'Vulkan.Core10.Handles.DeviceMemory',
-- 'Vulkan.Core10.BaseType.DeviceSize', 'Vulkan.Core10.Handles.Image'
bindImageMemory :: forall io . MonadIO io => Device -> Image -> DeviceMemory -> ("memoryOffset" ::: DeviceSize) -> io ()
bindImageMemory device image memory memoryOffset = liftIO $ do
  let vkBindImageMemoryPtr = pVkBindImageMemory (deviceCmds (device :: Device))
  unless (vkBindImageMemoryPtr /= nullFunPtr) $
    throwIO $ IOError Nothing InvalidArgument "" "The function pointer for vkBindImageMemory is null" Nothing Nothing
  let vkBindImageMemory' = mkVkBindImageMemory vkBindImageMemoryPtr
  r <- vkBindImageMemory' (deviceHandle (device)) (image) (memory) (memoryOffset)
  when (r < SUCCESS) (throwIO (VulkanException r))


-- | VkMemoryRequirements - Structure specifying memory requirements
--
-- = See Also
--
-- 'Vulkan.Core10.BaseType.DeviceSize',
-- 'Vulkan.Core11.Promoted_From_VK_KHR_get_memory_requirements2.MemoryRequirements2',
-- 'getBufferMemoryRequirements', 'getImageMemoryRequirements'
data MemoryRequirements = MemoryRequirements
  { -- | @size@ is the size, in bytes, of the memory allocation /required/ for
    -- the resource.
    size :: DeviceSize
  , -- | @alignment@ is the alignment, in bytes, of the offset within the
    -- allocation /required/ for the resource.
    alignment :: DeviceSize
  , -- | @memoryTypeBits@ is a bitmask and contains one bit set for every
    -- supported memory type for the resource. Bit @i@ is set if and only if
    -- the memory type @i@ in the
    -- 'Vulkan.Core10.DeviceInitialization.PhysicalDeviceMemoryProperties'
    -- structure for the physical device is supported for the resource.
    memoryTypeBits :: Word32
  }
  deriving (Typeable)
deriving instance Show MemoryRequirements

instance ToCStruct MemoryRequirements where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p MemoryRequirements{..} f = do
    poke ((p `plusPtr` 0 :: Ptr DeviceSize)) (size)
    poke ((p `plusPtr` 8 :: Ptr DeviceSize)) (alignment)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (memoryTypeBits)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr DeviceSize)) (zero)
    poke ((p `plusPtr` 8 :: Ptr DeviceSize)) (zero)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (zero)
    f

instance FromCStruct MemoryRequirements where
  peekCStruct p = do
    size <- peek @DeviceSize ((p `plusPtr` 0 :: Ptr DeviceSize))
    alignment <- peek @DeviceSize ((p `plusPtr` 8 :: Ptr DeviceSize))
    memoryTypeBits <- peek @Word32 ((p `plusPtr` 16 :: Ptr Word32))
    pure $ MemoryRequirements
             size alignment memoryTypeBits

instance Storable MemoryRequirements where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero MemoryRequirements where
  zero = MemoryRequirements
           zero
           zero
           zero
