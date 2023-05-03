import java.util.*;
import java.io.*;
import java.awt.image.BufferedImage;

public class smartContract {

    static class Record {
        int num; // the numbering of the record 
        int petID;  // ID of the pet
        String recordType; // is it a vaccination, vet's appointment, etc? 
        int date; // date of the vaccination, or appointment
        String additionalInfo; // any additional information about this current record

        Record(int num, int petID, String recordType, int date, String additionalInfo){
            this.num = num;
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

    HashMap<String, ArrayList<Pet>> records = new HashMap<>();

    String owner= "";

    void addOwner(String own){ // add owner to map: own = owner 
        records.put(own, new ArrayList<Pet>());
    }

    // add pet to owner
    void addToOwner(int _petID, BufferedImage _img, String _name, String _breed, int _dob, String _gender, ArrayList<Record> _petRecords){

        Pet pet = new Pet(_petID, _img, _name, _breed, _dob, _gender, _petRecords);
        records.get(owner).add(pet);

    }

    void changePetOwner(){

    }

    void addRecord(){

    }

    void removePet(Pet p){ // remove this pet from owner
        records.get(owner).remove(p);
    }

    void removeRecord(Record r, int _petID){
        ArrayList<Record> pR = records.get(owner).get(_petID).petRecords;
        //indexOf(r);
        int index = pR.indexOf(r);
        records.get(owner).get(_petID).petRecords.remove(index);
    }


    public static void main(String[] args) throws Exception {

    }

}