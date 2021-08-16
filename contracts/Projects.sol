pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;

contract Projects {
    struct Project {
        uint id;
        string name;
        string description;
        uint voteCount;
    }

    constructor() public {
        addProject("Vi\xC5\xA1e ko\xC5\xA1eva za sme\xC4\x87e", "");
        addProject("Coworking prostori", "");
        addProject("Pametna javna rasvjeta", "");
    }
    mapping(uint => Project) public projects;
    uint public projectsCount; //jer ne mozemo iz mappinga dobiti velicinu

    mapping(address => bool) public voters;

    function addProject (string memory _name, string memory _description) private {
        projectsCount++;
        projects[projectsCount] = Project(projectsCount, _name, _description, 0);
    }

    function getVotedCount() public view returns (uint count) {
        for (uint i = 0; i < projectsCount; i++) {
            count += projects[i].voteCount;
        }
    }

    function vote(uint _projectId) public {
        //checking that this address hasn't voted before
        require(!voters[msg.sender]);
        //make sure that projectid is valid
        require(_projectId > 0 && _projectId <= projectsCount);
        //setting that a voter has voted
        voters[msg.sender] = true;
        //incrementing votecount for project
        projects[_projectId].voteCount++;
    }

}