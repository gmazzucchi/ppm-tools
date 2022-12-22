defmodule PpmTools do
  def resolve_color(color) do
    case color do
      :white -> "255 255 255 "
      :black -> "0 0 0 "
      :red -> "255 0 0 "
      :orange -> "255 165 0 "
      :yellow -> "255 255 0 "
      :green -> "0 255 0 "
      :light_blue -> "0 255 255 "
      :blue -> "0 0 255 "
      :purple -> "128 0 128 "
      :brown -> "165 42 42 "
      :grey -> "128 128 128 "
    end
  end

  def to_ppm(file_path, content, rows, cols, color_map, default, scale \\ 1) do
    file = File.open!(file_path, [:write])
    IO.binwrite(file, "P3\n#{cols * scale} #{rows * scale} \n255\n")

    for ix <- 0..(rows - 1) do
      for _x <- 1..scale do
        for iy <- 0..(cols - 1) do
          for _x <- 1..scale do
            color = Map.get(color_map, content |> Map.get({ix, iy}), nil)

            if color != nil do
              IO.binwrite(file, resolve_color(color))
            else
              IO.binwrite(file, resolve_color(default))
            end
          end
        end

        IO.binwrite(file, "\n")
      end
    end

    :ok
  end
end
