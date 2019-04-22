{-# language Strict #-}
{-# language CPP #-}
{-# language PatternSynonyms #-}
{-# language OverloadedStrings #-}

module Graphics.Vulkan.C.Extensions.VK_EXT_post_depth_coverage
  ( pattern VK_EXT_POST_DEPTH_COVERAGE_EXTENSION_NAME
  , pattern VK_EXT_POST_DEPTH_COVERAGE_SPEC_VERSION
  ) where

import Data.String
  ( IsString
  )





-- No documentation found for TopLevel "VK_EXT_POST_DEPTH_COVERAGE_EXTENSION_NAME"
pattern VK_EXT_POST_DEPTH_COVERAGE_EXTENSION_NAME :: (Eq a, IsString a) => a
pattern VK_EXT_POST_DEPTH_COVERAGE_EXTENSION_NAME = "VK_EXT_post_depth_coverage"

-- No documentation found for TopLevel "VK_EXT_POST_DEPTH_COVERAGE_SPEC_VERSION"
pattern VK_EXT_POST_DEPTH_COVERAGE_SPEC_VERSION :: Integral a => a
pattern VK_EXT_POST_DEPTH_COVERAGE_SPEC_VERSION = 1
