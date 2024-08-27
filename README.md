# Meta Transactions

This repo is created by following the `Metatransactions and Signature Replay` lesson on LearnWeb3 (https://learnweb3.io/degrees/ethereum-developer-degree/senior/using-metatransaction-to-pay-for-your-users-gas/)

## Introduction

There are times when you want your dApp users to have a gas-less experience, or perhaps make a transaction without actually putting something on the chain. These types of transactions are called meta-transactions, and in this repo, we implemented a very basic use case of meta transaction to see how it works.

## Requirements

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

## Installation

```bash
git clone https://github.com/SajidSheikh87/LW3-meta-transactions
cd LW3-meta-transactions
make install
```

# Testing

## Vanilla Foundry
We will be using the Makefile for the test.
```bash
foundryup
make test
```