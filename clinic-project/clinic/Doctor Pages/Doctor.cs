using System;
using System.Collections.Generic;
using System.Collections;
using System.Web;

namespace clinic.Doctor_Pages
{
    public class Doctor
    {
        private int id;
        private String name;
        private String surname;
        private String fathers_name;
        private String specialty;

        public Doctor(){}
        public Doctor(String Name, String Surname, String Fathers_name, String Specialty) {
            this.name = Name;
            this.surname = Surname;
            this.fathers_name = Fathers_name;
            this.specialty = Specialty;
        }

        public int Id {
            get { return id; }
            set { id = value; }
        }

        public String Name {
            get { return name; }
            set { name = value; }
        }

        public String Surame
        {
            get { return surname; }
            set { surname = value; }
        }

        public String Fathers_name
        {
            get { return fathers_name; }
            set { fathers_name = value; }
        }

        public String Specialty
        {
            get { return specialty; }
            set { specialty = value; }
        }
    }

    public static class DoctorSet {
        public static Hashtable docs = new Hashtable();
    }
}