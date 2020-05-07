{-# language CPP #-}
module Vulkan.Extensions.VK_NV_scissor_exclusive  ( cmdSetExclusiveScissorNV
                                                  , PhysicalDeviceExclusiveScissorFeaturesNV(..)
                                                  , PipelineViewportExclusiveScissorStateCreateInfoNV(..)
                                                  , NV_SCISSOR_EXCLUSIVE_SPEC_VERSION
                                                  , pattern NV_SCISSOR_EXCLUSIVE_SPEC_VERSION
                                                  , NV_SCISSOR_EXCLUSIVE_EXTENSION_NAME
                                                  , pattern NV_SCISSOR_EXCLUSIVE_EXTENSION_NAME
                                                  ) where

import Control.Monad (unless)
import Control.Monad.IO.Class (liftIO)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import GHC.IO (throwIO)
import GHC.Ptr (nullFunPtr)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Data.Vector (generateM)
import qualified Data.Vector (imapM_)
import qualified Data.Vector (length)
import qualified Data.Vector (null)
import Control.Monad.IO.Class (MonadIO)
import Data.String (IsString)
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
import Data.Vector (Vector)
import Vulkan.CStruct.Utils (advancePtrBytes)
import Vulkan.Core10.BaseType (bool32ToBool)
import Vulkan.Core10.BaseType (boolToBool32)
import Vulkan.NamedType ((:::))
import Vulkan.Core10.BaseType (Bool32)
import Vulkan.Core10.Handles (CommandBuffer)
import Vulkan.Core10.Handles (CommandBuffer(..))
import Vulkan.Core10.Handles (CommandBuffer_T)
import Vulkan.Dynamic (DeviceCmds(pVkCmdSetExclusiveScissorNV))
import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (FromCStruct(..))
import Vulkan.Core10.CommandBufferBuilding (Rect2D)
import Vulkan.Core10.Enums.StructureType (StructureType)
import Vulkan.CStruct (ToCStruct)
import Vulkan.CStruct (ToCStruct(..))
import Vulkan.Zero (Zero(..))
import Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV))
import Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetExclusiveScissorNV
  :: FunPtr (Ptr CommandBuffer_T -> Word32 -> Word32 -> Ptr Rect2D -> IO ()) -> Ptr CommandBuffer_T -> Word32 -> Word32 -> Ptr Rect2D -> IO ()

