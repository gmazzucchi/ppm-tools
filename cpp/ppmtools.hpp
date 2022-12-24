#ifdef __cplusplus
#ifndef PPMTOOLS_H
#define PPMTOOLS_H

#include <string>
#include <fstream>
#include <iostream>
#include <vector>

enum PPMCOLOR
{
    BLACK,
    WHITE,
    RED,
    YELLOW,
    GREEN,
    CYAN,
    BLUE,
    MAGENTA,
    GRAY,
    BROWN,
    ORANGE,
    PINK,
    VIOLET,
    INDIGO,
    TURQUOISE,
    DARKGREEN
};

uint32_t color_to_rgb(PPMCOLOR color);
void toppm(const std::string &path, std::vector<std::vector<PPMCOLOR>> &content, int nrows, int ncols, int scale);

#endif

#ifdef PPMTOOLS_IMPLEMENTATION

uint32_t color_to_rgb(PPMCOLOR color)
{
    switch (color)
    {
    case BLACK:
        return 0x000000;
    case WHITE:
        return 0xFFFFFF;
    case RED:
        return 0xFF0000;
    case YELLOW:
        return 0xFFFF00;
    case GREEN:
        return 0x00FF00;
    case CYAN:
        return 0x00FFFF;
    case BLUE:
        return 0x0000FF;
    case MAGENTA:
        return 0xFF00FF;
    case GRAY:
        return 0x808080;
    case BROWN:
        return 0x804000;
    case ORANGE:
        return 0xFF8000;
    case PINK:
        return 0xFF0080;
    case VIOLET:
        return 0x800080;
    case INDIGO:
        return 0x400080;
    case TURQUOISE:
        return 0x008080;
    case DARKGREEN:
        return 0x008000;
    default:
        return 0x000000;
    }
}

void toppm(const std::string &path, std::vector<std::vector<PPMCOLOR>> &content, int nrows, int ncols, int scale)
{
    std::ofstream out(path);
    if (!out.is_open())
    {
        std::cerr << "Error: could not open file " << path << std::endl;
        return;
    }
    out << "P3\n"
        << ncols * scale << " " << nrows * scale << "\n255\n";
    for (int ix = 0; ix < nrows; ix++)
    {
        for (int xscale = 0; xscale < scale; xscale++)
        {
            for (int iy = 0; iy < ncols; iy++)
            {
                for (int yscale = 0; yscale < scale; yscale++)
                {
                    PPMCOLOR color = content[ix][iy];
                    uint32_t rgb = color_to_rgb(color);
                    out << ((rgb >> 16) & 0xFF) << " " << ((rgb >> 8) & 0xFF) << " " << (rgb & 0xFF) << " ";
                }
            }
            out << "\n";
        }
    }
}

#endif

#else
#error "This file is for C++ only"
#endif