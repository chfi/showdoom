module Doom.WAD.Types where

import ClassyPrelude

data WADType = IWAD | PWAD deriving (Eq, Show, Read)


-- TODO: use Ptr for dirPtr and entryPtr instead?
-- would that make indexing easier?
-- actually, can I just read it as a C struct?
-- well, still doesn't make sense to make it a ptr, I guess
data Header = Header { wadtype :: WADType
                     , numLumps :: Word32
                     , dirPtr :: Word32
                     } deriving (Eq, Show)


data LumpData  = Verbatim ByteString
               | Map ByteString
               | THINGS ByteString
               | LINEDEFS ByteString
               | SIDEDEFS ByteString
               | VERTEXES ByteString
               | SEGS ByteString
               | SUBSECTORS ByteString
               | NODES ByteString
               | SECTORS ByteString
               | REJECT ByteString
               | BLOCKMAP ByteString
               | FLATS ByteString
               | SPRITES ByteString
               | PATCHES ByteString
               | PLAYPAL ByteString
               | COLORMAP ByteString
               | ENDOOM ByteString
               | TEXTURE1 ByteString
               | TEXTURE2 ByteString
               | PNAMES ByteString
               | DEMO ByteString



data DirEntry = DirEntry { entryPtr :: Word32
                         , size :: Word32
                         , name :: Text
                         } deriving (Eq, Show)


type Directory = Vector DirEntry
