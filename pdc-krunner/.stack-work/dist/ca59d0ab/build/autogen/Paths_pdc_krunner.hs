{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_pdc_krunner (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\ezoltke\\haskell\\pdc\\pdc\\.stack-work\\install\\63bf7b30\\bin"
libdir     = "C:\\Users\\ezoltke\\haskell\\pdc\\pdc\\.stack-work\\install\\63bf7b30\\lib\\x86_64-windows-ghc-8.0.2\\pdc-krunner-0.1.0.0-B1fLxNE250H1XZGvEQIUKz"
dynlibdir  = "C:\\Users\\ezoltke\\haskell\\pdc\\pdc\\.stack-work\\install\\63bf7b30\\lib\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\ezoltke\\haskell\\pdc\\pdc\\.stack-work\\install\\63bf7b30\\share\\x86_64-windows-ghc-8.0.2\\pdc-krunner-0.1.0.0"
libexecdir = "C:\\Users\\ezoltke\\haskell\\pdc\\pdc\\.stack-work\\install\\63bf7b30\\libexec"
sysconfdir = "C:\\Users\\ezoltke\\haskell\\pdc\\pdc\\.stack-work\\install\\63bf7b30\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pdc_krunner_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pdc_krunner_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "pdc_krunner_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "pdc_krunner_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pdc_krunner_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pdc_krunner_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
