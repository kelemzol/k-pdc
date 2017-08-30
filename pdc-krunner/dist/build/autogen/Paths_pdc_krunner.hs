{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_pdc_krunner (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
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
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\ezoltke\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\ezoltke\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.0.1\\pdc-krunner-0.1.0.0-JU7KjGQTpYmDs47IJ2X84U"
datadir    = "C:\\Users\\ezoltke\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.0.1\\pdc-krunner-0.1.0.0"
libexecdir = "C:\\Users\\ezoltke\\AppData\\Roaming\\cabal\\pdc-krunner-0.1.0.0-JU7KjGQTpYmDs47IJ2X84U"
sysconfdir = "C:\\Users\\ezoltke\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "pdc_krunner_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "pdc_krunner_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "pdc_krunner_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "pdc_krunner_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "pdc_krunner_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
