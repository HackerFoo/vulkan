{-# language CPP #-}
module Graphics.Vulkan.Core10.Memory  ( allocateMemory
                                      , withMemory
                                      , freeMemory
                                      , mapMemory
                                      , withMappedMemory
                                      , unmapMemory
                                      , flushMappedMemoryRanges
                                      , invalidateMappedMemoryRanges
                                      , getDeviceMemoryCommitment
                                      , MemoryAllocateInfo(..)
                                      , MappedMemoryRange(..)
                                      ) where

import Control.Exception.Base (bracket)
import Data.Typeable (eqT)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import GHC.Base (when)
import GHC.IO (throwIO)
import GHC.Ptr (castPtr)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import qualified Data.Vector (imapM_)
import qualified Data.Vector (length)
import Data.Type.Equality ((:~:)(Refl))
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Data.Word (Word32)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Data.Vector (Vector)
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.AllocationCallbacks (AllocationCallbacks)
import Graphics.Vulkan.CStruct.Extends (Chain)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_dedicated_allocation (DedicatedAllocationMemoryAllocateInfoNV)
import Graphics.Vulkan.Core10.Handles (Device)
import Graphics.Vulkan.Core10.Handles (Device(..))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkAllocateMemory))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkFlushMappedMemoryRanges))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkFreeMemory))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkGetDeviceMemoryCommitment))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkInvalidateMappedMemoryRanges))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkMapMemory))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkUnmapMemory))
import Graphics.Vulkan.Core10.Handles (DeviceMemory)
import Graphics.Vulkan.Core10.Handles (DeviceMemory(..))
import Graphics.Vulkan.Core10.BaseType (DeviceSize)
import Graphics.Vulkan.Core10.Handles (Device_T)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory (ExportMemoryAllocateInfo)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_external_memory (ExportMemoryAllocateInfoNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_external_memory_win32 (ExportMemoryWin32HandleInfoKHR)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_external_memory_win32 (ExportMemoryWin32HandleInfoNV)
import Graphics.Vulkan.CStruct.Extends (Extends)
import Graphics.Vulkan.CStruct.Extends (Extensible(..))
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer (ImportAndroidHardwareBufferInfoANDROID)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_external_memory_fd (ImportMemoryFdInfoKHR)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_external_memory_host (ImportMemoryHostPointerInfoEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_external_memory_win32 (ImportMemoryWin32HandleInfoKHR)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_external_memory_win32 (ImportMemoryWin32HandleInfoNV)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_device_group (MemoryAllocateFlagsInfo)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation (MemoryDedicatedAllocateInfo)
import Graphics.Vulkan.Core10.Enums.MemoryMapFlags (MemoryMapFlags)
import Graphics.Vulkan.Core10.Enums.MemoryMapFlags (MemoryMapFlags(..))
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_buffer_device_address (MemoryOpaqueCaptureAddressAllocateInfo)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_memory_priority (MemoryPriorityAllocateInfoEXT)
import Graphics.Vulkan.CStruct.Extends (PeekChain)
import Graphics.Vulkan.CStruct.Extends (PeekChain(..))
import Graphics.Vulkan.CStruct.Extends (PokeChain)
import Graphics.Vulkan.CStruct.Extends (PokeChain(..))
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_MAPPED_MEMORY_RANGE))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkAllocateMemory
  :: FunPtr (Ptr Device_T -> Ptr (MemoryAllocateInfo a) -> Ptr AllocationCallbacks -> Ptr DeviceMemory -> IO Result) -> Ptr Device_T -> Ptr (MemoryAllocateInfo a) -> Ptr AllocationCallbacks -> Ptr DeviceMemory -> IO Result

