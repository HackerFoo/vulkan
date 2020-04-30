{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_INTEL_performance_query  ( initializePerformanceApiINTEL
                                                              , uninitializePerformanceApiINTEL
                                                              , cmdSetPerformanceMarkerINTEL
                                                              , cmdSetPerformanceStreamMarkerINTEL
                                                              , cmdSetPerformanceOverrideINTEL
                                                              , acquirePerformanceConfigurationINTEL
                                                              , releasePerformanceConfigurationINTEL
                                                              , queueSetPerformanceConfigurationINTEL
                                                              , getPerformanceParameterINTEL
                                                              , PerformanceValueINTEL(..)
                                                              , InitializePerformanceApiInfoINTEL(..)
                                                              , QueryPoolPerformanceQueryCreateInfoINTEL(..)
                                                              , PerformanceMarkerInfoINTEL(..)
                                                              , PerformanceStreamMarkerInfoINTEL(..)
                                                              , PerformanceOverrideInfoINTEL(..)
                                                              , PerformanceConfigurationAcquireInfoINTEL(..)
                                                              , PerformanceValueDataINTEL(..)
                                                              , peekPerformanceValueDataINTEL
                                                              , PerformanceConfigurationTypeINTEL( PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL
                                                                                                 , ..
                                                                                                 )
                                                              , QueryPoolSamplingModeINTEL( QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL
                                                                                          , ..
                                                                                          )
                                                              , PerformanceOverrideTypeINTEL( PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL
                                                                                            , PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL
                                                                                            , ..
                                                                                            )
                                                              , PerformanceParameterTypeINTEL( PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL
                                                                                             , PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL
                                                                                             , ..
                                                                                             )
                                                              , PerformanceValueTypeINTEL( PERFORMANCE_VALUE_TYPE_UINT32_INTEL
                                                                                         , PERFORMANCE_VALUE_TYPE_UINT64_INTEL
                                                                                         , PERFORMANCE_VALUE_TYPE_FLOAT_INTEL
                                                                                         , PERFORMANCE_VALUE_TYPE_BOOL_INTEL
                                                                                         , PERFORMANCE_VALUE_TYPE_STRING_INTEL
                                                                                         , ..
                                                                                         )
                                                              , QueryPoolCreateInfoINTEL
                                                              , INTEL_PERFORMANCE_QUERY_SPEC_VERSION
                                                              , pattern INTEL_PERFORMANCE_QUERY_SPEC_VERSION
                                                              , INTEL_PERFORMANCE_QUERY_EXTENSION_NAME
                                                              , pattern INTEL_PERFORMANCE_QUERY_EXTENSION_NAME
                                                              , PerformanceConfigurationINTEL(..)
                                                              ) where

import Control.Exception.Base (bracket)
import Control.Monad.IO.Class (liftIO)
import Foreign.Marshal.Alloc (allocaBytesAligned)
import Foreign.Marshal.Alloc (callocBytes)
import Foreign.Marshal.Alloc (free)
import GHC.Base (when)
import GHC.IO (throwIO)
import GHC.Ptr (castPtr)
import Foreign.Ptr (nullPtr)
import Foreign.Ptr (plusPtr)
import GHC.Read (choose)
import GHC.Read (expectP)
import GHC.Read (parens)
import GHC.Show (showParen)
import GHC.Show (showString)
import GHC.Show (showsPrec)
import Text.ParserCombinators.ReadPrec ((+++))
import Text.ParserCombinators.ReadPrec (prec)
import Text.ParserCombinators.ReadPrec (step)
import Data.ByteString (packCString)
import Data.ByteString (useAsCString)
import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Cont (evalContT)
import Control.Monad.Trans.Cont (runContT)
import Control.Monad.IO.Class (MonadIO)
import Data.String (IsString)
import Data.Typeable (Typeable)
import Foreign.C.Types (CChar)
import Foreign.C.Types (CFloat)
import Foreign.C.Types (CFloat(CFloat))
import Foreign.Storable (Storable)
import Foreign.Storable (Storable(peek))
import Foreign.Storable (Storable(poke))
import qualified Foreign.Storable (Storable(..))
import Data.Int (Int32)
import Foreign.Ptr (FunPtr)
import Foreign.Ptr (Ptr)
import GHC.Read (Read(readPrec))
import Data.Word (Word32)
import Data.Word (Word64)
import Text.Read.Lex (Lexeme(Ident))
import Data.ByteString (ByteString)
import Data.Kind (Type)
import Control.Monad.Trans.Cont (ContT(..))
import Graphics.Vulkan.Core10.BaseType (bool32ToBool)
import Graphics.Vulkan.Core10.BaseType (boolToBool32)
import Graphics.Vulkan.NamedType ((:::))
import Graphics.Vulkan.Core10.BaseType (Bool32)
import Graphics.Vulkan.Core10.Handles (CommandBuffer)
import Graphics.Vulkan.Core10.Handles (CommandBuffer(..))
import Graphics.Vulkan.Core10.Handles (CommandBuffer_T)
import Graphics.Vulkan.Core10.Handles (Device)
import Graphics.Vulkan.Core10.Handles (Device(..))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkAcquirePerformanceConfigurationINTEL))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCmdSetPerformanceMarkerINTEL))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCmdSetPerformanceOverrideINTEL))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkCmdSetPerformanceStreamMarkerINTEL))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkGetPerformanceParameterINTEL))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkInitializePerformanceApiINTEL))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkQueueSetPerformanceConfigurationINTEL))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkReleasePerformanceConfigurationINTEL))
import Graphics.Vulkan.Dynamic (DeviceCmds(pVkUninitializePerformanceApiINTEL))
import Graphics.Vulkan.Core10.Handles (Device_T)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Extensions.Handles (PerformanceConfigurationINTEL)
import Graphics.Vulkan.Extensions.Handles (PerformanceConfigurationINTEL(..))
import Graphics.Vulkan.Core10.Handles (Queue)
import Graphics.Vulkan.Core10.Handles (Queue(..))
import Graphics.Vulkan.Core10.Handles (Queue_T)
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero)
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_INITIALIZE_PERFORMANCE_API_INFO_INTEL))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PERFORMANCE_OVERRIDE_INFO_INTEL))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PERFORMANCE_STREAM_MARKER_INFO_INTEL))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO_INTEL))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
import Graphics.Vulkan.Extensions.Handles (PerformanceConfigurationINTEL(..))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkInitializePerformanceApiINTEL
  :: FunPtr (Ptr Device_T -> Ptr InitializePerformanceApiInfoINTEL -> IO Result) -> Ptr Device_T -> Ptr InitializePerformanceApiInfoINTEL -> IO Result

