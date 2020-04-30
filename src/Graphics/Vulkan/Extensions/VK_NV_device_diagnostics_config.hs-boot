{-# language CPP #-}
module Graphics.Vulkan.Extensions.VK_NV_device_diagnostics_config  ( DeviceDiagnosticsConfigCreateInfoNV
                                                                   , PhysicalDeviceDiagnosticsConfigFeaturesNV
                                                                   ) where

import Data.Kind (Type)
import Graphics.Vulkan.CStruct (FromCStruct)
import Graphics.Vulkan.CStruct (ToCStruct)
data DeviceDiagnosticsConfigCreateInfoNV

instance ToCStruct DeviceDiagnosticsConfigCreateInfoNV
instance Show DeviceDiagnosticsConfigCreateInfoNV

instance FromCStruct DeviceDiagnosticsConfigCreateInfoNV


data PhysicalDeviceDiagnosticsConfigFeaturesNV

instance ToCStruct PhysicalDeviceDiagnosticsConfigFeaturesNV
instance Show PhysicalDeviceDiagnosticsConfigFeaturesNV

instance FromCStruct PhysicalDeviceDiagnosticsConfigFeaturesNV

