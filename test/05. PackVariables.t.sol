// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "forge-std/Test.sol";
import "src/05. PackVariables.sol";

contract PackVariablesTest is Test {
    PackVariables packVariables;
    uint8[30] arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

    function setUp() public {
        packVariables = new PackVariables();
    }

    function test_set() public {
        packVariables.setValues(
            0xbe, 0xbebebe, 0xdeadbeefdeadbeefdeadbeefdeadbeefdead, arr, 0xdeadbeefdeadbeefdeadbeefdead, 0xff
        );
    }
}

contract PackVariablesOptimizedTest is Test {
    PackVariablesOptimized packVariables;
    uint8[30] arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

    function setUp() public {
        packVariables = new PackVariablesOptimized();
    }

    function test_set() public {
        packVariables.setValues(
            0xbe, 0xbebebe, 0xdeadbeefdeadbeefdeadbeefdeadbeefdead, arr, 0xdeadbeefdeadbeefdeadbeefdead, 0xff
        );
    }
}