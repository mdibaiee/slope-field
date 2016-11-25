{-# LANGUAGE ScopedTypeVariables #-}

module Main where
  import Lib
  import System.IO
  import Graphics.Rendering.Chart
  import Graphics.Rendering.Chart.Backend.Cairo
  import Control.Lens
  import Data.Default.Class
  import Data.Colour.SRGB
  import Data.Colour

  main :: IO ()
  main = do
    putStrLn "dy/dx = "
    math <- getLine
    putStrLn "range - format: (lower, upper): "
    (lower, upper) :: (Int, Int) <- read <$> getLine
    putStrLn "estimation size: "
    s <- read <$> getLine

    let pts = points (lower, upper)
        field = slopeField math pts s

    let chart = toRenderable layout
          where
            color = opaque (sRGB 0.3 0.3 1)

            layout = layout_title .~ "slope field"
                   $ layout_plots .~ [vectors]
                   $ def

            vectors = plotVectorField
                    $ plot_vectors_values .~ field
                    $ plot_vectors_scale .~ 1
                    $ plot_vectors_grid .~ []
                    $ plot_vectors_style . vector_head_style . point_color .~ color
                    $ plot_vectors_style . vector_line_style . line_color .~ color
                    $ def

    renderableToFile def "slope-field.png" chart
    putStrLn "created file slope-field.png"
    return ()
