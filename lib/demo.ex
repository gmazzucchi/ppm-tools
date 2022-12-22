defmodule Demo do
  def demo() do
    rows = 100
    cols = 200

    points =
      for ir <- 0..(rows - 1) do
        for ic <- 0..(cols - 1) do
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

  '''
  Example taken from https://adventofcode.com/2022/day/22
  '''

  def demo2() do
    map =
      File.read!("./text.txt")
      |> String.split("\n")
      |> Enum.map(&String.graphemes/1)
      |> Enum.reduce({0, Map.new()}, fn crow, {irow, imap} ->
        {irow + 1,
         crow
         |> Enum.reduce({0, imap}, fn elem, {icol, jmap} ->
           {icol + 1,
            case elem do
              "." ->
                Map.put(jmap, {irow, icol}, :free)

              "#" ->
                Map.put(jmap, {irow, icol}, :wall)

              _ ->
                jmap
            end}
         end)
         |> elem(1)}
      end)
      |> elem(1)

    xs = map |> Map.keys() |> Enum.map(fn {x, _y} -> x end) |> Enum.max() |> IO.inspect()
    ys = map |> Map.keys() |> Enum.map(fn {_x, y} -> y end) |> Enum.max() |> IO.inspect()

    PpmTools.to_ppm(
      "./demo2.ppm",
      map,
      xs + 1,
      ys + 1,
      Map.new() |> Map.put(:wall, :black) |> Map.put(:free, :yellow),
      :white,
      20
    )
  end
end
