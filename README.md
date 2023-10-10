# Foundry Fund Me

This is a crowd sourcing app created as part of section 7 of the Cyfrin Solidity Course.

Cyfrin Solidity Course section and code can be found at:
https://github.com/Cyfrin/foundry-fund-me-f23

The relevant course video section can be found at:
*[⭐️ (0:00:00) | Lesson 7: Foundry Fund Me](https://www.youtube.com/watch?v=sas02qSFZ74&t=0s)*

# Getting Started

## Requirements
You will need to have git and foundry installed.
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - Run `git --version`. You see an output like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - Run `forge --version` you should see an output like `forge 0.2.0 (ec3f9bd 2023-09-19T13:44:30.009787069Z)` if you've done it right.


## Quickstart

```
git clone https://github.com/chthsol/foundry-fund-me-f23
cd foundry-fund-me-f23
forge build
```

# Usage

## Deploy:

```
forge script script/DeployFundMe.s.sol
```

## Testing

```
forge test
```

or 

```
// To run a specific test block rather than all the tests.
The course video uses "forge test -mt testFunctionName"
This is now deprecated. Please use: 

forge test --match-test testFunctionName
```

or

```
forge test --fork-url $SEPOLIA_RPC_URL
```

### Test Coverage

```
forge coverage
```


# Deployment to a testnet or mainnet

1. Setup environment variables

You'll want to set your `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables. You can add them to a `.env` file, similar to what you see in `.env.example`.

- `PRIVATE_KEY`: The private key of your account (like from [metamask](https://metamask.io/)). **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
  - You can [learn how to export it here](https://metamask.zendesk.com/hc/en-us/articles/360015289632-How-to-Export-an-Account-Private-Key).
- `SEPOLIA_RPC_URL`: This is url of the sepolia testnet node you're working with. You can get setup with one for free from [Alchemy](https://alchemy.com/?a=673c802981)

Optionally, add your `ETHERSCAN_API_KEY` if you want to verify your contract on [Etherscan](https://etherscan.io/).

1. Get testnet ETH

Head over to [faucets.chain.link](https://faucets.chain.link/) and get some testnet ETH. You should see the ETH show up in your metamask.

3. Deploy

```
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Scripts

After deploying to a testnet or local net, you can run the scripts. 

Using cast deployed locally example: 

```
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
```

or
```
forge script script/Interactions.s.sol --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
```

### To Withdraw

```
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()"  --private-key <PRIVATE_KEY>
```

## To Estimate gas usage

```
forge snapshot
```

You will see a new file in teh directory called `.gas-snapshot`


# Formatting


To run code formatting:
```
forge fmt
```
