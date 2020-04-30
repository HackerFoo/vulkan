{-# language CPP #-}
module Graphics.Vulkan.Core12.Promoted_From_VK_KHR_create_renderpass2  ( createRenderPass2
                                                                       , cmdBeginRenderPass2
                                                                       , cmdWithRenderPass2
                                                                       , cmdNextSubpass2
                                                                       , cmdEndRenderPass2
                                                                       , AttachmentDescription2(..)
                                                                       , AttachmentReference2(..)
                                                                       , SubpassDescription2(..)
                                                                       , SubpassDependency2(..)
                                                                       , RenderPassCreateInfo2(..)
                                                                       , SubpassBeginInfo(..)
                                                                       , SubpassEndInfo(..)
                                                                       , StructureType(..)
                                                                       ) where

import Control.Exception.Base (bracket)
import Control.Monad (unless)
import Control.Monad.IO.Class (liftIO)
import Data.Typeable (eqT)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import Foreign.Marshal.Utils (maybePeek)
import GHC.Base (when)
import GHC.IO (throwIO)
import GHC.Ptr (castPtr)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Data.Vector (generateM)
import qualified Data.Vector (imapM_)
import qualified Data.Vector (length)
import qualified Data.Vector (null)
import Control.Monad.IO.Class (MonadIO)
import Data.Either (Either)
import Data.Type.Equality ((:~:)(Refl))
import Data.Typeable (Typeable)
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import GHC.IO.Exception (IOErrorType(..))
import GHC.IO.Exception (IOException(..))
import Data.Int (Int32)
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import Data.Word (Word32)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Data.Vector (Vector)
import Graphics.Vulkan.CStruct.Utils (advancePtrBytes)
import Graphics.Vulkan.CStruct.Extends (forgetExtensions)
import Graphics.Vulkan.CStruct.Extends (peekSomeCStruct)
import Graphics.Vulkan.CStruct.Extends (pokeSomeCStruct)
import Graphics.Vulkan.CStruct.Extends (withSomeCStruct)
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.Enums.AccessFlagBits (AccessFlags)
import Graphics.Vulkan.Core10.AllocationCallbacks (AllocationCallbacks)
import Graphics.Vulkan.Core10.Enums.AttachmentDescriptionFlagBits (AttachmentDescriptionFlags)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts (AttachmentDescriptionStencilLayout)
import Graphics.Vulkan.Core10.Enums.AttachmentLoadOp (AttachmentLoadOp)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts (AttachmentReferenceStencilLayout)
import Graphics.Vulkan.Core10.Enums.AttachmentStoreOp (AttachmentStoreOp)
import Graphics.Vulkan.CStruct.Extends (Chain)
import Graphics.Vulkan.Core10.Handles (CommandBuffer)
import Graphics.Vulkan.Core10.Handles (CommandBuffer(..))
import Graphics.Vulkan.Core10.Handles (CommandBuffer_T)
import Graphics.Vulkan.Core10.Enums.DependencyFlagBits (DependencyFlags)
import Graphics.Vulkan.Core10.Handles (Device)
import Graphics.Vulkan.Core10.Handles (Device(..))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCmdBeginRenderPass2))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCmdEndRenderPass2))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCmdNextSubpass2))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCreateRenderPass2))
import Graphics.Vulkan.Core10.Handles (Device_T)
import Graphics.Vulkan.CStruct.Extends (Extends)
import Graphics.Vulkan.CStruct.Extends (Extensible(..))
import Graphics.Vulkan.Core10.Enums.Format (Format)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits (ImageAspectFlags)
import Graphics.Vulkan.Core10.Enums.ImageLayout (ImageLayout)
import Graphics.Vulkan.CStruct.Extends (PeekChain)
import Graphics.Vulkan.CStruct.Extends (PeekChain(..))
import Graphics.Vulkan.Core10.Enums.PipelineBindPoint (PipelineBindPoint)
import Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits (PipelineStageFlags)
import Graphics.Vulkan.CStruct.Extends (PokeChain)
import Graphics.Vulkan.CStruct.Extends (PokeChain(..))
import Graphics.Vulkan.Core10.Handles (RenderPass)
import Graphics.Vulkan.Core10.Handles (RenderPass(..))
import Graphics.Vulkan.Core10.CommandBufferBuilding (RenderPassBeginInfo)
import Graphics.Vulkan.Core10.Enums.RenderPassCreateFlagBits (RenderPassCreateFlags)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_fragment_density_map (RenderPassFragmentDensityMapCreateInfoEXT)
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.SampleCountFlagBits (SampleCountFlagBits)
import Graphics.Vulkan.CStruct.Extends (SomeStruct)
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.Core10.Enums.SubpassContents (SubpassContents)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_depth_stencil_resolve (SubpassDescriptionDepthStencilResolve)
import Graphics.Vulkan.Core10.Enums.SubpassDescriptionFlagBits (SubpassDescriptionFlags)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_SUBPASS_BEGIN_INFO))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_SUBPASS_END_INFO))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(..))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateRenderPass2
  :: FunPtr (Ptr Device_T -> Ptr (RenderPassCreateInfo2 a) -> Ptr AllocationCallbacks -> Ptr RenderPass -> IO Result) -> Ptr Device_T -> Ptr (RenderPassCreateInfo2 a) -> Ptr AllocationCallbacks -> Ptr RenderPass -> IO Result

-- | vkCreateRenderPass2 - Create a new render pass object
--
-- = Parameters
--
-- -   @device@ is the logical device that creates the render pass.
--
-- -   @pCreateInfo@ is a pointer to a 'RenderPassCreateInfo2' structure
--     describing the parameters of the render pass.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pRenderPass@ is a pointer to a
--     'Graphics.Vulkan.Core10.Handles.RenderPass' handle in which the
--     resulting render pass object is returned.
--
-- = Description
--
-- This command is functionally identical to
-- 'Graphics.Vulkan.Core10.Pass.createRenderPass', but includes extensible
-- sub-structures that include @sType@ and @pNext@ parameters, allowing
-- them to be more easily extended.
--
-- == Valid Usage (Implicit)
--
-- -   @device@ /must/ be a valid 'Graphics.Vulkan.Core10.Handles.Device'
--     handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'RenderPassCreateInfo2' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.Core10.AllocationCallbacks.AllocationCallbacks'
--     structure
--
-- -   @pRenderPass@ /must/ be a valid pointer to a
--     'Graphics.Vulkan.Core10.Handles.RenderPass' handle
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
-- 'Graphics.Vulkan.Core10.Handles.RenderPass', 'RenderPassCreateInfo2'
createRenderPass2 :: forall a io . (PokeChain a, MonadIO io) => Device -> RenderPassCreateInfo2 a -> ("allocator" ::: Maybe AllocationCallbacks) -> io (RenderPass)
createRenderPass2 device createInfo allocator = liftIO . evalContT $ do
  let vkCreateRenderPass2' = mkVkCreateRenderPass2 (pVkCreateRenderPass2 (deviceCmds (device :: Device)))
  pCreateInfo <- ContT $ withCStruct (createInfo)
  pAllocator <- case (allocator) of
    Nothing -> pure nullPtr
    Just j -> ContT $ withCStruct (j)
  pPRenderPass <- ContT $ bracket (callocBytes @RenderPass 8) free
  r <- lift $ vkCreateRenderPass2' (deviceHandle (device)) pCreateInfo pAllocator (pPRenderPass)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pRenderPass <- lift $ peek @RenderPass pPRenderPass
  pure $ (pRenderPass)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdBeginRenderPass2
  :: FunPtr (Ptr CommandBuffer_T -> Ptr (RenderPassBeginInfo a) -> Ptr SubpassBeginInfo -> IO ()) -> Ptr CommandBuffer_T -> Ptr (RenderPassBeginInfo a) -> Ptr SubpassBeginInfo -> IO ()