-- | vkAllocateMemory - Allocate device memory
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the memory.
--
-- -   @pAllocateInfo@ is a pointer to a 'MemoryAllocateInfo' structure
--     describing parameters of the allocation. A successful returned
--     allocation /must/ use the requested parameters — no substitution is
--     permitted by the implementation.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pMemory@ is a pointer to a
--     'Graphics.Vulkan.Core10.Handles.DeviceMemory' handle in which
--     information about the allocated memory is returned.
--
-- = Description
--
-- Allocations returned by 'allocateMemory' are guaranteed to meet any
-- alignment requirement of the implementation. For example, if an
-- implementation requires 128 byte alignment for images and 64 byte
-- alignment for buffers, the device memory returned through this mechanism
-- would be 128-byte aligned. This ensures that applications /can/
-- correctly suballocate objects of different types (with potentially
-- different alignment requirements) in the same memory object.
--
-- When memory is allocated, its contents are undefined with the following
-- constraint:
--
-- -   The contents of unprotected memory /must/ not be a function of data
--     protected memory objects, even if those memory objects were
--     previously freed.
--
-- Note
--
-- The contents of memory allocated by one application /should/ not be a
-- function of data from protected memory objects of another application,
-- even if those memory objects were previously freed.
--
-- The maximum number of valid memory allocations that /can/ exist
-- simultaneously within a 'Graphics.Vulkan.Core10.Handles.Device' /may/ be
-- restricted by implementation- or platform-dependent limits. If a call to
-- 'allocateMemory' would cause the total number of allocations to exceed
-- these limits, such a call will fail and /must/ return
-- 'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'. The
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#limits-maxMemoryAllocationCount maxMemoryAllocationCount>
-- feature describes the number of allocations that /can/ exist
-- simultaneously before encountering these internal limits.
--
-- Some platforms /may/ have a limit on the maximum size of a single
-- allocation. For example, certain systems /may/ fail to create
-- allocations with a size greater than or equal to 4GB. Such a limit is
-- implementation-dependent, and if such a failure occurs then the error
-- 'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY' /must/
-- be returned. This limit is advertised in
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_maintenance3.PhysicalDeviceMaintenance3Properties'::@maxMemoryAllocationSize@.
--
-- The cumulative memory size allocated to a heap /can/ be limited by the
-- size of the specified heap. In such cases, allocated memory is tracked
-- on a per-device and per-heap basis. Some platforms allow overallocation
-- into other heaps. The overallocation behavior /can/ be specified through
-- the
-- @https:\/\/www.khronos.org\/registry\/vulkan\/specs\/1.2-extensions\/html\/vkspec.html#VK_AMD_memory_overallocation_behavior@
-- extension.
--
-- == Valid Usage
--
-- -   @pAllocateInfo->allocationSize@ /must/ be less than or equal to
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceMemoryProperties'::@memoryHeaps@[memindex].size
--     where @memindex@ =
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceMemoryProperties'::@memoryTypes@[pAllocateInfo->memoryTypeIndex].heapIndex
--     as returned by
--     'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceMemoryProperties'
--     for the 'Graphics.Vulkan.Core10.Handles.PhysicalDevice' that
--     'Graphics.Vulkan.Core10.Handles.Device' was created from.
--
-- -   @pAllocateInfo->memoryTypeIndex@ /must/ be less than
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceMemoryProperties'::@memoryTypeCount@
--     as returned by
--     'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceMemoryProperties'
--     for the 'Graphics.Vulkan.Core10.Handles.PhysicalDevice' that
--     'Graphics.Vulkan.Core10.Handles.Device' was created from.
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-deviceCoherentMemory deviceCoherentMemory>
--     feature is not enabled, @pAllocateInfo->memoryTypeIndex@ /must/ not
--     identify a memory type supporting
--     'Graphics.Vulkan.Core10.Enums.MemoryPropertyFlagBits.MEMORY_PROPERTY_DEVICE_COHERENT_BIT_AMD'
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   @pAllocateInfo@ /must/ be a valid pointer to a valid
--     'MemoryAllocateInfo' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   @pMemory@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.Core10.Handles.DeviceMemory' handle
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_INVALID_EXTERNAL_HANDLE'
--
--     -   'Graphics.Vulkan.Extensions.VK_KHR_buffer_device_address.ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS_KHR'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.DeviceMemory', 'MemoryAllocateInfo'
allocateMemory :: PokeChain a => Device -> MemoryAllocateInfo a -> ("allocator" ::: Maybe AllocationCallbacks) -> IO (DeviceMemory)
allocateMemory device allocateInfo allocator = evalContT $ do
  let vkAllocateMemory' = mkVkAllocateMemory (pVkAllocateMemory (deviceCmds (device :: Device)))
  pAllocateInfo <- ContT $ withCStruct (allocateInfo)
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  pPMemory <- ContT $ bracket (callocBytes @DeviceMemory 8) free
  r <- lift $ vkAllocateMemory' (deviceHandle (device)) pAllocateInfo pAllocator (pPMemory)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pMemory <- lift $ peek @DeviceMemory pPMemory
  pure $ (pMemory)

-- | A safe wrapper for 'allocateMemory' and 'freeMemory' using 'bracket'
--
-- The allocated value must not be returned from the provided computation
withMemory :: PokeChain a => Device -> MemoryAllocateInfo a -> Maybe AllocationCallbacks -> (DeviceMemory -> IO r) -> IO r
withMemory device memoryAllocateInfo allocationCallbacks =
  bracket
    (allocateMemory device memoryAllocateInfo allocationCallbacks)
    (\o -> freeMemory device o allocationCallbacks)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkFreeMemory
  :: FunPtr (Ptr Device_T -> DeviceMemory -> Ptr AllocationCallbacks -> IO ()) -> Ptr Device_T -> DeviceMemory -> Ptr AllocationCallbacks -> IO ()

-- | vkFreeMemory - Free device memory
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the memory.
--
-- -   @memory@ is the 'Graphics.Vulkan.Core10.Handles.DeviceMemory' object
--     to be freed.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- = Description
--
-- Before freeing a memory object, an application /must/ ensure the memory
-- object is no longer in use by the device—​for example by command buffers
-- in the /pending state/. Memory /can/ be freed whilst still bound to
-- resources, but those resources /must/ not be used afterwards. If there
-- are still any bound images or buffers, the memory /may/ not be
-- immediately released by the implementation, but /must/ be released by
-- the time all bound images and buffers have been destroyed. Once memory
-- is released, it is returned to the heap from which it was allocated.
--
-- How memory objects are bound to Images and Buffers is described in
-- detail in the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#resources-association Resource Memory Association>
-- section.
--
-- If a memory object is mapped at the time it is freed, it is implicitly
-- unmapped.
--
-- Note
--
-- As described
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-device-unmap-does-not-flush below>,
-- host writes are not implicitly flushed when the memory object is
-- unmapped, but the implementation /must/ guarantee that writes that have
-- not been flushed do not affect any other memory.
--
-- == Valid Usage
--
-- -   All submitted commands that refer to @memory@ (via images or
--     buffers) /must/ have completed execution
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   If @memory@ is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', @memory@ /must/
--     be a valid 'Graphics.Vulkan.Core10.Handles.DeviceMemory' handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   If @memory@ is a valid handle, it /must/ have been created,
--     allocated, or retrieved from 'Graphics.Vulkan.Core10.Handles.Device'
--
-- == Host Synchronization
--
-- -   Host access to @memory@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.DeviceMemory'
freeMemory :: Device -> DeviceMemory -> ("allocator" ::: Maybe AllocationCallbacks) -> IO ()
freeMemory device memory allocator = evalContT $ do
  let vkFreeMemory' = mkVkFreeMemory (pVkFreeMemory (deviceCmds (device :: Device)))
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  lift $ vkFreeMemory' (deviceHandle (device)) (memory) pAllocator
  pure $ ()


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkMapMemory
  :: FunPtr (Ptr Device_T -> DeviceMemory -> DeviceSize -> DeviceSize -> MemoryMapFlags -> Ptr (Ptr ()) -> IO Result) -> Ptr Device_T -> DeviceMemory -> DeviceSize -> DeviceSize -> MemoryMapFlags -> Ptr (Ptr ()) -> IO Result

