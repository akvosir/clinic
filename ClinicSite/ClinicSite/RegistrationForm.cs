using System;
using System.Collections.Generic;
using System.Collections;
using MySql.Data.MySqlClient;

namespace clinic
{
    public class RegistrationForm
    {
        private String surname { get; set; }
        private String name { get; set; }
        private String fathers_name { get; set; }
        private DateTime birthday { get; set; }
        private String gender { get; set; }
        private String email { get; set; }
        private String address { get; set; }
        private String city { get; set; }
        private int zip { get; set; }
        private String telephone { get; set; }
        private String password { get; set; }


        public RegistrationForm() { }

        public RegistrationForm(String Surname, String Name, String Fathers_name, DateTime Birthday, String Gender, String Email, String Address, String City, int Zip, String Telephone, String Password)
        {
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
            this.password = password;
        }


        public String Surname
        {
            get { return surname; }
            set { surname = value; }
        }

        public String Name
        {
            get { return name; }
            set { name = value; }
        }

        public String Fathers_name
        {
            get { return fathers_name; }
            set { fathers_name = value; }
        }

        public DateTime Birthday
        {
            get { return birthday; }
            set { birthday = value; }
        }

        public String Gender
        {
            get { return gender; }
            set { gender = value; }
        }

        public String Email
        {
            get { return email; }
            set { email = value; }
        }

        public String Address
        {
            get { return address; }
            set { address = value; }
        }

        public String City
        {
            get { return city; }
            set { city = value; }
        }

        public int Zip
        {
            get { return zip; }
            set { zip = value; }
        }

        public String Telephone
        {
            get { return telephone; }
            set { telephone = value; }
        }

        public String Password
        {
            get { return password; }
            set { password = value; }
        }

    }

    public static class PatientSet
    {
        public static Hashtable set = new Hashtable();

    }
}