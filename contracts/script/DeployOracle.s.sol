// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console2} from "forge-std/Script.sol";
import {Oracle} from "../src/Oracle.sol";
import {IAttestationCenter} from "../src/interfaces/IAttestationCenter.sol";

contract DeployOracleScript is Script {
    address public attestationCenter = 0x2e17Acf054bDB44679A9bc98Fff6280d458DAFcA;

    function run() external {
        // Start broadcasting transactions
        vm.startBroadcast();

        Oracle oracle = new Oracle(attestationCenter);

        IAttestationCenter(attestationCenter).setAvsLogic(address(oracle));

        // Stop broadcasting transactions
        vm.stopBroadcast();

        console2.log("Oracle deployed at:", address(oracle));
    }
}
