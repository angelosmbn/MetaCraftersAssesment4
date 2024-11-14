// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Assessment {
    // Struct to define a Candidate
    struct Candidate {
        string name;       // Name of the candidate
        uint256 voteCount; // Number of votes received by the candidate
    }

    // Mapping to store candidates using their ID as key
    mapping(uint256 => Candidate) public candidates;
    
    // Mapping to track if an address has voted
    mapping(address => bool) public voters;

    // Variables to track the number of candidates and total votes
    uint256 public candidatesCount;
    uint256 public totalVotes;
    
    // Address of the contract owner (only owner can register candidates)
    address public owner;

    // Events to log the registration of candidates and votes
    event CandidateRegistered(uint256 candidateId, string candidateName);
    event Voted(address voter, uint256 candidateId);

    // Modifier to restrict certain functions to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can register candidates.");
        _; // Placeholder for function execution
    }

    // Constructor that sets the owner and registers default candidates
    constructor() {
        owner = msg.sender; // Set the contract deployer as the owner
        // Register 3 default candidates upon deployment
        registerDefaultCandidates();
    }

    // Internal function to register 3 default candidates (Alice, Bob, and Charlie)
    function registerDefaultCandidates() internal {
        registerCandidate("Alice");
        registerCandidate("Bob");
        registerCandidate("Charlie");
    }

    // Function to register a new candidate, only callable by the contract owner
    function registerCandidate(string memory _name) public onlyOwner {
        candidatesCount++; // Increment candidate count
        candidates[candidatesCount] = Candidate(_name, 0); // Add new candidate
        emit CandidateRegistered(candidatesCount, _name); // Emit event for candidate registration
    }

    // Function for a user to vote for a candidate
    function vote(uint256 _candidateId) public {
        // Ensure the candidate ID is valid
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");
        
        // Increment vote count for the chosen candidate
        candidates[_candidateId].voteCount++;
        
        // Increment the total number of votes
        totalVotes++;
        
        // Emit event for the vote
        emit Voted(msg.sender, _candidateId);
    }

    // Function to get the number of votes for a specific candidate
    function getVotes(uint256 _candidateId) public view returns (uint256) {
        // Ensure the candidate ID is valid
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID.");
        
        // Return the vote count for the specified candidate
        return candidates[_candidateId].voteCount;
    }

    // Function to get the total number of votes across all candidates
    function getTotalVotes() public view returns (uint256) {
        return totalVotes; // Return the total votes cast
    }
}
