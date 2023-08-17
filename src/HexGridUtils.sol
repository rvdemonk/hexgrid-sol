// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

library HexGridUtils {
    struct Tile {
        int8 q;
        int8 r;
        int8 s;
        int8 weight;
    }

    function abs(int8 x) internal pure returns (uint8) {
        return x >= 0 ? uint8(x) : uint8(-x);
    }

    // @dev uses half of cubic distance method
    // @gas 5718
    function distance(
        Tile memory x,
        Tile memory y
    ) internal pure returns (uint8) {
        return (abs(x.q - y.q) + abs(x.r - y.r) + abs(x.s - y.s)) / 2;
    }

    // @dev uses maximum coord method
    // @gas 5527
    function distance2(
        Tile memory x,
        Tile memory y
    ) internal pure returns (uint8) {
        uint8 vec_q = abs(x.q - y.q);
        uint8 vec_r = abs(x.r - y.r);
        uint8 vec_s = abs(x.s - y.s);

        uint8 longest = vec_q > vec_r ? vec_q : vec_r;
        return longest > vec_s ? longest : vec_s;
    }

    // @gas 2757
    function isValidTile(Tile memory tile) internal pure returns (bool) {
        return (tile.q + tile.r + tile.s == 0);
    }

    // @gas 5632
    function isAdjacent(
        Tile memory x,
        Tile memory y
    ) internal pure returns (bool) {
        return (distance2(x, y) == 1);
    }
}
