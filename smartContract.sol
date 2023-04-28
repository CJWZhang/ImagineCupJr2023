pragma solidity ^0.8.0;

// TODO: 用 Go 去 调用 智能合约， 也可以用python，看你哪个熟练（我个人推荐你们用python，因为machine learning那部分要用python

contract Insurance {

    struct Record {
        uint num; // the numbering of the record 
        uint petID;  // ID of the pet
        string recordType; // is it a vaccination, vet's appointment, etc? 
        uint date; // date of the vaccination, or appointment
        string additionalInfo; // any additional information about this current record

    }

    struct Pet{
        uint petID; // RFID tag id
        string name;
        string breed;
        string dob; // date of birth
        string gender;

        Record[] petRecords; // records of the pet

    }

    
    address private owner; 
    // is this contract owner or pet owner? --> This is the contract owner which I believe to be the pet owner, or the person calling the contract?

    mapping(address => Pet[]) public records; 
    // tracks all the records of the pets of the owner
    // key: address of owner 
    // value: array of their pets


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
    function addToOwner(uint _petID) public  returns (address){
        // if(records[msg.sender][_petID].length != 0){
        if(records[msg.sender][_petID].petRecords.length != 0){
            records[msg.sender][_petID];
        }
    }

    // change the owner of the pet to newOwner
    function changePetOwner(address newOwner, uint _petID) public  returns (address){
        // Record[] storage currPetRecord = records[msg.sender][_petID];
        Record[] storage currPetRecord = records[msg.sender][_petID].petRecords;
        // 这里不对
        // records[newOwner][_petID] = currPetRecord;
        
    }

    // add record to petID
    function addRecord(uint _petID, string memory _recordType, uint _date, string memory _additionalInfo) public  returns(address) {  

        Pet storage p = records[msg.sender][_petID];

        Record memory newRecord;
        newRecord.petID = _petID;
        newRecord.recordType = _recordType;
        newRecord.date = _date;
        newRecord.additionalInfo = _additionalInfo;
        // 
        p.petRecords.push(newRecord);


    }

} 
