{-# language CPP #-}
-- | = Name
--
-- VK_AMD_pipeline_compiler_control - device extension
--
-- = Registered Extension Number
--
-- 184
--
-- = Revision
--
-- 1
--
-- = Extension and Version Dependencies
--
-- -   Requires Vulkan 1.0
--
-- == Other Extension Metadata
--
-- [__Last Modified Date__]
--     2019-07-26
--
-- [__IP Status__]
--     No known IP claims.
--
-- [__Contributors__]
--
--     -   Matthaeus G. Chajdas, AMD
--
--     -   Daniel Rakos, AMD
--
--     -   Maciej Jesionowski, AMD
--
--     -   Tobias Hector, AMD
--
-- == Description
--
-- This extension introduces 'PipelineCompilerControlCreateInfoAMD'
-- structure that can be chained to a pipeline’s create info to specify
-- additional flags that affect pipeline compilation.
--
-- == New Structures
--
-- -   Extending 'Vulkan.Core10.Pipeline.GraphicsPipelineCreateInfo',
--     'Vulkan.Core10.Pipeline.ComputePipelineCreateInfo':
--
--     -   'PipelineCompilerControlCreateInfoAMD'
--
-- == New Enums
--
-- -   'PipelineCompilerControlFlagBitsAMD'
--
-- == New Bitmasks
--
-- -   'PipelineCompilerControlFlagsAMD'
--
-- == New Enum Constants
--
-- -   'AMD_PIPELINE_COMPILER_CONTROL_EXTENSION_NAME'
--
-- -   'AMD_PIPELINE_COMPILER_CONTROL_SPEC_VERSION'
--
-- -   Extending 'Vulkan.Core10.Enums.StructureType.StructureType':
--
--     -   'Vulkan.Core10.Enums.StructureType.STRUCTURE_TYPE_PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD'
--
-- == Issues
--
-- None.
--
-- == Examples
--
-- None.
--
-- == Version History
--
-- -   Revision 1, 2019-07-26 (Tobias Hector)
--
--     -   Initial revision.
--
-- = See Also
--
-- 'PipelineCompilerControlCreateInfoAMD',
-- 'PipelineCompilerControlFlagBitsAMD', 'PipelineCompilerControlFlagsAMD'
--
-- = Document Notes
--
-- For more information, see the
-- <https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html#VK_AMD_pipeline_compiler_control Vulkan Specification>
--
-- This page is a generated document. Fixes and changes should be made to
-- the generator scripts, not directly.
module Vulkan.Extensions.VK_AMD_pipeline_compiler_control  (PipelineCompilerControlCreateInfoAMD) where

import Data.Kind (Type)
import Vulkan.CStruct (FromCStruct)
import Vulkan.CStruct (ToCStruct)
data PipelineCompilerControlCreateInfoAMD

instance ToCStruct PipelineCompilerControlCreateInfoAMD
instance Show PipelineCompilerControlCreateInfoAMD

instance FromCStruct PipelineCompilerControlCreateInfoAMD

