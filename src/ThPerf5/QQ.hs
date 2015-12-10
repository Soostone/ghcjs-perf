module ThPerf5.QQ where

import Control.Monad.State
import Data.Data
import Data.Generics
import Data.Monoid
import qualified Language.Haskell.Exts as Hs
import qualified Language.Haskell.Meta.Syntax.Translate as Hs
import Language.Haskell.TH
import Language.Haskell.TH.Quote
import qualified Language.Haskell.TH.Syntax as TH

test :: QuasiQuoter
test = QuasiQuoter
  { quoteExp = testExp
  , quotePat = error "test: pattern splices not supported"
  , quoteType = error "test: type splices not supported"
  , quoteDec = error "test: declaration splices not supported"
  }

testExp :: String -> Q Exp
testExp s = case Hs.parseExpWithMode (Hs.defaultParseMode { Hs.extensions = [ Hs.EnableExtension Hs.TemplateHaskell ] }) s of
  Hs.ParseFailed (Hs.SrcLoc _ l c) err -> fail $ "mkDyn:" <> show l <> ":" <> show c <> ": " <> err
  Hs.ParseOk e -> return $ Hs.toExp e
