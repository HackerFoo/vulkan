{-# language CPP #-}
module Graphics.Vulkan.Core11.Promoted_From_VK_KHR_get_physical_device_properties2  ( getPhysicalDeviceFeatures2
                                                                                    , getPhysicalDeviceProperties2
                                                                                    , getPhysicalDeviceFormatProperties2
                                                                                    , getPhysicalDeviceImageFormatProperties2
                                                                                    , getPhysicalDeviceQueueFamilyProperties2
                                                                                    , getPhysicalDeviceMemoryProperties2
                                                                                    , getPhysicalDeviceSparseImageFormatProperties2
                                                                                    , PhysicalDeviceFeatures2(..)
                                                                                    , PhysicalDeviceProperties2(..)
                                                                                    , FormatProperties2(..)
                                                                                    , ImageFormatProperties2(..)
                                                                                    , PhysicalDeviceImageFormatInfo2(..)
                                                                                    , QueueFamilyProperties2(..)
                                                                                    , PhysicalDeviceMemoryProperties2(..)
                                                                                    , SparseImageFormatProperties2(..)
                                                                                    , PhysicalDeviceSparseImageFormatInfo2(..)
                                                                                    , StructureType(..)
                                                                                    ) where

import Control.Exception.Base (bracket)
import Control.Monad.IO.Class (liftIO)
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
import Data.Vector (generateM)
import Control.Monad.IO.Class (MonadIO)
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
import Graphics.Vulkan.CStruct.Utils (advancePtrBytes)
import Graphics.Vulkan.NamedType ((:::))
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer (AndroidHardwareBufferUsageANDROID)
import Graphics.Vulkan.CStruct.Extends (Chain)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_image_drm_format_modifier (DrmFormatModifierPropertiesListEXT)
import Graphics.Vulkan.CStruct.Extends (Extends)
import Graphics.Vulkan.CStruct.Extends (Extensible(..))
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities (ExternalImageFormatProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_filter_cubic (FilterCubicImageViewImageFormatPropertiesEXT)
import Graphics.Vulkan.Core10.Enums.Format (Format)
import Graphics.Vulkan.Core10.Enums.Format (Format(..))
import Graphics.Vulkan.Core10.DeviceInitialization (FormatProperties)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (FromCStruct(..))
import Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits (ImageCreateFlags)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_image_format_list (ImageFormatListCreateInfo)
import Graphics.Vulkan.Core10.DeviceInitialization (ImageFormatProperties)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_EXT_separate_stencil_usage (ImageStencilUsageCreateInfo)
import Graphics.Vulkan.Core10.Enums.ImageTiling (ImageTiling)
import Graphics.Vulkan.Core10.Enums.ImageType (ImageType)
import Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits (ImageUsageFlags)
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceFeatures2))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceFormatProperties2))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceImageFormatProperties2))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceMemoryProperties2))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceProperties2))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceQueueFamilyProperties2))
import Graphics.Vulkan.Dynamic (InstanceCmds(pVkGetPhysicalDeviceSparseImageFormatProperties2))
import Graphics.Vulkan.CStruct.Extends (PeekChain)
import Graphics.Vulkan.CStruct.Extends (PeekChain(..))
import Graphics.Vulkan.Core10.Handles (PhysicalDevice)
import Graphics.Vulkan.Core10.Handles (PhysicalDevice(..))
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_16bit_storage (PhysicalDevice16BitStorageFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_8bit_storage (PhysicalDevice8BitStorageFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_astc_decode_mode (PhysicalDeviceASTCDecodeFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_blend_operation_advanced (PhysicalDeviceBlendOperationAdvancedFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_blend_operation_advanced (PhysicalDeviceBlendOperationAdvancedPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_buffer_device_address (PhysicalDeviceBufferDeviceAddressFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_buffer_device_address (PhysicalDeviceBufferDeviceAddressFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_AMD_device_coherent_memory (PhysicalDeviceCoherentMemoryFeaturesAMD)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_compute_shader_derivatives (PhysicalDeviceComputeShaderDerivativesFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_conditional_rendering (PhysicalDeviceConditionalRenderingFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_conservative_rasterization (PhysicalDeviceConservativeRasterizationPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_cooperative_matrix (PhysicalDeviceCooperativeMatrixFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_cooperative_matrix (PhysicalDeviceCooperativeMatrixPropertiesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_corner_sampled_image (PhysicalDeviceCornerSampledImageFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_coverage_reduction_mode (PhysicalDeviceCoverageReductionModeFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_dedicated_allocation_image_aliasing (PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_depth_clip_enable (PhysicalDeviceDepthClipEnableFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_depth_stencil_resolve (PhysicalDeviceDepthStencilResolveProperties)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_EXT_descriptor_indexing (PhysicalDeviceDescriptorIndexingFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_EXT_descriptor_indexing (PhysicalDeviceDescriptorIndexingProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_device_generated_commands (PhysicalDeviceDeviceGeneratedCommandsFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_device_generated_commands (PhysicalDeviceDeviceGeneratedCommandsPropertiesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_device_diagnostics_config (PhysicalDeviceDiagnosticsConfigFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_discard_rectangles (PhysicalDeviceDiscardRectanglePropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_driver_properties (PhysicalDeviceDriverProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_scissor_exclusive (PhysicalDeviceExclusiveScissorFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities (PhysicalDeviceExternalImageFormatInfo)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_external_memory_host (PhysicalDeviceExternalMemoryHostPropertiesEXT)
import Graphics.Vulkan.Core10.DeviceInitialization (PhysicalDeviceFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_shader_float_controls (PhysicalDeviceFloatControlsProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_fragment_density_map (PhysicalDeviceFragmentDensityMapFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_fragment_density_map (PhysicalDeviceFragmentDensityMapPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_fragment_shader_barycentric (PhysicalDeviceFragmentShaderBarycentricFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_fragment_shader_interlock (PhysicalDeviceFragmentShaderInterlockFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_EXT_host_query_reset (PhysicalDeviceHostQueryResetFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities (PhysicalDeviceIDProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_image_drm_format_modifier (PhysicalDeviceImageDrmFormatModifierInfoEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_filter_cubic (PhysicalDeviceImageViewImageFormatInfoEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_imageless_framebuffer (PhysicalDeviceImagelessFramebufferFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_index_type_uint8 (PhysicalDeviceIndexTypeUint8FeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_inline_uniform_block (PhysicalDeviceInlineUniformBlockFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_inline_uniform_block (PhysicalDeviceInlineUniformBlockPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_line_rasterization (PhysicalDeviceLineRasterizationFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_line_rasterization (PhysicalDeviceLineRasterizationPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_maintenance3 (PhysicalDeviceMaintenance3Properties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_memory_budget (PhysicalDeviceMemoryBudgetPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_memory_priority (PhysicalDeviceMemoryPriorityFeaturesEXT)
import Graphics.Vulkan.Core10.DeviceInitialization (PhysicalDeviceMemoryProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_mesh_shader (PhysicalDeviceMeshShaderFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_mesh_shader (PhysicalDeviceMeshShaderPropertiesNV)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_multiview (PhysicalDeviceMultiviewFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NVX_multiview_per_view_attributes (PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_multiview (PhysicalDeviceMultiviewProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_pci_bus_info (PhysicalDevicePCIBusInfoPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_performance_query (PhysicalDevicePerformanceQueryFeaturesKHR)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_performance_query (PhysicalDevicePerformanceQueryPropertiesKHR)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_pipeline_creation_cache_control (PhysicalDevicePipelineCreationCacheControlFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_pipeline_executable_properties (PhysicalDevicePipelineExecutablePropertiesFeaturesKHR)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_maintenance2 (PhysicalDevicePointClippingProperties)
import Graphics.Vulkan.Core10.DeviceInitialization (PhysicalDeviceProperties)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Originally_Based_On_VK_KHR_protected_memory (PhysicalDeviceProtectedMemoryFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Originally_Based_On_VK_KHR_protected_memory (PhysicalDeviceProtectedMemoryProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_push_descriptor (PhysicalDevicePushDescriptorPropertiesKHR)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_ray_tracing (PhysicalDeviceRayTracingFeaturesKHR)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_ray_tracing (PhysicalDeviceRayTracingPropertiesKHR)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_ray_tracing (PhysicalDeviceRayTracingPropertiesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_representative_fragment_test (PhysicalDeviceRepresentativeFragmentTestFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_sample_locations (PhysicalDeviceSampleLocationsPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_EXT_sampler_filter_minmax (PhysicalDeviceSamplerFilterMinmaxProperties)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion (PhysicalDeviceSamplerYcbcrConversionFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_EXT_scalar_block_layout (PhysicalDeviceScalarBlockLayoutFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_separate_depth_stencil_layouts (PhysicalDeviceSeparateDepthStencilLayoutsFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_shader_atomic_int64 (PhysicalDeviceShaderAtomicInt64Features)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_KHR_shader_clock (PhysicalDeviceShaderClockFeaturesKHR)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_AMD_shader_core_properties2 (PhysicalDeviceShaderCoreProperties2AMD)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_AMD_shader_core_properties (PhysicalDeviceShaderCorePropertiesAMD)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_shader_demote_to_helper_invocation (PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_shader_draw_parameters (PhysicalDeviceShaderDrawParametersFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_shader_float16_int8 (PhysicalDeviceShaderFloat16Int8Features)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_shader_image_footprint (PhysicalDeviceShaderImageFootprintFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_INTEL_shader_integer_functions2 (PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_shader_sm_builtins (PhysicalDeviceShaderSMBuiltinsFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_shader_sm_builtins (PhysicalDeviceShaderSMBuiltinsPropertiesNV)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_shader_subgroup_extended_types (PhysicalDeviceShaderSubgroupExtendedTypesFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_shading_rate_image (PhysicalDeviceShadingRateImageFeaturesNV)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_shading_rate_image (PhysicalDeviceShadingRateImagePropertiesNV)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Originally_Based_On_VK_KHR_subgroup (PhysicalDeviceSubgroupProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_subgroup_size_control (PhysicalDeviceSubgroupSizeControlFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_subgroup_size_control (PhysicalDeviceSubgroupSizeControlPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_texel_buffer_alignment (PhysicalDeviceTexelBufferAlignmentFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_texel_buffer_alignment (PhysicalDeviceTexelBufferAlignmentPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_texture_compression_astc_hdr (PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_timeline_semaphore (PhysicalDeviceTimelineSemaphoreFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_timeline_semaphore (PhysicalDeviceTimelineSemaphoreProperties)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_transform_feedback (PhysicalDeviceTransformFeedbackFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_transform_feedback (PhysicalDeviceTransformFeedbackPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_uniform_buffer_standard_layout (PhysicalDeviceUniformBufferStandardLayoutFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_variable_pointers (PhysicalDeviceVariablePointersFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_vertex_attribute_divisor (PhysicalDeviceVertexAttributeDivisorFeaturesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_vertex_attribute_divisor (PhysicalDeviceVertexAttributeDivisorPropertiesEXT)
import {-# SOURCE #-} Graphics.Vulkan.Core12 (PhysicalDeviceVulkan11Features)
import {-# SOURCE #-} Graphics.Vulkan.Core12 (PhysicalDeviceVulkan11Properties)
import {-# SOURCE #-} Graphics.Vulkan.Core12 (PhysicalDeviceVulkan12Features)
import {-# SOURCE #-} Graphics.Vulkan.Core12 (PhysicalDeviceVulkan12Properties)
import {-# SOURCE #-} Graphics.Vulkan.Core12.Promoted_From_VK_KHR_vulkan_memory_model (PhysicalDeviceVulkanMemoryModelFeatures)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_EXT_ycbcr_image_arrays (PhysicalDeviceYcbcrImageArraysFeaturesEXT)
import Graphics.Vulkan.Core10.Handles (PhysicalDevice_T)
import Graphics.Vulkan.CStruct.Extends (PokeChain)
import Graphics.Vulkan.CStruct.Extends (PokeChain(..))
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_NV_device_diagnostic_checkpoints (QueueFamilyCheckpointPropertiesNV)
import Graphics.Vulkan.Core10.DeviceInitialization (QueueFamilyProperties)
import Graphics.Vulkan.Core10.Enums.Result (Result)
import Graphics.Vulkan.Core10.Enums.Result (Result(..))
import Graphics.Vulkan.Core10.Enums.SampleCountFlagBits (SampleCountFlagBits)
import {-# SOURCE #-} Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion (SamplerYcbcrConversionImageFormatProperties)
import Graphics.Vulkan.Core10.SparseResourceMemoryManagement (SparseImageFormatProperties)
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType)
import {-# SOURCE #-} Graphics.Vulkan.Extensions.VK_AMD_texture_gather_bias_lod (TextureLODGatherFormatPropertiesAMD)
import Graphics.Vulkan.CStruct (ToCStruct)
import Graphics.Vulkan.CStruct (ToCStruct(..))
import Graphics.Vulkan.Exception (VulkanException(..))
import Graphics.Vulkan.Zero (Zero(..))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_FORMAT_PROPERTIES_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2))
import Graphics.Vulkan.Core10.Enums.Result (Result(SUCCESS))
import Graphics.Vulkan.Core10.Enums.StructureType (StructureType(..))
foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceFeatures2
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr (PhysicalDeviceFeatures2 a) -> IO ()) -> Ptr PhysicalDevice_T -> Ptr (PhysicalDeviceFeatures2 a) -> IO ()

-- | vkGetPhysicalDeviceFeatures2 - Reports capabilities of a physical device
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device from which to query the
--     supported features.
--
-- -   @pFeatures@ is a pointer to a 'PhysicalDeviceFeatures2' structure in
--     which the physical device features are returned.
--
-- = Description
--
-- Each structure in @pFeatures@ and its @pNext@ chain contains members
-- corresponding to fine-grained features. 'getPhysicalDeviceFeatures2'
-- writes each member to a boolean value indicating whether that feature is
-- supported.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice',
-- 'PhysicalDeviceFeatures2'
getPhysicalDeviceFeatures2 :: forall a io . (PokeChain a, PeekChain a, MonadIO io) => PhysicalDevice -> io (PhysicalDeviceFeatures2 a)
getPhysicalDeviceFeatures2 physicalDevice = liftIO . evalContT $ do
  let vkGetPhysicalDeviceFeatures2' = mkVkGetPhysicalDeviceFeatures2 (pVkGetPhysicalDeviceFeatures2 (instanceCmds (physicalDevice :: PhysicalDevice)))
  pPFeatures <- ContT (withZeroCStruct @(PhysicalDeviceFeatures2 _))
  lift $ vkGetPhysicalDeviceFeatures2' (physicalDeviceHandle (physicalDevice)) (pPFeatures)
  pFeatures <- lift $ peekCStruct @(PhysicalDeviceFeatures2 _) pPFeatures
  pure $ (pFeatures)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceProperties2
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr (PhysicalDeviceProperties2 a) -> IO ()) -> Ptr PhysicalDevice_T -> Ptr (PhysicalDeviceProperties2 a) -> IO ()

-- | vkGetPhysicalDeviceProperties2 - Returns properties of a physical device
--
-- = Parameters
--
-- -   @physicalDevice@ is the handle to the physical device whose
--     properties will be queried.
--
-- -   @pProperties@ is a pointer to a 'PhysicalDeviceProperties2'
--     structure in which properties are returned.
--
-- = Description
--
-- Each structure in @pProperties@ and its @pNext@ chain contain members
-- corresponding to properties or implementation-dependent limits.
-- 'getPhysicalDeviceProperties2' writes each member to a value indicating
-- the value of that property or limit.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice',
-- 'PhysicalDeviceProperties2'
getPhysicalDeviceProperties2 :: forall a io . (PokeChain a, PeekChain a, MonadIO io) => PhysicalDevice -> io (PhysicalDeviceProperties2 a)
getPhysicalDeviceProperties2 physicalDevice = liftIO . evalContT $ do
  let vkGetPhysicalDeviceProperties2' = mkVkGetPhysicalDeviceProperties2 (pVkGetPhysicalDeviceProperties2 (instanceCmds (physicalDevice :: PhysicalDevice)))
  pPProperties <- ContT (withZeroCStruct @(PhysicalDeviceProperties2 _))
  lift $ vkGetPhysicalDeviceProperties2' (physicalDeviceHandle (physicalDevice)) (pPProperties)
  pProperties <- lift $ peekCStruct @(PhysicalDeviceProperties2 _) pPProperties
  pure $ (pProperties)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceFormatProperties2
  :: FunPtr (Ptr PhysicalDevice_T -> Format -> Ptr (FormatProperties2 a) -> IO ()) -> Ptr PhysicalDevice_T -> Format -> Ptr (FormatProperties2 a) -> IO ()

-- | vkGetPhysicalDeviceFormatProperties2 - Lists physical device’s format
-- capabilities
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device from which to query the
--     format properties.
--
-- -   @format@ is the format whose properties are queried.
--
-- -   @pFormatProperties@ is a pointer to a 'FormatProperties2' structure
--     in which physical device properties for @format@ are returned.
--
-- = Description
--
-- 'getPhysicalDeviceFormatProperties2' behaves similarly to
-- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceFormatProperties',
-- with the ability to return extended information in a @pNext@ chain of
-- output structures.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.Format.Format', 'FormatProperties2',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice'
getPhysicalDeviceFormatProperties2 :: forall a io . (PokeChain a, PeekChain a, MonadIO io) => PhysicalDevice -> Format -> io (FormatProperties2 a)
getPhysicalDeviceFormatProperties2 physicalDevice format = liftIO . evalContT $ do
  let vkGetPhysicalDeviceFormatProperties2' = mkVkGetPhysicalDeviceFormatProperties2 (pVkGetPhysicalDeviceFormatProperties2 (instanceCmds (physicalDevice :: PhysicalDevice)))
  pPFormatProperties <- ContT (withZeroCStruct @(FormatProperties2 _))
  lift $ vkGetPhysicalDeviceFormatProperties2' (physicalDeviceHandle (physicalDevice)) (format) (pPFormatProperties)
  pFormatProperties <- lift $ peekCStruct @(FormatProperties2 _) pPFormatProperties
  pure $ (pFormatProperties)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceImageFormatProperties2
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr (PhysicalDeviceImageFormatInfo2 a) -> Ptr (ImageFormatProperties2 b) -> IO Result) -> Ptr PhysicalDevice_T -> Ptr (PhysicalDeviceImageFormatInfo2 a) -> Ptr (ImageFormatProperties2 b) -> IO Result

-- | vkGetPhysicalDeviceImageFormatProperties2 - Lists physical device’s
-- image format capabilities
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device from which to query the
--     image capabilities.
--
-- -   @pImageFormatInfo@ is a pointer to a
--     'PhysicalDeviceImageFormatInfo2' structure describing the parameters
--     that would be consumed by
--     'Graphics.Vulkan.Core10.Image.createImage'.
--
-- -   @pImageFormatProperties@ is a pointer to a 'ImageFormatProperties2'
--     structure in which capabilities are returned.
--
-- = Description
--
-- 'getPhysicalDeviceImageFormatProperties2' behaves similarly to
-- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceImageFormatProperties',
-- with the ability to return extended information in a @pNext@ chain of
-- output structures.
--
-- == Valid Usage
--
-- -   If the @pNext@ chain of @pImageFormatProperties@ includes a
--     'Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.AndroidHardwareBufferUsageANDROID'
--     structure, the @pNext@ chain of @pImageFormatInfo@ /must/ include a
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.PhysicalDeviceExternalImageFormatInfo'
--     structure with @handleType@ set to
--     'Graphics.Vulkan.Core11.Enums.ExternalMemoryHandleTypeFlagBits.EXTERNAL_MEMORY_HANDLE_TYPE_ANDROID_HARDWARE_BUFFER_BIT_ANDROID'.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @pImageFormatInfo@ /must/ be a valid pointer to a valid
--     'PhysicalDeviceImageFormatInfo2' structure
--
-- -   @pImageFormatProperties@ /must/ be a valid pointer to a
--     'ImageFormatProperties2' structure
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
--     -   'Graphics.Vulkan.Core10.Enums.Result.ERROR_FORMAT_NOT_SUPPORTED'
--
-- = See Also
--
-- 'ImageFormatProperties2',
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice',
-- 'PhysicalDeviceImageFormatInfo2'
getPhysicalDeviceImageFormatProperties2 :: forall a b io . (PokeChain a, PokeChain b, PeekChain b, MonadIO io) => PhysicalDevice -> PhysicalDeviceImageFormatInfo2 a -> io (ImageFormatProperties2 b)
getPhysicalDeviceImageFormatProperties2 physicalDevice imageFormatInfo = liftIO . evalContT $ do
  let vkGetPhysicalDeviceImageFormatProperties2' = mkVkGetPhysicalDeviceImageFormatProperties2 (pVkGetPhysicalDeviceImageFormatProperties2 (instanceCmds (physicalDevice :: PhysicalDevice)))
  pImageFormatInfo <- ContT $ withCStruct (imageFormatInfo)
  pPImageFormatProperties <- ContT (withZeroCStruct @(ImageFormatProperties2 _))
  r <- lift $ vkGetPhysicalDeviceImageFormatProperties2' (physicalDeviceHandle (physicalDevice)) pImageFormatInfo (pPImageFormatProperties)
  lift $ when (r < SUCCESS) (throwIO (VulkanException r))
  pImageFormatProperties <- lift $ peekCStruct @(ImageFormatProperties2 _) pPImageFormatProperties
  pure $ (pImageFormatProperties)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceQueueFamilyProperties2
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr (QueueFamilyProperties2 a) -> IO ()) -> Ptr PhysicalDevice_T -> Ptr Word32 -> Ptr (QueueFamilyProperties2 a) -> IO ()

-- | vkGetPhysicalDeviceQueueFamilyProperties2 - Reports properties of the
-- queues of the specified physical device
--
-- = Parameters
--
-- -   @physicalDevice@ is the handle to the physical device whose
--     properties will be queried.
--
-- -   @pQueueFamilyPropertyCount@ is a pointer to an integer related to
--     the number of queue families available or queried, as described in
--     'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceQueueFamilyProperties'.
--
-- -   @pQueueFamilyProperties@ is either @NULL@ or a pointer to an array
--     of 'QueueFamilyProperties2' structures.
--
-- = Description
--
-- 'getPhysicalDeviceQueueFamilyProperties2' behaves similarly to
-- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceQueueFamilyProperties',
-- with the ability to return extended information in a @pNext@ chain of
-- output structures.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @pQueueFamilyPropertyCount@ /must/ be a valid pointer to a
--     @uint32_t@ value
--
-- -   If the value referenced by @pQueueFamilyPropertyCount@ is not @0@,
--     and @pQueueFamilyProperties@ is not @NULL@, @pQueueFamilyProperties@
--     /must/ be a valid pointer to an array of @pQueueFamilyPropertyCount@
--     'QueueFamilyProperties2' structures
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice',
-- 'QueueFamilyProperties2'
getPhysicalDeviceQueueFamilyProperties2 :: forall a io . (PokeChain a, PeekChain a, MonadIO io) => PhysicalDevice -> io (("queueFamilyProperties" ::: Vector (QueueFamilyProperties2 a)))
getPhysicalDeviceQueueFamilyProperties2 physicalDevice = liftIO . evalContT $ do
  let vkGetPhysicalDeviceQueueFamilyProperties2' = mkVkGetPhysicalDeviceQueueFamilyProperties2 (pVkGetPhysicalDeviceQueueFamilyProperties2 (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pPQueueFamilyPropertyCount <- ContT $ bracket (callocBytes @Word32 4) free
  lift $ vkGetPhysicalDeviceQueueFamilyProperties2' physicalDevice' (pPQueueFamilyPropertyCount) (nullPtr)
  pQueueFamilyPropertyCount <- lift $ peek @Word32 pPQueueFamilyPropertyCount
  pPQueueFamilyProperties <- ContT $ bracket (callocBytes @(QueueFamilyProperties2 _) ((fromIntegral (pQueueFamilyPropertyCount)) * 40)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPQueueFamilyProperties `advancePtrBytes` (i * 40) :: Ptr (QueueFamilyProperties2 _)) . ($ ())) [0..(fromIntegral (pQueueFamilyPropertyCount)) - 1]
  lift $ vkGetPhysicalDeviceQueueFamilyProperties2' physicalDevice' (pPQueueFamilyPropertyCount) ((pPQueueFamilyProperties))
  pQueueFamilyPropertyCount' <- lift $ peek @Word32 pPQueueFamilyPropertyCount
  pQueueFamilyProperties' <- lift $ generateM (fromIntegral (pQueueFamilyPropertyCount')) (\i -> peekCStruct @(QueueFamilyProperties2 _) (((pPQueueFamilyProperties) `advancePtrBytes` (40 * (i)) :: Ptr (QueueFamilyProperties2 _))))
  pure $ (pQueueFamilyProperties')


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceMemoryProperties2
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr (PhysicalDeviceMemoryProperties2 a) -> IO ()) -> Ptr PhysicalDevice_T -> Ptr (PhysicalDeviceMemoryProperties2 a) -> IO ()

-- | vkGetPhysicalDeviceMemoryProperties2 - Reports memory information for
-- the specified physical device
--
-- = Parameters
--
-- -   @physicalDevice@ is the handle to the device to query.
--
-- -   @pMemoryProperties@ is a pointer to a
--     'PhysicalDeviceMemoryProperties2' structure in which the properties
--     are returned.
--
-- = Description
--
-- 'getPhysicalDeviceMemoryProperties2' behaves similarly to
-- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceMemoryProperties',
-- with the ability to return extended information in a @pNext@ chain of
-- output structures.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice',
-- 'PhysicalDeviceMemoryProperties2'
getPhysicalDeviceMemoryProperties2 :: forall a io . (PokeChain a, PeekChain a, MonadIO io) => PhysicalDevice -> io (PhysicalDeviceMemoryProperties2 a)
getPhysicalDeviceMemoryProperties2 physicalDevice = liftIO . evalContT $ do
  let vkGetPhysicalDeviceMemoryProperties2' = mkVkGetPhysicalDeviceMemoryProperties2 (pVkGetPhysicalDeviceMemoryProperties2 (instanceCmds (physicalDevice :: PhysicalDevice)))
  pPMemoryProperties <- ContT (withZeroCStruct @(PhysicalDeviceMemoryProperties2 _))
  lift $ vkGetPhysicalDeviceMemoryProperties2' (physicalDeviceHandle (physicalDevice)) (pPMemoryProperties)
  pMemoryProperties <- lift $ peekCStruct @(PhysicalDeviceMemoryProperties2 _) pPMemoryProperties
  pure $ (pMemoryProperties)


foreign import ccall
#if !defined(SAFE_FOREIGN_CALLS)
  unsafe
#endif
  "dynamic" mkVkGetPhysicalDeviceSparseImageFormatProperties2
  :: FunPtr (Ptr PhysicalDevice_T -> Ptr PhysicalDeviceSparseImageFormatInfo2 -> Ptr Word32 -> Ptr SparseImageFormatProperties2 -> IO ()) -> Ptr PhysicalDevice_T -> Ptr PhysicalDeviceSparseImageFormatInfo2 -> Ptr Word32 -> Ptr SparseImageFormatProperties2 -> IO ()

-- | vkGetPhysicalDeviceSparseImageFormatProperties2 - Retrieve properties of
-- an image format applied to sparse images
--
-- = Parameters
--
-- -   @physicalDevice@ is the physical device from which to query the
--     sparse image capabilities.
--
-- -   @pFormatInfo@ is a pointer to a
--     'PhysicalDeviceSparseImageFormatInfo2' structure containing input
--     parameters to the command.
--
-- -   @pPropertyCount@ is a pointer to an integer related to the number of
--     sparse format properties available or queried, as described below.
--
-- -   @pProperties@ is either @NULL@ or a pointer to an array of
--     'SparseImageFormatProperties2' structures.
--
-- = Description
--
-- 'getPhysicalDeviceSparseImageFormatProperties2' behaves identically to
-- 'Graphics.Vulkan.Core10.SparseResourceMemoryManagement.getPhysicalDeviceSparseImageFormatProperties',
-- with the ability to return extended information by adding extension
-- structures to the @pNext@ chain of its @pProperties@ parameter.
--
-- == Valid Usage (Implicit)
--
-- -   @physicalDevice@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Handles.PhysicalDevice' handle
--
-- -   @pFormatInfo@ /must/ be a valid pointer to a valid
--     'PhysicalDeviceSparseImageFormatInfo2' structure
--
-- -   @pPropertyCount@ /must/ be a valid pointer to a @uint32_t@ value
--
-- -   If the value referenced by @pPropertyCount@ is not @0@, and
--     @pProperties@ is not @NULL@, @pProperties@ /must/ be a valid pointer
--     to an array of @pPropertyCount@ 'SparseImageFormatProperties2'
--     structures
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Handles.PhysicalDevice',
-- 'PhysicalDeviceSparseImageFormatInfo2', 'SparseImageFormatProperties2'
getPhysicalDeviceSparseImageFormatProperties2 :: forall io . MonadIO io => PhysicalDevice -> PhysicalDeviceSparseImageFormatInfo2 -> io (("properties" ::: Vector SparseImageFormatProperties2))
getPhysicalDeviceSparseImageFormatProperties2 physicalDevice formatInfo = liftIO . evalContT $ do
  let vkGetPhysicalDeviceSparseImageFormatProperties2' = mkVkGetPhysicalDeviceSparseImageFormatProperties2 (pVkGetPhysicalDeviceSparseImageFormatProperties2 (instanceCmds (physicalDevice :: PhysicalDevice)))
  let physicalDevice' = physicalDeviceHandle (physicalDevice)
  pFormatInfo <- ContT $ withCStruct (formatInfo)
  pPPropertyCount <- ContT $ bracket (callocBytes @Word32 4) free
  lift $ vkGetPhysicalDeviceSparseImageFormatProperties2' physicalDevice' pFormatInfo (pPPropertyCount) (nullPtr)
  pPropertyCount <- lift $ peek @Word32 pPPropertyCount
  pPProperties <- ContT $ bracket (callocBytes @SparseImageFormatProperties2 ((fromIntegral (pPropertyCount)) * 40)) free
  _ <- traverse (\i -> ContT $ pokeZeroCStruct (pPProperties `advancePtrBytes` (i * 40) :: Ptr SparseImageFormatProperties2) . ($ ())) [0..(fromIntegral (pPropertyCount)) - 1]
  lift $ vkGetPhysicalDeviceSparseImageFormatProperties2' physicalDevice' pFormatInfo (pPPropertyCount) ((pPProperties))
  pPropertyCount' <- lift $ peek @Word32 pPPropertyCount
  pProperties' <- lift $ generateM (fromIntegral (pPropertyCount')) (\i -> peekCStruct @SparseImageFormatProperties2 (((pPProperties) `advancePtrBytes` (40 * (i)) :: Ptr SparseImageFormatProperties2)))
  pure $ (pProperties')


-- | VkPhysicalDeviceFeatures2 - Structure describing the fine-grained
-- features that can be supported by an implementation
--
-- = Members
--
-- The 'PhysicalDeviceFeatures2' structure is defined as:
--
-- = Description
--
-- The @pNext@ chain of this structure is used to extend the structure with
-- features defined by extensions. This structure /can/ be used in
-- 'getPhysicalDeviceFeatures2' or /can/ be included in the @pNext@ chain
-- of a 'Graphics.Vulkan.Core10.Device.DeviceCreateInfo' structure, in
-- which case it controls which features are enabled in the device in lieu
-- of @pEnabledFeatures@.
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceFeatures',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceFeatures2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_physical_device_properties2.getPhysicalDeviceFeatures2KHR'
data PhysicalDeviceFeatures2 (es :: [Type]) = PhysicalDeviceFeatures2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @features@ is a
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceFeatures'
    -- structure describing the fine-grained features of the Vulkan 1.0 API.
    features :: PhysicalDeviceFeatures
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (PhysicalDeviceFeatures2 es)

instance Extensible PhysicalDeviceFeatures2 where
  extensibleType = STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2
  setNext x next = x{next = next}
  getNext PhysicalDeviceFeatures2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends PhysicalDeviceFeatures2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @PhysicalDeviceDiagnosticsConfigFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceCoherentMemoryFeaturesAMD = Just f
    | Just Refl <- eqT @e @PhysicalDeviceVulkan12Features = Just f
    | Just Refl <- eqT @e @PhysicalDeviceVulkan11Features = Just f
    | Just Refl <- eqT @e @PhysicalDevicePipelineCreationCacheControlFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceLineRasterizationFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceSubgroupSizeControlFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceTexelBufferAlignmentFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderDemoteToHelperInvocationFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDevicePipelineExecutablePropertiesFeaturesKHR = Just f
    | Just Refl <- eqT @e @PhysicalDeviceSeparateDepthStencilLayoutsFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceFragmentShaderInterlockFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderSMBuiltinsFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceIndexTypeUint8FeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderClockFeaturesKHR = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderIntegerFunctions2FeaturesINTEL = Just f
    | Just Refl <- eqT @e @PhysicalDeviceCoverageReductionModeFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDevicePerformanceQueryFeaturesKHR = Just f
    | Just Refl <- eqT @e @PhysicalDeviceYcbcrImageArraysFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceCooperativeMatrixFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceTextureCompressionASTCHDRFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceImagelessFramebufferFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceBufferDeviceAddressFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceBufferDeviceAddressFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceMemoryPriorityFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceDepthClipEnableFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceUniformBufferStandardLayoutFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceScalarBlockLayoutFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceFragmentDensityMapFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceRayTracingFeaturesKHR = Just f
    | Just Refl <- eqT @e @PhysicalDeviceMeshShaderFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShadingRateImageFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceDedicatedAllocationImageAliasingFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderImageFootprintFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceFragmentShaderBarycentricFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceComputeShaderDerivativesFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceCornerSampledImageFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceExclusiveScissorFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceRepresentativeFragmentTestFeaturesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceTransformFeedbackFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceASTCDecodeFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceVertexAttributeDivisorFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderAtomicInt64Features = Just f
    | Just Refl <- eqT @e @PhysicalDeviceVulkanMemoryModelFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceConditionalRenderingFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDevice8BitStorageFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceTimelineSemaphoreFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceDescriptorIndexingFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceHostQueryResetFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderFloat16Int8Features = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderDrawParametersFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceInlineUniformBlockFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceBlendOperationAdvancedFeaturesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceProtectedMemoryFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceSamplerYcbcrConversionFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderSubgroupExtendedTypesFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDevice16BitStorageFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceMultiviewFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceVariablePointersFeatures = Just f
    | Just Refl <- eqT @e @PhysicalDeviceDeviceGeneratedCommandsFeaturesNV = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (PhysicalDeviceFeatures2 es) where
  withCStruct x f = allocaBytesAligned 240 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceFeatures2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr PhysicalDeviceFeatures)) (features) . ($ ())
    lift $ f
  cStructSize = 240
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_FEATURES_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr PhysicalDeviceFeatures)) (zero) . ($ ())
    lift $ f

instance PeekChain es => FromCStruct (PhysicalDeviceFeatures2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    features <- peekCStruct @PhysicalDeviceFeatures ((p `plusPtr` 16 :: Ptr PhysicalDeviceFeatures))
    pure $ PhysicalDeviceFeatures2
             next features

instance es ~ '[] => Zero (PhysicalDeviceFeatures2 es) where
  zero = PhysicalDeviceFeatures2
           ()
           zero


-- | VkPhysicalDeviceProperties2 - Structure specifying physical device
-- properties
--
-- = Description
--
-- The @pNext@ chain of this structure is used to extend the structure with
-- properties defined by extensions.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of
--     'Graphics.Vulkan.Extensions.VK_EXT_blend_operation_advanced.PhysicalDeviceBlendOperationAdvancedPropertiesEXT',
--     'Graphics.Vulkan.Extensions.VK_EXT_conservative_rasterization.PhysicalDeviceConservativeRasterizationPropertiesEXT',
--     'Graphics.Vulkan.Extensions.VK_NV_cooperative_matrix.PhysicalDeviceCooperativeMatrixPropertiesNV',
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_depth_stencil_resolve.PhysicalDeviceDepthStencilResolveProperties',
--     'Graphics.Vulkan.Core12.Promoted_From_VK_EXT_descriptor_indexing.PhysicalDeviceDescriptorIndexingProperties',
--     'Graphics.Vulkan.Extensions.VK_NV_device_generated_commands.PhysicalDeviceDeviceGeneratedCommandsPropertiesNV',
--     'Graphics.Vulkan.Extensions.VK_EXT_discard_rectangles.PhysicalDeviceDiscardRectanglePropertiesEXT',
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_driver_properties.PhysicalDeviceDriverProperties',
--     'Graphics.Vulkan.Extensions.VK_EXT_external_memory_host.PhysicalDeviceExternalMemoryHostPropertiesEXT',
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_shader_float_controls.PhysicalDeviceFloatControlsProperties',
--     'Graphics.Vulkan.Extensions.VK_EXT_fragment_density_map.PhysicalDeviceFragmentDensityMapPropertiesEXT',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.PhysicalDeviceIDProperties',
--     'Graphics.Vulkan.Extensions.VK_EXT_inline_uniform_block.PhysicalDeviceInlineUniformBlockPropertiesEXT',
--     'Graphics.Vulkan.Extensions.VK_EXT_line_rasterization.PhysicalDeviceLineRasterizationPropertiesEXT',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_maintenance3.PhysicalDeviceMaintenance3Properties',
--     'Graphics.Vulkan.Extensions.VK_NV_mesh_shader.PhysicalDeviceMeshShaderPropertiesNV',
--     'Graphics.Vulkan.Extensions.VK_NVX_multiview_per_view_attributes.PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_multiview.PhysicalDeviceMultiviewProperties',
--     'Graphics.Vulkan.Extensions.VK_EXT_pci_bus_info.PhysicalDevicePCIBusInfoPropertiesEXT',
--     'Graphics.Vulkan.Extensions.VK_KHR_performance_query.PhysicalDevicePerformanceQueryPropertiesKHR',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_maintenance2.PhysicalDevicePointClippingProperties',
--     'Graphics.Vulkan.Core11.Originally_Based_On_VK_KHR_protected_memory.PhysicalDeviceProtectedMemoryProperties',
--     'Graphics.Vulkan.Extensions.VK_KHR_push_descriptor.PhysicalDevicePushDescriptorPropertiesKHR',
--     'Graphics.Vulkan.Extensions.VK_KHR_ray_tracing.PhysicalDeviceRayTracingPropertiesKHR',
--     'Graphics.Vulkan.Extensions.VK_NV_ray_tracing.PhysicalDeviceRayTracingPropertiesNV',
--     'Graphics.Vulkan.Extensions.VK_EXT_sample_locations.PhysicalDeviceSampleLocationsPropertiesEXT',
--     'Graphics.Vulkan.Core12.Promoted_From_VK_EXT_sampler_filter_minmax.PhysicalDeviceSamplerFilterMinmaxProperties',
--     'Graphics.Vulkan.Extensions.VK_AMD_shader_core_properties2.PhysicalDeviceShaderCoreProperties2AMD',
--     'Graphics.Vulkan.Extensions.VK_AMD_shader_core_properties.PhysicalDeviceShaderCorePropertiesAMD',
--     'Graphics.Vulkan.Extensions.VK_NV_shader_sm_builtins.PhysicalDeviceShaderSMBuiltinsPropertiesNV',
--     'Graphics.Vulkan.Extensions.VK_NV_shading_rate_image.PhysicalDeviceShadingRateImagePropertiesNV',
--     'Graphics.Vulkan.Core11.Originally_Based_On_VK_KHR_subgroup.PhysicalDeviceSubgroupProperties',
--     'Graphics.Vulkan.Extensions.VK_EXT_subgroup_size_control.PhysicalDeviceSubgroupSizeControlPropertiesEXT',
--     'Graphics.Vulkan.Extensions.VK_EXT_texel_buffer_alignment.PhysicalDeviceTexelBufferAlignmentPropertiesEXT',
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_timeline_semaphore.PhysicalDeviceTimelineSemaphoreProperties',
--     'Graphics.Vulkan.Extensions.VK_EXT_transform_feedback.PhysicalDeviceTransformFeedbackPropertiesEXT',
--     'Graphics.Vulkan.Extensions.VK_EXT_vertex_attribute_divisor.PhysicalDeviceVertexAttributeDivisorPropertiesEXT',
--     'Graphics.Vulkan.Core12.PhysicalDeviceVulkan11Properties', or
--     'Graphics.Vulkan.Core12.PhysicalDeviceVulkan12Properties'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceProperties',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceProperties2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_physical_device_properties2.getPhysicalDeviceProperties2KHR'
data PhysicalDeviceProperties2 (es :: [Type]) = PhysicalDeviceProperties2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @properties@ is a
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceProperties'
    -- structure describing properties of the physical device. This structure
    -- is written with the same values as if it were written by
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceProperties'.
    properties :: PhysicalDeviceProperties
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (PhysicalDeviceProperties2 es)

instance Extensible PhysicalDeviceProperties2 where
  extensibleType = STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2
  setNext x next = x{next = next}
  getNext PhysicalDeviceProperties2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends PhysicalDeviceProperties2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @PhysicalDeviceVulkan12Properties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceVulkan11Properties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceLineRasterizationPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceSubgroupSizeControlPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceTexelBufferAlignmentPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderSMBuiltinsPropertiesNV = Just f
    | Just Refl <- eqT @e @PhysicalDevicePerformanceQueryPropertiesKHR = Just f
    | Just Refl <- eqT @e @PhysicalDeviceCooperativeMatrixPropertiesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceFragmentDensityMapPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceRayTracingPropertiesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceRayTracingPropertiesKHR = Just f
    | Just Refl <- eqT @e @PhysicalDeviceMeshShaderPropertiesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShadingRateImagePropertiesNV = Just f
    | Just Refl <- eqT @e @PhysicalDeviceTransformFeedbackPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceDepthStencilResolveProperties = Just f
    | Just Refl <- eqT @e @PhysicalDevicePCIBusInfoPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceVertexAttributeDivisorPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceTimelineSemaphoreProperties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceDescriptorIndexingProperties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderCoreProperties2AMD = Just f
    | Just Refl <- eqT @e @PhysicalDeviceShaderCorePropertiesAMD = Just f
    | Just Refl <- eqT @e @PhysicalDeviceConservativeRasterizationPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceExternalMemoryHostPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceFloatControlsProperties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceMaintenance3Properties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceInlineUniformBlockPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceBlendOperationAdvancedPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceSampleLocationsPropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceSamplerFilterMinmaxProperties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceProtectedMemoryProperties = Just f
    | Just Refl <- eqT @e @PhysicalDevicePointClippingProperties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceSubgroupProperties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceMultiviewPerViewAttributesPropertiesNVX = Just f
    | Just Refl <- eqT @e @PhysicalDeviceDiscardRectanglePropertiesEXT = Just f
    | Just Refl <- eqT @e @PhysicalDeviceMultiviewProperties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceIDProperties = Just f
    | Just Refl <- eqT @e @PhysicalDeviceDriverProperties = Just f
    | Just Refl <- eqT @e @PhysicalDevicePushDescriptorPropertiesKHR = Just f
    | Just Refl <- eqT @e @PhysicalDeviceDeviceGeneratedCommandsPropertiesNV = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (PhysicalDeviceProperties2 es) where
  withCStruct x f = allocaBytesAligned 840 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceProperties2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr PhysicalDeviceProperties)) (properties) . ($ ())
    lift $ f
  cStructSize = 840
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_PROPERTIES_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr PhysicalDeviceProperties)) (zero) . ($ ())
    lift $ f

instance PeekChain es => FromCStruct (PhysicalDeviceProperties2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    properties <- peekCStruct @PhysicalDeviceProperties ((p `plusPtr` 16 :: Ptr PhysicalDeviceProperties))
    pure $ PhysicalDeviceProperties2
             next properties

instance es ~ '[] => Zero (PhysicalDeviceProperties2 es) where
  zero = PhysicalDeviceProperties2
           ()
           zero


-- | VkFormatProperties2 - Structure specifying image format properties
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_FORMAT_PROPERTIES_2'
--
-- -   @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
--     'Graphics.Vulkan.Extensions.VK_EXT_image_drm_format_modifier.DrmFormatModifierPropertiesListEXT'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.DeviceInitialization.FormatProperties',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceFormatProperties2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_physical_device_properties2.getPhysicalDeviceFormatProperties2KHR'
data FormatProperties2 (es :: [Type]) = FormatProperties2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @formatProperties@ is a
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.FormatProperties' structure
    -- describing features supported by the requested format.
    formatProperties :: FormatProperties
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (FormatProperties2 es)

instance Extensible FormatProperties2 where
  extensibleType = STRUCTURE_TYPE_FORMAT_PROPERTIES_2
  setNext x next = x{next = next}
  getNext FormatProperties2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends FormatProperties2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @DrmFormatModifierPropertiesListEXT = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (FormatProperties2 es) where
  withCStruct x f = allocaBytesAligned 32 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p FormatProperties2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_FORMAT_PROPERTIES_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr FormatProperties)) (formatProperties) . ($ ())
    lift $ f
  cStructSize = 32
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_FORMAT_PROPERTIES_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr FormatProperties)) (zero) . ($ ())
    lift $ f

instance PeekChain es => FromCStruct (FormatProperties2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    formatProperties <- peekCStruct @FormatProperties ((p `plusPtr` 16 :: Ptr FormatProperties))
    pure $ FormatProperties2
             next formatProperties

instance es ~ '[] => Zero (FormatProperties2 es) where
  zero = FormatProperties2
           ()
           zero


-- | VkImageFormatProperties2 - Structure specifying an image format
-- properties
--
-- = Description
--
-- If the combination of parameters to
-- 'getPhysicalDeviceImageFormatProperties2' is not supported by the
-- implementation for use in 'Graphics.Vulkan.Core10.Image.createImage',
-- then all members of @imageFormatProperties@ will be filled with zero.
--
-- Note
--
-- Filling @imageFormatProperties@ with zero for unsupported formats is an
-- exception to the usual rule that output structures have undefined
-- contents on error. This exception was unintentional, but is preserved
-- for backwards compatibility. This exeption only applies to
-- @imageFormatProperties@, not @sType@, @pNext@, or any structures chained
-- from @pNext@.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of
--     'Graphics.Vulkan.Extensions.VK_ANDROID_external_memory_android_hardware_buffer.AndroidHardwareBufferUsageANDROID',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.ExternalImageFormatProperties',
--     'Graphics.Vulkan.Extensions.VK_EXT_filter_cubic.FilterCubicImageViewImageFormatPropertiesEXT',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_sampler_ycbcr_conversion.SamplerYcbcrConversionImageFormatProperties',
--     or
--     'Graphics.Vulkan.Extensions.VK_AMD_texture_gather_bias_lod.TextureLODGatherFormatPropertiesAMD'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.DeviceInitialization.ImageFormatProperties',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceImageFormatProperties2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_physical_device_properties2.getPhysicalDeviceImageFormatProperties2KHR'
data ImageFormatProperties2 (es :: [Type]) = ImageFormatProperties2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure. The
    -- @pNext@ chain of 'ImageFormatProperties2' is used to allow the
    -- specification of additional capabilities to be returned from
    -- 'getPhysicalDeviceImageFormatProperties2'.
    next :: Chain es
  , -- | @imageFormatProperties@ is a
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.ImageFormatProperties'
    -- structure in which capabilities are returned.
    imageFormatProperties :: ImageFormatProperties
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (ImageFormatProperties2 es)

instance Extensible ImageFormatProperties2 where
  extensibleType = STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2
  setNext x next = x{next = next}
  getNext ImageFormatProperties2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends ImageFormatProperties2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @FilterCubicImageViewImageFormatPropertiesEXT = Just f
    | Just Refl <- eqT @e @AndroidHardwareBufferUsageANDROID = Just f
    | Just Refl <- eqT @e @TextureLODGatherFormatPropertiesAMD = Just f
    | Just Refl <- eqT @e @SamplerYcbcrConversionImageFormatProperties = Just f
    | Just Refl <- eqT @e @ExternalImageFormatProperties = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (ImageFormatProperties2 es) where
  withCStruct x f = allocaBytesAligned 48 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p ImageFormatProperties2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr ImageFormatProperties)) (imageFormatProperties) . ($ ())
    lift $ f
  cStructSize = 48
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_IMAGE_FORMAT_PROPERTIES_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr ImageFormatProperties)) (zero) . ($ ())
    lift $ f

instance PeekChain es => FromCStruct (ImageFormatProperties2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    imageFormatProperties <- peekCStruct @ImageFormatProperties ((p `plusPtr` 16 :: Ptr ImageFormatProperties))
    pure $ ImageFormatProperties2
             next imageFormatProperties

instance es ~ '[] => Zero (ImageFormatProperties2 es) where
  zero = ImageFormatProperties2
           ()
           zero


-- | VkPhysicalDeviceImageFormatInfo2 - Structure specifying image creation
-- parameters
--
-- = Description
--
-- The members of 'PhysicalDeviceImageFormatInfo2' correspond to the
-- arguments to
-- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceImageFormatProperties',
-- with @sType@ and @pNext@ added for extensibility.
--
-- == Valid Usage
--
-- -   @tiling@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.ImageTiling.IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT'
--     if and only if the @pNext@ chain includes
--     'Graphics.Vulkan.Extensions.VK_EXT_image_drm_format_modifier.PhysicalDeviceImageDrmFormatModifierInfoEXT'.
--
-- -   If @tiling@ is
--     'Graphics.Vulkan.Core10.Enums.ImageTiling.IMAGE_TILING_DRM_FORMAT_MODIFIER_EXT'
--     and @flags@ contains
--     'Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits.IMAGE_CREATE_MUTABLE_FORMAT_BIT',
--     then the @pNext@ chain /must/ include a
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_image_format_list.ImageFormatListCreateInfo'
--     structure with non-zero @viewFormatCount@.
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2'
--
-- -   Each @pNext@ member of any structure (including this one) in the
--     @pNext@ chain /must/ be either @NULL@ or a pointer to a valid
--     instance of
--     'Graphics.Vulkan.Core12.Promoted_From_VK_KHR_image_format_list.ImageFormatListCreateInfo',
--     'Graphics.Vulkan.Core12.Promoted_From_VK_EXT_separate_stencil_usage.ImageStencilUsageCreateInfo',
--     'Graphics.Vulkan.Core11.Promoted_From_VK_KHR_external_memory_capabilities.PhysicalDeviceExternalImageFormatInfo',
--     'Graphics.Vulkan.Extensions.VK_EXT_image_drm_format_modifier.PhysicalDeviceImageDrmFormatModifierInfoEXT',
--     or
--     'Graphics.Vulkan.Extensions.VK_EXT_filter_cubic.PhysicalDeviceImageViewImageFormatInfoEXT'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- -   @format@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.Format.Format' value
--
-- -   @type@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.ImageType.ImageType' value
--
-- -   @tiling@ /must/ be a valid
--     'Graphics.Vulkan.Core10.Enums.ImageTiling.ImageTiling' value
--
-- -   @usage@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.ImageUsageFlagBits'
--     values
--
-- -   @usage@ /must/ not be @0@
--
-- -   @flags@ /must/ be a valid combination of
--     'Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits.ImageCreateFlagBits'
--     values
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.Format.Format',
-- 'Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits.ImageCreateFlags',
-- 'Graphics.Vulkan.Core10.Enums.ImageTiling.ImageTiling',
-- 'Graphics.Vulkan.Core10.Enums.ImageType.ImageType',
-- 'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.ImageUsageFlags',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceImageFormatProperties2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_physical_device_properties2.getPhysicalDeviceImageFormatProperties2KHR'
data PhysicalDeviceImageFormatInfo2 (es :: [Type]) = PhysicalDeviceImageFormatInfo2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure. The
    -- @pNext@ chain of 'PhysicalDeviceImageFormatInfo2' is used to provide
    -- additional image parameters to
    -- 'getPhysicalDeviceImageFormatProperties2'.
    next :: Chain es
  , -- | @format@ is a 'Graphics.Vulkan.Core10.Enums.Format.Format' value
    -- indicating the image format, corresponding to
    -- 'Graphics.Vulkan.Core10.Image.ImageCreateInfo'::@format@.
    format :: Format
  , -- | @type@ is a 'Graphics.Vulkan.Core10.Enums.ImageType.ImageType' value
    -- indicating the image type, corresponding to
    -- 'Graphics.Vulkan.Core10.Image.ImageCreateInfo'::@imageType@.
    type' :: ImageType
  , -- | @tiling@ is a 'Graphics.Vulkan.Core10.Enums.ImageTiling.ImageTiling'
    -- value indicating the image tiling, corresponding to
    -- 'Graphics.Vulkan.Core10.Image.ImageCreateInfo'::@tiling@.
    tiling :: ImageTiling
  , -- | @usage@ is a bitmask of
    -- 'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.ImageUsageFlagBits'
    -- indicating the intended usage of the image, corresponding to
    -- 'Graphics.Vulkan.Core10.Image.ImageCreateInfo'::@usage@.
    usage :: ImageUsageFlags
  , -- | @flags@ is a bitmask of
    -- 'Graphics.Vulkan.Core10.Enums.ImageCreateFlagBits.ImageCreateFlagBits'
    -- indicating additional parameters of the image, corresponding to
    -- 'Graphics.Vulkan.Core10.Image.ImageCreateInfo'::@flags@.
    flags :: ImageCreateFlags
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (PhysicalDeviceImageFormatInfo2 es)

instance Extensible PhysicalDeviceImageFormatInfo2 where
  extensibleType = STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2
  setNext x next = x{next = next}
  getNext PhysicalDeviceImageFormatInfo2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends PhysicalDeviceImageFormatInfo2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @PhysicalDeviceImageViewImageFormatInfoEXT = Just f
    | Just Refl <- eqT @e @ImageStencilUsageCreateInfo = Just f
    | Just Refl <- eqT @e @PhysicalDeviceImageDrmFormatModifierInfoEXT = Just f
    | Just Refl <- eqT @e @ImageFormatListCreateInfo = Just f
    | Just Refl <- eqT @e @PhysicalDeviceExternalImageFormatInfo = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (PhysicalDeviceImageFormatInfo2 es) where
  withCStruct x f = allocaBytesAligned 40 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceImageFormatInfo2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    lift $ poke ((p `plusPtr` 16 :: Ptr Format)) (format)
    lift $ poke ((p `plusPtr` 20 :: Ptr ImageType)) (type')
    lift $ poke ((p `plusPtr` 24 :: Ptr ImageTiling)) (tiling)
    lift $ poke ((p `plusPtr` 28 :: Ptr ImageUsageFlags)) (usage)
    lift $ poke ((p `plusPtr` 32 :: Ptr ImageCreateFlags)) (flags)
    lift $ f
  cStructSize = 40
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    lift $ poke ((p `plusPtr` 16 :: Ptr Format)) (zero)
    lift $ poke ((p `plusPtr` 20 :: Ptr ImageType)) (zero)
    lift $ poke ((p `plusPtr` 24 :: Ptr ImageTiling)) (zero)
    lift $ poke ((p `plusPtr` 28 :: Ptr ImageUsageFlags)) (zero)
    lift $ f

instance PeekChain es => FromCStruct (PhysicalDeviceImageFormatInfo2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    format <- peek @Format ((p `plusPtr` 16 :: Ptr Format))
    type' <- peek @ImageType ((p `plusPtr` 20 :: Ptr ImageType))
    tiling <- peek @ImageTiling ((p `plusPtr` 24 :: Ptr ImageTiling))
    usage <- peek @ImageUsageFlags ((p `plusPtr` 28 :: Ptr ImageUsageFlags))
    flags <- peek @ImageCreateFlags ((p `plusPtr` 32 :: Ptr ImageCreateFlags))
    pure $ PhysicalDeviceImageFormatInfo2
             next format type' tiling usage flags

instance es ~ '[] => Zero (PhysicalDeviceImageFormatInfo2 es) where
  zero = PhysicalDeviceImageFormatInfo2
           ()
           zero
           zero
           zero
           zero
           zero


-- | VkQueueFamilyProperties2 - Structure providing information about a queue
-- family
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2'
--
-- -   @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
--     'Graphics.Vulkan.Extensions.VK_NV_device_diagnostic_checkpoints.QueueFamilyCheckpointPropertiesNV'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.DeviceInitialization.QueueFamilyProperties',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceQueueFamilyProperties2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_physical_device_properties2.getPhysicalDeviceQueueFamilyProperties2KHR'
data QueueFamilyProperties2 (es :: [Type]) = QueueFamilyProperties2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @queueFamilyProperties@ is a
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.QueueFamilyProperties'
    -- structure which is populated with the same values as in
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceQueueFamilyProperties'.
    queueFamilyProperties :: QueueFamilyProperties
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (QueueFamilyProperties2 es)

instance Extensible QueueFamilyProperties2 where
  extensibleType = STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2
  setNext x next = x{next = next}
  getNext QueueFamilyProperties2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends QueueFamilyProperties2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @QueueFamilyCheckpointPropertiesNV = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (QueueFamilyProperties2 es) where
  withCStruct x f = allocaBytesAligned 40 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p QueueFamilyProperties2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr QueueFamilyProperties)) (queueFamilyProperties) . ($ ())
    lift $ f
  cStructSize = 40
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_QUEUE_FAMILY_PROPERTIES_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr QueueFamilyProperties)) (zero) . ($ ())
    lift $ f

instance PeekChain es => FromCStruct (QueueFamilyProperties2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    queueFamilyProperties <- peekCStruct @QueueFamilyProperties ((p `plusPtr` 16 :: Ptr QueueFamilyProperties))
    pure $ QueueFamilyProperties2
             next queueFamilyProperties

instance es ~ '[] => Zero (QueueFamilyProperties2 es) where
  zero = QueueFamilyProperties2
           ()
           zero


-- | VkPhysicalDeviceMemoryProperties2 - Structure specifying physical device
-- memory properties
--
-- == Valid Usage (Implicit)
--
-- -   @sType@ /must/ be
--     'Graphics.Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2'
--
-- -   @pNext@ /must/ be @NULL@ or a pointer to a valid instance of
--     'Graphics.Vulkan.Extensions.VK_EXT_memory_budget.PhysicalDeviceMemoryBudgetPropertiesEXT'
--
-- -   The @sType@ value of each struct in the @pNext@ chain /must/ be
--     unique
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceMemoryProperties',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceMemoryProperties2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_physical_device_properties2.getPhysicalDeviceMemoryProperties2KHR'
data PhysicalDeviceMemoryProperties2 (es :: [Type]) = PhysicalDeviceMemoryProperties2
  { -- | @pNext@ is @NULL@ or a pointer to an extension-specific structure.
    next :: Chain es
  , -- | @memoryProperties@ is a
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.PhysicalDeviceMemoryProperties'
    -- structure which is populated with the same values as in
    -- 'Graphics.Vulkan.Core10.DeviceInitialization.getPhysicalDeviceMemoryProperties'.
    memoryProperties :: PhysicalDeviceMemoryProperties
  }
  deriving (Typeable)
deriving instance Show (Chain es) => Show (PhysicalDeviceMemoryProperties2 es)

instance Extensible PhysicalDeviceMemoryProperties2 where
  extensibleType = STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2
  setNext x next = x{next = next}
  getNext PhysicalDeviceMemoryProperties2{..} = next
  extends :: forall e b proxy. Typeable e => proxy e -> (Extends PhysicalDeviceMemoryProperties2 e => b) -> Maybe b
  extends _ f
    | Just Refl <- eqT @e @PhysicalDeviceMemoryBudgetPropertiesEXT = Just f
    | otherwise = Nothing

instance PokeChain es => ToCStruct (PhysicalDeviceMemoryProperties2 es) where
  withCStruct x f = allocaBytesAligned 536 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceMemoryProperties2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2)
    pNext'' <- fmap castPtr . ContT $ withChain (next)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext''
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr PhysicalDeviceMemoryProperties)) (memoryProperties) . ($ ())
    lift $ f
  cStructSize = 536
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_MEMORY_PROPERTIES_2)
    pNext' <- fmap castPtr . ContT $ withZeroChain @es
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) pNext'
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr PhysicalDeviceMemoryProperties)) (zero) . ($ ())
    lift $ f

instance PeekChain es => FromCStruct (PhysicalDeviceMemoryProperties2 es) where
  peekCStruct p = do
    pNext <- peek @(Ptr ()) ((p `plusPtr` 8 :: Ptr (Ptr ())))
    next <- peekChain (castPtr pNext)
    memoryProperties <- peekCStruct @PhysicalDeviceMemoryProperties ((p `plusPtr` 16 :: Ptr PhysicalDeviceMemoryProperties))
    pure $ PhysicalDeviceMemoryProperties2
             next memoryProperties

instance es ~ '[] => Zero (PhysicalDeviceMemoryProperties2 es) where
  zero = PhysicalDeviceMemoryProperties2
           ()
           zero


-- | VkSparseImageFormatProperties2 - Structure specifying sparse image
-- format properties
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.SparseResourceMemoryManagement.SparseImageFormatProperties',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceSparseImageFormatProperties2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_physical_device_properties2.getPhysicalDeviceSparseImageFormatProperties2KHR'
data SparseImageFormatProperties2 = SparseImageFormatProperties2
  { -- | @properties@ is a
    -- 'Graphics.Vulkan.Core10.SparseResourceMemoryManagement.SparseImageFormatProperties'
    -- structure which is populated with the same values as in
    -- 'Graphics.Vulkan.Core10.SparseResourceMemoryManagement.getPhysicalDeviceSparseImageFormatProperties'.
    properties :: SparseImageFormatProperties }
  deriving (Typeable)
deriving instance Show SparseImageFormatProperties2

instance ToCStruct SparseImageFormatProperties2 where
  withCStruct x f = allocaBytesAligned 40 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p SparseImageFormatProperties2{..} f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr SparseImageFormatProperties)) (properties) . ($ ())
    lift $ f
  cStructSize = 40
  cStructAlignment = 8
  pokeZeroCStruct p f = evalContT $ do
    lift $ poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_SPARSE_IMAGE_FORMAT_PROPERTIES_2)
    lift $ poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    ContT $ pokeCStruct ((p `plusPtr` 16 :: Ptr SparseImageFormatProperties)) (zero) . ($ ())
    lift $ f

instance FromCStruct SparseImageFormatProperties2 where
  peekCStruct p = do
    properties <- peekCStruct @SparseImageFormatProperties ((p `plusPtr` 16 :: Ptr SparseImageFormatProperties))
    pure $ SparseImageFormatProperties2
             properties

instance Zero SparseImageFormatProperties2 where
  zero = SparseImageFormatProperties2
           zero


-- | VkPhysicalDeviceSparseImageFormatInfo2 - Structure specifying sparse
-- image format inputs
--
-- == Valid Usage (Implicit)
--
-- = See Also
--
-- 'Graphics.Vulkan.Core10.Enums.Format.Format',
-- 'Graphics.Vulkan.Core10.Enums.ImageTiling.ImageTiling',
-- 'Graphics.Vulkan.Core10.Enums.ImageType.ImageType',
-- 'Graphics.Vulkan.Core10.Enums.ImageUsageFlagBits.ImageUsageFlags',
-- 'Graphics.Vulkan.Core10.Enums.SampleCountFlagBits.SampleCountFlagBits',
-- 'Graphics.Vulkan.Core10.Enums.StructureType.StructureType',
-- 'getPhysicalDeviceSparseImageFormatProperties2',
-- 'Graphics.Vulkan.Extensions.VK_KHR_get_physical_device_properties2.getPhysicalDeviceSparseImageFormatProperties2KHR'
data PhysicalDeviceSparseImageFormatInfo2 = PhysicalDeviceSparseImageFormatInfo2
  { -- | @format@ /must/ be a valid 'Graphics.Vulkan.Core10.Enums.Format.Format'
    -- value
    format :: Format
  , -- | @type@ /must/ be a valid
    -- 'Graphics.Vulkan.Core10.Enums.ImageType.ImageType' value
    type' :: ImageType
  , -- | @samples@ /must/ be a valid
    -- 'Graphics.Vulkan.Core10.Enums.SampleCountFlagBits.SampleCountFlagBits'
    -- value
    samples :: SampleCountFlagBits
  , -- | @usage@ /must/ not be @0@
    usage :: ImageUsageFlags
  , -- | @tiling@ /must/ be a valid
    -- 'Graphics.Vulkan.Core10.Enums.ImageTiling.ImageTiling' value
    tiling :: ImageTiling
  }
  deriving (Typeable)
deriving instance Show PhysicalDeviceSparseImageFormatInfo2

instance ToCStruct PhysicalDeviceSparseImageFormatInfo2 where
  withCStruct x f = allocaBytesAligned 40 8 $ \p -> pokeCStruct p x (f p)
  pokeCStruct p PhysicalDeviceSparseImageFormatInfo2{..} f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Format)) (format)
    poke ((p `plusPtr` 20 :: Ptr ImageType)) (type')
    poke ((p `plusPtr` 24 :: Ptr SampleCountFlagBits)) (samples)
    poke ((p `plusPtr` 28 :: Ptr ImageUsageFlags)) (usage)
    poke ((p `plusPtr` 32 :: Ptr ImageTiling)) (tiling)
    f
  cStructSize = 40
  cStructAlignment = 8
  pokeZeroCStruct p f = do
    poke ((p `plusPtr` 0 :: Ptr StructureType)) (STRUCTURE_TYPE_PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2)
    poke ((p `plusPtr` 8 :: Ptr (Ptr ()))) (nullPtr)
    poke ((p `plusPtr` 16 :: Ptr Format)) (zero)
    poke ((p `plusPtr` 20 :: Ptr ImageType)) (zero)
    poke ((p `plusPtr` 24 :: Ptr SampleCountFlagBits)) (zero)
    poke ((p `plusPtr` 28 :: Ptr ImageUsageFlags)) (zero)
    poke ((p `plusPtr` 32 :: Ptr ImageTiling)) (zero)
    f

instance FromCStruct PhysicalDeviceSparseImageFormatInfo2 where
  peekCStruct p = do
    format <- peek @Format ((p `plusPtr` 16 :: Ptr Format))
    type' <- peek @ImageType ((p `plusPtr` 20 :: Ptr ImageType))
    samples <- peek @SampleCountFlagBits ((p `plusPtr` 24 :: Ptr SampleCountFlagBits))
    usage <- peek @ImageUsageFlags ((p `plusPtr` 28 :: Ptr ImageUsageFlags))
    tiling <- peek @ImageTiling ((p `plusPtr` 32 :: Ptr ImageTiling))
    pure $ PhysicalDeviceSparseImageFormatInfo2
             format type' samples usage tiling

instance Storable PhysicalDeviceSparseImageFormatInfo2 where
  sizeOf ~_ = 40
  alignment ~_ = 8
  peek = peekCStruct
  poke ptr poked = pokeCStruct ptr poked (pure ())

instance Zero PhysicalDeviceSparseImageFormatInfo2 where
  zero = PhysicalDeviceSparseImageFormatInfo2
           zero
           zero
           zero
           zero
           zero

