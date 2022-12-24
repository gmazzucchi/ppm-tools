#define PPMTOOLS_IMPLEMENTATION
#include "ppmtools.hpp"


int main() {
    std::vector<std::vector<PPMCOLOR>> content;
    content.resize(100);
    for (int i = 0; i < 100; i++) {
        content[i].resize(100);
        for (int j = 0; j < 100; j++) {
            content[i][j] = PPMCOLOR::RED;
        }
    }
    toppm("test.ppm", content, 100, 100, 3);

    return 0;
}