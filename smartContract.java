import java.util.*;
import java.io.*;
import java.awt.image.BufferedImage;

public class smartContract {

    static class Record { 
        int petID;  // ID of the pet
        String recordType; // is it a vaccination, vet's appointment, etc? 
        int date; // date of the vaccination, or appointment
        String additionalInfo; // any additional information about this current record

        Record(int petID, String recordType, int date, String additionalInfo){
            this.petID = petID;
            this.recordType = recordType;
            this.date = date;
            this.additionalInfo = additionalInfo;
        }


    }

    static class Pet{
        int petID; // RFID tag id
        BufferedImage img; 
        String name;
        String breed;
        int dob; // date of birth
        String gender;

        ArrayList<Record> petRecords; // records of the pet


        Pet(int petID, BufferedImage img, String name, String breed, int dob, String gender, ArrayList<Record> petRecords){
            this.petID = petID;
            this.img = img;
            this.name = name;
            this.breed = breed;
            this.dob = dob;
            this.gender = gender;
            this.petRecords = petRecords;
        }

    }

    HashMap<String, HashMap<Integer, Pet>> records = new HashMap<>();
    /*
     outer map: key is the owner, value is an inner mpa
     inner map: key is petID, value is the pet
     */

    String own = ""; //   address private owner; in Solidity 

    // add owner to the Map
    void addOwner(String owner){ 
        records.put(owner, new HashMap<>());
    }

    // add pet to owner
    void addToOwner(String owner, int _petID, BufferedImage _img, String _name, String _breed, int _dob, String _gender, ArrayList<Record> _petRecords){

        Pet pet = new Pet(_petID, _img, _name, _breed, _dob, _gender, _petRecords);
        records.get(owner).put(_petID, pet);

    }

    // TODO: move the pet from oldOwner to newOwner
    void changePetOwner(String oldOwner, String newOwner, int petID){
        HashMap<Integer, Pet> petsOfOldOwner = records.get(oldOwner);
        
        Pet pet =  petsOfOldOwner.get(petID);
        petsOfOldOwner.remove(pet);

        records.get(newOwner).put(petID, pet);

    }

    // add new record to dog of petID
    void addRecord(String owner, int _petID, int _num, String _recordType, int _date, String _additionalInfo){

        ArrayList<Record> pR = records.get(owner).get(_petID).petRecords;
        Record r = new Record(_petID, _recordType, _date, _additionalInfo);
        pR.add(r); // add the record to the record array

    }

    // remove pet from owner
    void removePet(String owner, Pet p){ 
        records.get(owner).remove(p);
    }

    // remove a record from records
    void removeRecord(String owner, Record r, int _petID){
        ArrayList<Record> pR = records.get(owner).get(_petID).petRecords;
        //indexOf(r);
        int index = pR.indexOf(r);
        records.get(owner).get(_petID).petRecords.remove(index);
    }


    public static void main(String[] args) throws Exception {

    }

}