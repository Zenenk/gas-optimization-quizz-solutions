// SPDX-License-Identifier: MIT
pragma solidity ^0.8.25;

import "./Interfaces.sol";

contract Addition is IAddition {
    uint256 number = 1;

    function addition(uint256 value) public {
        number += value;
    }
}

contract Subtraction is ISubtraction {
    uint256 number = 100;

    function subtraction(uint256 value) public {
        number -= value;
    }
}

contract Division is IDivision {
    function divisionBy2(uint256 number) public pure returns (uint256) {
        return number / 2;
    }

    function divisionBy128(uint256 number) public pure returns (uint256) {
        return number / 128;
    }
}

contract AdditionOptimized is IAddition {
    uint256 number = 1;

    function addition(uint256 value) public {
        assembly {
            let current := sload(number.slot)
            let updated := add(current, value)
            if lt(updated, current) {
                mstore(0x00, 0x4e487b71)
                mstore(0x20, 0x11)
                revert(0x1c, 0x24)
            }
            sstore(number.slot, updated)
        }
    }
}

contract SubtractionOptimized is ISubtraction {
    uint256 number = 100;

    function subtraction(uint256 value) public {
        assembly {
            let current := sload(number.slot)
            if gt(value, current) {
                mstore(0x00, 0x4e487b71)
                mstore(0x20, 0x11)
                revert(0x1c, 0x24)
            }
            sstore(number.slot, sub(current, value))
        }
    }
}

contract DivisionOptimized is IDivision {
    function divisionBy2(uint256 number) public pure returns (uint256) {
        return number >> 1;
    }

    function divisionBy128(uint256 number) public pure returns (uint256) {
        return number >> 7;
    }
}