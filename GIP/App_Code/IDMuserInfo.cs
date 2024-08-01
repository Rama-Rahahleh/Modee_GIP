using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GIP
{
    public class IDMuserInfo
    {
        // Root myDeserializedClass = JsonConvert.DeserializeObject<Root>(myJsonResponse);
        public class Attributes
        {
            public List<string> egovUserTN_ar { get; set; }
            public List<string> egovUserLN_ar { get; set; }
            public List<string> givenName { get; set; }
            public List<string> userType { get; set; }
            public List<string> isActiveUser { get; set; }
            public List<string> userFullName_ar { get; set; }
            public List<string> egovUserTN { get; set; }
            public List<string> userName { get; set; }
            public List<string> gender { get; set; }
            public List<string> birthDate { get; set; }
            public List<string> userFullName { get; set; }
            public List<string> dn { get; set; }
            public List<string> sn { get; set; }
            public List<string> egov_showProfilePhoto { get; set; }
            public List<string> objectClass { get; set; }
            public List<string> egovUserSN_ar { get; set; }
            public List<string> egovUserFN { get; set; }
            public List<string> cn { get; set; }
            public List<string> email { get; set; }
            public List<string> __UID__ { get; set; }
            public List<string> egovUserLN { get; set; }
            public List<string> cn_ar { get; set; }
            public List<string> egovUserSN { get; set; }
            public List<string> nationalNumber { get; set; }
            public List<string> egovUserFN_ar { get; set; }
            public List<string> mobile { get; set; }
        }

        public class Result
        {
            public string id { get; set; }
            public Attributes attributes { get; set; }
            public string firstName { get; set; }
            public string lastName { get; set; }
            public string mail { get; set; }
            public string mobile { get; set; }
            public object employeeType { get; set; }
            public object password { get; set; }
            public object department { get; set; }
            public string distinguishedName { get; set; }
            public string commonName { get; set; }
        }

        public class Root
        {
            public bool operationStatus { get; set; }
            public string responseCode { get; set; }
            public string responseMessgae { get; set; }
            public Result result { get; set; }
        }


    }
}