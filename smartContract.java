import java.util.*;
import java.io.*;

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
        String name;
        String breed;
        String dob; // date of birth
        String gender;

        Record[] petRecords; // records of the pet


        Pet(int petID, String name, String breed, String dob, String gender, Record[] petRecords){
            this.petID = petID;
            this.name = name;
            this.breed = breed;
            this.dob = dob;
            this.gender = gender;
            this.petRecords = petRecords;
        }

    }

    HashMap<String, Pet[]> records = new HashMap<>();

    String ownerAdress = "";


    void addToOwner(){

    }

    void changePetOwner(){

    }

    void addRecord(){

    }

    void removePet(){

    }

    void removeRecord(){

    }


    public static void main(String[] args) throws Exception {

    }

}