-- | vkCmdSetExclusiveScissorNV - Set the dynamic exclusive scissor
-- rectangles on a command buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @firstExclusiveScissor@ is the index of the first exclusive scissor
--     rectangle whose state is updated by the command.
--
-- -   @exclusiveScissorCount@ is the number of exclusive scissor
--     rectangles updated by the command.
--
-- -   @pExclusiveScissors@ is a pointer to an array of
--     'Vulkan.Core10.CommandBufferBuilding.Rect2D' structures defining
--     exclusive scissor rectangles.
--
-- = Description
--
-- The scissor rectangles taken from element i of @pExclusiveScissors@
-- replace the current state for the scissor index @firstExclusiveScissor@
-- + i, for i in [0, @exclusiveScissorCount@).
--
-- This command sets the state for a given draw when the graphics pipeline
-- is created with
-- 'Vulkan.Core10.Enums.DynamicState.DYNAMIC_STATE_EXCLUSIVE_SCISSOR_NV'
-- set in
-- 'Vulkan.Core10.Pipeline.PipelineDynamicStateCreateInfo'::@pDynamicStates@.
--
-- == Valid Usage
--
-- -   The
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-exclusiveScissor exclusive scissor>
--     feature /must/ be enabled
--
-- -   @firstExclusiveScissor@ /must/ be less than
--     'Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@maxViewports@
--
-- -   The sum of @firstExclusiveScissor@ and @exclusiveScissorCount@
--     /must/ be between @1@ and
--     'Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@maxViewports@,
--     inclusive
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-multiViewport multiple viewports>
--     feature is not enabled, @firstExclusiveScissor@ /must/ be @0@
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-multiViewport multiple viewports>
--     feature is not enabled, @exclusiveScissorCount@ /must/ be @1@
--
-- -   The @x@ and @y@ members of @offset@ in each member of
--     @pExclusiveScissors@ /must/ be greater than or equal to @0@
--
-- -   Evaluation of (@offset.x@ + @extent.width@) for each member of
--     @pExclusiveScissors@ /must/ not cause a signed integer addition
--     overflow
--
-- -   Evaluation of (@offset.y@ + @extent.height@) for each member of
--     @pExclusiveScissors@ /must/ not cause a signed integer addition
--     overflow
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Vulkan.Core10.Handles.CommandBuffer' handle
--
-- -   @pExclusiveScissors@ /must/ be a valid pointer to an array of
--     @exclusiveScissorCount@ 'Vulkan.Core10.CommandBufferBuilding.Rect2D'
--     structures
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Vulkan.Core10.Handles.CommandPool' that @commandBuffer@ was
--     allocated from /must/ support graphics operations
--
-- -   @exclusiveScissorCount@ /must/ be greater than @0@
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the 'Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
--
-- == Command Properties
--
-- \'
--
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
-- | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkCommandBufferLevel Command Buffer Levels> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#vkCmdBeginRenderPass Render Pass Scope> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkQueueFlagBits Supported Queue Types> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-types Pipeline Type> |
-- +============================================================================================================================+========================================================================================================================+=======================================================================================================================+=====================================================================================================================================+
-- | Primary                                                                                                                    | Both                                                                                                                   | Graphics                                                                                                              |                                                                                                                                     |
-- | Secondary                                                                                                                  |                                                                                                                        |                                                                                                                       |                                                                                                                                     |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
--
-- = See Also
--
-- 'Vulkan.Core10.Handles.CommandBuffer',
-- 'Vulkan.Core10.CommandBufferBuilding.Rect2D'
cmdSetExclusiveScissorNV :: forall io . MonadIO io => CommandBuffer -> ("firstExclusiveScissor" ::: Word32) -> ("exclusiveScissors" ::: Vector Rect2D) -> io ()
cmdSetExclusiveScissorNV commandBuffer firstExclusiveScissor exclusiveScissors = liftIO . evalContT $ do
  let vkCmdSetExclusiveScissorNVPtr = pVkCmdSetExclusiveScissorNV (deviceCmds (commandBuffer :: CommandBuffer))
  lift $ unless (vkCmdSetExclusiveScissorNVPtr /= nullFunPtr) $
    throwIO $ IOError Nothing InvalidArgument "" "The function pointer for vkCmdSetExclusiveScissorNV is null" Nothing Nothing
  let vkCmdSetExclusiveScissorNV' = mkVkCmdSetExclusiveScissorNV vkCmdSetExclusiveScissorNVPtr
  pPExclusiveScissors <- ContT $ allocaBytesAligned @Rect2D ((Data.Vector.length (exclusiveScissors)) * 16) 4
  Data.Vector.imapM_ (\i e -> ContT $ pokeCStruct (pPExclusiveScissors `plusPtr` (16 * (i)) :: Ptr Rect2D) (e) . ($ ())) (exclusiveScissors)
  lift $ vkCmdSetExclusiveScissorNV' (commandBufferHandle (commandBuffer)) (firstExclusiveScissor) ((fromIntegral (Data.Vector.length $ (exclusiveScissors)) :: Word32)) (pPExclusiveScissors)
  pure $ ()


