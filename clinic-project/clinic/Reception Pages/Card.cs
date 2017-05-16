using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic
{ 
    public class Card
    {
        private int idpc;
        private String surname;
        private String name;
        private String fathers_name;
        private DateTime birthday;
        private String gender;
        private String email;
        private String address;
        private String city;
        private int zip;
        private String telephone;

        public Card(int Idpc, String Surname, String Name, String Fathers_name, DateTime Birthday, String Gender, String Email, String Address, String City, int Zip, String Telephone) {
            this.idpc = Idpc;
            this.name = Name;
            this.surname = Surname;
            this.fathers_name = Fathers_name;
            this.birthday = Birthday;
            this.gender = Gender;
            this.email = Email;
            this.address = Address;
            this.city = City;
            this.zip = Zip;
            this.telephone = Telephone;            
        }

        public String getSurname { get; set; }
        /*private String name;
        private String fathers_name;
        private DateTime birthday;
        private String gender;
        private String email;
        private String city;
        private int zip;
        private String telephone;*/

        //create hashset of cards
        //get value by patient_id
    }

    public static class PatientSet {
        public static HashSet<Card> set;

        static PatientSet() {
        }
    }
}