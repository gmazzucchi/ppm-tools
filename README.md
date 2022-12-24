# Ppm Tools

Useful image format to visualize quickly some data.

#### Display

`feh` is a common and simple tool to display ppm images but anything else wil be ok.

`feh -B black -g 600x480 <PPM_FILE.ppm>`


#### Elixir usage

Copy `elixir_ppm.ex` into your project, then use

`PpmTools.to_ppm(file_path, content, nrows, ncols, scale, color_map)`

The `content` is what you want to display in the image. It must be a Map with following structure: `{x, y} => value`. The `color_map` is a Map with `value => color"` for example `:red` (see [this](./lib/elixir_ppm.ex) for options). The ppm content will be written into `file_path`. 

The content of the file if exists will be erased so be careful.