-- | VkPhysicalDeviceExclusiveScissorFeaturesNV - Structure describing
-- exclusive scissor features that can be supported by an implementation
--
-- = Members
--
-- The members of the 'PhysicalDeviceExclusiveScissorFeaturesNV' structure
-- describe the following features:
--
-- = Description
--
-- See
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fragops-exclusive-scissor Exclusive Scissor Test>
-- for more information.
--
-- If the 'PhysicalDeviceExclusiveScissorFeaturesNV' structure is included
-- in the @pNext@ chain of
-- 'Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2.PhysicalDeviceFeatures2',
-- it is filled with values indicating whether the feature is supported.
-- 'PhysicalDeviceExclusiveScissorFeaturesNV' /can/ also be included in the
-- @pNext@ chain of 'Vulkan.Core10.Device.DeviceCreateInfo' to enable the
-- feature.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Vulkan.Core10.BaseType.Bool32',
-- 'Vulkan.Core10.Enums.StructureType.StructureType'
data PhysicalDeviceExclusiveScissorFeaturesNV = PhysicalDeviceExclusiveScissorFeaturesNV
  { -- | @exclusiveScissor@ indicates that the implementation supports the
    -- exclusive scissor test.
    exclusiveScissor :: Bool }
  deriving (Typeable)
deriving instance Show PhysicalDeviceExclusiveScissorFeaturesNV

instance ToCStruct PhysicalDeviceExclusiveScissorFeaturesNV where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceExclusiveScissorFeaturesNV{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (exclusiveScissor))
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Bool32)) (boolToBool32 (zero))
    f

instance FromCStruct PhysicalDeviceExclusiveScissorFeaturesNV where
  peekCStruct p = do
    exclusiveScissor <- peek @Bool32 ((p `plusPtr` 16 :: Ptr Bool32))
    pure $ PhysicalDeviceExclusiveScissorFeaturesNV
             (bool32ToBool exclusiveScissor)

instance Storable PhysicalDeviceExclusiveScissorFeaturesNV where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PhysicalDeviceExclusiveScissorFeaturesNV where
  zero = PhysicalDeviceExclusiveScissorFeaturesNV
           zero


-- | VkPipelineViewportExclusiveScissorStateCreateInfoNV - Structure
-- specifying parameters controlling exclusive scissor testing
--
-- = Description
--
-- If the
-- 'Vulkan.Core10.Enums.DynamicState.DYNAMIC_STATE_EXCLUSIVE_SCISSOR_NV'
-- dynamic state is enabled for a pipeline, the @pExclusiveScissors@ member
-- is ignored.
--
-- When this structure is included in the @pNext@ chain of
-- 'Vulkan.Core10.Pipeline.GraphicsPipelineCreateInfo', it defines
-- parameters of the exclusive scissor test. If this structure is not
-- included in the @pNext@ chain, it is equivalent to specifying this
-- structure with a @exclusiveScissorCount@ of @0@.
--
-- == Valid Usage
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-multiViewport multiple viewports>
--     feature is not enabled, @exclusiveScissorCount@ /must/ be @0@ or @1@
--
-- -   @exclusiveScissorCount@ /must/ be less than or equal to
--     'Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@maxViewports@
--
-- -   @exclusiveScissorCount@ /must/ be @0@ or identical to the
--     @viewportCount@ member of
--     'Vulkan.Core10.Pipeline.PipelineViewportStateCreateInfo'
--
-- -   If no element of the @pDynamicStates@ member of @pDynamicState@ is
--     'Vulkan.Core10.Enums.DynamicState.DYNAMIC_STATE_EXCLUSIVE_SCISSOR_NV'
--     and @exclusiveScissorCount@ is not @0@, @pExclusiveScissors@ /must/
--     be a valid pointer to an array of @exclusiveScissorCount@
--     'Vulkan.Core10.CommandBufferBuilding.Rect2D' structures
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV'
--
-- -   If @exclusiveScissorCount@ is not @0@, and @pExclusiveScissors@ is
--     not @NULL@, @pExclusiveScissors@ /must/ be a valid pointer to an
--     array of @exclusiveScissorCount@
--     'Vulkan.Core10.CommandBufferBuilding.Rect2D' structures
--
-- = See Also
--
-- 'Vulkan.Core10.CommandBufferBuilding.Rect2D',
-- 'Vulkan.Core10.Enums.StructureType.StructureType'
data PipelineViewportExclusiveScissorStateCreateInfoNV = PipelineViewportExclusiveScissorStateCreateInfoNV
  { -- | @exclusiveScissorCount@ is the number of exclusive scissor rectangles.
    exclusiveScissorCount :: Word32
  , -- | @pExclusiveScissors@ is a pointer to an array of
    -- 'Vulkan.Core10.CommandBufferBuilding.Rect2D' structures defining
    -- exclusive scissor rectangles.
    exclusiveScissors :: Vector Rect2D
  }
  deriving (Typeable)