-- | vkCmdBeginRenderPass2 - Begin a new render pass
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer in which to record the
--     command.
--
-- -   @pRenderPassBegin@ is a pointer to a
--     'Graphics.Vulkan.Core10.CommandBufferBuilding.RenderPassBeginInfo'
--     structure specifying the render pass to begin an instance of, and
--     the framebuffer the instance uses.
--
-- -   @pSubpassBeginInfo@ is a pointer to a 'SubpassBeginInfo' structure
--     containing information about the subpass which is about to begin
--     rendering.
--
-- = Description
--
-- After beginning a render pass instance, the command buffer is ready to
-- record the commands for the first subpass of that render pass.
--
-- == Valid Usage
--
-- -   Both the @framebuffer@ and @renderPass@ members of
--     @pRenderPassBegin@ /must/ have been created on the same
--     'Graphics.Vulkan.Core10.Handles.Device' that @commandBuffer@ was
--     allocated on
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentDescription' structures or
--     the @layout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.IMAGE_USAGE_COLOR_ATTACHMENT_BIT'
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentDescription' structures or
--     the @layout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT'
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentDescription' structures or
--     the @layout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT'
--
-- -   If any of the @stencilInitialLayout@ or @stencilFinalLayout@ member
--     of the
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts.AttachmentDescriptionStencilLayout'
--     structures or the @stencilLayout@ member of the
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts.AttachmentReferenceStencilLayout'
--     structures specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.IMAGE_USAGE_DEPTH_STENCIL_ATTACHMENT_BIT'
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentDescription' structures or
--     the @layout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.IMAGE_USAGE_SAMPLED_BIT'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.IMAGE_USAGE_INPUT_ATTACHMENT_BIT'
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentDescription' structures or
--     the @layout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_TRANSFER_SRC_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.IMAGE_USAGE_TRANSFER_SRC_BIT'
--
-- -   If any of the @initialLayout@ or @finalLayout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentDescription' structures or
--     the @layout@ member of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentReference' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_TRANSFER_DST_OPTIMAL'
--     then the corresponding attachment image view of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@ /must/
--     have been created with a @usage@ value including
--     'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.IMAGE_USAGE_TRANSFER_DST_BIT'
--
-- -   If any of the @initialLayout@ members of the
--     'Graphics.Vulkan.Core10.Pass.AttachmentDescription' structures
--     specified when creating the render pass specified in the
--     @renderPass@ member of @pRenderPassBegin@ is not
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_UNDEFINED',
--     then each such @initialLayout@ /must/ be equal to the current layout
--     of the corresponding attachment image subresource of the framebuffer
--     specified in the @framebuffer@ member of @pRenderPassBegin@
--
-- -   The @srcStageMask@ and @dstStageMask@ members of any element of the
--     @pDependencies@ member of
--     'Graphics.Vulkan.Core10.Pass.RenderPassCreateInfo' used to create
--     @renderPass@ /must/ be supported by the capabilities of the queue
--     family identified by the @queueFamilyIndex@ member of the
--     'Graphics.Vulkan.Core10.CommandPool.CommandPoolCreateInfo' used to
--     create the command pool which @commandBuffer@ was allocated from
--
-- -   For any attachment in @framebuffer@ that is used by @renderPass@ and
--     is bound to memory locations that are also bound to another
--     attachment used by @renderPass@, and if at least one of those uses
--     causes either attachment to be written to, both attachments /must/
--     have had the
--     'Graphics.Vulkan.Core10.Enums.AttachmentDescriptionFlagBits.ATTACHMENT_DESCRIPTION_MAY_ALIAS_BIT'
--     set
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer' handle
--
-- -   @pRenderPassBegin@ /must/ be a valid pointer to a valid
--     'Graphics.Vulkan.Core10.CommandBufferBuilding.RenderPassBeginInfo'
--     structure
--
-- -   @pSubpassBeginInfo@ /must/ be a valid pointer to a valid
--     'SubpassBeginInfo' structure
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called outside of a render pass instance
--
-- -   @commandBuffer@ /must/ be a primary
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
--
-- == Command Properties
--
-- \'
--
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
-- | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkCommandBufferLevel Command Buffer Levels> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#vkCmdBeginRenderPass Render Pass Scope> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkQueueFlagBits Supported Queue Types> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-types Pipeline Type> |
-- +============================================================================================================================+========================================================================================================================+=======================================================================================================================+=====================================================================================================================================+
-- | Primary                                                                                                                    | Outside                                                                                                                | Graphics                                                                                                              | Graphics                                                                                                                            |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.CommandBuffer',
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.RenderPassBeginInfo',
-- 'SubpassBeginInfo'
cmdBeginRenderPass2 :: forall a io . (PokeChain a, MonadIO io) => CommandBuffer -> RenderPassBeginInfo a -> SubpassBeginInfo -> io ()
cmdBeginRenderPass2 commandBuffer renderPassBegin subpassBeginInfo = liftIO . evalContT $ do
  let vkCmdBeginRenderPass2' = mkVkCmdBeginRenderPass2 (pVkCmdBeginRenderPass2 (deviceCmds (commandBuffer :: CommandBuffer)))
  pRenderPassBegin <- ContT $ withCStruct (renderPassBegin)
  pSubpassBeginInfo <- ContT $ withCStruct (subpassBeginInfo)
  lift $ vkCmdBeginRenderPass2' (commandBufferHandle (commandBuffer)) pRenderPassBegin pSubpassBeginInfo
  pure $ ()

-- | A convenience wrapper to make a compatible pair of calls to
-- 'cmdBeginRenderPass2' and 'cmdEndRenderPass2'
--
-- To ensure that 'cmdEndRenderPass2' is always called: pass
-- 'Control.Exception.bracket_' (or the allocate function from your
-- favourite resource management library) as the first argument.
-- To just extract the pair pass '(,)' as the first argument.
--
-- Note that there is no inner resource
cmdWithRenderPass2 :: forall a io r . (PokeChain a, MonadIO io) => (io () -> io () -> r) -> CommandBuffer -> RenderPassBeginInfo a -> SubpassBeginInfo -> SubpassEndInfo -> r
cmdWithRenderPass2 b commandBuffer pRenderPassBegin pSubpassBeginInfo pSubpassEndInfo =
  b (cmdBeginRenderPass2 commandBuffer pRenderPassBegin pSubpassBeginInfo)
    (cmdEndRenderPass2 commandBuffer pSubpassEndInfo)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdNextSubpass2
  :: FunPtr (Ptr CommandBuffer_T -> Ptr SubpassBeginInfo -> Ptr SubpassEndInfo -> IO ()) -> Ptr CommandBuffer_T -> Ptr SubpassBeginInfo -> Ptr SubpassEndInfo -> IO ()

-- | vkCmdNextSubpass2 - Transition to the next subpass of a render pass
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer in which to record the
--     command.
--
-- -   @pSubpassBeginInfo@ is a pointer to a 'SubpassBeginInfo' structure
--     containing information about the subpass which is about to begin
--     rendering.
--
-- -   @pSubpassEndInfo@ is a pointer to a 'SubpassEndInfo' structure
--     containing information about how the previous subpass will be ended.
--
-- = Description
--
-- 'cmdNextSubpass2' is semantically identical to
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdNextSubpass', except
-- that it is extensible, and that @contents@ is provided as part of an
-- extensible structure instead of as a flat parameter.
--
-- == Valid Usage
--
-- -   The current subpass index /must/ be less than the number of
--     subpasses in the render pass minus one
--
-- -   This command /must/ not be recorded when transform feedback is
--     active
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer' handle
--
-- -   @pSubpassBeginInfo@ /must/ be a valid pointer to a valid
--     'SubpassBeginInfo' structure
--
-- -   @pSubpassEndInfo@ /must/ be a valid pointer to a valid
--     'SubpassEndInfo' structure
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called inside of a render pass instance
--
-- -   @commandBuffer@ /must/ be a primary
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
--
-- == Command Properties
--
-- \'
--
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
-- | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkCommandBufferLevel Command Buffer Levels> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#vkCmdBeginRenderPass Render Pass Scope> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkQueueFlagBits Supported Queue Types> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-types Pipeline Type> |
-- +============================================================================================================================+========================================================================================================================+=======================================================================================================================+=====================================================================================================================================+
-- | Primary                                                                                                                    | Inside                                                                                                                 | Graphics                                                                                                              | Graphics                                                                                                                            |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.CommandBuffer', 'SubpassBeginInfo',
-- 'SubpassEndInfo'
cmdNextSubpass2 :: forall io . MonadIO io => CommandBuffer -> SubpassBeginInfo -> SubpassEndInfo -> io ()
cmdNextSubpass2 commandBuffer subpassBeginInfo subpassEndInfo = liftIO . evalContT $ do
  let vkCmdNextSubpass2' = mkVkCmdNextSubpass2 (pVkCmdNextSubpass2 (deviceCmds (commandBuffer :: CommandBuffer)))
  pSubpassBeginInfo <- ContT $ withCStruct (subpassBeginInfo)
  pSubpassEndInfo <- ContT $ withCStruct (subpassEndInfo)
  lift $ vkCmdNextSubpass2' (commandBufferHandle (commandBuffer)) pSubpassBeginInfo pSubpassEndInfo
  pure $ ()


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdEndRenderPass2
  :: FunPtr (Ptr CommandBuffer_T -> Ptr SubpassEndInfo -> IO ()) -> Ptr CommandBuffer_T -> Ptr SubpassEndInfo -> IO ()

-- | vkCmdEndRenderPass2 - End the current render pass
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer in which to end the current
--     render pass instance.
--
-- -   @pSubpassEndInfo@ is a pointer to a 'SubpassEndInfo' structure
--     containing information about how the previous subpass will be ended.
--
-- = Description
--
-- 'cmdEndRenderPass2' is semantically identical to
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdEndRenderPass', except
-- that it is extensible.
--
-- == Valid Usage
--
-- -   The current subpass index /must/ be equal to the number of subpasses
--     in the render pass minus one
--
-- -   This command /must/ not be recorded when transform feedback is
--     active
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer' handle
--
-- -   @pSubpassEndInfo@ /must/ be a valid pointer to a valid
--     'SubpassEndInfo' structure
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics
--     operations
--
-- -   This command /must/ only be called inside of a render pass instance
--
-- -   @commandBuffer@ /must/ be a primary
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer'
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ be externally synchronized
--
-- == Command Properties
--
-- \'
--
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
-- | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkCommandBufferLevel Command Buffer Levels> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#vkCmdBeginRenderPass Render Pass Scope> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkQueueFlagBits Supported Queue Types> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-types Pipeline Type> |
-- +============================================================================================================================+========================================================================================================================+=======================================================================================================================+=====================================================================================================================================+
-- | Primary                                                                                                                    | Inside                                                                                                                 | Graphics                                                                                                              | Graphics                                                                                                                            |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.CommandBuffer', 'SubpassEndInfo'
cmdEndRenderPass2 :: forall io . MonadIO io => CommandBuffer -> SubpassEndInfo -> io ()
cmdEndRenderPass2 commandBuffer subpassEndInfo = liftIO . evalContT $ do
  let vkCmdEndRenderPass2' = mkVkCmdEndRenderPass2 (pVkCmdEndRenderPass2 (deviceCmds (commandBuffer :: CommandBuffer)))
  pSubpassEndInfo <- ContT $ withCStruct (subpassEndInfo)
  lift $ vkCmdEndRenderPass2' (commandBufferHandle (commandBuffer)) pSubpassEndInfo
  pure $ ()


