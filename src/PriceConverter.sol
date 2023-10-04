// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// location of aggregator interface from which we will pull pricing.
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
    function getPrice(AggregatorV3Interface priceFeed) internal view returns (uint256) {
        // Sepolia ETH / USD Address
	// https://docs.chain.link/data-feeds/price-feeds/addresses
        (, int256 answer,,,) = priceFeed.latestRoundData(); // picking the datafeeds we are interested in
        return uint256(answer * 1e10);
    }

    function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed) internal view returns (uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18; /*ethprice and ethAmount have 18 dec places
    	so need to div */
        return ethAmountInUsd;
    }

}
