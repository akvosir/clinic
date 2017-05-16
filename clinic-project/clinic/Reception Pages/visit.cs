using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace clinic.Reception_Pages
{
    public class Visit
    {
        private Card patients_card;
        private String reason;
        private String symptoms;
        private String diagnosis;
        private String med_name;
        private DateTime med_start;
        private DateTime med_end; //med_duration
        private String recom_consult;
        private String recom_analysis;
        private DateTime next_visit;

        public Visit(Card pat_card, String Reason, String Symptoms, String Diagnosis, String Med_name, DateTime Med_start, DateTime Med_end, String Recom_consult, String Recom_analysis, DateTime Next_visit ) {
            this.patients_card = pat_card;
            this.reason = Reason;
            this.symptoms = Symptoms;
            this.diagnosis = Diagnosis;
            this.med_name = Med_name;
            this.med_start = Med_start;
            this.med_end = Med_end;
            this.recom_consult = Recom_consult;
            this.recom_analysis = Recom_analysis;
            this.next_visit = Next_visit;
        }
    }
}