-- | vkInitializePerformanceApiINTEL - Initialize a device for performance
-- queries
--
-- = Parameters
--
-- -   @device@ is the logical device used for the queries.
--
-- -   @pInitializeInfo@ is a pointer to a
--     'InitializePerformanceApiInfoINTEL' structure specifying
--     initialization parameters.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'InitializePerformanceApiInfoINTEL'
initializePerformanceApiINTEL :: forall io . MonadIO io => Device -> ("initializeInfo" ::: InitializePerformanceApiInfoINTEL) -> io ()
initializePerformanceApiINTEL device initializeInfo = liftIO . evalContT $ do
  let vkInitializePerformanceApiINTEL' = mkVkInitializePerformanceApiINTEL (pVkInitializePerformanceApiINTEL (deviceCmds (device :: Device)))
  pInitializeInfo <- ContT $ withCStruct (initializeInfo)
  r <- lift $ vkInitializePerformanceApiINTEL' (deviceHandle (device)) pInitializeInfo
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkUninitializePerformanceApiINTEL
  :: FunPtr (Ptr Device_T -> IO ()) -> Ptr Device_T -> IO ()

-- | vkUninitializePerformanceApiINTEL - Uninitialize a device for
-- performance queries
--
-- = Parameters
--
-- -   @device@ is the logical device used for the queries.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device'
uninitializePerformanceApiINTEL :: forall io . MonadIO io => Device -> io ()
uninitializePerformanceApiINTEL device = liftIO $ do
  let vkUninitializePerformanceApiINTEL' = mkVkUninitializePerformanceApiINTEL (pVkUninitializePerformanceApiINTEL (deviceCmds (device :: Device)))
  vkUninitializePerformanceApiINTEL' (deviceHandle (device))
  pure $ ()


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetPerformanceMarkerINTEL
  :: FunPtr (Ptr CommandBuffer_T -> Ptr PerformanceMarkerInfoINTEL -> IO Result) -> Ptr CommandBuffer_T -> Ptr PerformanceMarkerInfoINTEL -> IO Result

-- | vkCmdSetPerformanceMarkerINTEL - Markers
--
-- = Parameters
--
-- The last marker set onto a command buffer before the end of a query will
-- be part of the query result.
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer' handle
--
-- -   @pMarkerInfo@ /must/ be a valid pointer to a valid
--     'PerformanceMarkerInfoINTEL' structure
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, compute,
--     or transfer operations
--
-- == Host Synchronization
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
-- | Primary                                                                                                                    | Both                                                                                                                   | Graphics                                                                                                              |                                                                                                                                     |
-- | Secondary                                                                                                                  |                                                                                                                        | Compute                                                                                                               |                                                                                                                                     |
-- |                                                                                                                            |                                                                                                                        | Transfer                                                                                                              |                                                                                                                                     |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.CommandBuffer',
-- 'PerformanceMarkerInfoINTEL'
cmdSetPerformanceMarkerINTEL :: forall io . MonadIO io => CommandBuffer -> PerformanceMarkerInfoINTEL -> io ()
cmdSetPerformanceMarkerINTEL commandBuffer markerInfo = liftIO . evalContT $ do
  let vkCmdSetPerformanceMarkerINTEL' = mkVkCmdSetPerformanceMarkerINTEL (pVkCmdSetPerformanceMarkerINTEL (deviceCmds (commandBuffer :: CommandBuffer)))
  pMarkerInfo <- ContT $ withCStruct (markerInfo)
  r <- lift $ vkCmdSetPerformanceMarkerINTEL' (commandBufferHandle (commandBuffer)) pMarkerInfo
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetPerformanceStreamMarkerINTEL
  :: FunPtr (Ptr CommandBuffer_T -> Ptr PerformanceStreamMarkerInfoINTEL -> IO Result) -> Ptr CommandBuffer_T -> Ptr PerformanceStreamMarkerInfoINTEL -> IO Result

-- | vkCmdSetPerformanceStreamMarkerINTEL - Markers
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer' handle
--
-- -   @pMarkerInfo@ /must/ be a valid pointer to a valid
--     'PerformanceStreamMarkerInfoINTEL' structure
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, compute,
--     or transfer operations
--
-- == Host Synchronization
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
-- | Primary                                                                                                                    | Both                                                                                                                   | Graphics                                                                                                              |                                                                                                                                     |
-- | Secondary                                                                                                                  |                                                                                                                        | Compute                                                                                                               |                                                                                                                                     |
-- |                                                                                                                            |                                                                                                                        | Transfer                                                                                                              |                                                                                                                                     |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.CommandBuffer',
-- 'PerformanceStreamMarkerInfoINTEL'
cmdSetPerformanceStreamMarkerINTEL :: forall io . MonadIO io => CommandBuffer -> PerformanceStreamMarkerInfoINTEL -> io ()
cmdSetPerformanceStreamMarkerINTEL commandBuffer markerInfo = liftIO . evalContT $ do
  let vkCmdSetPerformanceStreamMarkerINTEL' = mkVkCmdSetPerformanceStreamMarkerINTEL (pVkCmdSetPerformanceStreamMarkerINTEL (deviceCmds (commandBuffer :: CommandBuffer)))
  pMarkerInfo <- ContT $ withCStruct (markerInfo)
  r <- lift $ vkCmdSetPerformanceStreamMarkerINTEL' (commandBufferHandle (commandBuffer)) pMarkerInfo
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkCmdSetPerformanceOverrideINTEL
  :: FunPtr (Ptr CommandBuffer_T -> Ptr PerformanceOverrideInfoINTEL -> IO Result) -> Ptr CommandBuffer_T -> Ptr PerformanceOverrideInfoINTEL -> IO Result

