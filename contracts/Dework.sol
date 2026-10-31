// SPDX-lICENSE-IDENTIFIER:: GPL-3.0
pragma solidity =0.8.34;
import {FreelancerProfile, EmployerProfile} from "./types/DeworkTypes.sol";
contract Dework{
    uint256 connectFee=65536;  //camelCase //state variables
    address public initialOwner;
    FreelancerProfile[] public freelancerProfiles;
    EmployerProfile[] public employerProfiles;
    constructor(address _initialOwner){
        initialOwner=_initialOwner;
    }

    function getNumberOfRegisteredFreelancers() public view returns(uint256){
        return freelancerProfiles.length;
    }
    
    function registerFreelancerProfile(
        string calldata name, 
        uint8 experienceYears,
        uint256 hourlyRateWei
    ) external{
        uint256 freelancerId=getNumberOfRegisteredFreelancers();
        FreelancerProfile memory freelancerProfile=FreelancerProfile({
            id:freelancerId,
            name:name,
            wallet:msg.sender,
            experienceYears:experienceYears,
            isAvailableHire:true,
            hourlyRateWei:hourlyRateWei
        });
        freelancerProfiles.push(freelancerProfile);
    }
    function getFreelancerProfiles() public view returns (FreelancerProfile[] memory){
        return freelancerProfiles;
    }
    function getNumberOfRegisteredEmployers() public view returns(uint256){
        return employerProfiles.length;
    }
    
    function registerEmployerProfile(string calldata employerName) external{
        uint256 employerId=getNumberOfRegisteredEmployers();
        EmployerProfile memory employerProfile=EmployerProfile({
            id:employerId,
            name:employerName,
            isHiring:true,
            wallet:msg.sender
        });
        employerProfiles.push(employerProfile);
    }
    function getEmployerProfiles() public view returns (EmployerProfile[] memory){
        return employerProfiles;
    }
    
    // function updateHourlyRate(uint256 _hourlyRate) public {
    //     hourlyRate = _hourlyRate;
    // }
    // function getHourlyRate() public view returns(uint256){
    //     return hourlyRate;
    // }
    // function getFreeLancerProfile() public pure returns (uint24){
    // }
}
