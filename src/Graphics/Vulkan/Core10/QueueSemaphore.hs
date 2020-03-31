{-# language CPP #-}
module Graphics.Vulkan.Core10.QueueSemaphore  ( createSemaphore
                                              , withSemaphore
                                              , destroySemaphore
                                              , SemaphoreCreateInfo(..)
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
import Data.Type.Equality ((:~:)(Refl))
import Data.Typeable (Typeable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.AllocationCallbacks (AllocationCallbacks)
import Graphics.Vulkan.CStruct.Extends (Chain)
import Graphics.Vulkan.Core10.Handles (Device)
import Graphics.Vulkan.Core10.Handles (Device(..))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCreateSemaphore))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkDestroySemaphore))
import Graphics.Vulkan.Core10.Handles (Device_T)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_semaphore (ExportSemaphoreCreateInfo)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_external_semaphore_win32 (ExportSemaphoreWin32HandleInfoKHR)
import Graphics.Vulkan.CStruct.Extends (Extends)
import Graphics.Vulkan.CStruct.Extends (Extensible(..))
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.CStruct.Extends (PeekChain)
import Graphics.Vulkan.CStruct.Extends (PeekChain(..))
import Graphics.Vulkan.CStruct.Extends (PokeChain)
import Graphics.Vulkan.CStruct.Extends (PokeChain(..))
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Handles (Semaphore)
import Graphics.Vulkan.Core10.Handles (Semaphore(..))
import Graphics.Vulkan.Core10.Enums.SemaphoreCreateFlags (SemaphoreCreateFlags)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_timeline_semaphore (SemaphoreTypeCreateInfo)
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateSemaphore
  :: FunPtr (Ptr Device_T -> Ptr (SemaphoreCreateInfo a) -> Ptr AllocationCallbacks -> Ptr Semaphore -> IO Result) -> Ptr Device_T -> Ptr (SemaphoreCreateInfo a) -> Ptr AllocationCallbacks -> Ptr Semaphore -> IO Result

-- | vkCreateSemaphore - Create a new queue semaphore object
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     creates the semaphore.
--
-- -   @pCreateInfo@ is a pointer to a 'SemaphoreCreateInfo' structure
--     containing information about how the semaphore is to be created.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pSemaphore@ is a pointer to a handle in which the resulting
--     semaphore object is returned.
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'SemaphoreCreateInfo' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   @pSemaphore@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.Core10.Handles.Semaphore' handle
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
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.Semaphore', 'SemaphoreCreateInfo'
createSemaphore :: PokeChain a => Device -> SemaphoreCreateInfo a -> ("allocator" ::: Maybe AllocationCallbacks) -> IO (Semaphore)
createSemaphore device createInfo allocator = evalContT $ do
  let vkCreateSemaphore' = mkVkCreateSemaphore (pVkCreateSemaphore (deviceCmds (device :: Device)))
  pCreateInfo <- ContT $ withCStruct (createInfo)
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  pPSemaphore <- ContT $ bracket (callocBytes @Semaphore 8) free
  r <- lift $ vkCreateSemaphore' (deviceHandle (device)) pCreateInfo pAllocator (pPSemaphore)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pSemaphore <- lift $ peek @Semaphore pPSemaphore
  pure $ (pSemaphore)

-- | A safe wrapper for 'createSemaphore' and 'destroySemaphore' using
-- 'bracket'
--
-- The allocated value must not be returned from the provided computation
withSemaphore :: PokeChain a => Device -> SemaphoreCreateInfo a -> Maybe AllocationCallbacks -> (Semaphore -> IO r) -> IO r
withSemaphore device semaphoreCreateInfo allocationCallbacks =
  bracket
    (createSemaphore device semaphoreCreateInfo allocationCallbacks)
    (\o -> destroySemaphore device o allocationCallbacks)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDestroySemaphore
  :: FunPtr (Ptr Device_T -> Semaphore -> Ptr AllocationCallbacks -> IO ()) -> Ptr Device_T -> Semaphore -> Ptr AllocationCallbacks -> IO ()

