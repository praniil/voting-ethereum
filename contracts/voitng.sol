// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Ballot{
    struct Voter {
        uint weight;    //weight is accumulated by delegation
        bool voted;
        address delegate; //person delgated to  
        uint vote; 
    }

    struct Proposal {
        bytes32 name;
        uint voteCount; //number of accumulated votes
    }

    address public chairperson;

    mapping(address => Voter) public voters;

    //dynamically sized array
    Proposal[] public proposals;

    constructor(bytes32[] memory proposalNames) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;

        for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount : 0
            }));
        }        
    }
}
