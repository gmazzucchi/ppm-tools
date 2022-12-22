defmodule PpmTools do
  def to_ppm(file_path, content, rows, cols, color_map, scale \\ 1) do
    file = File.open!(file_path, [:write])
    IO.binwrite(file, "P3\n#{cols * scale} #{rows * scale} \n255\n")

    for ix <- 0..(rows - 1) do
      for _x <- 1..scale do
        for iy <- 0..(cols - 1) do
          for _x <- 1..scale do
            IO.binwrite(file, Map.get(color_map, content |> Map.get({ix, iy})))
          end
        end

        IO.binwrite(file, "\n")
      end
    end

    :ok
  end
end
