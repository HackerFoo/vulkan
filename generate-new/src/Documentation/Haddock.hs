module Documentation.Haddock
  ( Haddock(..)
  , DocumenteeLocation(..)
  , documentationToHaddock
  ) where

import           Relude
import           Data.Default
import           Data.List                     as List
import qualified Data.Text.Extra               as T
import           Text.Pandoc

import           Documentation
import           Spec.Name
import           Render.Element                 ( ModName(..) )
import           Haskell.Name

newtype Haddock = Haddock { unHaddock :: Text }
  deriving (Show)

data DocumenteeLocation
  = Unknown
  | ThisModule HName
  | OtherModule ModName HName

documentationToHaddock
  :: (CName -> DocumenteeLocation)
  -- ^ Find which module a documentee lives in
  -> Documentation
  -- ^ The documentation to render
  -> Either Text Haddock
documentationToHaddock getModule Documentation {..} =
  let writerOptions = def
  in  bimap show Haddock $ runPure
        (writeHaddock
          writerOptions
          (prepareForHaddock . fixLinks getModule $ dDocumentation)
        )

prepareForHaddock :: Pandoc -> Pandoc
prepareForHaddock =
  bottomUp emptyBeforeBullet
    . topDown haddock801
    . topDown removeEmptySections
    . topDown fixupBlock
 where

  emptyBeforeBullet :: [Block] -> [Block]
  emptyBeforeBullet = \case
    [bu@BulletList{}] -> [Para [Str ""], bu]
    bs                -> bs

  haddock801 :: [Block] -> [Block]
  haddock801 = foldr go []
   where
    dummy = Para [Str "'"]
    go :: Block -> [Block] -> [Block]
    go h@Header{} (t@Table{} : bs) = h : dummy : t : bs
    go b          bs               = b : bs

  removeEmptySections :: [Block] -> [Block]
  removeEmptySections = foldr go []
   where
    go :: Block -> [Block] -> [Block]
    go (Header n1 _ _) (h@(Header n2 _ _) : bs) | n1 <= n2 = h : bs
    go b bs = b : bs

  fixupBlock :: Block -> Block
  fixupBlock = \case
    -- Remove idents from headers
    Header n (_, cs, kvs) is -> Header n ("", cs, kvs) is

    -- Change definition lists to bullets
    DefinitionList ds | all (null . fst) ds, all ((== 1) . length . snd) ds ->
      BulletList (List.head . snd <$> ds)

    b -> b

fixLinks :: (CName -> DocumenteeLocation) -> Pandoc -> Pandoc
fixLinks findDocs = topDown fixInlines
 where
  fixInlines = \case
    Link ("", [], []) [Str name] (tag, "") | tag == "#" <> name ->
      case findDocs (CName name) of
        Unknown      -> Code ("", [], []) name
        ThisModule n -> RawInline "haddock" ("'" <> unName n <> "'")
        OtherModule (ModName m) n ->
          RawInline "haddock" ("'" <> m <> "." <> unName n <> "'")
    -- Because of https://github.com/haskell/haddock/issues/802 the best we
    -- can do is link to the spec
    Link attrs t (tag, title) | Just fragment <- T.dropPrefix "#" tag ->
      Link attrs t (externalSpecHTML <> "#" <> fragment, title)
    Link attrs t (tag, title)
      | Just fragment <- T.dropPrefix "{html_spec_relative}#" tag -> Link
        attrs
        t
        (externalSpecHTML <> "#" <> fragment, title)
    i@(Code _ name) -> case findDocs (CName name) of
      Unknown      -> i
      ThisModule n -> RawInline "haddock" ("'" <> unName n <> "'")
      OtherModule (ModName m) n ->
        RawInline "haddock" ("'" <> m <> "." <> unName n <> "'")
    i -> i

externalSpecHTML :: Text
externalSpecHTML =
  "https://www.khronos.org/registry/vulkan/specs/1.2-extensions/html/vkspec.html"