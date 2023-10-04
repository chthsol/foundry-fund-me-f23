// SPDX License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {MockV3Aggregator} from "../test/mocks/MockV3Aggregator.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    uint8 public constant DECIMALS = 8;
    int256 public constant INITIAL_PRICE = 2000e8;
    
    struct NetworkConfig {
	address priceFeed; // ETH/USD price feed address
    }

    constructor() {
	if (block.chainid == 11155111){
	    activeNetworkConfig = getSapoliaEthConfig();
	} else if (block.chainid == 1){
	    activeNetworkConfig = getMainnetEthConfig();
	} else {
	    activeNetworkConfig = getOrCreateAnvilEthConfig();
	}
    }
    
    function getSapoliaEthConfig() public pure returns (NetworkConfig memory) {
	// priceFeed address
	NetworkConfig memory sepoliaConfig = NetworkConfig({
	    priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
	});
	return sepoliaConfig;
    }

    function getMainnetEthConfig() public pure returns (NetworkConfig memory) {
	// priceFeed address
	NetworkConfig memory ethConfig = NetworkConfig({
	    priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
	});
	return ethConfig;
    }

    function getOrCreateAnvilEthConfig() public returns (NetworkConfig memory) {
	if (activeNetworkConfig.priceFeed != address(0)) {
	    return activeNetworkConfig;
	}
	// priceFeed address
	// 1. Deploy Mock Pricefeed Contracts (they dont exist here)
	// 2. return mock addresses
	// because of vm keyword needed below, HelperConfig contract MUST BE "is Script"
	// and can not be pure
	vm.startBroadcast();
	MockV3Aggregator mockPriceFeed = new MockV3Aggregator(DECIMALS, INITIAL_PRICE);
	vm.stopBroadcast();

	NetworkConfig memory anvilConfig = NetworkConfig({
	    priceFeed: address(mockPriceFeed)
	});
	return anvilConfig;
     }
}
