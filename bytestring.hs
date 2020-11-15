import qualified Data.ByteString.Lazy as B
import qualified Data.ByteString as S


packTest :: B.ByteString
packTest = B.pack [99,97,110]

fromChunksTest :: B.ByteString
fromChunksTest = B.fromChunks [S.pack [40,41,42], S.pack [43,44,45]]

lazyConsTest :: B.ByteString
lazyConsTest = B.cons 85 $ B.pack [80 .. 84]

strictConsTest :: B.ByteString
strictConsTest = B.cons' 85 $ B.pack [80 .. 84]
 