-- | vkMapMemory - Map a memory object into application address space
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the memory.
--
-- -   @memory@ is the 'Graphics.Vulkan.Core10.Handles.DeviceMemory' object
--     to be mapped.
--
-- -   @offset@ is a zero-based byte offset from the beginning of the
--     memory object.
--
-- -   @size@ is the size of the memory range to map, or
--     'Graphics.Vulkan.Core10.APIConstants.WHOLE_SIZE' to map from
--     @offset@ to the end of the allocation.
--
-- -   'Graphics.Vulkan.Core10.BaseType.Flags' is reserved for future use.
--
-- -   @ppData@ is a pointer to a @void *@ variable in which is returned a
--     host-accessible pointer to the beginning of the mapped range. This
--     pointer minus @offset@ /must/ be aligned to at least
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@minMemoryMapAlignment@.
--
-- = Description
--
-- After a successful call to 'mapMemory' the memory object @memory@ is
-- considered to be currently /host mapped/.
--
-- Note
--
-- It is an application error to call 'mapMemory' on a memory object that
-- is already /host mapped/.
--
-- Note
--
-- 'mapMemory' will fail if the implementation is unable to allocate an
-- appropriately sized contiguous virtual address range, e.g. due to
-- virtual address space fragmentation or platform limits. In such cases,
-- 'mapMemory' /must/ return
-- 'Graphics.Vulkan.Core10.Enums.Result.ERROR_MEMORY_MAP_FAILED'. The
-- application /can/ improve the likelihood of success by reducing the size
-- of the mapped range and\/or removing unneeded mappings using
-- 'unmapMemory'.
--
-- 'mapMemory' does not check whether the device memory is currently in use
-- before returning the host-accessible pointer. The application /must/
-- guarantee that any previously submitted command that writes to this
-- range has completed before the host reads from or writes to that range,
-- and that any previously submitted command that reads from that range has
-- completed before the host writes to that region (see
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-submission-host-writes here>
-- for details on fulfilling such a guarantee). If the device memory was
-- allocated without the
-- 'Graphics.Vulkan.Core10.Enums.MemoryPropertyFlagBits.MEMORY_PROPERTY_HOST_COHERENT_BIT'
-- set, these guarantees /must/ be made for an extended range: the
-- application /must/ round down the start of the range to the nearest
-- multiple of
-- 'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@nonCoherentAtomSize@,
-- and round the end of the range up to the nearest multiple of
-- 'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@nonCoherentAtomSize@.
--
-- While a range of device memory is host mapped, the application is
-- responsible for synchronizing both device and host access to that memory
-- range.
--
-- Note
--
-- It is important for the application developer to become meticulously
-- familiar with all of the mechanisms described in the chapter on
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization Synchronization and Cache Control>
-- as they are crucial to maintaining memory access ordering.
--
-- == Valid Usage
--
-- -   @memory@ /must/ not be currently host mapped
--
-- -   @offset@ /must/ be less than the size of @memory@
--
-- -   If @size@ is not equal to
--     'Graphics.Vulkan.Core10.APIConstants.WHOLE_SIZE', @size@ /must/ be
--     greater than @0@
--
-- -   If @size@ is not equal to
--     'Graphics.Vulkan.Core10.APIConstants.WHOLE_SIZE', @size@ /must/ be
--     less than or equal to the size of the @memory@ minus @offset@
--
-- -   @memory@ /must/ have been created with a memory type that reports
--     'Graphics.Vulkan.Core10.Enums.MemoryPropertyFlagBits.MEMORY_PROPERTY_HOST_VISIBLE_BIT'
--
-- -   @memory@ /must/ not have been allocated with multiple instances.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   @memory@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.DeviceMemory' handle
--
-- -   'Graphics.Vulkan.Core10.BaseType.Flags' /must/ be @0@
--
-- -   @ppData@ /must/ be a valid pointer to a pointer value
--
-- -   @memory@ /must/ have been created, allocated, or retrieved from
--     'Graphics.Vulkan.Core10.Handles.Device'
--
-- == Host Synchronization
--
-- -   Host access to @memory@ /must/ be externally synchronized
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_MEMORY_MAP_FAILED'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.DeviceMemory',
-- 'Graphics.Vulkan.Core10.BaseType.DeviceSize',
-- 'Graphics.Vulkan.Core10.Enums.MemoryMapFlags.MemoryMapFlags'
mapMemory :: Device -> DeviceMemory -> ("offset" ::: DeviceSize) -> DeviceSize -> MemoryMapFlags -> IO (("data" ::: Ptr ()))
mapMemory device memory offset size flags = evalContT $ do
  let vkMapMemory' = mkVkMapMemory (pVkMapMemory (deviceCmds (device :: Device)))
  pPpData <- ContT $ bracket (callocBytes @(Ptr ()) 8) free
  r <- lift $ vkMapMemory' (deviceHandle (device)) (memory) (offset) (size) (flags) (pPpData)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  ppData <- lift $ peek @(Ptr ()) pPpData
  pure $ (ppData)

