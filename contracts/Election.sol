pragma solidity ^0.4.2;

contract Election {
    // Model a Candidate
    struct Candidate {
      uint id;
      string name;
      uint voteCount;
    }

    // Store Candidate
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;

    // Store Candidates Count
    uint public candidatesCount;

    // Constructor
    constructor () public {
      addCandidate("Candidate 1");
      addCandidate("Candiadte 2");
    }

    function addCandidate (string _name) private {
      candidatesCount ++;
      candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}
