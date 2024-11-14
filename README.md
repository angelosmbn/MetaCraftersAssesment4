# Decentralized Voting System
This project is a decentralized voting system built on Ethereum using Solidity and React. It allows users to vote for candidates, with data stored securely on the Ethereum blockchain. Voters interact with the system through a React web application that uses MetaMask for authentication and signing transactions.
## Features
- **Decentralized Voting**: The voting system operates on the Ethereum blockchain, ensuring transparency and immutability.
- **MetaMask Integration**: Uses MetaMask for authentication and transaction signing.
- **Real-Time Updates**: Updates the UI with candidate details and total votes in real-time.
- **Event Logging**: Logs candidate registration and voting events.
  
## Smart Contract Details
### Functions
- **registerCandidate**: Adds a new candidate (only callable by the contract owner).
- **vote**: Allows a user to vote for a candidate by ID.
- **getVotes**: Returns the number of votes for a specific candidate.
- **getTotalVotes**: Returns the total votes cast across all candidates.
### Events
- **CandidateRegistered**: Triggered when a new candidate is registered.
- **Voted**: Triggered when a vote is cast.
### License
This project is licensed under the MIT License.
