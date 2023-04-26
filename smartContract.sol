pragma solidity ^0.8.0;

// TODO: 用 Go 去 调用 智能合约， 也可以用python，看你哪个熟练（我个人推荐你们用python，因为machine learning那部分要用python

contract Insurance {

    struct Pet{
        uint petID; // RFID tag id
        string name;
        string breed;
        string dob; // date of birth
        string gender;

    }

    struct Record {
        uint num; // the numbering of the record 
        uint petID;  // ID of the pet
        string recordType; // is it a vaccination, vet's appointment, etc? 
        uint date; // date of the vaccination, or appointment
        string additionalInfo; // any additional information about this current record

    }
    
    address private owner; // is this contract owner or pet owner?

    mapping(address => mapping(uint => Record[])) public records; // tracks all the records of the pets of the owner
    // main key: address of owner 
    // map 2 key: petIDs
    // map 2 value: array of records

    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        _;
    }

    constructor() {
        owner = msg.sender; 
        emit OwnerSet(address(0), owner);
    }

    function changeOwner(address newOwner) public isOwner {
        emit OwnerSet(owner, newOwner);
        owner = newOwner;
    }

    function getOwner() external view returns (address) {
        return owner;
    }


    // add pet to current owner
    // 没有这个isValue方法吧，利用length判断不为空？
    function addToOwner(uint _petID) public  returns (address){
        // if(!records[msg.sender][_petID].isValue){
        //     records[msg.sender][_petID];
        // }
    }

    // change the owner of the pet to newOwner
    function changePetOwner(address newOwner, uint _petID) public  returns (address){
        Record[] storage currPetRecord = records[msg.sender][_petID];
        records[newOwner][_petID] = currPetRecord;
    }

    // add record to petID
    function addRecord(uint _petID, string memory _recordType, uint _date, string memory _additionalInfo) public  returns(address) {  
        uint oldNum = records[msg.sender][_petID].length;
        // 没有add方法，给你贴了一个例子 在最后
        records[msg.sender][_petID].add(Record(
        {
            num: oldNum + 1, 
            petID: _petID,
            recordType: _recordType,
            date: _date, 
            additionalInfo: _additionalInfo
        }
    ));

    }

} 

//  struct Campaign {
//         address beneficiary;
//         uint fundingGoal;
//         uint numFunders;
//         uint amount;
//         mapping (uint => Funder) funders;
//     }
// ​
//     uint numCampaigns;
//     mapping (uint => Campaign) campaigns;
// ​
//     function newCampaign(address payable beneficiary, uint goal) public returns (uint campaignID) {
//         // campaignID 作为一个变量返回,也就是说不一定要有return，而且函数的返回值定义中也可以初始化变量。
//         campaignID = numCampaigns++; 
// ​
//         // 不能使用 "campaigns[campaignID] = Campaign(beneficiary, goal, 0, 0)"
//         // 因为RHS会创建一个包含映射的内存结构体 "Campaign"，而映射只能是storage
//         Campaign storage c = campaigns[campaignID];
//         c.beneficiary = beneficiary;
//         c.fundingGoal = goal;
//     }