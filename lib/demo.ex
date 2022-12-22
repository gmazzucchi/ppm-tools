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
            x <= 80 and x >= 50 and y <= 80 and y >= 50 -> :white
            true -> :black
          end

        acc |> Map.put({x, y}, val)
      end)

    color_map =
      Map.new()
      |> Map.put(:white, "#{255} #{255} #{255} ")
      |> Map.put(:black, "#{0} #{0} #{0} ")

    PpmTools.to_ppm("./output.ppm", content, rows, cols, color_map, 2)
  end
end
