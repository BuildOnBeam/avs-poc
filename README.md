# Bringing Oracles To Beam Network

---

# TL;DR!

In this PoC, I set up a custom oracle using [Othentic cli](https://docs.othentic.xyz/main) stack and [eigenlayer](https://docs.eigenlayer.xyz/developers/avs-developer-guide).
Basically there is a system where 3 Attester nodes fetch the price from a data source like [binance](https://api.binance.com/api/v3/ticker/price?symbol=ETHUSDT) and other Validator nodes check that the price is correct. After the check passes, the price is set on chain.

[check this contract to see the price on chain of ETH in USD](https://subnets-test.avax.network/beam/address/0xCD2eE76126Cae7279e5f3916Faf5a6B649250667?tab=code&contractTab=read)

---

# Simple Price Oracle AVS Example

This repository demonstrates how to implement a simple price oracle AVS using the Othentic Stack.

---

## Table of Contents

1. [Overview](#overview)
2. [Project Structure](#project-structure)
3. [Architecture](#usage)
4. [Prerequisites](#prerequisites)
5. [Installation](#installation)
6. [Usage](#usage)

---

## Overview

The Simple Price Oracle AVS Example demonstrates how to deploy a minimal AVS using Othentic Stack.

### Features

- **Containerised deployment:** Simplifies deployment and scaling.
- **Prometheus and Grafana integration:** Enables real-time monitoring and observability.

## Project Structure

```mdx
📂 simple-price-oracle-avs-example
├── Execution_Service # Implements task execution logic
├── Validation_Service # Implements task validation logic
├── grafana # Grafana monitoring configuration
├── docker-compose.yml # Docker setup for Operator Nodes (Performer, Attesters, Aggregator), Execution Service, Validation Service, and monitoring tools
└── README.md # Project documentation
```

## Architecture

![Price oracle sample](https://github.com/user-attachments/assets/03d544eb-d9c3-44a7-9712-531220c94f7e)

The Performer node executes tasks using the Task Execution Service and sends the results to the p2p network.

Attester Nodes validate task execution through the Validation Service. Based on the Validation Service's response, attesters sign the tasks. In this AVS:

Task Execution logic:

- Fetch the ETHUSDT price.
- Store the result in IPFS.
- Share the IPFS CID as proof.

Validation Service logic:

- Retrieve the price from IPFS using the CID.
- Get the expected ETHUSDT price.
- Validate by comparing the actual and expected prices within an acceptable margin.

---

## Prerequisites

- Node.js (v 22.6.0 )
- Foundry
- [Yarn](https://yarnpkg.com/)
- [Docker](https://docs.docker.com/engine/install/)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/Othentic-Labs/simple-price-oracle-avs-example.git
   cd simple-price-oracle-avs-example
   ```

2. Install Othentic CLI:

   ```bash
   npm i -g @othentic/othentic-cli
   ```

## Usage

Follow the steps in the official documentation's [Quickstart](https://docs.othentic.xyz/main/avs-framework/quick-start#steps) Guide for setup and deployment.

### Next

Modify the different configurations, tailor the task execution logic as per your use case, and run the AVS.

Happy Building! 🚀
