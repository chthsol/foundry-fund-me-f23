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

Run all tests.
```
forge test
```
To run a specific test block rather than all the tests.
The course video uses "forge test -mt testFunctionName"
This is now deprecated. Please use: 
```
forge test --match-test testFunctionName
```

Run tests in a forked environment.
```
forge test --fork-url $SEPOLIA_RPC_URL
```

### Test Coverage

Check test coverage.
```
forge coverage
```

# To deploy to a testsnet.

1. Setup environment variables.

Create a .env file and add `SEPOLIA_RPC_URL` and `PRIVATE_KEY` as environment variables.

- `PRIVATE_KEY` :  Private key of the account you will use to deploy. **NOTE:** FOR DEVELOPMENT, PLEASE USE A KEY THAT DOESN'T HAVE ANY REAL FUNDS ASSOCIATED WITH IT.
- `SEPOLIA_RPC_URL`: Url of the Sepolia testnet that you will use.

2. You will need testnet ETH to deploy to testnet.

If you have an Alchemy account you can get tesnet ETH at eh appropriate Alchemy ETH faucet.
[sepoliafaucet.com](https://sepoliafaucet.com/)

3. To deploy

```
forge script script/DeployFundMe.s.sol --rpc-url $SEPOLIA_RPC_URL --private-key $PRIVATE_KEY --broadcast --verify --etherscan-api-key $ETHERSCAN_API_KEY
```

## Interacting with the deployed contract 

Example using  cast to fund a contract.
```
cast send <FUNDME_CONTRACT_ADDRESS> "fund()" --value 0.1ether --private-key <PRIVATE_KEY>
```

Example of running scripts using forge.
```
forge script script/Interactions.s.sol --rpc-url sepolia  --private-key $PRIVATE_KEY  --broadcast
```

Example using cast to withdraw.
```
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()"  --private-key <PRIVATE_KEY>
```

Estimate gase usage with snapshot.
```
forge snapshot
```

You will then see a new file in the directory called `.gas-snapshot`

