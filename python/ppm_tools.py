def resolve_color(colorString):
    match colorString:
        case 'black':
            return '0 0 0 '
        case 'white':
            return '255 255 255 '
        case 'green':
            return '0 128 0 '
        case 'red':
            return '255 0 0 '
        case 'lime':
            return '0 255 0 '
        case 'blue':
            return '0 0 255 '
        case 'yellow':
            return '255 255 0 '
        case 'cyan':
            return '0 255 255 '
        case 'magenta':
            return '255 0 255 '
        case 'silver':
            return '192 192 192 '
        case 'gray':
            return '128 128 128 '
        case 'maroon':
            return '128 0 0 '


def to_ppm(file_path, content, nrows, ncols, color_map, default, scale):
    out = open(file_path, 'w')
    out.write(f'P3\n{ncols * scale} {nrows * scale}\n255\n')

    for ix in range(nrows):
        for _x in range(scale):
            for iy in range(ncols):
                for _y in range(scale):
                    val = color_map.get(content.get((ix, iy), None), default)
                    out.write(resolve_color(val))
            out.write('\n')