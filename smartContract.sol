pragma solidity ^0.8.0;

// TODO: 用 Go 去 调用 智能合约

contract Insurance {

    struct Record {
        address owner; // owner of the pet
        uint petID;  // ID of the pet
        string recordType; // is it a vaccination, vet's appointment, etc? 
        uint date; // date of the vaccination, or appointment
        string additionalInfo; // any additional information about this current record
    }

    address private owner;
    int private petId; // make it into a map
    uint[] pets; // pets of the owner

    mapping(uint => Record) records; // tracks all the records of the pets of the owner
    // key: dog 
    // value: petIDs


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

    // Problem 1: 
    // check pet and owner --> use map 

    // TODO: pet and record (map)


    // Problem 2: Function
    // TODO: add pet (pet.appendToOwner)
    //        change owner
    //          add record 

    function addRecord(Record record) public view returns(address newContract) {  
        // function body
    }

} 