-- | A safe wrapper for 'mapMemory' and 'unmapMemory' using 'bracket'
--
-- The allocated value must not be returned from the provided computation
withMappedMemory :: Device -> DeviceMemory -> DeviceSize -> DeviceSize -> MemoryMapFlags -> (Ptr () -> IO r) -> IO r
withMappedMemory device deviceMemory offset' size' flags' =
  bracket
    (mapMemory device deviceMemory offset' size' flags')
    (\_ -> unmapMemory device deviceMemory)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkUnmapMemory
  :: FunPtr (Ptr Device_T -> DeviceMemory -> IO ()) -> Ptr Device_T -> DeviceMemory -> IO ()

-- | vkUnmapMemory - Unmap a previously mapped memory object
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the memory.
--
-- -   @memory@ is the memory object to be unmapped.
--
-- == Valid Usage
--
-- -   @memory@ /must/ be currently host mapped
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   @memory@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.DeviceMemory' handle
--
-- -   @memory@ /must/ have been created, allocated, or retrieved from
--     'Graphics.Vulkan.Core10.Handles.Device'
--
-- == Host Synchronization
--
-- -   Host access to @memory@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.DeviceMemory'
unmapMemory :: Device -> DeviceMemory -> IO ()
unmapMemory device memory = do
  let vkUnmapMemory' = mkVkUnmapMemory (pVkUnmapMemory (deviceCmds (device :: Device)))
  vkUnmapMemory' (deviceHandle (device)) (memory)
  pure $ ()


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkFlushMappedMemoryRanges
  :: FunPtr (Ptr Device_T -> Word32 -> Ptr MappedMemoryRange -> IO Result) -> Ptr Device_T -> Word32 -> Ptr MappedMemoryRange -> IO Result

-- | vkFlushMappedMemoryRanges - Flush mapped memory ranges
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the memory ranges.
--
-- -   @memoryRangeCount@ is the length of the @pMemoryRanges@ array.
--
-- -   @pMemoryRanges@ is a pointer to an array of 'MappedMemoryRange'
--     structures describing the memory ranges to flush.
--
-- = Description
--
-- 'flushMappedMemoryRanges' guarantees that host writes to the memory
-- ranges described by @pMemoryRanges@ are made available to the host
-- memory domain, such that they /can/ be made available to the device
-- memory domain via
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-dependencies-available-and-visible memory domain operations>
-- using the
-- 'Graphics.Vulkan.Core10.Enums.AccessFlagBits.ACCESS_HOST_WRITE_BIT'
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-access-types access type>.
--
-- Within each range described by @pMemoryRanges@, each set of
-- @nonCoherentAtomSize@ bytes in that range is flushed if any byte in that
-- set has been written by the host since it was first host mapped, or the
-- last time it was flushed. If @pMemoryRanges@ includes sets of
-- @nonCoherentAtomSize@ bytes where no bytes have been written by the
-- host, those bytes /must/ not be flushed.
--
-- Unmapping non-coherent memory does not implicitly flush the host mapped
-- memory, and host writes that have not been flushed /may/ not ever be
-- visible to the device. However, implementations /must/ ensure that
-- writes that have not been flushed do not become visible to any other
-- memory.
--
-- Note
--
-- The above guarantee avoids a potential memory corruption in scenarios
-- where host writes to a mapped memory object have not been flushed before
-- the memory is unmapped (or freed), and the virtual address range is
-- subsequently reused for a different mapping (or memory allocation).
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device', 'MappedMemoryRange'
flushMappedMemoryRanges :: Device -> ("memoryRanges" ::: Vector MappedMemoryRange) -> IO ()
flushMappedMemoryRanges device memoryRanges = evalContT $ do
  let vkFlushMappedMemoryRanges' = mkVkFlushMappedMemoryRanges (pVkFlushMappedMemoryRanges (deviceCmds (device :: Device)))
  pPMemoryRanges <- ContT $ allocaBytesAligned @MappedMemoryRange ((Data.Vector.length (memoryRanges)) * 40) 8
  Data.Vector.imapM_ (\i e -> ContT $ pokeCStruct (pPMemoryRanges `plusPtr` (40 * (i)) :: Ptr MappedMemoryRange) (e) . ($ ())) (memoryRanges)
  r <- lift $ vkFlushMappedMemoryRanges' (deviceHandle (device)) ((fromIntegral (Data.Vector.length $ (memoryRanges)) :: Word32)) (pPMemoryRanges)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkInvalidateMappedMemoryRanges
  :: FunPtr (Ptr Device_T -> Word32 -> Ptr MappedMemoryRange -> IO Result) -> Ptr Device_T -> Word32 -> Ptr MappedMemoryRange -> IO Result

-- | vkInvalidateMappedMemoryRanges - Invalidate ranges of mapped memory
-- objects
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the memory ranges.
--
-- -   @memoryRangeCount@ is the length of the @pMemoryRanges@ array.
--
-- -   @pMemoryRanges@ is a pointer to an array of 'MappedMemoryRange'
--     structures describing the memory ranges to invalidate.
--
-- = Description
--
-- 'invalidateMappedMemoryRanges' guarantees that device writes to the
-- memory ranges described by @pMemoryRanges@, which have been made
-- available to the host memory domain using the
-- 'Graphics.Vulkan.Core10.Enums.AccessFlagBits.ACCESS_HOST_WRITE_BIT' and
-- 'Graphics.Vulkan.Core10.Enums.AccessFlagBits.ACCESS_HOST_READ_BIT'
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-access-types access types>,
-- are made visible to the host. If a range of non-coherent memory is
-- written by the host and then invalidated without first being flushed,
-- its contents are undefined.
--
-- Within each range described by @pMemoryRanges@, each set of
-- @nonCoherentAtomSize@ bytes in that range is invalidated if any byte in
-- that set has been written by the device since it was first host mapped,
-- or the last time it was invalidated.
--
-- Note
--
-- Mapping non-coherent memory does not implicitly invalidate that memory.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_DEVICE_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device', 'MappedMemoryRange'
invalidateMappedMemoryRanges :: Device -> ("memoryRanges" ::: Vector MappedMemoryRange) -> IO ()
invalidateMappedMemoryRanges device memoryRanges = evalContT $ do
  let vkInvalidateMappedMemoryRanges' = mkVkInvalidateMappedMemoryRanges (pVkInvalidateMappedMemoryRanges (deviceCmds (device :: Device)))
  pPMemoryRanges <- ContT $ allocaBytesAligned @MappedMemoryRange ((Data.Vector.length (memoryRanges)) * 40) 8
  Data.Vector.imapM_ (\i e -> ContT $ pokeCStruct (pPMemoryRanges `plusPtr` (40 * (i)) :: Ptr MappedMemoryRange) (e) . ($ ())) (memoryRanges)
  r <- lift $ vkInvalidateMappedMemoryRanges' (deviceHandle (device)) ((fromIntegral (Data.Vector.length $ (memoryRanges)) :: Word32)) (pPMemoryRanges)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetDeviceMemoryCommitment
  :: FunPtr (Ptr Device_T -> DeviceMemory -> Ptr DeviceSize -> IO ()) -> Ptr Device_T -> DeviceMemory -> Ptr DeviceSize -> IO ()

-- | vkGetDeviceMemoryCommitment - Query the current commitment for a
-- VkDeviceMemory
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     owns the memory.
--
-- -   @memory@ is the memory object being queried.
--
-- -   @pCommittedMemoryInBytes@ is a pointer to a
--     'Graphics.Vulkan.Core10.BaseType.DeviceSize' value in which the
--     number of bytes currently committed is returned, on success.
--
-- = Description
--
-- The implementation /may/ update the commitment at any time, and the
-- value returned by this query /may/ be out of date.
--
-- The implementation guarantees to allocate any committed memory from the
-- @heapIndex@ indicated by the memory type that the memory object was
-- created with.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.DeviceMemory',
-- 'Graphics.Vulkan.Core10.BaseType.DeviceSize'
getDeviceMemoryCommitment :: Device -> DeviceMemory -> IO (("committedMemoryInBytes" ::: DeviceSize))
getDeviceMemoryCommitment device memory = evalContT $ do
  let vkGetDeviceMemoryCommitment' = mkVkGetDeviceMemoryCommitment (pVkGetDeviceMemoryCommitment (deviceCmds (device :: Device)))
  pPCommittedMemoryInBytes <- ContT $ bracket (callocBytes @DeviceSize 8) free
  lift $ vkGetDeviceMemoryCommitment' (deviceHandle (device)) (memory) (pPCommittedMemoryInBytes)
  pCommittedMemoryInBytes <- lift $ peek @DeviceSize pPCommittedMemoryInBytes
  pure $ (pCommittedMemoryInBytes)


-- | VkMemoryAllocateInfo - Structure containing parameters of a memory
-- allocation
--
-- = Description
--
-- A 'MemoryAllocateInfo' structure defines a memory import operation if
-- its @pNext@ chain includes one of the following structures:
--
-- -   'Graphics.Vulkan.Extensions.VK_KHR_external_memory_win32.ImportMemoryWin32HandleInfoKHR'
--     with non-zero @handleType@ value
--
-- -   'Graphics.Vulkan.Extensions.VK_KHR_external_memory_fd.ImportMemoryFdInfoKHR'
--     with a non-zero @handleType@ value
--
-- -   'Graphics.Vulkan.Extensions.VK_EXT_external_memory_host.ImportMemoryHostPointerInfoEXT'
--     with a non-zero @handleType@ value
--
-- -   'Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.ImportAndroidHardwareBufferInfoANDROID'
--     with a non-@NULL@ 'Graphics.Vulkan.Core10.Handles.Buffer' value
--
-- Importing memory /must/ not modify the content of the memory.
-- Implementations /must/ ensure that importing memory does not enable the
-- importing Vulkan instance to access any memory or resources in other
-- Vulkan instances other than that corresponding to the memory object
-- imported. Implementations /must/ also ensure accessing imported memory
-- which has not been initialized does not allow the importing Vulkan
-- instance to obtain data from the exporting Vulkan instance or
-- vice-versa.
--
-- Note
--
-- How exported and imported memory is isolated is left to the
-- implementation, but applications should be aware that such isolation
-- /may/ prevent implementations from placing multiple exportable memory
-- objects in the same physical or virtual page. Hence, applications
-- /should/ avoid creating many small external memory objects whenever
-- possible.
--
-- When performing a memory import operation, it is the responsibility of
-- the application to ensure the external handles meet all valid usage
-- requirements. However, implementations /must/ perform sufficient
-- validation of external handles to ensure that the operation results in a
-- valid memory object which will not cause program termination, device
-- loss, queue stalls, or corruption of other resources when used as
-- allowed according to its allocation parameters. If the external handle
-- provided does not meet these requirements, the implementation /must/
-- fail the memory import operation with the error code
-- 'Graphics.Vulkan.Core10.Enums.Result.ERROR_INVALID_EXTERNAL_HANDLE'.
--
-- == Valid Usage
--
-- -   If the @pNext@ chain includes a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExportMemoryAllocateInfo'
--     structure, and any of the handle types specified in
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExportMemoryAllocateInfo'::@handleTypes@
--     require a dedicated allocation, as reported by
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.getPhysicalDeviceImageFormatProperties2'
--     in
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.ExternalImageFormatProperties'::@externalMemoryProperties.externalMemoryFeatures@
--     or
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.ExternalBufferProperties'::@externalMemoryProperties.externalMemoryFeatures@,
--     the @pNext@ chain must include a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     or
--     'Graphics.Vulkan.Extensions.VK_NV_dedicated_allocation.DedicatedAllocationMemoryAllocateInfoNV'
--     structure with either its 'Graphics.Vulkan.Core10.Handles.Image' or
--     'Graphics.Vulkan.Core10.Handles.Buffer' member set to a value other
--     than 'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE'.
--
-- -   If the @pNext@ chain includes a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExportMemoryAllocateInfo'
--     structure, it /must/ not include a
--     'Graphics.Vulkan.Extensions.VK_NV_external_memory.ExportMemoryAllocateInfoNV'
--     or
--     'Graphics.Vulkan.Extensions.VK_NV_external_memory_win32.ExportMemoryWin32HandleInfoNV'
--     structure.
--
-- -   If the @pNext@ chain includes a
--     'Graphics.Vulkan.Extensions.VK_KHR_external_memory_win32.ImportMemoryWin32HandleInfoKHR'
--     structure, it /must/ not include a
--     'Graphics.Vulkan.Extensions.VK_NV_external_memory_win32.ImportMemoryWin32HandleInfoNV'
--     structure.
--
-- -   If the parameters define an import operation, the external handle
--     specified was created by the Vulkan API, and the external handle
--     type is
--     'Graphics.Vulkan.Extensions.VK_KHR_external_memory_capabilities.EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_FD_BIT_KHR',
--     then the values of @allocationSize@ and @memoryTypeIndex@ /must/
--     match those specified when the memory object being imported was
--     created.
--
-- -   If the parameters define an import operation and the external handle
--     specified was created by the Vulkan API, the device mask specified
--     by
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_device_group.MemoryAllocateFlagsInfo'
--     /must/ match that specified when the memory object being imported
--     was allocated.
--
-- -   If the parameters define an import operation and the external handle
--     specified was created by the Vulkan API, the list of physical
--     devices that comprise the logical device passed to 'allocateMemory'
--     /must/ match the list of physical devices that comprise the logical
--     device on which the memory was originally allocated.
--
-- -   If the parameters define an import operation and the external handle
--     is an NT handle or a global share handle created outside of the
--     Vulkan API, the value of @memoryTypeIndex@ /must/ be one of those
--     returned by
--     'Graphics.Vulkan.Extensions.VK_KHR_external_memory_win32.getMemoryWin32HandlePropertiesKHR'.
--
-- -   If the parameters define an import operation, the external handle
--     was created by the Vulkan API, and the external handle type is
--     'Graphics.Vulkan.Extensions.VK_KHR_external_memory_capabilities.EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_BIT_KHR'
--     or
--     'Graphics.Vulkan.Extensions.VK_KHR_external_memory_capabilities.EXTERNAL_MEMORY_HANDLE_TYPE_OPAQUE_WIN32_KMT_BIT_KHR',
--     then the values of @allocationSize@ and @memoryTypeIndex@ /must/
--     match those specified when the memory object being imported was
--     created.
--
-- -   If the parameters define an import operation and the external handle
--     type is
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_BIT',
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D11_TEXTURE_KMT_BIT',
--     or
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_RESOURCE_BIT',
--     @allocationSize@ /must/ match the size reported in the memory
--     requirements of the 'Graphics.Vulkan.Core10.Handles.Image' or
--     'Graphics.Vulkan.Core10.Handles.Buffer' member of the
--     'Graphics.Vulkan.Extensions.VK_NV_dedicated_allocation.DedicatedAllocationMemoryAllocateInfoNV'
--     structure included in the @pNext@ chain.
--
-- -   If the parameters define an import operation and the external handle
--     type is
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_D3D12_HEAP_BIT',
--     @allocationSize@ /must/ match the size specified when creating the
--     Direct3D 12 heap from which the external handle was extracted.
--
-- -   If the parameters define an import operation and the external handle
--     is a POSIX file descriptor created outside of the Vulkan API, the
--     value of @memoryTypeIndex@ /must/ be one of those returned by
--     'Graphics.Vulkan.Extensions.VK_KHR_external_memory_fd.getMemoryFdPropertiesKHR'.
--
-- -   If the protected memory feature is not enabled, the
--     'MemoryAllocateInfo'::@memoryTypeIndex@ /must/ not indicate a memory
--     type that reports
--     'Graphics.Vulkan.Core10.Enums.MemoryPropertyFlagBits.MEMORY_PROPERTY_PROTECTED_BIT'.
--
-- -   If the parameters define an import operation and the external handle
--     is a host pointer, the value of @memoryTypeIndex@ /must/ be one of
--     those returned by
--     'Graphics.Vulkan.Extensions.VK_EXT_external_memory_host.getMemoryHostPointerPropertiesEXT'
--
-- -   If the parameters define an import operation and the external handle
--     is a host pointer, @allocationSize@ /must/ be an integer multiple of
--     'Graphics.Vulkan.Extensions.VK_EXT_external_memory_host.PhysicalDeviceExternalMemoryHostPropertiesEXT'::@minImportedHostPointerAlignment@
--
-- -   If the parameters define an import operation and the external handle
--     is a host pointer, the @pNext@ chain /must/ not include a
--     'Graphics.Vulkan.Extensions.VK_NV_dedicated_allocation.DedicatedAllocationMemoryAllocateInfoNV'
--     structure with either its 'Graphics.Vulkan.Core10.Handles.Image' or
--     'Graphics.Vulkan.Core10.Handles.Buffer' field set to a value other
--     than 'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE'.
--
-- -   If the parameters define an import operation and the external handle
--     is a host pointer, the @pNext@ chain /must/ not include a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure with either its 'Graphics.Vulkan.Core10.Handles.Image' or
--     'Graphics.Vulkan.Core10.Handles.Buffer' field set to a value other
--     than 'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE'.
--
-- -   If the parameters define an import operation and the external handle
--     type is
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID',
--     @allocationSize@ /must/ be the size returned by
--     'Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.getAndroidHardwareBufferPropertiesANDROID'
--     for the Android hardware buffer.
--
-- -   If the parameters define an import operation and the external handle
--     type is
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID',
--     and the @pNext@ chain does not include a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure or
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'::'Graphics.Vulkan.Core10.Handles.Image'
--     is 'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', the Android
--     hardware buffer /must/ have a
--     @AHardwareBuffer_Desc@::'Graphics.Vulkan.Core10.Enums.Format.Format'
--     of @AHARDWAREBUFFER_FORMAT_BLOB@ and a
--     @AHardwareBuffer_Desc@::@usage@ that includes
--     @AHARDWAREBUFFER_USAGE_GPU_DATA_BUFFER@.
--
-- -   If the parameters define an import operation and the external handle
--     type is
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID',
--     @memoryTypeIndex@ /must/ be one of those returned by
--     'Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.getAndroidHardwareBufferPropertiesANDROID'
--     for the Android hardware buffer.
--
-- -   If the parameters do not define an import operation, and the @pNext@
--     chain includes a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExportMemoryAllocateInfo'
--     structure with
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID'
--     included in its @handleTypes@ member, and the @pNext@ chain includes
--     a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure with 'Graphics.Vulkan.Core10.Handles.Image' not equal to
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', then
--     @allocationSize@ /must/ be @0@, otherwise @allocationSize@ /must/ be
--     greater than @0@.
--
-- -   If the parameters define an import operation, the external handle is
--     an Android hardware buffer, and the @pNext@ chain includes a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     with 'Graphics.Vulkan.Core10.Handles.Image' that is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', the Android
--     hardware buffer’s
--     'Graphics.Vulkan.Extensions.WSITypes.AHardwareBuffer'::@usage@
--     /must/ include at least one of
--     @AHARDWAREBUFFER_USAGE_GPU_COLOR_OUTPUT@ or
--     @AHARDWAREBUFFER_USAGE_GPU_SAMPLED_IMAGE@.
--
-- -   If the parameters define an import operation, the external handle is
--     an Android hardware buffer, and the @pNext@ chain includes a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     with 'Graphics.Vulkan.Core10.Handles.Image' that is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', the format of
--     'Graphics.Vulkan.Core10.Handles.Image' /must/ be
--     'Graphics.Vulkan.Core10.Enums.Format.FORMAT_UNDEFINED' or the format
--     returned by
--     'Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.getAndroidHardwareBufferPropertiesANDROID'
--     in
--     'Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.AndroidHardwareBufferFormatPropertiesANDROID'::'Graphics.Vulkan.Core10.Enums.Format.Format'
--     for the Android hardware buffer.
--
-- -   If the parameters define an import operation, the external handle is
--     an Android hardware buffer, and the @pNext@ chain includes a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure with 'Graphics.Vulkan.Core10.Handles.Image' that is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', the width,
--     height, and array layer dimensions of
--     'Graphics.Vulkan.Core10.Handles.Image' and the Android hardware
--     buffer’s @AHardwareBuffer_Desc@ /must/ be identical.
--
-- -   If the parameters define an import operation, the external handle is
--     an Android hardware buffer, and the @pNext@ chain includes a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure with 'Graphics.Vulkan.Core10.Handles.Image' that is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', and the Android
--     hardware buffer’s
--     'Graphics.Vulkan.Extensions.WSITypes.AHardwareBuffer'::@usage@
--     includes @AHARDWAREBUFFER_USAGE_GPU_MIPMAP_COMPLETE@, the
--     'Graphics.Vulkan.Core10.Handles.Image' /must/ have a complete mipmap
--     chain.
--
-- -   If the parameters define an import operation, the external handle is
--     an Android hardware buffer, and the @pNext@ chain includes a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure with 'Graphics.Vulkan.Core10.Handles.Image' that is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', and the Android
--     hardware buffer’s
--     'Graphics.Vulkan.Extensions.WSITypes.AHardwareBuffer'::@usage@ does
--     not include @AHARDWAREBUFFER_USAGE_GPU_MIPMAP_COMPLETE@, the
--     'Graphics.Vulkan.Core10.Handles.Image' /must/ have exactly one
--     mipmap level.
--
-- -   If the parameters define an import operation, the external handle is
--     an Android hardware buffer, and the @pNext@ chain includes a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo'
--     structure with 'Graphics.Vulkan.Core10.Handles.Image' that is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE', each bit set in
--     the usage of 'Graphics.Vulkan.Core10.Handles.Image' /must/ be listed
--     in
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-external-android-hardware-buffer-usage AHardwareBuffer Usage Equivalence>,
--     and if there is a corresponding @AHARDWAREBUFFER_USAGE@ bit listed
--     that bit /must/ be included in the Android hardware buffer’s
--     @AHardwareBuffer_Desc@::@usage@.
--
-- -   If
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_buffer_device_address.MemoryOpaqueCaptureAddressAllocateInfo'::@opaqueCaptureAddress@
--     is not zero,
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_device_group.MemoryAllocateFlagsInfo'::'Graphics.Vulkan.Core10.BaseType.Flags'
--     /must/ include
--     'Graphics.Vulkan.Core11.Enums.MemoryAllocateFlagBits.MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT'
--
-- -   If
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_device_group.MemoryAllocateFlagsInfo'::'Graphics.Vulkan.Core10.BaseType.Flags'
--     includes
--     'Graphics.Vulkan.Core11.Enums.MemoryAllocateFlagBits.MEMORY_ALLOCATE_DEVICE_ADDRESS_CAPTURE_REPLAY_BIT',
--     the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-bufferDeviceAddressCaptureReplay bufferDeviceAddressCaptureReplay>
--     feature /must/ be enabled
--
-- -   If
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_device_group.MemoryAllocateFlagsInfo'::'Graphics.Vulkan.Core10.BaseType.Flags'
--     includes
--     'Graphics.Vulkan.Core11.Enums.MemoryAllocateFlagBits.MEMORY_ALLOCATE_DEVICE_ADDRESS_BIT',
--     the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-bufferDeviceAddress bufferDeviceAddress>
--     feature /must/ be enabled
--
-- -   If the @pNext@ chain includes a
--     'Graphics.Vulkan.Extensions.VK_EXT_external_memory_host.ImportMemoryHostPointerInfoEXT'
--     structure,
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_buffer_device_address.MemoryOpaqueCaptureAddressAllocateInfo'::@opaqueCaptureAddress@
--     /must/ be zero
--
-- -   If the parameters define an import operation,
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_buffer_device_address.MemoryOpaqueCaptureAddressAllocateInfo'::@opaqueCaptureAddress@
--     /must/ be zero
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of
--     'Graphics.Vulkan.Extensions.VK_NV_dedicated_allocation.DedicatedAllocationMemoryAllocateInfoNV',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory.ExportMemoryAllocateInfo',
--     'Graphics.Vulkan.Extensions.VK_NV_external_memory.ExportMemoryAllocateInfoNV',
--     'Graphics.Vulkan.Extensions.VK_KHR_external_memory_win32.ExportMemoryWin32HandleInfoKHR',
--     'Graphics.Vulkan.Extensions.VK_NV_external_memory_win32.ExportMemoryWin32HandleInfoNV',
--     'Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.ImportAndroidHardwareBufferInfoANDROID',
--     'Graphics.Vulkan.Extensions.VK_KHR_external_memory_fd.ImportMemoryFdInfoKHR',
--     'Graphics.Vulkan.Extensions.VK_EXT_external_memory_host.ImportMemoryHostPointerInfoEXT',
--     'Graphics.Vulkan.Extensions.VK_KHR_external_memory_win32.ImportMemoryWin32HandleInfoKHR',
--     'Graphics.Vulkan.Extensions.VK_NV_external_memory_win32.ImportMemoryWin32HandleInfoNV',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_device_group.MemoryAllocateFlagsInfo',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_dedicated_allocation.MemoryDedicatedAllocateInfo',
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_buffer_device_address.MemoryOpaqueCaptureAddressAllocateInfo',
--     or
--     'Graphics.Vulkan.Extensions.VK_EXT_memory_priority.MemoryPriorityAllocateInfoEXT'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.BaseType.DeviceSize',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'allocateMemory'
data MemoryAllocateInfo (es :: [Type]) = MemoryAllocateInfo
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @allocationSize@ is the size of the allocation in bytes
    allocationSize :: DeviceSize
  , -- | @memoryTypeIndex@ is an index identifying a memory type from the
    -- @memoryTypes@ array of the
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceMemoryProperties'
    -- structure
    memoryTypeIndex :: Word32
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (MemoryAllocateInfo es)

instance Extensible MemoryAllocateInfo where
  extensibleType = STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO
  setNext x next = x{next = next}
  getNext MemoryAllocateInfo{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends MemoryAllocateInfo e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @MemoryOpaqueCaptureAddressAllocateInfo = Just f
    | Just Refl <- eqT @e @MemoryPriorityAllocateInfoEXT = Just f
    | Just Refl <- eqT @e @ImportAndroidHardwareBufferInfoANDROID = Just f
    | Just Refl <- eqT @e @ImportMemoryHostPointerInfoEXT = Just f
    | Just Refl <- eqT @e @MemoryDedicatedAllocateInfo = Just f
    | Just Refl <- eqT @e @MemoryAllocateFlagsInfo = Just f
    | Just Refl <- eqT @e @ImportMemoryFdInfoKHR = Just f
    | Just Refl <- eqT @e @ExportMemoryWin32HandleInfoKHR = Just f
    | Just Refl <- eqT @e @ImportMemoryWin32HandleInfoKHR = Just f
    | Just Refl <- eqT @e @ExportMemoryAllocateInfo = Just f
    | Just Refl <- eqT @e @ExportMemoryWin32HandleInfoNV = Just f
    | Just Refl <- eqT @e @ImportMemoryWin32HandleInfoNV = Just f
    | Just Refl <- eqT @e @ExportMemoryAllocateInfoNV = Just f
    | Just Refl <- eqT @e @DedicatedAllocationMemoryAllocateInfoNV = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (MemoryAllocateInfo es) where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p MemoryAllocateInfo{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    lift $ poke ((p `plusPtr` 16 :: Ptr DeviceSize)) (allocationSize)
    lift $ poke ((p `plusPtr` 24 :: Ptr Word32)) (memoryTypeIndex)
    lift $ f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MEMORY_ALLOCATE_INFO)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    lift $ poke ((p `plusPtr` 16 :: Ptr DeviceSize)) (zero)
    lift $ poke ((p `plusPtr` 24 :: Ptr Word32)) (zero)
    lift $ f

instance PeekChain es => FromCStruct (MemoryAllocateInfo es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    allocationSize <- peek @DeviceSize ((p `plusPtr` 16 :: Ptr DeviceSize))
    memoryTypeIndex <- peek @Word32 ((p `plusPtr` 24 :: Ptr Word32))
    pure $ MemoryAllocateInfo
             next allocationSize memoryTypeIndex

instance es ~ '[] => Zero (MemoryAllocateInfo es) where
  zero = MemoryAllocateInfo
           ()
           zero
           zero


-- | VkMappedMemoryRange - Structure specifying a mapped memory range
--
-- == Valid Usage
--
-- -   @memory@ /must/ be currently host mapped
--
-- -   If @size@ is not equal to
--     'Graphics.Vulkan.Core10.APIConstants.WHOLE_SIZE', @offset@ and
--     @size@ /must/ specify a range contained within the currently mapped
--     range of @memory@
--
-- -   If @size@ is equal to
--     'Graphics.Vulkan.Core10.APIConstants.WHOLE_SIZE', @offset@ /must/ be
--     within the currently mapped range of @memory@
--
-- -   If @size@ is equal to
--     'Graphics.Vulkan.Core10.APIConstants.WHOLE_SIZE', the end of the
--     current mapping of @memory@ /must/ be a multiple of
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@nonCoherentAtomSize@
--     bytes from the beginning of the memory object.
--
-- -   @offset@ /must/ be a multiple of
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@nonCoherentAtomSize@
--
-- -   If @size@ is not equal to
--     'Graphics.Vulkan.Core10.APIConstants.WHOLE_SIZE', @size@ /must/
--     either be a multiple of
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@nonCoherentAtomSize@,
--     or @offset@ plus @size@ /must/ equal the size of @memory@.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_MAPPED_MEMORY_RANGE'
--
-- -   @pNext@ /must/ be @NULL@
--
-- -   @memory@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.DeviceMemory' handle
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.DeviceMemory',
-- 'Graphics.Vulkan.Core10.BaseType.DeviceSize',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'flushMappedMemoryRanges', 'invalidateMappedMemoryRanges'
data MappedMemoryRange = MappedMemoryRange
  { -- | @memory@ is the memory object to which this range belongs.
    memory :: DeviceMemory
  , -- | @offset@ is the zero-based byte offset from the beginning of the memory
    -- object.
    offset :: DeviceSize
  , -- | @size@ is either the size of range, or
    -- 'Graphics.Vulkan.Core10.APIConstants.WHOLE_SIZE' to affect the range
    -- from @offset@ to the end of the current mapping of the allocation.
    size :: DeviceSize
  }
  deriving (Typeable)
deriving instance Show MappedMemoryRange

instance ToCStruct MappedMemoryRange where
  withCStruct x f = allocaBytesAligned 40 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p MappedMemoryRange{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MAPPED_MEMORY_RANGE)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr DeviceMemory)) (memory)
    poke ((p `plusPtr` 24 :: Ptr DeviceSize)) (offset)
    poke ((p `plusPtr` 32 :: Ptr DeviceSize)) (size)
    f
  cStructSize = 40
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_MAPPED_MEMORY_RANGE)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr DeviceMemory)) (zero)
    poke ((p `plusPtr` 24 :: Ptr DeviceSize)) (zero)
    poke ((p `plusPtr` 32 :: Ptr DeviceSize)) (zero)
    f

instance FromCStruct MappedMemoryRange where
  peekCStruct p = do
    memory <- peek @DeviceMemory ((p `plusPtr` 16 :: Ptr DeviceMemory))
    offset <- peek @DeviceSize ((p `plusPtr` 24 :: Ptr DeviceSize))
    size <- peek @DeviceSize ((p `plusPtr` 32 :: Ptr DeviceSize))
    pure $ MappedMemoryRange
             memory offset size

instance Storable MappedMemoryRange where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero MappedMemoryRange where
  zero = MappedMemoryRange
           zero
           zero
           zero