-- | vkCmdSetPerformanceOverrideINTEL - Performance override settings
--
-- = Parameters
--
-- -   @commandBuffer@ is the command buffer where the override takes
--     place.
--
-- -   @pOverrideInfo@ is a pointer to a 'PerformanceOverrideInfoINTEL'
--     structure selecting the parameter to override.
--
-- == Valid Usage
--
-- -   @pOverrideInfo@ /must/ not be used with a
--     'PerformanceOverrideTypeINTEL' that is not reported available by
--     'getPerformanceParameterINTEL'.
--
-- == Valid Usage (Implicit)
--
-- -   @commandBuffer@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.CommandBuffer' handle
--
-- -   @pOverrideInfo@ /must/ be a valid pointer to a valid
--     'PerformanceOverrideInfoINTEL' structure
--
-- -   @commandBuffer@ /must/ be in the
--     <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#commandbuffers-lifecycle recording state>
--
-- -   The 'Graphics.Vulkan.Core10.Handles.CommandPool' that
--     @commandBuffer@ was allocated from /must/ support graphics, compute,
--     or transfer operations
--
-- == Host Synchronization
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
-- | Primary                                                                                                                    | Both                                                                                                                   | Graphics                                                                                                              |                                                                                                                                     |
-- | Secondary                                                                                                                  |                                                                                                                        | Compute                                                                                                               |                                                                                                                                     |
-- |                                                                                                                            |                                                                                                                        | Transfer                                                                                                              |                                                                                                                                     |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.CommandBuffer',
-- 'PerformanceOverrideInfoINTEL'
cmdSetPerformanceOverrideINTEL :: forall io . MonadIO io => CommandBuffer -> PerformanceOverrideInfoINTEL -> io ()
cmdSetPerformanceOverrideINTEL commandBuffer overrideInfo = liftIO . evalContT $ do
  let vkCmdSetPerformanceOverrideINTEL' = mkVkCmdSetPerformanceOverrideINTEL (pVkCmdSetPerformanceOverrideINTEL (deviceCmds (commandBuffer :: CommandBuffer)))
  pOverrideInfo <- ContT $ withCStruct (overrideInfo)
  r <- lift $ vkCmdSetPerformanceOverrideINTEL' (commandBufferHandle (commandBuffer)) pOverrideInfo
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkAcquirePerformanceConfigurationINTEL
  :: FunPtr (Ptr Device_T -> Ptr PerformanceConfigurationAcquireInfoINTEL -> Ptr PerformanceConfigurationINTEL -> IO Result) -> Ptr Device_T -> Ptr PerformanceConfigurationAcquireInfoINTEL -> Ptr PerformanceConfigurationINTEL -> IO Result

-- | vkAcquirePerformanceConfigurationINTEL - Acquire the performance query
-- capability
--
-- = Parameters
--
-- -   @device@ is the logical device that the performance query commands
--     will be submitted to.
--
-- -   @pAcquireInfo@ is a pointer to a
--     'PerformanceConfigurationAcquireInfoINTEL' structure, specifying the
--     performance configuration to acquire.
--
-- -   @pConfiguration@ is a pointer to a
--     'Graphics.Vulkan.Extensions.Handles.PerformanceConfigurationINTEL'
--     handle in which the resulting configuration object is returned.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'PerformanceConfigurationAcquireInfoINTEL',
-- 'Graphics.Vulkan.Extensions.Handles.PerformanceConfigurationINTEL'
acquirePerformanceConfigurationINTEL :: forall io . MonadIO io => Device -> PerformanceConfigurationAcquireInfoINTEL -> io (PerformanceConfigurationINTEL)
acquirePerformanceConfigurationINTEL device acquireInfo = liftIO . evalContT $ do
  let vkAcquirePerformanceConfigurationINTEL' = mkVkAcquirePerformanceConfigurationINTEL (pVkAcquirePerformanceConfigurationINTEL (deviceCmds (device :: Device)))
  pAcquireInfo <- ContT $ withCStruct (acquireInfo)
  pPConfiguration <- ContT $ bracket (callocBytes @PerformanceConfigurationINTEL 8) free
  r <- lift $ vkAcquirePerformanceConfigurationINTEL' (deviceHandle (device)) pAcquireInfo (pPConfiguration)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pConfiguration <- lift $ peek @PerformanceConfigurationINTEL pPConfiguration
  pure $ (pConfiguration)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkReleasePerformanceConfigurationINTEL
  :: FunPtr (Ptr Device_T -> PerformanceConfigurationINTEL -> IO Result) -> Ptr Device_T -> PerformanceConfigurationINTEL -> IO Result

