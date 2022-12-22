defmodule PpmTools do
  def to_ppm(content, rows, cols, scale, color_map) do
    file = File.open!("./output.ppm", [:write])
    IO.binwrite(file, "P3\n#{(cols) * (scale + 1)} #{(rows) * (scale + 1)} \n255\n")

    for ix <- 0..rows - 1 do
      for _x <- 0..scale do
        for iy <- 0..cols - 1 do
          for _x <- 0..scale do
            IO.binwrite(file, Map.get(color_map, content |> Map.get({ix, iy})))
          end
        end

        IO.binwrite(file, "\n")
      end
    end
  end
end
