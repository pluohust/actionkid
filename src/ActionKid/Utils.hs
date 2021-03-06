module ActionKid.Utils where
import Data.List
import Graphics.Gloss
import Control.Monad.State

-- | Convenience function to make a box:
--
-- > box 50 50
box :: Int -> Int -> Picture
box w_ h_ = polygon [p1, p2, p3, p4]
  where
    w = fromIntegral w_
    h = fromIntegral h_
    p1 = (0, 0)
    p2 = (0, w)
    p3 = (h, w)
    p4 = (h, 0)

join elem list = concat $ intersperse elem list

for :: [a] -> (a -> b) -> [b]
for = flip map

count :: Eq a => a -> [a] -> Int
count x list = length $ filter (==x) list

indices :: [a] -> [Int]
indices arr = [0..(length arr - 1)]

(//) :: Integral a => a -> a -> a
a // b = floor $ (fromIntegral a) / (fromIntegral b)

mapWithIndex func list = map func (zip list (indices list))

forWithIndex = flip mapWithIndex

-- | convenient if you need to update a lot of attributes on a `MovieClip`.
-- Example:
--
-- > withMC person $ do
--     x .= 100
--     y .= 100
--     name .= "adit"
withMC state func = snd $ runState func state
