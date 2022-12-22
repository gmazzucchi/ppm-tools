defmodule Demo do

  def demo() do
    rows = 100
    cols = 200

    points =
      for ir <- 0..rows-1 do
        for ic <- 0..cols-1 do
          {ir, ic}
        end
      end
      |> List.flatten()

    content =
      points
      |> Enum.reduce(Map.new(), fn {x, y}, acc ->
        val =
          cond do
            x <= 80 and x >= 50 and y <= 80 and y >= 50 -> 13
            true -> 12
          end

        acc |> Map.put({x, y}, val)
      end)

    color_map =
      Map.new()
      |> Map.put(13, :red)
      |> Map.put(12, :green)

    PpmTools.to_ppm("./output.ppm", content, rows, cols, color_map, :white, 4)
  end
end