-- | vkReleasePerformanceConfigurationINTEL - Release a configuration to
-- capture performance data
--
-- = Parameters
--
-- -   @device@ is the device associated to the configuration object to
--     release.
--
-- -   @configuration@ is the configuration object to release.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'Graphics.Vulkan.Extensions.Handles.PerformanceConfigurationINTEL'
releasePerformanceConfigurationINTEL :: forall io . MonadIO io => Device -> PerformanceConfigurationINTEL -> io ()
releasePerformanceConfigurationINTEL device configuration = liftIO $ do
  let vkReleasePerformanceConfigurationINTEL' = mkVkReleasePerformanceConfigurationINTEL (pVkReleasePerformanceConfigurationINTEL (deviceCmds (device :: Device)))
  r <- vkReleasePerformanceConfigurationINTEL' (deviceHandle (device)) (configuration)
  when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkQueueSetPerformanceConfigurationINTEL
  :: FunPtr (Ptr Queue_T -> PerformanceConfigurationINTEL -> IO Result) -> Ptr Queue_T -> PerformanceConfigurationINTEL -> IO Result

-- | vkQueueSetPerformanceConfigurationINTEL - Set a performance query
--
-- = Parameters
--
-- -   @queue@ is the queue on which the configuration will be used.
--
-- -   @configuration@ is the configuration to use.
--
-- == Valid Usage (Implicit)
--
-- -   @queue@ /must/ be a valid 'Graphics.Vulkan.Core10.Handles.Queue'
--     handle
--
-- -   @configuration@ /must/ be a valid
--     'Graphics.Vulkan.Extensions.Handles.PerformanceConfigurationINTEL'
--     handle
--
-- -   Both of @configuration@, and @queue@ /must/ have been created,
--     allocated, or retrieved from the same
--     'Graphics.Vulkan.Core10.Handles.Device'
--
-- == Command Properties
--
-- \'
--
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
-- | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkCommandBufferLevel Command Buffer Levels> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#vkCmdBeginRenderPass Render Pass Scope> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VkQueueFlagBits Supported Queue Types> | <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#synchronization-pipeline-stages-types Pipeline Type> |
-- +============================================================================================================================+========================================================================================================================+=======================================================================================================================+=====================================================================================================================================+
-- | -                                                                                                                          | -                                                                                                                      | Any                                                                                                                   | -                                                                                                                                   |
-- +----------------------------------------------------------------------------------------------------------------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------------------+-------------------------------------------------------------------------------------------------------------------------------------+
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Extensions.Handles.PerformanceConfigurationINTEL',
-- 'Graphics.Vulkan.Core10.Handles.Queue'
queueSetPerformanceConfigurationINTEL :: forall io . MonadIO io => Queue -> PerformanceConfigurationINTEL -> io ()
queueSetPerformanceConfigurationINTEL queue configuration = liftIO $ do
  let vkQueueSetPerformanceConfigurationINTEL' = mkVkQueueSetPerformanceConfigurationINTEL (pVkQueueSetPerformanceConfigurationINTEL (deviceCmds (queue :: Queue)))
  r <- vkQueueSetPerformanceConfigurationINTEL' (queueHandle (queue)) (configuration)
  when (r < SUCCESS) (throwIO (VulkanException r))


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPerformanceParameterINTEL
  :: FunPtr (Ptr Device_T -> PerformanceParameterTypeINTEL -> Ptr PerformanceValueINTEL -> IO Result) -> Ptr Device_T -> PerformanceParameterTypeINTEL -> Ptr PerformanceValueINTEL -> IO Result

-- | vkGetPerformanceParameterINTEL - Query performance capabilities of the
-- device
--
-- = Parameters
--
-- -   @device@ is the logical device to query.
--
-- -   @parameter@ is the parameter to query.
--
-- -   @pValue@ is a pointer to a 'PerformanceValueINTEL' structure in
--     which the type and value of the parameter are returned.
--
-- == Return Codes
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-successcodes Success>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.SUCCESS'
--
-- [<https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#fundamentals-errorcodes Failure>]
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_TOO_MANY_OBJECTS'
--
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_OUT_OF_HOST_MEMORY'
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.Device',
-- 'PerformanceParameterTypeINTEL', 'PerformanceValueINTEL'
getPerformanceParameterINTEL :: forall io . MonadIO io => Device -> PerformanceParameterTypeINTEL -> io (PerformanceValueINTEL)
getPerformanceParameterINTEL device parameter = liftIO . evalContT $ do
  let vkGetPerformanceParameterINTEL' = mkVkGetPerformanceParameterINTEL (pVkGetPerformanceParameterINTEL (deviceCmds (device :: Device)))
  pPValue <- ContT (withZeroCStruct @PerformanceValueINTEL)
  r <- lift $ vkGetPerformanceParameterINTEL' (deviceHandle (device)) (parameter) (pPValue)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pValue <- lift $ peekCStruct @PerformanceValueINTEL pPValue
  pure $ (pValue)


-- | VkPerformanceValueINTEL - Container for value and types of parameters
-- that can be queried
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'PerformanceValueDataINTEL', 'PerformanceValueTypeINTEL',
-- 'getPerformanceParameterINTEL'
data PerformanceValueINTEL = PerformanceValueINTEL
  { -- | @type@ /must/ be a valid 'PerformanceValueTypeINTEL' value
    type' :: PerformanceValueTypeINTEL
  , -- | @data@ /must/ be a valid 'PerformanceValueDataINTEL' union
    data' :: PerformanceValueDataINTEL
  }
  deriving (Typeable)
deriving instance Show PerformanceValueINTEL

instance ToCStruct PerformanceValueINTEL where
  withCStruct x f = allocaBytesAligned 16 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PerformanceValueINTEL{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr PerformanceValueTypeINTEL)) (type')
    ContT $ pokeCStruct ((p `plusPtr` 8 :: Ptr PerformanceValueDataINTEL)) (data') . ($ ())
    lift $ f
  cStructSize = 16
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr PerformanceValueTypeINTEL)) (zero)
    ContT $ pokeCStruct ((p `plusPtr` 8 :: Ptr PerformanceValueDataINTEL)) (zero) . ($ ())
    lift $ f

