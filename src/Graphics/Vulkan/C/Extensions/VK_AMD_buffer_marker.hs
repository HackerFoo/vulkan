{-# language Strict #-}
{-# language CPP #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_AMD_buffer_marker
  ( 
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
  vkCmdWriteBufferMarkerAMD
  , 
#endif
  FN_vkCmdWriteBufferMarkerAMD
  , PFN_vkCmdWriteBufferMarkerAMD
  , pattern VK_AMD_BUFFER_MARKER_EXTENSION_NAME
  , pattern VK_AMD_BUFFER_MARKER_SPEC_VERSION
  ) where

import Data.String
  ( IsString
  )
import Data.Word
  ( Word32
  )
import Foreign.Ptr
  ( FunPtr
  )


import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkDeviceSize
  )
import Graphics.Vulkan.C.Core10.MemoryManagement
  ( VkBuffer
  )
import Graphics.Vulkan.C.Core10.Queue
  ( VkPipelineStageFlagBits(..)
  , VkCommandBuffer
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
-- | vkCmdWriteBufferMarkerAMD - Execute a pipelined write of a marker value
-- into a buffer
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer into which the command will be
--     recorded.
--
-- -   @pipelineStage@ is one of the
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' values,
--     specifying the pipeline stage whose completion triggers the marker
--     write.
--
-- -   @dstBuffer@ is the buffer where the marker will be written to.
--
-- -   @dstOffset@ is the byte offset into the buffer where the marker will
--     be written to.
--
-- -   @marker@ is the 32-bit value of the marker.
--
-- = Description
--
-- The command will write the 32-bit marker value into the buffer only
-- after all preceding commands have finished executing up to at least the
-- specified pipeline stage. This includes the completion of other
-- preceding @vkCmdWriteBufferMarkerAMD@ commands so long as their
-- specified pipeline stages occur either at the same time or earlier than
-- this command’s specified @pipelineStage@.
--
-- While consecutive buffer marker writes with the same @pipelineStage@
-- parameter are implicitly complete in submission order, memory and
-- execution dependencies between buffer marker writes and other operations
-- must still be explicitly ordered using synchronization commands. The
-- access scope for buffer marker writes falls under the
-- @VK_ACCESS_TRANSFER_WRITE_BIT@, and the pipeline stages for identifying
-- the synchronization scope /must/ include both @pipelineStage@ and
-- @VK_PIPELINE_STAGE_TRANSFER_BIT@.
--
-- __Note__
--
-- Similar to @vkCmdWriteTimestamp@, if an implementation is unable to
-- write a marker at any specific pipeline stage, it /may/ instead do so at
-- any logically later stage.
--
-- __Note__
--
-- Implementations /may/ only support a limited number of pipelined marker
-- write operations in flight at a given time, thus excessive number of
-- marker write operations /may/ degrade command execution performance.
--
-- == Valid Usage
--
-- -   @dstOffset@ /must/ be less than or equal to the size of @dstBuffer@
--     minus @4@.
--
-- -   @dstBuffer@ /must/ have been created with
--     @VK_BUFFER_USAGE_TRANSFER_DST_BIT@ usage flag
--
-- -   If @dstBuffer@ is non-sparse then it /must/ be bound completely and
--     contiguously to a single @VkDeviceMemory@ object
--
-- -   @dstOffset@ /must/ be a multiple of @4@
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid @VkCommandBuffer@ handle
--
-- -   @pipelineStage@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.Queue.VkPipelineStageFlagBits' value
--
-- -   @dstBuffer@ /must/ be a valid @VkBuffer@ handle
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The @VkCommandPool@ that @commandBuffer@ was allocated from /must/
--     support transfer, graphics, or compute operations
--
-- -   Both of @commandBuffer@, and @dstBuffer@ /must/ have been created,
--     allocated, or retrieved from the same @VkDevice@
--
-- == Host Synchronization
--
-- -   Host access to @commandBuffer@ /must/ be externally synchronized
--
-- -   Host access to the @VkCommandPool@ that @commandBuffer@ was
--     allocated from /must/ be externally synchronized
--
-- == Command Properties
--
-- \'
--
-- > +-----------------+-----------------+-----------------+-----------------+
-- > | <https://www.kh | <https://www.kh | <https://www.kh | <https://www.kh |
-- > | ronos.org/regis | ronos.org/regis | ronos.org/regis | ronos.org/regis |
-- > | try/vulkan/spec | try/vulkan/spec | try/vulkan/spec | try/vulkan/spec |
-- > | s/1.0-extension | s/1.0-extension | s/1.0-extension | s/1.0-extension |
-- > | s/html/vkspec.h | s/html/vkspec.h | s/html/vkspec.h | s/html/vkspec.h |
-- > | tml#VkCommandBu | tml#vkCmdBeginR | tml#VkQueueFlag | tml#synchroniza |
-- > | fferLevel Comma | enderPass Rende | Bits Supported  | tion-pipeline-s |
-- > | nd Buffer Level | r Pass Scope>   | Queue Types>    | tages-types Pip |
-- > | s>              |                 |                 | eline Type>     |
-- > +=================+=================+=================+=================+
-- > | Primary         | Both            | Transfer        | Transfer        |
-- > | Secondary       |                 | Graphics        |                 |
-- > |                 |                 | Compute         |                 |
-- > +-----------------+-----------------+-----------------+-----------------+
--
-- = See Also
--
-- No cross-references are available
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCmdWriteBufferMarkerAMD" vkCmdWriteBufferMarkerAMD :: ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineStage" ::: VkPipelineStageFlagBits) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("marker" ::: Word32) -> IO ()

#endif
type FN_vkCmdWriteBufferMarkerAMD = ("commandBuffer" ::: VkCommandBuffer) -> ("pipelineStage" ::: VkPipelineStageFlagBits) -> ("dstBuffer" ::: VkBuffer) -> ("dstOffset" ::: VkDeviceSize) -> ("marker" ::: Word32) -> IO ()
type PFN_vkCmdWriteBufferMarkerAMD = FunPtr FN_vkCmdWriteBufferMarkerAMD
-- No documentation found for TopLevel "VK_AMD_BUFFER_MARKER_EXTENSION_NAME"
pattern VK_AMD_BUFFER_MARKER_EXTENSION_NAME :: (Eq a ,IsString a) => a
pattern VK_AMD_BUFFER_MARKER_EXTENSION_NAME = "VK_AMD_buffer_marker"
-- No documentation found for TopLevel "VK_AMD_BUFFER_MARKER_SPEC_VERSION"
pattern VK_AMD_BUFFER_MARKER_SPEC_VERSION :: Integral a => a
pattern VK_AMD_BUFFER_MARKER_SPEC_VERSION = 1
