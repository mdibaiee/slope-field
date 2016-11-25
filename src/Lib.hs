module Lib
    ( points
    , slopeField
    ) where
      import Numeric.MathExpr
      import Data.Default.Class

      type Range = (Int, Int)

      points :: Range -> [(Double, Double)]
      points (lower, upper) =
        let range = [lower..upper]
        in [ (fromIntegral x, fromIntegral y) | x <- range, y <- range ]

      slopeField :: String -> [(Double, Double)] -> Double -> [((Double, Double), (Double, Double))]
      slopeField math pts diff =
        let d x y = evaluate def math [("x", x), ("y", y)]
            half = diff / 2
            res = map (\(x, y) -> ((x - half, y), (half, d x y * diff))) pts
            inf = 1/0
            noinf = filter (\((x0, y0), (x, y)) -> x < inf && y < inf && x > -inf && y > -inf) res
            (minx, miny) = head pts
            (maxx, maxy) = last pts
            limitX = min maxx . max minx
            limitY = min maxy . max miny
        in map (\((x0, y0), (x1, y1)) -> ((limitX x0, limitY y0), (limitX x1, limitY y1))) noinf