-- | vkDestroySemaphore - Destroy a semaphore object
--
-- = Parameters
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' is the logical device that
--     destroys the semaphore.
--
-- -   'Graphics.Vulkan.Core10.Handles.Semaphore' is the handle of the
--     semaphore to destroy.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- == Valid Usage
--
-- -   All submitted batches that refer to
--     'Graphics.Vulkan.Core10.Handles.Semaphore' /must/ have completed
--     execution
--
-- -   If 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     were provided when 'Graphics.Vulkan.Core10.Handles.Semaphore' was
--     created, a compatible set of callbacks /must/ be provided here
--
-- -   If no
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     were provided when 'Graphics.Vulkan.Core10.Handles.Semaphore' was
--     created, @pAllocator@ /must/ be @NULL@
--
-- == Valid Usage (Implicit)
--
-- -   'Graphics.Vulkan.Core10.Handles.Device' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Device' handle
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Semaphore' is not
--     'Graphics.Vulkan.Core10.APIConstants.NULL_HANDLE',
--     'Graphics.Vulkan.Core10.Handles.Semaphore' /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.Semaphore' handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   If 'Graphics.Vulkan.Core10.Handles.Semaphore' is a valid handle, it
--     /must/ have been created, allocated, or retrieved from
--     'Graphics.Vulkan.Core10.Handles.Device'
--
-- == Host Synchronization
--
-- -   Host access to 'Graphics.Vulkan.Core10.Handles.Semaphore' /must/ be
--     externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks',
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Core10.Handles.Semaphore'
destroySemaphore :: Device -> Semaphore -> ("allocator" ::: Maybe AllocationCallbacks) -> IO ()
destroySemaphore device semaphore allocator = evalContT $ do
  let vkDestroySemaphore' = mkVkDestroySemaphore (pVkDestroySemaphore (deviceCmds (device :: Device)))
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  lift $ vkDestroySemaphore' (deviceHandle (device)) (semaphore) pAllocator
  pure $ ()


-- | VkSemaphoreCreateInfo - Structure specifying parameters of a newly
-- created semaphore
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_semaphore.ExportSemaphoreCreateInfo',
--     'Graphics.Vulkan.Extensions.VK_KHR_external_semaphore_win32.ExportSemaphoreWin32HandleInfoKHR',
--     or
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_timeline_semaphore.SemaphoreTypeCreateInfo'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- -   'Graphics.Vulkan.Core10.BaseType.Flags' /must/ be @0@
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.SemaphoreCreateFlags.SemaphoreCreateFlags',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'createSemaphore'
data SemaphoreCreateInfo (es :: [Type]) = SemaphoreCreateInfo
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | 'Graphics.Vulkan.Core10.BaseType.Flags' is reserved for future use.
    flags :: SemaphoreCreateFlags
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (SemaphoreCreateInfo es)

instance Extensible SemaphoreCreateInfo where
  extensibleType = STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO
  setNext x next = x{next = next}
  getNext SemaphoreCreateInfo{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends SemaphoreCreateInfo e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @SemaphoreTypeCreateInfo = Just f
    | Just Refl <- eqT @e @ExportSemaphoreWin32HandleInfoKHR = Just f
    | Just Refl <- eqT @e @ExportSemaphoreCreateInfo = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (SemaphoreCreateInfo es) where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p SemaphoreCreateInfo{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    lift $ poke ((p `plusPtr` 16 :: Ptr SemaphoreCreateFlags)) (flags)
    lift $ f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    lift $ f

instance PeekChain es => FromCStruct (SemaphoreCreateInfo es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    flags <- peek @SemaphoreCreateFlags ((p `plusPtr` 16 :: Ptr SemaphoreCreateFlags))
    pure $ SemaphoreCreateInfo
             next flags

instance es ~ '[] => Zero (SemaphoreCreateInfo es) where
  zero = SemaphoreCreateInfo
           ()
           zero