instance FromCStruct PerformanceValueINTEL where
  peekCStruct p = do
    type' <- peek @PerformanceValueTypeINTEL ((p `plusPtr` 0 :: Ptr PerformanceValueTypeINTEL))
    data' <- peekPerformanceValueDataINTEL type' ((p `plusPtr` 8 :: Ptr PerformanceValueDataINTEL))
    pure $ PerformanceValueINTEL
             type' data'

instance Zero PerformanceValueINTEL where
  zero = PerformanceValueINTEL
           zero
           zero


-- | VkInitializePerformanceApiInfoINTEL - Structure specifying parameters of
-- initialize of the device
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'initializePerformanceApiINTEL'
data InitializePerformanceApiInfoINTEL = InitializePerformanceApiInfoINTEL
  { -- | @pUserData@ is a pointer for application data.
    userData :: Ptr () }
  deriving (Typeable)
deriving instance Show InitializePerformanceApiInfoINTEL

instance ToCStruct InitializePerformanceApiInfoINTEL where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p InitializePerformanceApiInfoINTEL{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_INITIALIZE_PERFORMANCE_API_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr (Ptr ()))) (userData)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_INITIALIZE_PERFORMANCE_API_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr (Ptr ()))) (zero)
    f

instance FromCStruct InitializePerformanceApiInfoINTEL where
  peekCStruct p = do
    pUserData <- peek @(Ptr ()) ((p `plusPtr` 16 :: Ptr (Ptr ())))
    pure $ InitializePerformanceApiInfoINTEL
             pUserData

instance Storable InitializePerformanceApiInfoINTEL where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero InitializePerformanceApiInfoINTEL where
  zero = InitializePerformanceApiInfoINTEL
           zero


-- | VkQueryPoolPerformanceQueryCreateInfoINTEL - Structure specifying
-- parameters to create a pool of performance queries
--
-- = Members
--
-- To create a pool for Intel performance queries, set
-- 'Graphics.Vulkan.Core10.Query.QueryPoolCreateInfo'::@queryType@ to
-- 'Graphics.Vulkan.Core10.Enums.QueryType.QUERY_TYPE_PERFORMANCE_QUERY_INTEL'
-- and add a 'QueryPoolPerformanceQueryCreateInfoINTEL' structure to the
-- @pNext@ chain of the 'Graphics.Vulkan.Core10.Query.QueryPoolCreateInfo'
-- structure.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'QueryPoolSamplingModeINTEL',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType'
data QueryPoolPerformanceQueryCreateInfoINTEL = QueryPoolPerformanceQueryCreateInfoINTEL
  { -- | @performanceCountersSampling@ /must/ be a valid
    -- 'QueryPoolSamplingModeINTEL' value
    performanceCountersSampling :: QueryPoolSamplingModeINTEL }
  deriving (Typeable)
deriving instance Show QueryPoolPerformanceQueryCreateInfoINTEL

instance ToCStruct QueryPoolPerformanceQueryCreateInfoINTEL where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p QueryPoolPerformanceQueryCreateInfoINTEL{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr QueryPoolSamplingModeINTEL)) (performanceCountersSampling)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_QUERY_POOL_CREATE_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr QueryPoolSamplingModeINTEL)) (zero)
    f

instance FromCStruct QueryPoolPerformanceQueryCreateInfoINTEL where
  peekCStruct p = do
    performanceCountersSampling <- peek @QueryPoolSamplingModeINTEL ((p `plusPtr` 16 :: Ptr QueryPoolSamplingModeINTEL))
    pure $ QueryPoolPerformanceQueryCreateInfoINTEL
             performanceCountersSampling

instance Storable QueryPoolPerformanceQueryCreateInfoINTEL where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero QueryPoolPerformanceQueryCreateInfoINTEL where
  zero = QueryPoolPerformanceQueryCreateInfoINTEL
           zero


-- | VkPerformanceMarkerInfoINTEL - Structure specifying performance markers
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'cmdSetPerformanceMarkerINTEL'
data PerformanceMarkerInfoINTEL = PerformanceMarkerInfoINTEL
  { -- | @marker@ is the marker value that will be recorded into the opaque query
    -- results.
    marker :: Word64 }
  deriving (Typeable)
deriving instance Show PerformanceMarkerInfoINTEL

instance ToCStruct PerformanceMarkerInfoINTEL where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PerformanceMarkerInfoINTEL{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word64)) (marker)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PERFORMANCE_MARKER_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word64)) (zero)
    f

instance FromCStruct PerformanceMarkerInfoINTEL where
  peekCStruct p = do
    marker <- peek @Word64 ((p `plusPtr` 16 :: Ptr Word64))
    pure $ PerformanceMarkerInfoINTEL
             marker

instance Storable PerformanceMarkerInfoINTEL where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PerformanceMarkerInfoINTEL where
  zero = PerformanceMarkerInfoINTEL
           zero


-- | VkPerformanceStreamMarkerInfoINTEL - Structure specifying stream
-- performance markers
--
-- == Valid Usage
--
-- -   The value written by the application into @marker@ /must/ only used
--     the valid bits as reported by 'getPerformanceParameterINTEL' with
--     the 'PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL'.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_PERFORMANCE_STREAM_MARKER_INFO_INTEL'
--
-- -   @pNext@ /must/ be @NULL@
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'cmdSetPerformanceStreamMarkerINTEL'
data PerformanceStreamMarkerInfoINTEL = PerformanceStreamMarkerInfoINTEL
  { -- | @marker@ is the marker value that will be recorded into the reports
    -- consumed by an external application.
    marker :: Word32 }
  deriving (Typeable)
deriving instance Show PerformanceStreamMarkerInfoINTEL

instance ToCStruct PerformanceStreamMarkerInfoINTEL where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PerformanceStreamMarkerInfoINTEL{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PERFORMANCE_STREAM_MARKER_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (marker)
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PERFORMANCE_STREAM_MARKER_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Word32)) (zero)
    f