-- | VkAttachmentDescription2 - Structure specifying an attachment
-- description
--
-- = Description
--
-- Parameters defined by this structure with the same name as those in
-- 'Graphics.Vulkan.Core10.Pass.AttachmentDescription' have the identical
-- effect to those parameters.
--
-- If the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-separateDepthStencilLayouts separateDepthStencilLayouts>
-- feature is enabled, and @format@ is a depth\/stencil format,
-- @initialLayout@ and @finalLayout@ /can/ be set to a layout that only
-- specifies the layout of the depth aspect.
--
-- If @format@ is a depth\/stencil format, and @initialLayout@ only
-- specifies the initial layout of the depth aspect of the attachment, the
-- initial layout of the stencil aspect is specified by the
-- @stencilInitialLayout@ member of a
-- 'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts.AttachmentDescriptionStencilLayout'
-- structure included in the @pNext@ chain. Otherwise, @initialLayout@
-- describes the initial layout for all relevant image aspects.
--
-- If @format@ is a depth\/stencil format, and @finalLayout@ only specifies
-- the final layout of the depth aspect of the attachment, the final layout
-- of the stencil aspect is specified by the @stencilFinalLayout@ member of
-- a
-- 'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts.AttachmentDescriptionStencilLayout'
-- structure included in the @pNext@ chain. Otherwise, @finalLayout@
-- describes the final layout for all relevant image aspects.
--
-- == Valid Usage
--
-- -   @finalLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_UNDEFINED' or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_PREINITIALIZED'
--
-- -   If @format@ is a color format, @initialLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL'
--
-- -   If @format@ is a depth\/stencil format, @initialLayout@ /must/ not
--     be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL'
--
-- -   If @format@ is a color format, @finalLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL'
--
-- -   If @format@ is a depth\/stencil format, @finalLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-separateDepthStencilLayouts separateDepthStencilLayouts>
--     feature is not enabled, @initialLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-separateDepthStencilLayouts separateDepthStencilLayouts>
--     feature is not enabled, @finalLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
--
-- -   If @format@ is a color format, @initialLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
--
-- -   If @format@ is a color format, @finalLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
--
-- -   If @format@ is a depth\/stencil format which includes both depth and
--     stencil aspects, and @initialLayout@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     the @pNext@ chain /must/ include a
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts.AttachmentDescriptionStencilLayout'
--     structure
--
-- -   If @format@ is a depth\/stencil format which includes both depth and
--     stencil aspects, and @finalLayout@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     the @pNext@ chain /must/ include a
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts.AttachmentDescriptionStencilLayout'
--     structure
--
-- -   If @format@ is a depth\/stencil format which includes only the depth
--     aspect, @initialLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
--
-- -   If @format@ is a depth\/stencil format which includes only the depth
--     aspect, @finalLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
--
-- -   If @format@ is a depth\/stencil format which includes only the
--     stencil aspect, @initialLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL'
--
-- -   If @format@ is a depth\/stencil format which includes only the
--     stencil aspect, @finalLayout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2'
--
-- -   @flags@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.AttachmentDescriptionFlagBits.AttachmentDescriptionFlagBits'
--     values
--
-- -   @format@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.Format.Format' value
--
-- -   @samples@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.SampleCountFlagBits.SampleCountFlagBits'
--     value
--
-- -   @loadOp@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.AttachmentLoadOp.AttachmentLoadOp'
--     value
--
-- -   @storeOp@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.AttachmentStoreOp.AttachmentStoreOp'
--     value
--
-- -   @stencilLoadOp@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.AttachmentLoadOp.AttachmentLoadOp'
--     value
--
-- -   @stencilStoreOp@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.AttachmentStoreOp.AttachmentStoreOp'
--     value
--
-- -   @initialLayout@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout' value
--
-- -   @finalLayout@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout' value
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.AttachmentDescriptionFlagBits.AttachmentDescriptionFlags',
-- 'Graphics.Vulkan.Core10.Enums.AttachmentLoadOp.AttachmentLoadOp',
-- 'Graphics.Vulkan.Core10.Enums.AttachmentStoreOp.AttachmentStoreOp',
-- 'Graphics.Vulkan.Core10.Enums.Format.Format',
-- 'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout',
-- 'RenderPassCreateInfo2',
-- 'Graphics.Vulkan.Core10.Enums.SampleCountFlagBits.SampleCountFlagBits',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data AttachmentDescription2 (es :: [Type]) = AttachmentDescription2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @flags@ is a bitmask of
    -- 'Graphics.Vulkan.Core10.Enums.AttachmentDescriptionFlagBits.AttachmentDescriptionFlagBits'
    -- specifying additional properties of the attachment.
    flags :: AttachmentDescriptionFlags
  , -- | @format@ is a 'Graphics.Vulkan.Core10.Enums.Format.Format' value
    -- specifying the format of the image that will be used for the attachment.
    format :: Format
  , -- | @samples@ is the number of samples of the image as defined in
    -- 'Graphics.Vulkan.Core10.Enums.SampleCountFlagBits.SampleCountFlagBits'.
    samples :: SampleCountFlagBits
  , -- | @loadOp@ is a
    -- 'Graphics.Vulkan.Core10.Enums.AttachmentLoadOp.AttachmentLoadOp' value
    -- specifying how the contents of color and depth components of the
    -- attachment are treated at the beginning of the subpass where it is first
    -- used.
    loadOp :: AttachmentLoadOp
  , -- | @storeOp@ is a
    -- 'Graphics.Vulkan.Core10.Enums.AttachmentStoreOp.AttachmentStoreOp' value
    -- specifying how the contents of color and depth components of the
    -- attachment are treated at the end of the subpass where it is last used.
    storeOp :: AttachmentStoreOp
  , -- | @stencilLoadOp@ is a
    -- 'Graphics.Vulkan.Core10.Enums.AttachmentLoadOp.AttachmentLoadOp' value
    -- specifying how the contents of stencil components of the attachment are
    -- treated at the beginning of the subpass where it is first used.
    stencilLoadOp :: AttachmentLoadOp
  , -- | @stencilStoreOp@ is a
    -- 'Graphics.Vulkan.Core10.Enums.AttachmentStoreOp.AttachmentStoreOp' value
    -- specifying how the contents of stencil components of the attachment are
    -- treated at the end of the last subpass where it is used.
    stencilStoreOp :: AttachmentStoreOp
  , -- | @initialLayout@ is the layout the attachment image subresource will be
    -- in when a render pass instance begins.
    initialLayout :: ImageLayout
  , -- | @finalLayout@ is the layout the attachment image subresource will be
    -- transitioned to when a render pass instance ends.
    finalLayout :: ImageLayout
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (AttachmentDescription2 es)

instance Extensible AttachmentDescription2 where
  extensibleType = STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2
  setNext x next = x{next = next}
  getNext AttachmentDescription2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends AttachmentDescription2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @AttachmentDescriptionStencilLayout = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (AttachmentDescription2 es) where
  withCStruct x f = allocaBytesAligned 56 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p AttachmentDescription2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    lift $ poke ((p `plusPtr` 16 :: Ptr AttachmentDescriptionFlags)) (flags)
    lift $ poke ((p `plusPtr` 20 :: Ptr Format)) (format)
    lift $ poke ((p `plusPtr` 24 :: Ptr SampleCountFlagBits)) (samples)
    lift $ poke ((p `plusPtr` 28 :: Ptr AttachmentLoadOp)) (loadOp)
    lift $ poke ((p `plusPtr` 32 :: Ptr AttachmentStoreOp)) (storeOp)
    lift $ poke ((p `plusPtr` 36 :: Ptr AttachmentLoadOp)) (stencilLoadOp)
    lift $ poke ((p `plusPtr` 40 :: Ptr AttachmentStoreOp)) (stencilStoreOp)
    lift $ poke ((p `plusPtr` 44 :: Ptr ImageLayout)) (initialLayout)
    lift $ poke ((p `plusPtr` 48 :: Ptr ImageLayout)) (finalLayout)
    lift $ f
  cStructSize = 56
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ATTACHMENT_DESCRIPTION_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    lift $ poke ((p `plusPtr` 20 :: Ptr Format)) (zero)
    lift $ poke ((p `plusPtr` 24 :: Ptr SampleCountFlagBits)) (zero)
    lift $ poke ((p `plusPtr` 28 :: Ptr AttachmentLoadOp)) (zero)
    lift $ poke ((p `plusPtr` 32 :: Ptr AttachmentStoreOp)) (zero)
    lift $ poke ((p `plusPtr` 36 :: Ptr AttachmentLoadOp)) (zero)
    lift $ poke ((p `plusPtr` 40 :: Ptr AttachmentStoreOp)) (zero)
    lift $ poke ((p `plusPtr` 44 :: Ptr ImageLayout)) (zero)
    lift $ poke ((p `plusPtr` 48 :: Ptr ImageLayout)) (zero)
    lift $ f

