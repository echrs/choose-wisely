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
        addProject("Javni zahodi", "");
        addProject("Coworking prostori", "");
        addProject("Pametna javna rasvjeta", "");
        addProject("Parkovi za pse", "");
        addProject("Vi\xC5\xA1e zelenila", "");
    }
    mapping(uint => Project) public projects;
    uint public projectsCount; //jer ne mozemo iz mappinga dobiti velicinu

    function addProject (string memory _name, string memory _description) private {
        projectsCount++;
        projects[projectsCount] = Project(projectsCount, _name, _description, 0);
    }

    function getVotedCount() public view returns (uint count) {
        for (uint i = 0; i < projectsCount; i++) {
            count += projects[i].voteCount;
        }
    }
    
    address[] private voters;
}