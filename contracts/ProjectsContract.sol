pragma solidity >=0.4.22 <0.9.0;

contract ProjectsContract {
    struct Project {
        string name;
        uint256 voteCount;
    }
    struct Person {
        bool registered;
        bool voted;
        uint256 votedWhen;
    }

    Project[] public projects;

    mapping(address => Person) people;
    uint256 public peopleCount;

    function getAllProjects() public view returns (Project[] memory) {
        return projects;
    }

    function getVotedCount() public view returns (uint256 count) {
        for (uint256 i = 0; i < projects.length; i++) {
            count += projects[i].voteCount;
        }
    }

    function getMostVoted() public view returns (Project memory) {
        uint256 index = 0;
        for (uint256 i = 1; i < projects.length; i++) {
            if (projects[i].voteCount > projects[index].voteCount) {
                index = i;
            }
        }
        return projects[index];
    }

}