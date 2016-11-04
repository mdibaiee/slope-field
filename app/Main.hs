{-# LANGUAGE ScopedTypeVariables #-}

module Main where
  import Lib
  import System.IO
  import Graphics.Rendering.Chart
  import Graphics.Rendering.Chart.Backend.Cairo
  import Control.Lens
  import Data.Default.Class

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
            layout = layout_title .~ "slope field"
                   $ layout_plots .~ [vectors]
                   $ def

            vectors = plotVectorField
                    $ plot_vectors_values .~ field
                    $ plot_vectors_scale .~ 0
                    $ plot_vectors_style . vector_head_style . point_radius .~ 0
                    $ def

    renderableToFile def "slope-field.png" chart
    putStrLn "created file slope-field.png"
    return ()
