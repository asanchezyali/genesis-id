// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GenesisId {
    struct User {
        string firstName;
        string lastName;
        string username;
        string email;
        string homeAddress;
        string dateOfBirth;
        string education;
        string workHistory;
        string phoneNumber;
        string jobTitle;
        string x;
        string instagram;
        string tiktok;
        string youtube;
        string linkedin;
        string info;
        string[] skills;
        string imageURL;
        bool exists;
        uint[] appliedJobs; 
        Visibility visibility;
    }

    struct Visibility {
        bool education;
        bool workHistory;
        bool phoneNumber;
        bool homeAddress;
        bool dateOfBirth;
    }

    struct BasicInfo {
        string firstName;
        string lastName;
        string email;
        string homeAddress;
        string dateOfBirth;
        string phoneNumber;
    }

    struct SocialLinks {
        string x;
        string instagram;
        string tiktok;
        string youtube;
        string linkedin;
    }

    struct ProfessionalInfo {
        string education;
        string workHistory;
        string jobTitle;
        string info;
        string[] skills;
        string imageURL;
    }

    mapping(string => User) private users;
    mapping(address => string) private addressToUsername;
    mapping(string => bool) private usernames; // To check uniqueness of username


    modifier onlyUniqueUsername(string memory username) {
        require(!usernames[username], "Username already exists.");
        _;
    }

    function createUser(
        string memory _username,
        BasicInfo memory _basicInfo,
        ProfessionalInfo memory _professionalInfo,
        SocialLinks memory _socialLinks,
        Visibility memory _visibility
    ) public onlyUniqueUsername(_username) {
        User storage user = users[_username];
        user.firstName = _basicInfo.firstName;
        user.lastName = _basicInfo.lastName;
        user.username = _username;
        user.email = _basicInfo.email;
        user.homeAddress = _basicInfo.homeAddress;
        user.dateOfBirth = _basicInfo.dateOfBirth;
        user.phoneNumber = _basicInfo.phoneNumber;
        user.education = _professionalInfo.education;
        user.workHistory = _professionalInfo.workHistory;
        user.jobTitle = _professionalInfo.jobTitle;
        user.x = _socialLinks.x;
        user.instagram = _socialLinks.instagram;
        user.tiktok = _socialLinks.tiktok;
        user.youtube = _socialLinks.youtube;
        user.linkedin = _socialLinks.linkedin;
        user.info = _professionalInfo.info;
        user.skills = _professionalInfo.skills;
        user.imageURL = _professionalInfo.imageURL;
        user.exists = true;
        user.visibility = _visibility;
        usernames[_username] = true;
        addressToUsername[msg.sender] = _username;
    }

    function editUser(
        string memory _username,
        BasicInfo memory _basicInfo,
        ProfessionalInfo memory _professionalInfo,
        SocialLinks memory _socialLinks,
        Visibility memory _visibility
    ) public {
        require(users[_username].exists, "User does not exist.");
        User storage user = users[_username];
        user.firstName = _basicInfo.firstName;
        user.lastName = _basicInfo.lastName;
        user.email = _basicInfo.email;
        user.homeAddress = _basicInfo.homeAddress;
        user.dateOfBirth = _basicInfo.dateOfBirth;
        user.phoneNumber = _basicInfo.phoneNumber;
        user.education = _professionalInfo.education;
        user.workHistory = _professionalInfo.workHistory;
        user.jobTitle = _professionalInfo.jobTitle;
        user.x = _socialLinks.x;
        user.instagram = _socialLinks.instagram;
        user.tiktok = _socialLinks.tiktok;
        user.youtube = _socialLinks.youtube;
        user.linkedin = _socialLinks.linkedin;
        user.info = _professionalInfo.info;
        user.skills = _professionalInfo.skills;
        user.imageURL = _professionalInfo.imageURL;
        user.visibility = _visibility;
    }

    function getUserByUsername(string memory _username) public view returns (
        BasicInfo memory basicInfo,
        ProfessionalInfo memory professionalInfo,
        SocialLinks memory socialLinks,
        Visibility memory visibility
    ) {
        require(users[_username].exists, "User does not exist.");
        User storage user = users[_username];
        basicInfo = BasicInfo(
            user.firstName,
            user.lastName,
            user.email,
            user.homeAddress,
            user.dateOfBirth,
            user.phoneNumber
        );
        professionalInfo = ProfessionalInfo(
            user.education,
            user.workHistory,
            user.jobTitle,
            user.info,
            user.skills,
            user.imageURL
        );
        socialLinks = SocialLinks(
            user.x,
            user.instagram,
            user.tiktok,
            user.youtube,
            user.linkedin
        );
        visibility = user.visibility;
        return (basicInfo, professionalInfo, socialLinks, visibility);
    }

    function getUserByAddress(address _userAddress) public view returns (
        BasicInfo memory basicInfo,
        ProfessionalInfo memory professionalInfo,
        SocialLinks memory socialLinks,
        Visibility memory visibility
    ) {
        string memory username = addressToUsername[_userAddress];
        return getUserByUsername(username);
    }

    function getUsernameByAddress(address _userAddress) public view returns (string memory) {
        return addressToUsername[_userAddress];
    }

    function setVisibility(
        string memory _username, 
        bool _education,
        bool _workHistory,
        bool _phoneNumber,
        bool _homeAddress,
        bool _dateOfBirth
    ) public {
        require(users[_username].exists, "User does not exist.");
        User storage user = users[_username];
        user.visibility.education = _education;
        user.visibility.workHistory = _workHistory;
        user.visibility.phoneNumber = _phoneNumber;
        user.visibility.homeAddress = _homeAddress;
        user.visibility.dateOfBirth = _dateOfBirth;
    }

    function getVisibility(string memory _username) public view returns (Visibility memory) {
        require(users[_username].exists, "User does not exist.");
        return users[_username].visibility;
    }
}