instance PeekChain es => FromCStruct (AttachmentDescription2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    flags <- peek @AttachmentDescriptionFlags ((p `plusPtr` 16 :: Ptr AttachmentDescriptionFlags))
    format <- peek @Format ((p `plusPtr` 20 :: Ptr Format))
    samples <- peek @SampleCountFlagBits ((p `plusPtr` 24 :: Ptr SampleCountFlagBits))
    loadOp <- peek @AttachmentLoadOp ((p `plusPtr` 28 :: Ptr AttachmentLoadOp))
    storeOp <- peek @AttachmentStoreOp ((p `plusPtr` 32 :: Ptr AttachmentStoreOp))
    stencilLoadOp <- peek @AttachmentLoadOp ((p `plusPtr` 36 :: Ptr AttachmentLoadOp))
    stencilStoreOp <- peek @AttachmentStoreOp ((p `plusPtr` 40 :: Ptr AttachmentStoreOp))
    initialLayout <- peek @ImageLayout ((p `plusPtr` 44 :: Ptr ImageLayout))
    finalLayout <- peek @ImageLayout ((p `plusPtr` 48 :: Ptr ImageLayout))
    pure $ AttachmentDescription2
             next flags format samples loadOp storeOp stencilLoadOp stencilStoreOp initialLayout finalLayout

instance es ~ '[] => Zero (AttachmentDescription2 es) where
  zero = AttachmentDescription2
           ()
           zero
           zero
           zero
           zero
           zero
           zero
           zero
           zero
           zero


-- | VkAttachmentReference2 - Structure specifying an attachment reference
--
-- = Description
--
-- Parameters defined by this structure with the same name as those in
-- 'Graphics.Vulkan.Core10.Pass.AttachmentReference' have the identical
-- effect to those parameters.
--
-- @aspectMask@ has the same effect for the described attachment as
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_maintenance2.InputAttachmentAspectReference'::@aspectMask@
-- has on each corresponding attachment. It is ignored when this structure
-- is used to describe anything other than an input attachment reference.
--
-- If the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-separateDepthStencilLayouts separateDepthStencilLayouts>
-- feature is enabled, and @attachment@ has a depth\/stencil format,
-- @layout@ /can/ be set to a layout that only specifies the layout of the
-- depth aspect.
--
-- If @layout@ only specifies the layout of the depth aspect of the
-- attachment, the layout of the stencil aspect is specified by the
-- @stencilLayout@ member of a
-- 'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts.AttachmentReferenceStencilLayout'
-- structure included in the @pNext@ chain. Otherwise, @layout@ describes
-- the layout for all relevant image aspects.
--
-- == Valid Usage
--
-- -   If @attachment@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', @layout@
--     /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_UNDEFINED',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_PREINITIALIZED',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_PRESENT_SRC_KHR'
--
-- -   If @attachment@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', and
--     @aspectMask@ does not include
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_STENCIL_BIT'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_DEPTH_BIT',
--     @layout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL'
--
-- -   If @attachment@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', and
--     @aspectMask@ does not include
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_COLOR_BIT',
--     @layout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_COLOR_ATTACHMENT_OPTIMAL'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-separateDepthStencilLayouts separateDepthStencilLayouts>
--     feature is not enabled, and @attachment@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', @layout@
--     /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL',
--
-- -   If @attachment@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', and
--     @aspectMask@ includes
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_COLOR_BIT',
--     @layout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL',
--
-- -   If @attachment@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', and
--     @aspectMask@ includes both
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_DEPTH_BIT'
--     and
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_STENCIL_BIT',
--     and @layout@ is
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL'
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL',
--     the @pNext@ chain /must/ include a
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts.AttachmentReferenceStencilLayout'
--     structure
--
-- -   If @attachment@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', and
--     @aspectMask@ includes only
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_DEPTH_BIT'
--     then @layout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_ATTACHMENT_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_STENCIL_READ_ONLY_OPTIMAL'
--
-- -   If @attachment@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', and
--     @aspectMask@ includes only
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_STENCIL_BIT'
--     then @layout@ /must/ not be
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_OPTIMAL'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2'
--
-- -   @layout@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout' value
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.ImageAspectFlags',
-- 'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'SubpassDescription2',
-- 'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_depth_stencil_resolve.SubpassDescriptionDepthStencilResolve'
data AttachmentReference2 (es :: [Type]) = AttachmentReference2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @attachment@ is either an integer value identifying an attachment at the
    -- corresponding index in
    -- 'Graphics.Vulkan.Core10.Pass.RenderPassCreateInfo'::@pAttachments@, or
    -- 'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED' to signify that
    -- this attachment is not used.
    attachment :: Word32
  , -- | @layout@ is a 'Graphics.Vulkan.Core10.Enums.ImageLayout.ImageLayout'
    -- value specifying the layout the attachment uses during the subpass.
    layout :: ImageLayout
  , -- | @aspectMask@ is a mask of which aspect(s) /can/ be accessed within the
    -- specified subpass as an input attachment.
    aspectMask :: ImageAspectFlags
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (AttachmentReference2 es)

instance Extensible AttachmentReference2 where
  extensibleType = STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2
  setNext x next = x{next = next}
  getNext AttachmentReference2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends AttachmentReference2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @AttachmentReferenceStencilLayout = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (AttachmentReference2 es) where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p AttachmentReference2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    lift $ poke ((p `plusPtr` 16 :: Ptr Word32)) (attachment)
    lift $ poke ((p `plusPtr` 20 :: Ptr ImageLayout)) (layout)
    lift $ poke ((p `plusPtr` 24 :: Ptr ImageAspectFlags)) (aspectMask)
    lift $ f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_ATTACHMENT_REFERENCE_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    lift $ poke ((p `plusPtr` 16 :: Ptr Word32)) (zero)
    lift $ poke ((p `plusPtr` 20 :: Ptr ImageLayout)) (zero)
    lift $ poke ((p `plusPtr` 24 :: Ptr ImageAspectFlags)) (zero)
    lift $ f

instance PeekChain es => FromCStruct (AttachmentReference2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    attachment <- peek @Word32 ((p `plusPtr` 16 :: Ptr Word32))
    layout <- peek @ImageLayout ((p `plusPtr` 20 :: Ptr ImageLayout))
    aspectMask <- peek @ImageAspectFlags ((p `plusPtr` 24 :: Ptr ImageAspectFlags))
    pure $ AttachmentReference2
             next attachment layout aspectMask

instance es ~ '[] => Zero (AttachmentReference2 es) where
  zero = AttachmentReference2
           ()
           zero
           zero
           zero


-- | VkSubpassDescription2 - Structure specifying a subpass description
--
-- = Description
--
-- Parameters defined by this structure with the same name as those in
-- 'Graphics.Vulkan.Core10.Pass.SubpassDescription' have the identical
-- effect to those parameters.
--
-- @viewMask@ has the same effect for the described subpass as
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_multiview.RenderPassMultiviewCreateInfo'::@pViewMasks@
-- has on each corresponding subpass.
--
-- == Valid Usage
--
-- -   @pipelineBindPoint@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.PipelineBindPoint.PIPELINE_BIND_POINT_GRAPHICS'
--
-- -   @colorAttachmentCount@ /must/ be less than or equal to
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@maxColorAttachments@
--
-- -   If the first use of an attachment in this render pass is as an input
--     attachment, and the attachment is not also used as a color or
--     depth\/stencil attachment in the same subpass, then @loadOp@ /must/
--     not be
--     'Graphics.Vulkan.Core10.Enums.AttachmentLoadOp.ATTACHMENT_LOAD_OP_CLEAR'
--
-- -   If @pResolveAttachments@ is not @NULL@, for each resolve attachment
--     that does not have the value
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', the
--     corresponding color attachment /must/ not have the value
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED'
--
-- -   If @pResolveAttachments@ is not @NULL@, for each resolve attachment
--     that is not 'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED',
--     the corresponding color attachment /must/ not have a sample count of
--     'Graphics.Vulkan.Core10.Enums.SampleCountFlagBits.SAMPLE_COUNT_1_BIT'
--
-- -   If @pResolveAttachments@ is not @NULL@, each resolve attachment that
--     is not 'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED'
--     /must/ have a sample count of
--     'Graphics.Vulkan.Core10.Enums.SampleCountFlagBits.SAMPLE_COUNT_1_BIT'
--
-- -   Any given element of @pResolveAttachments@ /must/ have the same
--     'Graphics.Vulkan.Core10.Enums.Format.Format' as its corresponding
--     color attachment
--
-- -   All attachments in @pColorAttachments@ that are not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED' /must/ have
--     the same sample count
--
-- -   All attachments in @pInputAttachments@ that are not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED' /must/ have
--     formats whose features contain at least one of
--     'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_COLOR_ATTACHMENT_BIT'
--     or
--     'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT'.
--
-- -   All attachments in @pColorAttachments@ that are not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED' /must/ have
--     formats whose features contain
--     'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_COLOR_ATTACHMENT_BIT'
--
-- -   All attachments in @pResolveAttachments@ that are not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED' /must/ have
--     formats whose features contain
--     'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_COLOR_ATTACHMENT_BIT'
--
-- -   If @pDepthStencilAttachment@ is not @NULL@ and the attachment is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED' then it
--     /must/ have a format whose features contain
--     'Graphics.Vulkan.Core10.Enums.FormatFeatureFlagBits.FORMAT_FEATURE_DEPTH_STENCIL_ATTACHMENT_BIT'
--
-- -   If the @VK_AMD_mixed_attachment_samples@ extension is enabled, all
--     attachments in @pColorAttachments@ that are not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED' /must/ have
--     a sample count that is smaller than or equal to the sample count of
--     @pDepthStencilAttachment@ if it is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED'
--
-- -   If neither the @VK_AMD_mixed_attachment_samples@ nor the
--     @VK_NV_framebuffer_mixed_samples@ extensions are enabled, and if
--     @pDepthStencilAttachment@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED' and any
--     attachments in @pColorAttachments@ are not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', they /must/
--     have the same sample count
--
-- -   The @attachment@ member of any element of @pPreserveAttachments@
--     /must/ not be
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED'
--
-- -   Any given element of @pPreserveAttachments@ /must/ not also be an
--     element of any other member of the subpass description
--
-- -   If any attachment is used by more than one
--     'Graphics.Vulkan.Core10.Pass.AttachmentReference' member, then each
--     use /must/ use the same @layout@
--
-- -   If @flags@ includes
--     'Graphics.Vulkan.Core10.Enums.SubpassDescriptionFlagBits.SUBPASS_DESCRIPTION_PER_VIEW_POSITION_X_ONLY_BIT_NVX',
--     it /must/ also include
--     'Graphics.Vulkan.Core10.Enums.SubpassDescriptionFlagBits.SUBPASS_DESCRIPTION_PER_VIEW_ATTRIBUTES_BIT_NVX'.
--
-- -   If the @attachment@ member of any element of @pInputAttachments@ is
--     not 'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', then
--     the @aspectMask@ member /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.ImageAspectFlagBits'
--
-- -   If the @attachment@ member of any element of @pInputAttachments@ is
--     not 'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', then
--     the @aspectMask@ member /must/ not be @0@
--
-- -   If the @attachment@ member of any element of @pInputAttachments@ is
--     not 'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', then
--     the @aspectMask@ member /must/ not include
--     'Graphics.Vulkan.Core10.Enums.ImageAspectFlagBits.IMAGE_ASPECT_METADATA_BIT'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2'
--
-- -   @flags@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.SubpassDescriptionFlagBits.SubpassDescriptionFlagBits'
--     values
--
-- -   @pipelineBindPoint@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.PipelineBindPoint.PipelineBindPoint'
--     value
--
-- -   If @inputAttachmentCount@ is not @0@, @pInputAttachments@ /must/ be
--     a valid pointer to an array of @inputAttachmentCount@ valid
--     'AttachmentReference2' structures
--
-- -   If @colorAttachmentCount@ is not @0@, @pColorAttachments@ /must/ be
--     a valid pointer to an array of @colorAttachmentCount@ valid
--     'AttachmentReference2' structures
--
-- -   If @colorAttachmentCount@ is not @0@, and @pResolveAttachments@ is
--     not @NULL@, @pResolveAttachments@ /must/ be a valid pointer to an
--     array of @colorAttachmentCount@ valid 'AttachmentReference2'
--     structures
--
-- -   If @pDepthStencilAttachment@ is not @NULL@,
--     @pDepthStencilAttachment@ /must/ be a valid pointer to a valid
--     'AttachmentReference2' structure
--
-- -   If @preserveAttachmentCount@ is not @0@, @pPreserveAttachments@
--     /must/ be a valid pointer to an array of @preserveAttachmentCount@
--     @uint32_t@ values
--
-- = See Also
--
-- 'AttachmentReference2',
-- 'Graphics.Vulkan.Core10.Enums.PipelineBindPoint.PipelineBindPoint',
-- 'RenderPassCreateInfo2',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'Graphics.Vulkan.Core10.Enums.SubpassDescriptionFlagBits.SubpassDescriptionFlags'
data SubpassDescription2 (es :: [Type]) = SubpassDescription2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @flags@ is a bitmask of
    -- 'Graphics.Vulkan.Core10.Enums.SubpassDescriptionFlagBits.SubpassDescriptionFlagBits'
    -- specifying usage of the subpass.
    flags :: SubpassDescriptionFlags
  , -- | @pipelineBindPoint@ is a
    -- 'Graphics.Vulkan.Core10.Enums.PipelineBindPoint.PipelineBindPoint' value
    -- specifying the pipeline type supported for this subpass.
    pipelineBindPoint :: PipelineBindPoint
  , -- | @viewMask@ is a bitfield of view indices describing which views
    -- rendering is broadcast to in this subpass, when multiview is enabled.
    viewMask :: Word32
  , -- | @pInputAttachments@ is a pointer to an array of 'AttachmentReference2'
    -- structures defining the input attachments for this subpass and their
    -- layouts.
    inputAttachments :: Vector (SomeStruct AttachmentReference2)
  , -- | @pColorAttachments@ is a pointer to an array of 'AttachmentReference2'
    -- structures defining the color attachments for this subpass and their
    -- layouts.
    colorAttachments :: Vector (SomeStruct AttachmentReference2)
  , -- | @pResolveAttachments@ is an optional array of @colorAttachmentCount@
    -- 'AttachmentReference2' structures defining the resolve attachments for
    -- this subpass and their layouts.
    resolveAttachments :: Either Word32 (Vector (SomeStruct AttachmentReference2))
  , -- | @pDepthStencilAttachment@ is a pointer to a 'AttachmentReference2'
    -- structure specifying the depth\/stencil attachment for this subpass and
    -- its layout.
    depthStencilAttachment :: Maybe (SomeStruct AttachmentReference2)
  , -- | @pPreserveAttachments@ is a pointer to an array of
    -- @preserveAttachmentCount@ render pass attachment indices identifying
    -- attachments that are not used by this subpass, but whose contents /must/
    -- be preserved throughout the subpass.
    preserveAttachments :: Vector Word32
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (SubpassDescription2 es)

instance Extensible SubpassDescription2 where
  extensibleType = STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2
  setNext x next = x{next = next}
  getNext SubpassDescription2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends SubpassDescription2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @SubpassDescriptionDepthStencilResolve = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (SubpassDescription2 es) where
  withCStruct x f = allocaBytesAligned 88 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p SubpassDescription2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    lift $ poke ((p `plusPtr` 16 :: Ptr SubpassDescriptionFlags)) (flags)
    lift $ poke ((p `plusPtr` 20 :: Ptr PipelineBindPoint)) (pipelineBindPoint)
    lift $ poke ((p `plusPtr` 24 :: Ptr Word32)) (viewMask)
    lift $ poke ((p `plusPtr` 28 :: Ptr Word32)) ((fromIntegral (Data.Vector.length $ (inputAttachments)) :: Word32))
    pPInputAttachments' <- ContT $ allocaBytesAligned @(AttachmentReference2 _) ((Data.Vector.length (inputAttachments)) * 32) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeSomeCStruct (forgetExtensions (pPInputAttachments' `plusPtr` (32 * (i)) :: Ptr (AttachmentReference2 _))) (e) . ($ ())) (inputAttachments)
    lift $ poke ((p `plusPtr` 32 :: Ptr (Ptr (AttachmentReference2 _)))) (pPInputAttachments')
    let pColorAttachmentsLength = Data.Vector.length $ (colorAttachments)
    let pResolveAttachmentsLength = either id (fromIntegral . Data.Vector.length) (resolveAttachments)
    lift $ unless (fromIntegral pResolveAttachmentsLength == pColorAttachmentsLength || pResolveAttachmentsLength == 0) $
      throwIO $ IOError Nothing InvalidArgument "" "pResolveAttachments and pColorAttachments must have the same length" Nothing Nothing
    lift $ poke ((p `plusPtr` 40 :: Ptr Word32)) ((fromIntegral pColorAttachmentsLength :: Word32))
    pPColorAttachments' <- ContT $ allocaBytesAligned @(AttachmentReference2 _) ((Data.Vector.length (colorAttachments)) * 32) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeSomeCStruct (forgetExtensions (pPColorAttachments' `plusPtr` (32 * (i)) :: Ptr (AttachmentReference2 _))) (e) . ($ ())) (colorAttachments)
    lift $ poke ((p `plusPtr` 48 :: Ptr (Ptr (AttachmentReference2 _)))) (pPColorAttachments')
    pResolveAttachments'' <- case (resolveAttachments) of
      Left _ -> pure nullPtr
      Right v -> do
        pPResolveAttachments' <- ContT $ allocaBytesAligned @(AttachmentReference2 _) ((Data.Vector.length (v)) * 32) 8
        Data.Vector.imapM_ (\i e -> ContT $ pokeSomeCStruct (forgetExtensions (pPResolveAttachments' `plusPtr` (32 * (i)) :: Ptr (AttachmentReference2 _))) (e) . ($ ())) (v)
        pure $ pPResolveAttachments'
    lift $ poke ((p `plusPtr` 56 :: Ptr (Ptr (AttachmentReference2 _)))) pResolveAttachments''
    pDepthStencilAttachment'' <- case (depthStencilAttachment) of
      Nothing -> pure nullPtr
      Just j -> ContT @_ @_ @(Ptr (AttachmentReference2 '[])) $ \cont -> withSomeCStruct @AttachmentReference2 (j) (cont . castPtr)
    lift $ poke ((p `plusPtr` 64 :: Ptr (Ptr (AttachmentReference2 _)))) pDepthStencilAttachment''
    lift $ poke ((p `plusPtr` 72 :: Ptr Word32)) ((fromIntegral (Data.Vector.length $ (preserveAttachments)) :: Word32))
    pPPreserveAttachments' <- ContT $ allocaBytesAligned @Word32 ((Data.Vector.length (preserveAttachments)) * 4) 4
    lift $ Data.Vector.imapM_ (\i e -> poke (pPPreserveAttachments' `plusPtr` (4 * (i)) :: Ptr Word32) (e)) (preserveAttachments)
    lift $ poke ((p `plusPtr` 80 :: Ptr (Ptr Word32))) (pPPreserveAttachments')
    lift $ f
  cStructSize = 88
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SUBPASS_DESCRIPTION_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    lift $ poke ((p `plusPtr` 20 :: Ptr PipelineBindPoint)) (zero)
    lift $ poke ((p `plusPtr` 24 :: Ptr Word32)) (zero)
    pPInputAttachments' <- ContT $ allocaBytesAligned @(AttachmentReference2 _) ((Data.Vector.length (mempty)) * 32) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeSomeCStruct (forgetExtensions (pPInputAttachments' `plusPtr` (32 * (i)) :: Ptr (AttachmentReference2 _))) (e) . ($ ())) (mempty)
    lift $ poke ((p `plusPtr` 32 :: Ptr (Ptr (AttachmentReference2 _)))) (pPInputAttachments')
    pPColorAttachments' <- ContT $ allocaBytesAligned @(AttachmentReference2 _) ((Data.Vector.length (mempty)) * 32) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeSomeCStruct (forgetExtensions (pPColorAttachments' `plusPtr` (32 * (i)) :: Ptr (AttachmentReference2 _))) (e) . ($ ())) (mempty)
    lift $ poke ((p `plusPtr` 48 :: Ptr (Ptr (AttachmentReference2 _)))) (pPColorAttachments')
    pPPreserveAttachments' <- ContT $ allocaBytesAligned @Word32 ((Data.Vector.length (mempty)) * 4) 4
    lift $ Data.Vector.imapM_ (\i e -> poke (pPPreserveAttachments' `plusPtr` (4 * (i)) :: Ptr Word32) (e)) (mempty)
    lift $ poke ((p `plusPtr` 80 :: Ptr (Ptr Word32))) (pPPreserveAttachments')
    lift $ f

instance PeekChain es => FromCStruct (SubpassDescription2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    flags <- peek @SubpassDescriptionFlags ((p `plusPtr` 16 :: Ptr SubpassDescriptionFlags))
    pipelineBindPoint <- peek @PipelineBindPoint ((p `plusPtr` 20 :: Ptr PipelineBindPoint))
    viewMask <- peek @Word32 ((p `plusPtr` 24 :: Ptr Word32))
    inputAttachmentCount <- peek @Word32 ((p `plusPtr` 28 :: Ptr Word32))
    pInputAttachments <- peek @(Ptr (AttachmentReference2 _)) ((p `plusPtr` 32 :: Ptr (Ptr (AttachmentReference2 a))))
    pInputAttachments' <- generateM (fromIntegral inputAttachmentCount) (\i -> peekSomeCStruct (forgetExtensions ((pInputAttachments `advancePtrBytes` (32 * (i)) :: Ptr (AttachmentReference2 _)))))
    colorAttachmentCount <- peek @Word32 ((p `plusPtr` 40 :: Ptr Word32))
    pColorAttachments <- peek @(Ptr (AttachmentReference2 _)) ((p `plusPtr` 48 :: Ptr (Ptr (AttachmentReference2 a))))
    pColorAttachments' <- generateM (fromIntegral colorAttachmentCount) (\i -> peekSomeCStruct (forgetExtensions ((pColorAttachments `advancePtrBytes` (32 * (i)) :: Ptr (AttachmentReference2 _)))))
    pResolveAttachments <- peek @(Ptr (AttachmentReference2 _)) ((p `plusPtr` 56 :: Ptr (Ptr (AttachmentReference2 a))))
    pResolveAttachments' <- maybePeek (\j -> generateM (fromIntegral colorAttachmentCount) (\i -> peekSomeCStruct (forgetExtensions (((j) `advancePtrBytes` (32 * (i)) :: Ptr (AttachmentReference2 _)))))) pResolveAttachments
    let pResolveAttachments'' = maybe (Left colorAttachmentCount) Right pResolveAttachments'
    pDepthStencilAttachment <- peek @(Ptr (AttachmentReference2 _)) ((p `plusPtr` 64 :: Ptr (Ptr (AttachmentReference2 a))))
    pDepthStencilAttachment' <- maybePeek (\j -> peekSomeCStruct (forgetExtensions (j))) pDepthStencilAttachment
    preserveAttachmentCount <- peek @Word32 ((p `plusPtr` 72 :: Ptr Word32))
    pPreserveAttachments <- peek @(Ptr Word32) ((p `plusPtr` 80 :: Ptr (Ptr Word32)))
    pPreserveAttachments' <- generateM (fromIntegral preserveAttachmentCount) (\i -> peek @Word32 ((pPreserveAttachments `advancePtrBytes` (4 * (i)) :: Ptr Word32)))
    pure $ SubpassDescription2
             next flags pipelineBindPoint viewMask pInputAttachments' pColorAttachments' pResolveAttachments'' pDepthStencilAttachment' pPreserveAttachments'

instance es ~ '[] => Zero (SubpassDescription2 es) where
  zero = SubpassDescription2
           ()
           zero
           zero
           zero
           mempty
           mempty
           (Left 0)
           Nothing
           mempty


-- | VkSubpassDependency2 - Structure specifying a subpass dependency
--
-- = Description
--
-- Parameters defined by this structure with the same name as those in
-- 'Graphics.Vulkan.Core10.Pass.SubpassDependency' have the identical
-- effect to those parameters.
--
-- @viewOffset@ has the same effect for the described subpass dependency as
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_multiview.RenderPassMultiviewCreateInfo'::@pViewOffsets@
-- has on each corresponding subpass dependency.
--
-- == Valid Usage
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-geometryShader geometry shaders>
--     feature is not enabled, @srcStageMask@ /must/ not contain
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_GEOMETRY_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-geometryShader geometry shaders>
--     feature is not enabled, @dstStageMask@ /must/ not contain
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_GEOMETRY_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-tessellationShader tessellation shaders>
--     feature is not enabled, @srcStageMask@ /must/ not contain
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT'
--     or
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-tessellationShader tessellation shaders>
--     feature is not enabled, @dstStageMask@ /must/ not contain
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_TESSELLATION_CONTROL_SHADER_BIT'
--     or
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_TESSELLATION_EVALUATION_SHADER_BIT'
--
-- -   @srcSubpass@ /must/ be less than or equal to @dstSubpass@, unless
--     one of them is
--     'Graphics.Vulkan.Core10.APIConstants.SUBPASS_EXTERNAL', to avoid
--     cyclic dependencies and ensure a valid execution order
--
-- -   @srcSubpass@ and @dstSubpass@ /must/ not both be equal to
--     'Graphics.Vulkan.Core10.APIConstants.SUBPASS_EXTERNAL'
--
-- -   If @srcSubpass@ is equal to @dstSubpass@ and not all of the stages
--     in @srcStageMask@ and @dstStageMask@ are
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-framebuffer-regions framebuffer-space stages>,
--     the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-order logically latest>
--     pipeline stage in @srcStageMask@ /must/ be
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-order logically earlier>
--     than or equal to the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-order logically earliest>
--     pipeline stage in @dstStageMask@
--
-- -   Any access flag included in @srcAccessMask@ /must/ be supported by
--     one of the pipeline stages in @srcStageMask@, as specified in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-access-types-supported table of supported access types>
--
-- -   Any access flag included in @dstAccessMask@ /must/ be supported by
--     one of the pipeline stages in @dstStageMask@, as specified in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-access-types-supported table of supported access types>
--
-- -   If @dependencyFlags@ includes
--     'Graphics.Vulkan.Core10.Enums.DependencyFlagBits.DEPENDENCY_VIEW_LOCAL_BIT',
--     @srcSubpass@ /must/ not be equal to
--     'Graphics.Vulkan.Core10.APIConstants.SUBPASS_EXTERNAL'
--
-- -   If @dependencyFlags@ includes
--     'Graphics.Vulkan.Core10.Enums.DependencyFlagBits.DEPENDENCY_VIEW_LOCAL_BIT',
--     @dstSubpass@ /must/ not be equal to
--     'Graphics.Vulkan.Core10.APIConstants.SUBPASS_EXTERNAL'
--
-- -   If @srcSubpass@ equals @dstSubpass@, and @srcStageMask@ and
--     @dstStageMask@ both include a
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-framebuffer-regions framebuffer-space stage>,
--     then @dependencyFlags@ /must/ include
--     'Graphics.Vulkan.Core10.Enums.DependencyFlagBits.DEPENDENCY_BY_REGION_BIT'
--
-- -   If @viewOffset@ is not equal to @0@, @srcSubpass@ /must/ not be
--     equal to @dstSubpass@
--
-- -   If @dependencyFlags@ does not include
--     'Graphics.Vulkan.Core10.Enums.DependencyFlagBits.DEPENDENCY_VIEW_LOCAL_BIT',
--     @viewOffset@ /must/ be @0@
--
-- -   If @viewOffset@ is not @0@, @srcSubpass@ /must/ not be equal to
--     @dstSubpass@.
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-meshShader mesh shaders>
--     feature is not enabled, @srcStageMask@ /must/ not contain
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_MESH_SHADER_BIT_NV'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-taskShader task shaders>
--     feature is not enabled, @srcStageMask@ /must/ not contain
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_TASK_SHADER_BIT_NV'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-meshShader mesh shaders>
--     feature is not enabled, @dstStageMask@ /must/ not contain
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_MESH_SHADER_BIT_NV'
--
-- -   If the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#features-taskShader task shaders>
--     feature is not enabled, @dstStageMask@ /must/ not contain
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PIPELINE_STAGE_TASK_SHADER_BIT_NV'
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2'
--
-- -   @srcStageMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PipelineStageFlagBits'
--     values
--
-- -   @srcStageMask@ /must/ not be @0@
--
-- -   @dstStageMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PipelineStageFlagBits'
--     values
--
-- -   @dstStageMask@ /must/ not be @0@
--
-- -   @srcAccessMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.AccessFlagBits.AccessFlagBits' values
--
-- -   @dstAccessMask@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.AccessFlagBits.AccessFlagBits' values
--
-- -   @dependencyFlags@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.DependencyFlagBits.DependencyFlagBits'
--     values
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.AccessFlagBits.AccessFlags',
-- 'Graphics.Vulkan.Core10.Enums.DependencyFlagBits.DependencyFlags',
-- 'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PipelineStageFlags',
-- 'RenderPassCreateInfo2',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data SubpassDependency2 = SubpassDependency2
  { -- | @srcSubpass@ is the subpass index of the first subpass in the
    -- dependency, or 'Graphics.Vulkan.Core10.APIConstants.SUBPASS_EXTERNAL'.
    srcSubpass :: Word32
  , -- | @dstSubpass@ is the subpass index of the second subpass in the
    -- dependency, or 'Graphics.Vulkan.Core10.APIConstants.SUBPASS_EXTERNAL'.
    dstSubpass :: Word32
  , -- | @srcStageMask@ is a bitmask of
    -- 'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PipelineStageFlagBits'
    -- specifying the
    -- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-masks source stage mask>.
    srcStageMask :: PipelineStageFlags
  , -- | @dstStageMask@ is a bitmask of
    -- 'Graphics.Vulkan.Core10.Enums.PipelineStageFlagBits.PipelineStageFlagBits'
    -- specifying the
    -- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-masks destination stage mask>
    dstStageMask :: PipelineStageFlags
  , -- | @srcAccessMask@ is a bitmask of
    -- 'Graphics.Vulkan.Core10.Enums.AccessFlagBits.AccessFlagBits' specifying
    -- a
    -- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-access-masks source access mask>.
    srcAccessMask :: AccessFlags
  , -- | @dstAccessMask@ is a bitmask of
    -- 'Graphics.Vulkan.Core10.Enums.AccessFlagBits.AccessFlagBits' specifying
    -- a
    -- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-access-masks destination access mask>.
    dstAccessMask :: AccessFlags
  , -- | @dependencyFlags@ is a bitmask of
    -- 'Graphics.Vulkan.Core10.Enums.DependencyFlagBits.DependencyFlagBits'.
    dependencyFlags :: DependencyFlags
  , -- | @viewOffset@ controls which views in the source subpass the views in the
    -- destination subpass depend on.
    viewOffset :: Int32
  }
  deriving (Typeable)
deriving instance Show SubpassDependency2

instance ToCStruct SubpassDependency2 where
  withCStruct x f = allocaBytesAligned 48 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p SubpassDependency2{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (srcSubpass)
    poke ((p `plusPtr` 20 :: Ptr Word32)) (dstSubpass)
    poke ((p `plusPtr` 24 :: Ptr PipelineStageFlags)) (srcStageMask)
    poke ((p `plusPtr` 28 :: Ptr PipelineStageFlags)) (dstStageMask)
    poke ((p `plusPtr` 32 :: Ptr AccessFlags)) (srcAccessMask)
    poke ((p `plusPtr` 36 :: Ptr AccessFlags)) (dstAccessMask)
    poke ((p `plusPtr` 40 :: Ptr DependencyFlags)) (dependencyFlags)
    poke ((p `plusPtr` 44 :: Ptr Int32)) (viewOffset)
    f
  cStructSize = 48
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SUBPASS_DEPENDENCY_2)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (zero)
    poke ((p `plusPtr` 20 :: Ptr Word32)) (zero)
    poke ((p `plusPtr` 24 :: Ptr PipelineStageFlags)) (zero)
    poke ((p `plusPtr` 28 :: Ptr PipelineStageFlags)) (zero)
    f

instance FromCStruct SubpassDependency2 where
  peekCStruct p = do
    srcSubpass <- peek @Word32 ((p `plusPtr` 16 :: Ptr Word32))
    dstSubpass <- peek @Word32 ((p `plusPtr` 20 :: Ptr Word32))
    srcStageMask <- peek @PipelineStageFlags ((p `plusPtr` 24 :: Ptr PipelineStageFlags))
    dstStageMask <- peek @PipelineStageFlags ((p `plusPtr` 28 :: Ptr PipelineStageFlags))
    srcAccessMask <- peek @AccessFlags ((p `plusPtr` 32 :: Ptr AccessFlags))
    dstAccessMask <- peek @AccessFlags ((p `plusPtr` 36 :: Ptr AccessFlags))
    dependencyFlags <- peek @DependencyFlags ((p `plusPtr` 40 :: Ptr DependencyFlags))
    viewOffset <- peek @Int32 ((p `plusPtr` 44 :: Ptr Int32))
    pure $ SubpassDependency2
             srcSubpass dstSubpass srcStageMask dstStageMask srcAccessMask dstAccessMask dependencyFlags viewOffset

instance Storable SubpassDependency2 where
  sizeOf ~_ = 48
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero SubpassDependency2 where
  zero = SubpassDependency2
           zero
           zero
           zero
           zero
           zero
           zero
           zero
           zero


-- | VkRenderPassCreateInfo2 - Structure specifying parameters of a newly
-- created render pass
--
-- = Description
--
-- Parameters defined by this structure with the same name as those in
-- 'Graphics.Vulkan.Core10.Pass.RenderPassCreateInfo' have the identical
-- effect to those parameters; the child structures are variants of those
-- used in 'Graphics.Vulkan.Core10.Pass.RenderPassCreateInfo' which add
-- @sType@ and @pNext@ parameters, allowing them to be extended.
--
-- If the 'SubpassDescription2'::@viewMask@ member of any element of
-- @pSubpasses@ is not zero, /multiview/ functionality is considered to be
-- enabled for this render pass.
--
-- @correlatedViewMaskCount@ and @pCorrelatedViewMasks@ have the same
-- effect as
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_multiview.RenderPassMultiviewCreateInfo'::@correlationMaskCount@
-- and
-- 'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_multiview.RenderPassMultiviewCreateInfo'::@pCorrelationMasks@,
-- respectively.
--
-- == Valid Usage
--
-- -   If any two subpasses operate on attachments with overlapping ranges
--     of the same 'Graphics.Vulkan.Core10.Handles.DeviceMemory' object,
--     and at least one subpass writes to that area of
--     'Graphics.Vulkan.Core10.Handles.DeviceMemory', a subpass dependency
--     /must/ be included (either directly or via some intermediate
--     subpasses) between them
--
-- -   If the @attachment@ member of any element of @pInputAttachments@,
--     @pColorAttachments@, @pResolveAttachments@ or
--     @pDepthStencilAttachment@, or the attachment indexed by any element
--     of @pPreserveAttachments@ in any given element of @pSubpasses@ is
--     bound to a range of a 'Graphics.Vulkan.Core10.Handles.DeviceMemory'
--     object that overlaps with any other attachment in any subpass
--     (including the same subpass), the 'AttachmentDescription2'
--     structures describing them /must/ include
--     'Graphics.Vulkan.Core10.Enums.AttachmentDescriptionFlagBits.ATTACHMENT_DESCRIPTION_MAY_ALIAS_BIT'
--     in @flags@
--
-- -   If the @attachment@ member of any element of @pInputAttachments@,
--     @pColorAttachments@, @pResolveAttachments@ or
--     @pDepthStencilAttachment@, or any element of @pPreserveAttachments@
--     in any given element of @pSubpasses@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', it /must/
--     be less than @attachmentCount@
--
-- -   For any member of @pAttachments@ with a @loadOp@ equal to
--     'Graphics.Vulkan.Core10.Enums.AttachmentLoadOp.ATTACHMENT_LOAD_OP_CLEAR',
--     the first use of that attachment /must/ not specify a @layout@ equal
--     to
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL'
--
-- -   For any member of @pAttachments@ with a @stencilLoadOp@ equal to
--     'Graphics.Vulkan.Core10.Enums.AttachmentLoadOp.ATTACHMENT_LOAD_OP_CLEAR',
--     the first use of that attachment /must/ not specify a @layout@ equal
--     to
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_SHADER_READ_ONLY_OPTIMAL',
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_STENCIL_READ_ONLY_OPTIMAL',
--     or
--     'Graphics.Vulkan.Core10.Enums.ImageLayout.IMAGE_LAYOUT_DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL'.
--
-- -   For any element of @pDependencies@, if the @srcSubpass@ is not
--     'Graphics.Vulkan.Core10.APIConstants.SUBPASS_EXTERNAL', all stage
--     flags included in the @srcStageMask@ member of that dependency
--     /must/ be a pipeline stage supported by the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-types pipeline>
--     identified by the @pipelineBindPoint@ member of the source subpass
--
-- -   For any element of @pDependencies@, if the @dstSubpass@ is not
--     'Graphics.Vulkan.Core10.APIConstants.SUBPASS_EXTERNAL', all stage
--     flags included in the @dstStageMask@ member of that dependency
--     /must/ be a pipeline stage supported by the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-types pipeline>
--     identified by the @pipelineBindPoint@ member of the destination
--     subpass
--
-- -   The set of bits included in any element of @pCorrelatedViewMasks@
--     /must/ not overlap with the set of bits included in any other
--     element of @pCorrelatedViewMasks@
--
-- -   If the 'SubpassDescription2'::@viewMask@ member of all elements of
--     @pSubpasses@ is @0@, @correlatedViewMaskCount@ /must/ be @0@
--
-- -   The 'SubpassDescription2'::@viewMask@ member of all elements of
--     @pSubpasses@ /must/ either all be @0@, or all not be @0@
--
-- -   If the 'SubpassDescription2'::@viewMask@ member of all elements of
--     @pSubpasses@ is @0@, the @dependencyFlags@ member of any element of
--     @pDependencies@ /must/ not include
--     'Graphics.Vulkan.Core10.Enums.DependencyFlagBits.DEPENDENCY_VIEW_LOCAL_BIT'
--
-- -   For any element of @pDependencies@ where its @srcSubpass@ member
--     equals its @dstSubpass@ member, if the @viewMask@ member of the
--     corresponding element of @pSubpasses@ includes more than one bit,
--     its @dependencyFlags@ member /must/ include
--     'Graphics.Vulkan.Core10.Enums.DependencyFlagBits.DEPENDENCY_VIEW_LOCAL_BIT'
--
-- -   The @viewMask@ member /must/ not have a bit set at an index greater
--     than or equal to
--     'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceLimits'::@maxFramebufferLayers@
--
-- -   If the @attachment@ member of any element of the @pInputAttachments@
--     member of any element of @pSubpasses@ is not
--     'Graphics.Vulkan.Core10.APIConstants.ATTACHMENT_UNUSED', the
--     @aspectMask@ member of that element of @pInputAttachments@ /must/
--     only include aspects that are present in images of the format
--     specified by the element of @pAttachments@ specified by @attachment@
--
-- -   The @srcSubpass@ member of each element of @pDependencies@ /must/ be
--     less than @subpassCount@
--
-- -   The @dstSubpass@ member of each element of @pDependencies@ /must/ be
--     less than @subpassCount@
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2'
--
-- -   @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
--     'Graphics.Vulkan.Extensions.VK_EXT_fragment_density_map.RenderPassFragmentDensityMapCreateInfoEXT'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- -   @flags@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.RenderPassCreateFlagBits.RenderPassCreateFlagBits'
--     values
--
-- -   If @attachmentCount@ is not @0@, @pAttachments@ /must/ be a valid
--     pointer to an array of @attachmentCount@ valid
--     'AttachmentDescription2' structures
--
-- -   @pSubpasses@ /must/ be a valid pointer to an array of @subpassCount@
--     valid 'SubpassDescription2' structures
--
-- -   If @dependencyCount@ is not @0@, @pDependencies@ /must/ be a valid
--     pointer to an array of @dependencyCount@ valid 'SubpassDependency2'
--     structures
--
-- -   If @correlatedViewMaskCount@ is not @0@, @pCorrelatedViewMasks@
--     /must/ be a valid pointer to an array of @correlatedViewMaskCount@
--     @uint32_t@ values
--
-- -   @subpassCount@ /must/ be greater than @0@
--
-- = See Also
--
-- 'AttachmentDescription2',
-- 'Graphics.Vulkan.Core10.Enums.RenderPassCreateFlagBits.RenderPassCreateFlags',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'SubpassDependency2', 'SubpassDescription2', 'createRenderPass2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_create_renderpass2.createRenderPass2KHR'
data RenderPassCreateInfo2 (es :: [Type]) = RenderPassCreateInfo2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @flags@ is reserved for future use.
    flags :: RenderPassCreateFlags
  , -- | @pAttachments@ is a pointer to an array of @attachmentCount@
    -- 'AttachmentDescription2' structures describing the attachments used by
    -- the render pass.
    attachments :: Vector (SomeStruct AttachmentDescription2)
  , -- | @pSubpasses@ is a pointer to an array of @subpassCount@
    -- 'SubpassDescription2' structures describing each subpass.
    subpasses :: Vector (SomeStruct SubpassDescription2)
  , -- | @pDependencies@ is a pointer to an array of @dependencyCount@
    -- 'Graphics.Vulkan.Core10.Pass.SubpassDependency' structures describing
    -- dependencies between pairs of subpasses.
    dependencies :: Vector SubpassDependency2
  , -- | @pCorrelatedViewMasks@ is a pointer to an array of view masks indicating
    -- sets of views that /may/ be more efficient to render concurrently.
    correlatedViewMasks :: Vector Word32
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (RenderPassCreateInfo2 es)

instance Extensible RenderPassCreateInfo2 where
  extensibleType = STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2
  setNext x next = x{next = next}
  getNext RenderPassCreateInfo2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends RenderPassCreateInfo2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @RenderPassFragmentDensityMapCreateInfoEXT = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (RenderPassCreateInfo2 es) where
  withCStruct x f = allocaBytesAligned 80 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p RenderPassCreateInfo2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    lift $ poke ((p `plusPtr` 16 :: Ptr RenderPassCreateFlags)) (flags)
    lift $ poke ((p `plusPtr` 20 :: Ptr Word32)) ((fromIntegral (Data.Vector.length $ (attachments)) :: Word32))
    pPAttachments' <- ContT $ allocaBytesAligned @(AttachmentDescription2 _) ((Data.Vector.length (attachments)) * 56) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeSomeCStruct (forgetExtensions (pPAttachments' `plusPtr` (56 * (i)) :: Ptr (AttachmentDescription2 _))) (e) . ($ ())) (attachments)
    lift $ poke ((p `plusPtr` 24 :: Ptr (Ptr (AttachmentDescription2 _)))) (pPAttachments')
    lift $ poke ((p `plusPtr` 32 :: Ptr Word32)) ((fromIntegral (Data.Vector.length $ (subpasses)) :: Word32))
    pPSubpasses' <- ContT $ allocaBytesAligned @(SubpassDescription2 _) ((Data.Vector.length (subpasses)) * 88) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeSomeCStruct (forgetExtensions (pPSubpasses' `plusPtr` (88 * (i)) :: Ptr (SubpassDescription2 _))) (e) . ($ ())) (subpasses)
    lift $ poke ((p `plusPtr` 40 :: Ptr (Ptr (SubpassDescription2 _)))) (pPSubpasses')
    lift $ poke ((p `plusPtr` 48 :: Ptr Word32)) ((fromIntegral (Data.Vector.length $ (dependencies)) :: Word32))
    pPDependencies' <- ContT $ allocaBytesAligned @SubpassDependency2 ((Data.Vector.length (dependencies)) * 48) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeCStruct (pPDependencies' `plusPtr` (48 * (i)) :: Ptr SubpassDependency2) (e) . ($ ())) (dependencies)
    lift $ poke ((p `plusPtr` 56 :: Ptr (Ptr SubpassDependency2))) (pPDependencies')
    lift $ poke ((p `plusPtr` 64 :: Ptr Word32)) ((fromIntegral (Data.Vector.length $ (correlatedViewMasks)) :: Word32))
    pPCorrelatedViewMasks' <- ContT $ allocaBytesAligned @Word32 ((Data.Vector.length (correlatedViewMasks)) * 4) 4
    lift $ Data.Vector.imapM_ (\i e -> poke (pPCorrelatedViewMasks' `plusPtr` (4 * (i)) :: Ptr Word32) (e)) (correlatedViewMasks)
    lift $ poke ((p `plusPtr` 72 :: Ptr (Ptr Word32))) (pPCorrelatedViewMasks')
    lift $ f
  cStructSize = 80
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_RENDER_PASS_CREATE_INFO_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    pPAttachments' <- ContT $ allocaBytesAligned @(AttachmentDescription2 _) ((Data.Vector.length (mempty)) * 56) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeSomeCStruct (forgetExtensions (pPAttachments' `plusPtr` (56 * (i)) :: Ptr (AttachmentDescription2 _))) (e) . ($ ())) (mempty)
    lift $ poke ((p `plusPtr` 24 :: Ptr (Ptr (AttachmentDescription2 _)))) (pPAttachments')
    pPSubpasses' <- ContT $ allocaBytesAligned @(SubpassDescription2 _) ((Data.Vector.length (mempty)) * 88) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeSomeCStruct (forgetExtensions (pPSubpasses' `plusPtr` (88 * (i)) :: Ptr (SubpassDescription2 _))) (e) . ($ ())) (mempty)
    lift $ poke ((p `plusPtr` 40 :: Ptr (Ptr (SubpassDescription2 _)))) (pPSubpasses')
    pPDependencies' <- ContT $ allocaBytesAligned @SubpassDependency2 ((Data.Vector.length (mempty)) * 48) 8
    Data.Vector.imapM_ (\i e -> ContT $ pokeCStruct (pPDependencies' `plusPtr` (48 * (i)) :: Ptr SubpassDependency2) (e) . ($ ())) (mempty)
    lift $ poke ((p `plusPtr` 56 :: Ptr (Ptr SubpassDependency2))) (pPDependencies')
    pPCorrelatedViewMasks' <- ContT $ allocaBytesAligned @Word32 ((Data.Vector.length (mempty)) * 4) 4
    lift $ Data.Vector.imapM_ (\i e -> poke (pPCorrelatedViewMasks' `plusPtr` (4 * (i)) :: Ptr Word32) (e)) (mempty)
    lift $ poke ((p `plusPtr` 72 :: Ptr (Ptr Word32))) (pPCorrelatedViewMasks')
    lift $ f

instance PeekChain es => FromCStruct (RenderPassCreateInfo2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    flags <- peek @RenderPassCreateFlags ((p `plusPtr` 16 :: Ptr RenderPassCreateFlags))
    attachmentCount <- peek @Word32 ((p `plusPtr` 20 :: Ptr Word32))
    pAttachments <- peek @(Ptr (AttachmentDescription2 _)) ((p `plusPtr` 24 :: Ptr (Ptr (AttachmentDescription2 a))))
    pAttachments' <- generateM (fromIntegral attachmentCount) (\i -> peekSomeCStruct (forgetExtensions ((pAttachments `advancePtrBytes` (56 * (i)) :: Ptr (AttachmentDescription2 _)))))
    subpassCount <- peek @Word32 ((p `plusPtr` 32 :: Ptr Word32))
    pSubpasses <- peek @(Ptr (SubpassDescription2 _)) ((p `plusPtr` 40 :: Ptr (Ptr (SubpassDescription2 a))))
    pSubpasses' <- generateM (fromIntegral subpassCount) (\i -> peekSomeCStruct (forgetExtensions ((pSubpasses `advancePtrBytes` (88 * (i)) :: Ptr (SubpassDescription2 _)))))
    dependencyCount <- peek @Word32 ((p `plusPtr` 48 :: Ptr Word32))
    pDependencies <- peek @(Ptr SubpassDependency2) ((p `plusPtr` 56 :: Ptr (Ptr SubpassDependency2)))
    pDependencies' <- generateM (fromIntegral dependencyCount) (\i -> peekCStruct @SubpassDependency2 ((pDependencies `advancePtrBytes` (48 * (i)) :: Ptr SubpassDependency2)))
    correlatedViewMaskCount <- peek @Word32 ((p `plusPtr` 64 :: Ptr Word32))
    pCorrelatedViewMasks <- peek @(Ptr Word32) ((p `plusPtr` 72 :: Ptr (Ptr Word32)))
    pCorrelatedViewMasks' <- generateM (fromIntegral correlatedViewMaskCount) (\i -> peek @Word32 ((pCorrelatedViewMasks `advancePtrBytes` (4 * (i)) :: Ptr Word32)))
    pure $ RenderPassCreateInfo2
             next flags pAttachments' pSubpasses' pDependencies' pCorrelatedViewMasks'

instance es ~ '[] => Zero (RenderPassCreateInfo2 es) where
  zero = RenderPassCreateInfo2
           ()
           zero
           mempty
           mempty
           mempty
           mempty


-- | VkSubpassBeginInfo - Structure specifying subpass begin info
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'Graphics.Vulkan.Core10.Enums.SubpassContents.SubpassContents',
-- 'cmdBeginRenderPass2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_create_renderpass2.cmdBeginRenderPass2KHR',
-- 'cmdNextSubpass2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_create_renderpass2.cmdNextSubpass2KHR'
data SubpassBeginInfo = SubpassBeginInfo
  { -- | @contents@ /must/ be a valid
    -- 'Graphics.Vulkan.Core10.Enums.SubpassContents.SubpassContents' value
    contents :: SubpassContents }
  deriving (Typeable)
deriving instance Show SubpassBeginInfo

instance ToCStruct SubpassBeginInfo where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p SubpassBeginInfo{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SUBPASS_BEGIN_INFO)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr SubpassContents)) (contents)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SUBPASS_BEGIN_INFO)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr SubpassContents)) (zero)
    f

instance FromCStruct SubpassBeginInfo where
  peekCStruct p = do
    contents <- peek @SubpassContents ((p `plusPtr` 16 :: Ptr SubpassContents))
    pure $ SubpassBeginInfo
             contents

instance Storable SubpassBeginInfo where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero SubpassBeginInfo where
  zero = SubpassBeginInfo
           zero


-- | VkSubpassEndInfo - Structure specifying subpass end info
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'cmdEndRenderPass2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_create_renderpass2.cmdEndRenderPass2KHR',
-- 'cmdNextSubpass2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_create_renderpass2.cmdNextSubpass2KHR'
data SubpassEndInfo = SubpassEndInfo
  {}
  deriving (Typeable)
deriving instance Show SubpassEndInfo

instance ToCStruct SubpassEndInfo where
  withCStruct x f = allocaBytesAligned 16 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p SubpassEndInfo f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SUBPASS_END_INFO)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    f
  cStructSize = 16
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SUBPASS_END_INFO)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    f

instance FromCStruct SubpassEndInfo where
  peekCStruct _ = pure $ SubpassEndInfo
                           

instance Storable SubpassEndInfo where
  sizeOf ~_ = 16
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero SubpassEndInfo where
  zero = SubpassEndInfo
           