instance FromCStruct PerformanceStreamMarkerInfoINTEL where
  peekCStruct p = do
    marker <- peek @Word32 ((p `plusPtr` 16 :: Ptr Word32))
    pure $ PerformanceStreamMarkerInfoINTEL
             marker

instance Storable PerformanceStreamMarkerInfoINTEL where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PerformanceStreamMarkerInfoINTEL where
  zero = PerformanceStreamMarkerInfoINTEL
           zero


-- | VkPerformanceOverrideInfoINTEL - Performance override info
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.BaseType.Bool32',
-- 'PerformanceOverrideTypeINTEL',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'cmdSetPerformanceOverrideINTEL'
data PerformanceOverrideInfoINTEL = PerformanceOverrideInfoINTEL
  { -- | @type@ /must/ be a valid 'PerformanceOverrideTypeINTEL' value
    type' :: PerformanceOverrideTypeINTEL
  , -- | @enable@ defines whether the override is enabled.
    enable :: Bool
  , -- | @parameter@ is a potential required parameter for the override.
    parameter :: Word64
  }
  deriving (Typeable)
deriving instance Show PerformanceOverrideInfoINTEL

instance ToCStruct PerformanceOverrideInfoINTEL where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PerformanceOverrideInfoINTEL{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PERFORMANCE_OVERRIDE_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr PerformanceOverrideTypeINTEL)) (type')
    poke ((p `plusPtr` 20 :: Ptr Bool32)) (boolToBool32 (enable))
    poke ((p `plusPtr` 24 :: Ptr Word64)) (parameter)
    f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PERFORMANCE_OVERRIDE_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr PerformanceOverrideTypeINTEL)) (zero)
    poke ((p `plusPtr` 20 :: Ptr Bool32)) (boolToBool32 (zero))
    poke ((p `plusPtr` 24 :: Ptr Word64)) (zero)
    f

instance FromCStruct PerformanceOverrideInfoINTEL where
  peekCStruct p = do
    type' <- peek @PerformanceOverrideTypeINTEL ((p `plusPtr` 16 :: Ptr PerformanceOverrideTypeINTEL))
    enable <- peek @Bool32 ((p `plusPtr` 20 :: Ptr Bool32))
    parameter <- peek @Word64 ((p `plusPtr` 24 :: Ptr Word64))
    pure $ PerformanceOverrideInfoINTEL
             type' (bool32ToBool enable) parameter

instance Storable PerformanceOverrideInfoINTEL where
  sizeOf ~_ = 32
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PerformanceOverrideInfoINTEL where
  zero = PerformanceOverrideInfoINTEL
           zero
           zero
           zero


-- | VkPerformanceConfigurationAcquireInfoINTEL - Acquire a configuration to
-- capture performance data
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'PerformanceConfigurationTypeINTEL',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'acquirePerformanceConfigurationINTEL'
data PerformanceConfigurationAcquireInfoINTEL = PerformanceConfigurationAcquireInfoINTEL
  { -- | @type@ /must/ be a valid 'PerformanceConfigurationTypeINTEL' value
    type' :: PerformanceConfigurationTypeINTEL }
  deriving (Typeable)
deriving instance Show PerformanceConfigurationAcquireInfoINTEL

instance ToCStruct PerformanceConfigurationAcquireInfoINTEL where
  withCStruct x f = allocaBytesAligned 24 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PerformanceConfigurationAcquireInfoINTEL{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr PerformanceConfigurationTypeINTEL)) (type')
    f
  cStructSize = 24
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr PerformanceConfigurationTypeINTEL)) (zero)
    f

instance FromCStruct PerformanceConfigurationAcquireInfoINTEL where
  peekCStruct p = do
    type' <- peek @PerformanceConfigurationTypeINTEL ((p `plusPtr` 16 :: Ptr PerformanceConfigurationTypeINTEL))
    pure $ PerformanceConfigurationAcquireInfoINTEL
             type'

instance Storable PerformanceConfigurationAcquireInfoINTEL where
  sizeOf ~_ = 24
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PerformanceConfigurationAcquireInfoINTEL where
  zero = PerformanceConfigurationAcquireInfoINTEL
           zero


data PerformanceValueDataINTEL
  = Value32 Word32
  | Value64 Word64
  | ValueFloat Float
  | ValueBool Bool
  | ValueString ByteString
  deriving (Show)

instance ToCStruct PerformanceValueDataINTEL where
  withCStruct x f = allocaBytesAligned 8 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct :: Ptr PerformanceValueDataINTEL -> PerformanceValueDataINTEL -> IO a -> IO a
  pokeCStruct p = (. const) . runContT .  \case
    Value32 v -> lift $ poke (castPtr @_ @Word32 p) (v)
    Value64 v -> lift $ poke (castPtr @_ @Word64 p) (v)
    ValueFloat v -> lift $ poke (castPtr @_ @CFloat p) (CFloat (v))
    ValueBool v -> lift $ poke (castPtr @_ @Bool32 p) (boolToBool32 (v))
    ValueString v -> do
      valueString <- ContT $ useAsCString (v)
      lift $ poke (castPtr @_ @(Ptr CChar) p) valueString
  pokeZeroCStruct :: Ptr PerformanceValueDataINTEL -> IO b -> IO b
  pokeZeroCStruct _ f = f
  cStructSize = 8
  cStructAlignment = 8

instance Zero PerformanceValueDataINTEL where
  zero = Value64 zero

