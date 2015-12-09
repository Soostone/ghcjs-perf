{-# LANGUAGE QuasiQuotes #-}

module ThPerf2 where

------------------------------------------------------------------------------
import           Reflex
import           Reflex.Dynamic.TH
------------------------------------------------------------------------------


data Foo = Foo
    { fooStr  :: String
    , fooFlag :: Bool
    , fooNum  :: Int
    }

mkFoo :: (String, Bool) -> Int -> Foo
mkFoo (s,b) i = Foo s b (i*10)

testFunc
    :: (Monad m, Reflex t, MonadHold t m)
    => Dynamic t String
    -> Dynamic t Bool
    -> Dynamic t Int
    -> m (Dynamic t Foo)
testFunc s b i = do
    [mkDyn| mkFoo $s $b $i |]