deriving instance Show PipelineViewportExclusiveScissorStateCreateInfoNV

instance ToCStruct PipelineViewportExclusiveScissorStateCreateInfoNV where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PipelineViewportExclusiveScissorStateCreateInfoNV{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    let pExclusiveScissorsLength = Data.Vector.length $ (exclusiveScissors)
    exclusiveScissorCount'' <- lift $ if (exclusiveScissorCount) == 0
      then pure $ fromIntegral pExclusiveScissorsLength
      else do
        unless (fromIntegral pExclusiveScissorsLength == (exclusiveScissorCount) || pExclusiveScissorsLength == 0) $
          throwIO $ IOError Nothing InvalidArgument "" "pExclusiveScissors must be empty or have 'exclusiveScissorCount' elements" Nothing Nothing
        pure (exclusiveScissorCount)
    lift $ poke ((p `plusPtr` 16 :: Ptr Word32)) (exclusiveScissorCount'')
    pExclusiveScissors'' <- if Data.Vector.null (exclusiveScissors)
      then pure nullPtr
      else do
        pPExclusiveScissors <- ContT $ allocaBytesAligned @Rect2D (((Data.Vector.length (exclusiveScissors))) * 16) 4
        Data.Vector.imapM_ (\i e -> ContT $ pokeCStruct (pPExclusiveScissors `plusPtr` (16 * (i)) :: Ptr Rect2D) (e) . ($ ())) ((exclusiveScissors))
        pure $ pPExclusiveScissors
    lift $ poke ((p `plusPtr` 24 :: Ptr (Ptr Rect2D))) pExclusiveScissors''
    lift $ f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    f

instance FromCStruct PipelineViewportExclusiveScissorStateCreateInfoNV where
  peekCStruct p = do
    exclusiveScissorCount <- peek @Word32 ((p `plusPtr` 16 :: Ptr Word32))
    pExclusiveScissors <- peek @(Ptr Rect2D) ((p `plusPtr` 24 :: Ptr (Ptr Rect2D)))
    let pExclusiveScissorsLength = if pExclusiveScissors == nullPtr then 0 else (fromIntegral exclusiveScissorCount)
    pExclusiveScissors' <- generateM pExclusiveScissorsLength (\i -> peekCStruct @Rect2D ((pExclusiveScissors `advancePtrBytes` (16 * (i)) :: Ptr Rect2D)))
    pure $ PipelineViewportExclusiveScissorStateCreateInfoNV
             exclusiveScissorCount pExclusiveScissors'

instance Zero PipelineViewportExclusiveScissorStateCreateInfoNV where
  zero = PipelineViewportExclusiveScissorStateCreateInfoNV
           zero
           mempty


type NV_SCISSOR_EXCLUSIVE_SPEC_VERSION = 1

-- No documentation found for TopLevel "VK_NV_SCISSOR_EXCLUSIVE_SPEC_VERSION"
pattern NV_SCISSOR_EXCLUSIVE_SPEC_VERSION :: forall a . Integral a => a
pattern NV_SCISSOR_EXCLUSIVE_SPEC_VERSION = 1


type NV_SCISSOR_EXCLUSIVE_EXTENSION_NAME = "VK_NV_scissor_exclusive"

-- No documentation found for TopLevel "VK_NV_SCISSOR_EXCLUSIVE_EXTENSION_NAME"
pattern NV_SCISSOR_EXCLUSIVE_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern NV_SCISSOR_EXCLUSIVE_EXTENSION_NAME = "VK_NV_scissor_exclusive"

