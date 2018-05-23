pragma solidity ^0.4.2;

contract Election {
    // Model a Candidate
    struct Candidate {
      uint id;
      string name;
      uint voteCount;
    }

    // Store Candidate
    mapping(address => bool) public voters;
    // Fetch Candidate
    mapping(uint => Candidate) public candidates;

    // Store Candidates Count
    uint public candidatesCount;

    // voted event
    event votedEvent(uint indexed _candidateId);

    // Constructor
    constructor () public {
      addCandidate("Candidate 1");
      addCandidate("Candiadte 2");
    }

    function addCandidate (string _name) private {
      candidatesCount ++;
      candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public{
      //require they havent voted before
      require(!voters[msg.sender]);

      // requiere a valid candidate
      require(_candidateId>0 && _candidateId<= candidatesCount);

      //record that voter has voted
      voters[msg.sender] = true;

      //update candidate vote
      candidates[_candidateId].voteCount ++;

      // trigger voted event
      emit votedEvent(_candidateId);
    }
}
