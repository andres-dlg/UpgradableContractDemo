// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract BoxV2 is UUPSUpgradeable {
    uint256 internal value;

    function setNumber(uint256 _value) external {
        value = _value;
    }

    function getNumber() external view returns (uint256) {
        return value;
    }

    function version() external pure returns (uint256) {
        return 2;
    }

    function _authorizeUpgrade(address newImplementation) internal override {
        // If we leave this blank, everybody can upgrade the contract.
    }
}
