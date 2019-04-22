{-# language Strict #-}
{-# language CPP #-}
{-# language DataKinds #-}
{-# language TypeOperators #-}
{-# language DuplicateRecordFields #-}
{-# language GeneralizedNewtypeDeriving #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_EXT_debug_report
  ( PFN_vkDebugReportCallbackEXT
  , VkDebugReportCallbackCreateInfoEXT(..)
  , VkDebugReportCallbackEXT
  , VkDebugReportFlagBitsEXT(..)
  , pattern VK_DEBUG_REPORT_INFORMATION_BIT_EXT
  , pattern VK_DEBUG_REPORT_WARNING_BIT_EXT
  , pattern VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT
  , pattern VK_DEBUG_REPORT_ERROR_BIT_EXT
  , pattern VK_DEBUG_REPORT_DEBUG_BIT_EXT
  , VkDebugReportFlagsEXT
  , VkDebugReportObjectTypeEXT(..)
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT
  , FN_vkCreateDebugReportCallbackEXT
  , PFN_vkCreateDebugReportCallbackEXT
  , vkCreateDebugReportCallbackEXT
  , FN_vkDebugReportMessageEXT
  , PFN_vkDebugReportMessageEXT
  , vkDebugReportMessageEXT
  , FN_vkDestroyDebugReportCallbackEXT
  , PFN_vkDestroyDebugReportCallbackEXT
  , vkDestroyDebugReportCallbackEXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT
  , pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT
  , pattern VK_ERROR_VALIDATION_FAILED_EXT
  , pattern VK_EXT_DEBUG_REPORT_EXTENSION_NAME
  , pattern VK_EXT_DEBUG_REPORT_SPEC_VERSION
  , pattern VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT
  , pattern VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT
  , pattern VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT
  ) where

import Data.Bits
  ( Bits
  , FiniteBits
  )
import Data.Int
  ( Int32
  )
import Data.String
  ( IsString
  )
import Data.Word
  ( Word64
  )
import Foreign.C.Types
  ( CChar(..)
  , CSize(..)
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


import Graphics.Vulkan.C.Core10.Core
  ( VkBool32(..)
  , VkObjectType(..)
  , VkResult(..)
  , VkStructureType(..)
  , Zero(..)
  , VkFlags
  )
import Graphics.Vulkan.C.Core10.DeviceInitialization
  ( VkAllocationCallbacks(..)
  , VkInstance
  )
import Graphics.Vulkan.C.Dynamic
  ( InstanceCmds(..)
  )
import Graphics.Vulkan.NamedType
  ( (:::)
  )


-- | PFN_vkDebugReportCallbackEXT - Application-defined debug report callback
-- function
--
-- = Parameters
--
-- -   @flags@ specifies the 'VkDebugReportFlagBitsEXT' that triggered this
--     callback.
--
-- -   @objectType@ is a 'VkDebugReportObjectTypeEXT' value specifying the
--     type of object being used or created at the time the event was
--     triggered.
--
-- -   @object@ is the object where the issue was detected. If @objectType@
--     is 'VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT', @object@ is undefined.
--
-- -   @location@ is a component (layer, driver, loader) defined value that
--     specifies the /location/ of the trigger. This is an /optional/
--     value.
--
-- -   @messageCode@ is a layer-defined value indicating what test
--     triggered this callback.
--
-- -   @pLayerPrefix@ is a null-terminated string that is an abbreviation
--     of the name of the component making the callback. @pLayerPrefix@ is
--     only valid for the duration of the callback.
--
-- -   @pMessage@ is a null-terminated string detailing the trigger
--     conditions. @pMessage@ is only valid for the duration of the
--     callback.
--
-- -   @pUserData@ is the user data given when the
--     'VkDebugReportCallbackEXT' was created.
--
-- = Description
--
-- The callback /must/ not call 'vkDestroyDebugReportCallbackEXT'.
--
-- The callback returns a 'Graphics.Vulkan.C.Core10.Core.VkBool32', which
-- is interpreted in a layer-specified manner. The application /should/
-- always return 'Graphics.Vulkan.C.Core10.Core.VK_FALSE'. The
-- 'Graphics.Vulkan.C.Core10.Core.VK_TRUE' value is reserved for use in
-- layer development.
--
-- @object@ /must/ be a Vulkan object or
-- 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE'. If @objectType@ is
-- not 'VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT' and @object@ is not
-- 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE', @object@ /must/ be
-- a Vulkan object of the corresponding type associated with @objectType@
-- as defined in
-- <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#debug-report-object-types>.
--
-- = See Also
--
-- 'VkDebugReportCallbackCreateInfoEXT'
type PFN_vkDebugReportCallbackEXT = Ptr (("flags" ::: VkDebugReportFlagsEXT) -> ("objectType" ::: VkDebugReportObjectTypeEXT) -> ("object" ::: Word64) -> ("location" ::: CSize) -> ("messageCode" ::: Int32) -> ("pLayerPrefix" ::: Ptr CChar) -> ("pMessage" ::: Ptr CChar) -> ("pUserData" ::: Ptr ()) -> IO VkBool32)

-- | VkDebugReportCallbackCreateInfoEXT - Structure specifying parameters of
-- a newly created debug report callback
--
-- = Description
--
-- For each 'VkDebugReportCallbackEXT' that is created the
-- 'VkDebugReportCallbackCreateInfoEXT'::@flags@ determine when that
-- 'VkDebugReportCallbackCreateInfoEXT'::@pfnCallback@ is called. When an
-- event happens, the implementation will do a bitwise AND of the event’s
-- 'VkDebugReportFlagBitsEXT' flags to each 'VkDebugReportCallbackEXT'
-- object’s flags. For each non-zero result the corresponding callback will
-- be called. The callback will come directly from the component that
-- detected the event, unless some other layer intercepts the calls for its
-- own purposes (filter them in a different way, log to a system error log,
-- etc.).
--
-- An application /may/ receive multiple callbacks if multiple
-- 'VkDebugReportCallbackEXT' objects were created. A callback will always
-- be executed in the same thread as the originating Vulkan call.
--
-- A callback may be called from multiple threads simultaneously (if the
-- application is making Vulkan calls from multiple threads).
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'PFN_vkDebugReportCallbackEXT', 'VkDebugReportFlagsEXT',
-- 'Graphics.Vulkan.C.Core10.Core.VkStructureType',
-- 'vkCreateDebugReportCallbackEXT'
data VkDebugReportCallbackCreateInfoEXT = VkDebugReportCallbackCreateInfoEXT
  { -- | @sType@ /must/ be
  -- 'VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT'
  vkSType :: VkStructureType
  , -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
  vkPNext :: Ptr ()
  , -- | @flags@ /must/ be a valid combination of 'VkDebugReportFlagBitsEXT'
  -- values
  vkFlags :: VkDebugReportFlagsEXT
  , -- | @pfnCallback@ /must/ be a valid 'PFN_vkDebugReportCallbackEXT' value
  vkPfnCallback :: PFN_vkDebugReportCallbackEXT
  , -- | @pUserData@ is user data to be passed to the callback.
  vkPUserData :: Ptr ()
  }
  deriving (Eq, Show)

instance Storable VkDebugReportCallbackCreateInfoEXT where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek ptr = VkDebugReportCallbackCreateInfoEXT <$> peek (ptr `plusPtr` 0)
                                                <*> peek (ptr `plusPtr` 8)
                                                <*> peek (ptr `plusPtr` 16)
                                                <*> peek (ptr `plusPtr` 24)
                                                <*> peek (ptr `plusPtr` 32)
  poke ptr poked = poke (ptr `plusPtr` 0) (vkSType (poked :: VkDebugReportCallbackCreateInfoEXT))
                *> poke (ptr `plusPtr` 8) (vkPNext (poked :: VkDebugReportCallbackCreateInfoEXT))
                *> poke (ptr `plusPtr` 16) (vkFlags (poked :: VkDebugReportCallbackCreateInfoEXT))
                *> poke (ptr `plusPtr` 24) (vkPfnCallback (poked :: VkDebugReportCallbackCreateInfoEXT))
                *> poke (ptr `plusPtr` 32) (vkPUserData (poked :: VkDebugReportCallbackCreateInfoEXT))

instance Zero VkDebugReportCallbackCreateInfoEXT where
  zero = VkDebugReportCallbackCreateInfoEXT VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT
                                            zero
                                            zero
                                            zero
                                            zero

-- | Dummy data to tag the 'Ptr' with
data VkDebugReportCallbackEXT_T
-- | VkDebugReportCallbackEXT - Opaque handle to a debug report callback
-- object
--
-- = See Also
--
-- 'vkCreateDebugReportCallbackEXT', 'vkDestroyDebugReportCallbackEXT'
type VkDebugReportCallbackEXT = Ptr VkDebugReportCallbackEXT_T

-- ** VkDebugReportFlagBitsEXT

-- | VkDebugReportFlagBitsEXT - Bitmask specifying events which cause a debug
-- report callback
--
-- = See Also
--
-- 'VkDebugReportFlagsEXT'
newtype VkDebugReportFlagBitsEXT = VkDebugReportFlagBitsEXT VkFlags
  deriving (Eq, Ord, Storable, Bits, FiniteBits, Zero)

instance Show VkDebugReportFlagBitsEXT where
  showsPrec _ VK_DEBUG_REPORT_INFORMATION_BIT_EXT = showString "VK_DEBUG_REPORT_INFORMATION_BIT_EXT"
  showsPrec _ VK_DEBUG_REPORT_WARNING_BIT_EXT = showString "VK_DEBUG_REPORT_WARNING_BIT_EXT"
  showsPrec _ VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT = showString "VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT"
  showsPrec _ VK_DEBUG_REPORT_ERROR_BIT_EXT = showString "VK_DEBUG_REPORT_ERROR_BIT_EXT"
  showsPrec _ VK_DEBUG_REPORT_DEBUG_BIT_EXT = showString "VK_DEBUG_REPORT_DEBUG_BIT_EXT"
  showsPrec p (VkDebugReportFlagBitsEXT x) = showParen (p >= 11) (showString "VkDebugReportFlagBitsEXT " . showsPrec 11 x)

instance Read VkDebugReportFlagBitsEXT where
  readPrec = parens ( choose [ ("VK_DEBUG_REPORT_INFORMATION_BIT_EXT",         pure VK_DEBUG_REPORT_INFORMATION_BIT_EXT)
                             , ("VK_DEBUG_REPORT_WARNING_BIT_EXT",             pure VK_DEBUG_REPORT_WARNING_BIT_EXT)
                             , ("VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT", pure VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT)
                             , ("VK_DEBUG_REPORT_ERROR_BIT_EXT",               pure VK_DEBUG_REPORT_ERROR_BIT_EXT)
                             , ("VK_DEBUG_REPORT_DEBUG_BIT_EXT",               pure VK_DEBUG_REPORT_DEBUG_BIT_EXT)
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkDebugReportFlagBitsEXT")
                        v <- step readPrec
                        pure (VkDebugReportFlagBitsEXT v)
                        )
                    )

-- | 'VK_DEBUG_REPORT_INFORMATION_BIT_EXT' specifies an informational message
-- such as resource details that may be handy when debugging an
-- application.
pattern VK_DEBUG_REPORT_INFORMATION_BIT_EXT :: VkDebugReportFlagBitsEXT
pattern VK_DEBUG_REPORT_INFORMATION_BIT_EXT = VkDebugReportFlagBitsEXT 0x00000001

-- | 'VK_DEBUG_REPORT_WARNING_BIT_EXT' specifies use of Vulkan that /may/
-- expose an app bug. Such cases may not be immediately harmful, such as a
-- fragment shader outputting to a location with no attachment. Other cases
-- /may/ point to behavior that is almost certainly bad when unintended
-- such as using an image whose memory has not been filled. In general if
-- you see a warning but you know that the behavior is intended\/desired,
-- then simply ignore the warning.
pattern VK_DEBUG_REPORT_WARNING_BIT_EXT :: VkDebugReportFlagBitsEXT
pattern VK_DEBUG_REPORT_WARNING_BIT_EXT = VkDebugReportFlagBitsEXT 0x00000002

-- | 'VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT' specifies a potentially
-- non-optimal use of Vulkan, e.g. using
-- 'Graphics.Vulkan.C.Core10.CommandBufferBuilding.vkCmdClearColorImage'
-- when setting
-- 'Graphics.Vulkan.C.Core10.Pass.VkAttachmentDescription'::@loadOp@ to
-- 'Graphics.Vulkan.C.Core10.Pass.VK_ATTACHMENT_LOAD_OP_CLEAR' would have
-- worked.
pattern VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT :: VkDebugReportFlagBitsEXT
pattern VK_DEBUG_REPORT_PERFORMANCE_WARNING_BIT_EXT = VkDebugReportFlagBitsEXT 0x00000004

-- | 'VK_DEBUG_REPORT_ERROR_BIT_EXT' specifies that the application has
-- violated a valid usage condition of the specification.
pattern VK_DEBUG_REPORT_ERROR_BIT_EXT :: VkDebugReportFlagBitsEXT
pattern VK_DEBUG_REPORT_ERROR_BIT_EXT = VkDebugReportFlagBitsEXT 0x00000008

-- | 'VK_DEBUG_REPORT_DEBUG_BIT_EXT' specifies diagnostic information from
-- the implementation and layers.
pattern VK_DEBUG_REPORT_DEBUG_BIT_EXT :: VkDebugReportFlagBitsEXT
pattern VK_DEBUG_REPORT_DEBUG_BIT_EXT = VkDebugReportFlagBitsEXT 0x00000010

-- | VkDebugReportFlagsEXT - Bitmask of VkDebugReportFlagBitsEXT
--
-- = Description
--
-- 'VkDebugReportFlagsEXT' is a bitmask type for setting a mask of zero or
-- more 'VkDebugReportFlagBitsEXT'.
--
-- = See Also
--
-- 'VkDebugReportCallbackCreateInfoEXT', 'VkDebugReportFlagBitsEXT',
-- 'vkDebugReportMessageEXT'
type VkDebugReportFlagsEXT = VkDebugReportFlagBitsEXT

-- ** VkDebugReportObjectTypeEXT

-- | VkDebugReportObjectTypeEXT - Specify the type of an object handle
--
-- = Description
--
-- \'
--
-- > +------------------------------------------+---------------------------+
-- > | 'VkDebugReportObjectTypeEXT'             | Vulkan Handle Type        |
-- > +==========================================+===========================+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT | Unknown\/Undefined Handle |
-- > | '                                        |                           |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EX | 'Graphics.Vulkan.C.Core10 |
-- > | T'                                       | .DeviceInitialization.VkI |
-- > |                                          | nstance'                  |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DE | 'Graphics.Vulkan.C.Core10 |
-- > | VICE_EXT'                                | .DeviceInitialization.VkP |
-- > |                                          | hysicalDevice'            |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT' | 'Graphics.Vulkan.C.Core10 |
-- > |                                          | .DeviceInitialization.VkD |
-- > |                                          | evice'                    |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT'  | 'Graphics.Vulkan.C.Core10 |
-- > |                                          | .Queue.VkQueue'           |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_E | 'Graphics.Vulkan.C.Core10 |
-- > | XT'                                      | .Queue.VkSemaphore'       |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUF | 'Graphics.Vulkan.C.Core10 |
-- > | FER_EXT'                                 | .Queue.VkCommandBuffer'   |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT'  | 'Graphics.Vulkan.C.Core10 |
-- > |                                          | .Queue.VkFence'           |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMO | 'Graphics.Vulkan.C.Core10 |
-- > | RY_EXT'                                  | .Memory.VkDeviceMemory'   |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT' | 'Graphics.Vulkan.C.Core10 |
-- > |                                          | .MemoryManagement.VkBuffe |
-- > |                                          | r'                        |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT'  | 'Graphics.Vulkan.C.Core10 |
-- > |                                          | .MemoryManagement.VkImage |
-- > |                                          | '                         |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT'  | 'Graphics.Vulkan.C.Core10 |
-- > |                                          | .Event.VkEvent'           |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_ | 'Graphics.Vulkan.C.Core10 |
-- > | EXT'                                     | .Query.VkQueryPool'       |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW | 'Graphics.Vulkan.C.Core10 |
-- > | _EXT'                                    | .BufferView.VkBufferView' |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_ | 'Graphics.Vulkan.C.Core10 |
-- > | EXT'                                     | .ImageView.VkImageView'   |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODU | 'Graphics.Vulkan.C.Core10 |
-- > | LE_EXT'                                  | .Shader.VkShaderModule'   |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CA | 'Graphics.Vulkan.C.Core10 |
-- > | CHE_EXT'                                 | .PipelineCache.VkPipeline |
-- > |                                          | Cache'                    |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LA | 'Graphics.Vulkan.C.Core10 |
-- > | YOUT_EXT'                                | .Pipeline.VkPipelineLayou |
-- > |                                          | t'                        |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS | 'Graphics.Vulkan.C.Core10 |
-- > | _EXT'                                    | .Pipeline.VkRenderPass'   |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EX | 'Graphics.Vulkan.C.Core10 |
-- > | T'                                       | .Pipeline.VkPipeline'     |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_ | 'Graphics.Vulkan.C.Core10 |
-- > | SET_LAYOUT_EXT'                          | .PipelineLayout.VkDescrip |
-- > |                                          | torSetLayout'             |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT | 'Graphics.Vulkan.C.Core10 |
-- > | '                                        | .Sampler.VkSampler'       |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_ | 'Graphics.Vulkan.C.Core10 |
-- > | POOL_EXT'                                | .DescriptorSet.VkDescript |
-- > |                                          | orPool'                   |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_ | 'Graphics.Vulkan.C.Core10 |
-- > | SET_EXT'                                 | .DescriptorSet.VkDescript |
-- > |                                          | orSet'                    |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER | 'Graphics.Vulkan.C.Core10 |
-- > | _EXT'                                    | .Pass.VkFramebuffer'      |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POO | 'Graphics.Vulkan.C.Core10 |
-- > | L_EXT'                                   | .CommandPool.VkCommandPoo |
-- > |                                          | l'                        |
-- > +------------------------------------------+---------------------------+
-- > | 'VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPOR | 'VkDebugReportCallbackEXT |
-- > | T_CALLBACK_EXT_EXT'                      | '                         |
-- > +------------------------------------------+---------------------------+
-- >
-- > VkDebugReportObjectTypeEXT and Vulkan Handle Relationship
--
-- __Note__
--
-- The primary expected use of 'VK_ERROR_VALIDATION_FAILED_EXT' is for
-- validation layer testing. It is not expected that an application would
-- see this error code during normal use of the validation layers.
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_debug_marker.VkDebugMarkerObjectNameInfoEXT',
-- 'Graphics.Vulkan.C.Extensions.VK_EXT_debug_marker.VkDebugMarkerObjectTagInfoEXT',
-- 'vkDebugReportMessageEXT'
newtype VkDebugReportObjectTypeEXT = VkDebugReportObjectTypeEXT Int32
  deriving (Eq, Ord, Storable, Zero)

instance Show VkDebugReportObjectTypeEXT where
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT"
  showsPrec _ VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT = showString "VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT"
  -- The following values are from extensions, the patterns themselves are exported from the extension modules
  showsPrec _ (VkDebugReportObjectTypeEXT 1000156000) = showString "VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT"
  showsPrec _ (VkDebugReportObjectTypeEXT 1000085000) = showString "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT"
  showsPrec _ (VkDebugReportObjectTypeEXT 1000165000) = showString "VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT"
  showsPrec p (VkDebugReportObjectTypeEXT x) = showParen (p >= 11) (showString "VkDebugReportObjectTypeEXT " . showsPrec 11 x)

instance Read VkDebugReportObjectTypeEXT where
  readPrec = parens ( choose [ ("VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT",                      pure VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT",                     pure VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT",              pure VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT",                       pure VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT",                        pure VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT",                    pure VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT",               pure VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT",                        pure VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT",                pure VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT",                       pure VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT",                        pure VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT",                        pure VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT",                   pure VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT",                  pure VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT",                   pure VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT",                pure VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT",               pure VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT",              pure VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT",                  pure VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT",                     pure VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT",        pure VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT",                      pure VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT",              pure VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT",               pure VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT",                  pure VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT",                 pure VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT",                  pure VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT",                pure VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT",    pure VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT",                  pure VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT",             pure VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT",             pure VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT", pure VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT)
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT",         pure VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT)
                             , -- The following values are from extensions, the patterns themselves are exported from the extension modules
                               ("VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT",   pure (VkDebugReportObjectTypeEXT 1000156000))
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT", pure (VkDebugReportObjectTypeEXT 1000085000))
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT",   pure (VkDebugReportObjectTypeEXT 1000156000))
                             , ("VK_DEBUG_REPORT_OBJECT_TYPE_ACCELERATION_STRUCTURE_NV_EXT",  pure (VkDebugReportObjectTypeEXT 1000165000))
                             ] +++
                      prec 10 (do
                        expectP (Ident "VkDebugReportObjectTypeEXT")
                        v <- step readPrec
                        pure (VkDebugReportObjectTypeEXT v)
                        )
                    )

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT = VkDebugReportObjectTypeEXT 0

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_INSTANCE_EXT = VkDebugReportObjectTypeEXT 1

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_PHYSICAL_DEVICE_EXT = VkDebugReportObjectTypeEXT 2

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_EXT = VkDebugReportObjectTypeEXT 3

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUEUE_EXT = VkDebugReportObjectTypeEXT 4

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SEMAPHORE_EXT = VkDebugReportObjectTypeEXT 5

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_BUFFER_EXT = VkDebugReportObjectTypeEXT 6

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_FENCE_EXT = VkDebugReportObjectTypeEXT 7

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEVICE_MEMORY_EXT = VkDebugReportObjectTypeEXT 8

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_EXT = VkDebugReportObjectTypeEXT 9

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_EXT = VkDebugReportObjectTypeEXT 10

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_EVENT_EXT = VkDebugReportObjectTypeEXT 11

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_QUERY_POOL_EXT = VkDebugReportObjectTypeEXT 12

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_BUFFER_VIEW_EXT = VkDebugReportObjectTypeEXT 13

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_IMAGE_VIEW_EXT = VkDebugReportObjectTypeEXT 14

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SHADER_MODULE_EXT = VkDebugReportObjectTypeEXT 15

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_CACHE_EXT = VkDebugReportObjectTypeEXT 16

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_LAYOUT_EXT = VkDebugReportObjectTypeEXT 17

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_RENDER_PASS_EXT = VkDebugReportObjectTypeEXT 18

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_PIPELINE_EXT = VkDebugReportObjectTypeEXT 19

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_LAYOUT_EXT = VkDebugReportObjectTypeEXT 20

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_EXT = VkDebugReportObjectTypeEXT 21

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_POOL_EXT = VkDebugReportObjectTypeEXT 22

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_SET_EXT = VkDebugReportObjectTypeEXT 23

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_FRAMEBUFFER_EXT = VkDebugReportObjectTypeEXT 24

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_COMMAND_POOL_EXT = VkDebugReportObjectTypeEXT 25

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SURFACE_KHR_EXT = VkDebugReportObjectTypeEXT 26

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SWAPCHAIN_KHR_EXT = VkDebugReportObjectTypeEXT 27

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT_EXT = VkDebugReportObjectTypeEXT 28

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_KHR_EXT = VkDebugReportObjectTypeEXT 29

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DISPLAY_MODE_KHR_EXT = VkDebugReportObjectTypeEXT 30

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_OBJECT_TABLE_NVX_EXT = VkDebugReportObjectTypeEXT 31

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_INDIRECT_COMMANDS_LAYOUT_NVX_EXT = VkDebugReportObjectTypeEXT 32

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_VALIDATION_CACHE_EXT_EXT = VkDebugReportObjectTypeEXT 33

-- | vkCreateDebugReportCallbackEXT - Create a debug report callback object
--
-- = Parameters
--
-- -   @instance@ the instance the callback will be logged on.
--
-- -   @pCreateInfo@ points to a 'VkDebugReportCallbackCreateInfoEXT'
--     structure which defines the conditions under which this callback
--     will be called.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- -   @pCallback@ is a pointer to record the 'VkDebugReportCallbackEXT'
--     object created.
--
-- == Valid Usage (Implicit)
--
-- -   @instance@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance' handle
--
-- -   @pCreateInfo@ /must/ be a valid pointer to a valid
--     'VkDebugReportCallbackCreateInfoEXT' structure
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   @pCallback@ /must/ be a valid pointer to a
--     'VkDebugReportCallbackEXT' handle
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.0-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--     -   'Graphics.Vulkan.C.Core10.Core.VK_ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'VkDebugReportCallbackCreateInfoEXT', 'VkDebugReportCallbackEXT',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkCreateDebugReportCallbackEXT" vkCreateDebugReportCallbackEXT :: ("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkDebugReportCallbackCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pCallback" ::: Ptr VkDebugReportCallbackEXT) -> IO VkResult
#else
vkCreateDebugReportCallbackEXT :: InstanceCmds -> ("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkDebugReportCallbackCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pCallback" ::: Ptr VkDebugReportCallbackEXT) -> IO VkResult
vkCreateDebugReportCallbackEXT deviceCmds = mkVkCreateDebugReportCallbackEXT (pVkCreateDebugReportCallbackEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCreateDebugReportCallbackEXT
  :: FunPtr (("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkDebugReportCallbackCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pCallback" ::: Ptr VkDebugReportCallbackEXT) -> IO VkResult) -> (("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkDebugReportCallbackCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pCallback" ::: Ptr VkDebugReportCallbackEXT) -> IO VkResult)
#endif

type FN_vkCreateDebugReportCallbackEXT = ("instance" ::: VkInstance) -> ("pCreateInfo" ::: Ptr VkDebugReportCallbackCreateInfoEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> ("pCallback" ::: Ptr VkDebugReportCallbackEXT) -> IO VkResult
type PFN_vkCreateDebugReportCallbackEXT = FunPtr FN_vkCreateDebugReportCallbackEXT

-- | vkDebugReportMessageEXT - Inject a message into a debug stream
--
-- = Parameters
--
-- -   @instance@ is the debug stream’s
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'.
--
-- -   @flags@ specifies the 'VkDebugReportFlagBitsEXT' classification of
--     this event\/message.
--
-- -   @objectType@ is a 'VkDebugReportObjectTypeEXT' specifying the type
--     of object being used or created at the time the event was triggered.
--
-- -   @object@ this is the object where the issue was detected. @object@
--     /can/ be 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE' if
--     there is no object associated with the event.
--
-- -   @location@ is an application defined value.
--
-- -   @messageCode@ is an application defined value.
--
-- -   @pLayerPrefix@ is the abbreviation of the component making this
--     event\/message.
--
-- -   @pMessage@ is a null-terminated string detailing the trigger
--     conditions.
--
-- = Description
--
-- The call will propagate through the layers and generate callback(s) as
-- indicated by the message’s flags. The parameters are passed on to the
-- callback in addition to the @pUserData@ value that was defined at the
-- time the callback was registered.
--
-- == Valid Usage
--
-- -   @object@ /must/ be a Vulkan object or
--     'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE'
--
-- -   If @objectType@ is not 'VK_DEBUG_REPORT_OBJECT_TYPE_UNKNOWN_EXT' and
--     @object@ is not 'Graphics.Vulkan.C.Core10.Constants.VK_NULL_HANDLE',
--     @object@ /must/ be a Vulkan object of the corresponding type
--     associated with @objectType@ as defined in
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#debug-report-object-types>.
--
-- == Valid Usage (Implicit)
--
-- -   @instance@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance' handle
--
-- -   @flags@ /must/ be a valid combination of 'VkDebugReportFlagBitsEXT'
--     values
--
-- -   @flags@ /must/ not be @0@
--
-- -   @objectType@ /must/ be a valid 'VkDebugReportObjectTypeEXT' value
--
-- -   @pLayerPrefix@ /must/ be a null-terminated UTF-8 string
--
-- -   @pMessage@ /must/ be a null-terminated UTF-8 string
--
-- = See Also
--
-- 'VkDebugReportFlagsEXT', 'VkDebugReportObjectTypeEXT',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkDebugReportMessageEXT" vkDebugReportMessageEXT :: ("instance" ::: VkInstance) -> ("flags" ::: VkDebugReportFlagsEXT) -> ("objectType" ::: VkDebugReportObjectTypeEXT) -> ("object" ::: Word64) -> ("location" ::: CSize) -> ("messageCode" ::: Int32) -> ("pLayerPrefix" ::: Ptr CChar) -> ("pMessage" ::: Ptr CChar) -> IO ()
#else
vkDebugReportMessageEXT :: InstanceCmds -> ("instance" ::: VkInstance) -> ("flags" ::: VkDebugReportFlagsEXT) -> ("objectType" ::: VkDebugReportObjectTypeEXT) -> ("object" ::: Word64) -> ("location" ::: CSize) -> ("messageCode" ::: Int32) -> ("pLayerPrefix" ::: Ptr CChar) -> ("pMessage" ::: Ptr CChar) -> IO ()
vkDebugReportMessageEXT deviceCmds = mkVkDebugReportMessageEXT (pVkDebugReportMessageEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDebugReportMessageEXT
  :: FunPtr (("instance" ::: VkInstance) -> ("flags" ::: VkDebugReportFlagsEXT) -> ("objectType" ::: VkDebugReportObjectTypeEXT) -> ("object" ::: Word64) -> ("location" ::: CSize) -> ("messageCode" ::: Int32) -> ("pLayerPrefix" ::: Ptr CChar) -> ("pMessage" ::: Ptr CChar) -> IO ()) -> (("instance" ::: VkInstance) -> ("flags" ::: VkDebugReportFlagsEXT) -> ("objectType" ::: VkDebugReportObjectTypeEXT) -> ("object" ::: Word64) -> ("location" ::: CSize) -> ("messageCode" ::: Int32) -> ("pLayerPrefix" ::: Ptr CChar) -> ("pMessage" ::: Ptr CChar) -> IO ())
#endif

type FN_vkDebugReportMessageEXT = ("instance" ::: VkInstance) -> ("flags" ::: VkDebugReportFlagsEXT) -> ("objectType" ::: VkDebugReportObjectTypeEXT) -> ("object" ::: Word64) -> ("location" ::: CSize) -> ("messageCode" ::: Int32) -> ("pLayerPrefix" ::: Ptr CChar) -> ("pMessage" ::: Ptr CChar) -> IO ()
type PFN_vkDebugReportMessageEXT = FunPtr FN_vkDebugReportMessageEXT

-- | vkDestroyDebugReportCallbackEXT - Destroy a debug report callback object
--
-- = Parameters
--
-- -   @instance@ the instance where the callback was created.
--
-- -   @callback@ the 'VkDebugReportCallbackEXT' object to destroy.
--     @callback@ is an externally synchronized object and /must/ not be
--     used on more than one thread at a time. This means that
--     'vkDestroyDebugReportCallbackEXT' /must/ not be called when a
--     callback is active.
--
-- -   @pAllocator@ controls host memory allocation as described in the
--     <https://www.khronos.org/registry/vulkan/specs/1.1-extensions/html/vkspec.html#memory-allocation Memory Allocation>
--     chapter.
--
-- == Valid Usage
--
-- -   If
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @callback@ was created, a compatible set of
--     callbacks /must/ be provided here
--
-- -   If no
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     were provided when @callback@ was created, @pAllocator@ /must/ be
--     @NULL@
--
-- == Valid Usage (Implicit)
--
-- -   @instance@ /must/ be a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance' handle
--
-- -   @callback@ /must/ be a valid 'VkDebugReportCallbackEXT' handle
--
-- -   If @pAllocator@ is not @NULL@, @pAllocator@ /must/ be a valid
--     pointer to a valid
--     'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks'
--     structure
--
-- -   @callback@ /must/ have been created, allocated, or retrieved from
--     @instance@
--
-- == Host Synchronization
--
-- -   Host access to @callback@ /must/ be externally synchronized
--
-- = See Also
--
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkAllocationCallbacks',
-- 'VkDebugReportCallbackEXT',
-- 'Graphics.Vulkan.C.Core10.DeviceInitialization.VkInstance'
#if defined(EXPOSE_STATIC_EXTENSION_COMMANDS)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "vkDestroyDebugReportCallbackEXT" vkDestroyDebugReportCallbackEXT :: ("instance" ::: VkInstance) -> ("callback" ::: VkDebugReportCallbackEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
#else
vkDestroyDebugReportCallbackEXT :: InstanceCmds -> ("instance" ::: VkInstance) -> ("callback" ::: VkDebugReportCallbackEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
vkDestroyDebugReportCallbackEXT deviceCmds = mkVkDestroyDebugReportCallbackEXT (pVkDestroyDebugReportCallbackEXT deviceCmds)
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkDestroyDebugReportCallbackEXT
  :: FunPtr (("instance" ::: VkInstance) -> ("callback" ::: VkDebugReportCallbackEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()) -> (("instance" ::: VkInstance) -> ("callback" ::: VkDebugReportCallbackEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ())
#endif

type FN_vkDestroyDebugReportCallbackEXT = ("instance" ::: VkInstance) -> ("callback" ::: VkDebugReportCallbackEXT) -> ("pAllocator" ::: Ptr VkAllocationCallbacks) -> IO ()
type PFN_vkDestroyDebugReportCallbackEXT = FunPtr FN_vkDestroyDebugReportCallbackEXT

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_DESCRIPTOR_UPDATE_TEMPLATE_EXT = VkDebugReportObjectTypeEXT 1000085000

-- No documentation found for Nested "VkDebugReportObjectTypeEXT" "VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT"
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT :: VkDebugReportObjectTypeEXT
pattern VK_DEBUG_REPORT_OBJECT_TYPE_SAMPLER_YCBCR_CONVERSION_EXT = VkDebugReportObjectTypeEXT 1000156000

-- No documentation found for Nested "VkResult" "VK_ERROR_VALIDATION_FAILED_EXT"
pattern VK_ERROR_VALIDATION_FAILED_EXT :: VkResult
pattern VK_ERROR_VALIDATION_FAILED_EXT = VkResult (-1000011001)

-- No documentation found for TopLevel "VK_EXT_DEBUG_REPORT_EXTENSION_NAME"
pattern VK_EXT_DEBUG_REPORT_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_EXT_DEBUG_REPORT_EXTENSION_NAME = "VK_EXT_debug_report"

-- No documentation found for TopLevel "VK_EXT_DEBUG_REPORT_SPEC_VERSION"
pattern VK_EXT_DEBUG_REPORT_SPEC_VERSION :: Integral a => a
pattern VK_EXT_DEBUG_REPORT_SPEC_VERSION = 9

-- No documentation found for Nested "VkObjectType" "VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT"
pattern VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT :: VkObjectType
pattern VK_OBJECT_TYPE_DEBUG_REPORT_CALLBACK_EXT = VkObjectType 1000011000

-- No documentation found for Nested "VkStructureType" "VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT"
pattern VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT = VkStructureType 1000011000

-- No documentation found for TopLevel "VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT"
pattern VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT :: VkStructureType
pattern VK_STRUCTURE_TYPE_DEBUG_REPORT_CREATE_INFO_EXT = VK_STRUCTURE_TYPE_DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT
