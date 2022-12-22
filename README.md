## ElixirPpm

#### Usage

Copy this file into your project, then use

`PpmTools.to_ppm(file_path, content, rows, cols, scale, color_map)`

`content` is what you want to display in the image. It must be a Map with following structure: `{x, y} => value`. `rows` is the number of rows, `cols` the number of columns, `color_map` is a Map with `value => "#{R} #{G} #{B} "` with R, G and B a number from 0 to 255. The ppm content will be written into `file_path`. The content of the file if exists will be erased so be careful.

#### Display

For linux distros `feh` is a common and simple tool to display ppm images.

`feh -B black -g 600x480 <PPM_FILE.ppm>`

#### Note

`color_map` should contain all possible values of content
