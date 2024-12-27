// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

// Storage is stored in the proxy, not in the implementation contract.

// Proxy borrows functions from the implementation contract.

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable {
    uint256 internal value;

    /// @custom:oz-upgrades-unsafe-allow constructor
    constructor() {
        _disableInitializers(); // This says: Hey! Don't let any initialization happen
    }
    // Don't having this constructor is fine, but it's better to have it for clarity.

    // Since we cannot have a constructor in an upgradeable contract, we use the initializer function.
    // initialize is essentially the constructor for Proxy contracts.
    function initialize() public initializer {
        __Ownable_init(msg.sender); // Sets the owner to msg.sender
        __UUPSUpgradeable_init();
    }

    function getNumber() external view returns (uint256) {
        return value;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {
        // If we leave this blank, everybody can upgrade the contract.
    }
}