peekPerformanceValueDataINTEL :: PerformanceValueTypeINTEL -> Ptr PerformanceValueDataINTEL -> IO PerformanceValueDataINTEL
peekPerformanceValueDataINTEL tag p = case tag of
  PERFORMANCE_VALUE_TYPE_UINT32_INTEL -> Value32 <$> (peek @Word32 (castPtr @_ @Word32 p))
  PERFORMANCE_VALUE_TYPE_UINT64_INTEL -> Value64 <$> (peek @Word64 (castPtr @_ @Word64 p))
  PERFORMANCE_VALUE_TYPE_FLOAT_INTEL -> ValueFloat <$> (do
    valueFloat <- peek @CFloat (castPtr @_ @CFloat p)
    pure $ (\(CFloat a) -> a) valueFloat)
  PERFORMANCE_VALUE_TYPE_BOOL_INTEL -> ValueBool <$> (do
    valueBool <- peek @Bool32 (castPtr @_ @Bool32 p)
    pure $ bool32ToBool valueBool)
  PERFORMANCE_VALUE_TYPE_STRING_INTEL -> ValueString <$> (packCString =<< peek (castPtr @_ @(Ptr CChar) p))


-- | VkPerformanceConfigurationTypeINTEL - Type of performance configuration
--
-- = See Also
--
-- 'PerformanceConfigurationAcquireInfoINTEL'
newtype PerformanceConfigurationTypeINTEL = PerformanceConfigurationTypeINTEL Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- No documentation found for Nested "VkPerformanceConfigurationTypeINTEL" "VK_PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL"
pattern PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL = PerformanceConfigurationTypeINTEL 0
{-# complete PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL :: PerformanceConfigurationTypeINTEL #-}

instance Show PerformanceConfigurationTypeINTEL where
  showsPrec p = \case
    PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL -> showString "PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL"
    PerformanceConfigurationTypeINTEL x -> showParen (p >= 11) (showString "PerformanceConfigurationTypeINTEL " . showsPrec 11 x)

instance Read PerformanceConfigurationTypeINTEL where
  readPrec = parens (choose [("PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL", pure PERFORMANCE_CONFIGURATION_TYPE_COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL)]
                     +++
                     prec 10 (do
                       expectP (Ident "PerformanceConfigurationTypeINTEL")
                       v <- step readPrec
                       pure (PerformanceConfigurationTypeINTEL v)))


-- | VkQueryPoolSamplingModeINTEL - Enum specifying how performance queries
-- should be captured
--
-- = See Also
--
-- 'QueryPoolPerformanceQueryCreateInfoINTEL'
newtype QueryPoolSamplingModeINTEL = QueryPoolSamplingModeINTEL Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- | 'QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL' is the default mode in which the
-- application calls
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdBeginQuery' and
-- 'Graphics.Vulkan.Core10.CommandBufferBuilding.cmdEndQuery' to record
-- performance data.
pattern QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL = QueryPoolSamplingModeINTEL 0
{-# complete QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL :: QueryPoolSamplingModeINTEL #-}

instance Show QueryPoolSamplingModeINTEL where
  showsPrec p = \case
    QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL -> showString "QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL"
    QueryPoolSamplingModeINTEL x -> showParen (p >= 11) (showString "QueryPoolSamplingModeINTEL " . showsPrec 11 x)

instance Read QueryPoolSamplingModeINTEL where
  readPrec = parens (choose [("QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL", pure QUERY_POOL_SAMPLING_MODE_MANUAL_INTEL)]
                     +++
                     prec 10 (do
                       expectP (Ident "QueryPoolSamplingModeINTEL")
                       v <- step readPrec
                       pure (QueryPoolSamplingModeINTEL v)))


-- | VkPerformanceOverrideTypeINTEL - Performance override type
--
-- = See Also
--
-- 'PerformanceOverrideInfoINTEL'
newtype PerformanceOverrideTypeINTEL = PerformanceOverrideTypeINTEL Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- | 'PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL' turns all rendering
-- operations into noop.
pattern PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL = PerformanceOverrideTypeINTEL 0
-- | 'PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL' stalls the stream of
-- commands until all previously emitted commands have completed and all
-- caches been flushed and invalidated.
pattern PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL = PerformanceOverrideTypeINTEL 1
{-# complete PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL,
             PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL :: PerformanceOverrideTypeINTEL #-}

instance Show PerformanceOverrideTypeINTEL where
  showsPrec p = \case
    PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL -> showString "PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL"
    PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL -> showString "PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL"
    PerformanceOverrideTypeINTEL x -> showParen (p >= 11) (showString "PerformanceOverrideTypeINTEL " . showsPrec 11 x)

instance Read PerformanceOverrideTypeINTEL where
  readPrec = parens (choose [("PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL", pure PERFORMANCE_OVERRIDE_TYPE_NULL_HARDWARE_INTEL)
                            , ("PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL", pure PERFORMANCE_OVERRIDE_TYPE_FLUSH_GPU_CACHES_INTEL)]
                     +++
                     prec 10 (do
                       expectP (Ident "PerformanceOverrideTypeINTEL")
                       v <- step readPrec
                       pure (PerformanceOverrideTypeINTEL v)))


-- | VkPerformanceParameterTypeINTEL - Parameters that can be queried
--
-- = See Also
--
-- 'getPerformanceParameterINTEL'
newtype PerformanceParameterTypeINTEL = PerformanceParameterTypeINTEL Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- | 'PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL' has a boolean
-- result which tells whether hardware counters can be captured.
pattern PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL = PerformanceParameterTypeINTEL 0
-- | 'PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL' has a 32
-- bits integer result which tells how many bits can be written into the
-- 'PerformanceValueINTEL' value.
pattern PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL = PerformanceParameterTypeINTEL 1
{-# complete PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL,
             PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL :: PerformanceParameterTypeINTEL #-}

instance Show PerformanceParameterTypeINTEL where
  showsPrec p = \case
    PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL -> showString "PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL"
    PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL -> showString "PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL"
    PerformanceParameterTypeINTEL x -> showParen (p >= 11) (showString "PerformanceParameterTypeINTEL " . showsPrec 11 x)

instance Read PerformanceParameterTypeINTEL where
  readPrec = parens (choose [("PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL", pure PERFORMANCE_PARAMETER_TYPE_HW_COUNTERS_SUPPORTED_INTEL)
                            , ("PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL", pure PERFORMANCE_PARAMETER_TYPE_STREAM_MARKER_VALID_BITS_INTEL)]
                     +++
                     prec 10 (do
                       expectP (Ident "PerformanceParameterTypeINTEL")
                       v <- step readPrec
                       pure (PerformanceParameterTypeINTEL v)))


-- | VkPerformanceValueTypeINTEL - Type of the parameters that can be queried
--
-- = See Also
--
-- 'PerformanceValueINTEL'
newtype PerformanceValueTypeINTEL = PerformanceValueTypeINTEL Int32
  deriving newtype (Eq, Ord, Storable, Zero)

-- No documentation found for Nested "VkPerformanceValueTypeINTEL" "VK_PERFORMANCE_VALUE_TYPE_UINT32_INTEL"
pattern PERFORMANCE_VALUE_TYPE_UINT32_INTEL = PerformanceValueTypeINTEL 0
-- No documentation found for Nested "VkPerformanceValueTypeINTEL" "VK_PERFORMANCE_VALUE_TYPE_UINT64_INTEL"
pattern PERFORMANCE_VALUE_TYPE_UINT64_INTEL = PerformanceValueTypeINTEL 1
-- No documentation found for Nested "VkPerformanceValueTypeINTEL" "VK_PERFORMANCE_VALUE_TYPE_FLOAT_INTEL"
pattern PERFORMANCE_VALUE_TYPE_FLOAT_INTEL = PerformanceValueTypeINTEL 2
-- No documentation found for Nested "VkPerformanceValueTypeINTEL" "VK_PERFORMANCE_VALUE_TYPE_BOOL_INTEL"
pattern PERFORMANCE_VALUE_TYPE_BOOL_INTEL = PerformanceValueTypeINTEL 3
-- No documentation found for Nested "VkPerformanceValueTypeINTEL" "VK_PERFORMANCE_VALUE_TYPE_STRING_INTEL"
pattern PERFORMANCE_VALUE_TYPE_STRING_INTEL = PerformanceValueTypeINTEL 4
{-# complete PERFORMANCE_VALUE_TYPE_UINT32_INTEL,
             PERFORMANCE_VALUE_TYPE_UINT64_INTEL,
             PERFORMANCE_VALUE_TYPE_FLOAT_INTEL,
             PERFORMANCE_VALUE_TYPE_BOOL_INTEL,
             PERFORMANCE_VALUE_TYPE_STRING_INTEL :: PerformanceValueTypeINTEL #-}

instance Show PerformanceValueTypeINTEL where
  showsPrec p = \case
    PERFORMANCE_VALUE_TYPE_UINT32_INTEL -> showString "PERFORMANCE_VALUE_TYPE_UINT32_INTEL"
    PERFORMANCE_VALUE_TYPE_UINT64_INTEL -> showString "PERFORMANCE_VALUE_TYPE_UINT64_INTEL"
    PERFORMANCE_VALUE_TYPE_FLOAT_INTEL -> showString "PERFORMANCE_VALUE_TYPE_FLOAT_INTEL"
    PERFORMANCE_VALUE_TYPE_BOOL_INTEL -> showString "PERFORMANCE_VALUE_TYPE_BOOL_INTEL"
    PERFORMANCE_VALUE_TYPE_STRING_INTEL -> showString "PERFORMANCE_VALUE_TYPE_STRING_INTEL"
    PerformanceValueTypeINTEL x -> showParen (p >= 11) (showString "PerformanceValueTypeINTEL " . showsPrec 11 x)

instance Read PerformanceValueTypeINTEL where
  readPrec = parens (choose [("PERFORMANCE_VALUE_TYPE_UINT32_INTEL", pure PERFORMANCE_VALUE_TYPE_UINT32_INTEL)
                            , ("PERFORMANCE_VALUE_TYPE_UINT64_INTEL", pure PERFORMANCE_VALUE_TYPE_UINT64_INTEL)
                            , ("PERFORMANCE_VALUE_TYPE_FLOAT_INTEL", pure PERFORMANCE_VALUE_TYPE_FLOAT_INTEL)
                            , ("PERFORMANCE_VALUE_TYPE_BOOL_INTEL", pure PERFORMANCE_VALUE_TYPE_BOOL_INTEL)
                            , ("PERFORMANCE_VALUE_TYPE_STRING_INTEL", pure PERFORMANCE_VALUE_TYPE_STRING_INTEL)]
                     +++
                     prec 10 (do
                       expectP (Ident "PerformanceValueTypeINTEL")
                       v <- step readPrec
                       pure (PerformanceValueTypeINTEL v)))


-- No documentation found for TopLevel "VkQueryPoolCreateInfoINTEL"
type QueryPoolCreateInfoINTEL = QueryPoolPerformanceQueryCreateInfoINTEL


type INTEL_PERFORMANCE_QUERY_SPEC_VERSION = 2

-- No documentation found for TopLevel "VK_INTEL_PERFORMANCE_QUERY_SPEC_VERSION"
pattern INTEL_PERFORMANCE_QUERY_SPEC_VERSION :: forall a . Integral a => a
pattern INTEL_PERFORMANCE_QUERY_SPEC_VERSION = 2


type INTEL_PERFORMANCE_QUERY_EXTENSION_NAME = "VK_INTEL_performance_query"

-- No documentation found for TopLevel "VK_INTEL_PERFORMANCE_QUERY_EXTENSION_NAME"
pattern INTEL_PERFORMANCE_QUERY_EXTENSION_NAME :: forall a . (Eq a, IsString a) => a
pattern INTEL_PERFORMANCE_QUERY_EXTENSION_NAME = "VK_INTEL_performance_query"

