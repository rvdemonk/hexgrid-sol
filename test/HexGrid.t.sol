// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test, console2} from "forge-std/Test.sol";
import {HexGridUtils} from "src/HexGridUtils.sol";

contract HexGridUtilsTest is Test {
    using HexGridUtils for HexGridUtils.Tile;

    HexGridUtils.Tile public tileA;
    HexGridUtils.Tile public tileB;
    HexGridUtils.Tile public tileInvalid;

    function setUp() public {
        tileA = HexGridUtils.Tile(0, 0, 0);
        tileB = HexGridUtils.Tile(-2, 4, -2);
        tileInvalid = HexGridUtils.Tile(1, 1, 1);
    }

    function test_distance() public {
        // uint8 distance = HexGridUtils.distance(tileA, tileB);
        uint8 distance = tileA.distance(tileB);
        assertEq(distance, 4);
    }

    function test_distance2() public {
        uint8 distance = tileA.distance2(tileB);
        assertEq(distance, 4);
    }

    function test_validTile() public {
        bool isValid = tileInvalid.isValidTile();
        // assertFalse(isValid);
    }
}
