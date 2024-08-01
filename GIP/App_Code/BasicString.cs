using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;

namespace GIP.App_Code
{
    public class BasicString
    {
       private string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GIPInatiativesConnectionString"].ConnectionString;
        string GsbUser = "MoDEEstg";
        string GsbPass = "M0!cT@123";
        string ClientID = "fbdbadb546c2f7c466260453732843a2";
        string ClientSecret = "34a88c54e196a6bc3cbc37fec9f75612";
        public  string Errorpath;

        public string GetConnectionString { get { return ConnectionString; } }
        public string GetGsbUser { get { return GsbUser; } }
        public string GetGsbPass { get { return GsbPass; } }
        public string GetClientID { get { return ClientID; } }
        public string GetClientSecret { get { return ClientSecret; } }

        public bool IsNumeric(string text)
        {
            double test;
            return double.TryParse(text, out test);
        }

        public bool sndMailLocal(string recip_From, string recip_To, string Subject, string Message_body)
        {
            try
            {
                // Create a MailMessage object
                var msgObj = new MailMessage();

                // Specify from address and display name
                var AddressFrom = new MailAddress(recip_From, ",وزارة الاقتصاد الرقمي");

                // Specify the recipient address
                var rec2 = new MailAddress(recip_To);

                // Set email properties
                msgObj.Subject = Subject;
                msgObj.IsBodyHtml = true;
                msgObj.Body = Message_body;
                msgObj.To.Add(rec2);

                // Add BCC recipients if any
                string BCC_email = "EForms@modee.gov.jo";
                if (!string.IsNullOrEmpty(BCC_email) && BCC_email != recip_To)
                {

                    //msgObj.Bcc.Add(new MailAddress("Rama.Rahahleh@modee.gov.jo"));
                }

                // Set the sender address
                msgObj.From = AddressFrom;
                msgObj.BodyEncoding = System.Text.Encoding.UTF8;

                StringBuilder emlContent = new StringBuilder();
                emlContent.AppendLine($"From: {recip_From}");
                emlContent.AppendLine($"To: {recip_To}");
                emlContent.AppendLine($"Subject: {Subject}");
                emlContent.AppendLine("Content-Type: text/html; charset=UTF-8");
                emlContent.AppendLine(); // Empty line between headers and body
                emlContent.AppendLine(Message_body);

                //please do'not delete 
                string outputFolder = @"C:\Users\rama.r\Desktop\Mail\GIP"; // Change this to your desired folder path

                // Create a unique file name for the email
                string fileName = $"email_{DateTime.Now.ToString("yyyyMMddHHmmss")}.eml";

                // Combine the folder path and file name
                string filePath = Path.Combine(outputFolder, fileName);

                // Write email content to the .eml file
                File.WriteAllText(filePath, emlContent.ToString(), Encoding.UTF8);
                return true;
            }
            catch (Exception ex)
            {
                // Handle exceptions
                Console.WriteLine("Error: " + ex.Message);
                return false;
            }
        }
        public bool sendMail(string recip_To, string recip_From, string Subject, string Message_body)
        {
            var msgObj = new MailMessage();
            var client = new SmtpClient("10.0.18.180");
            client.Host = "10.0.18.180";
            client.Port = 25;
            //Specify from address and display name
            var AddressFrom = new MailAddress(recip_From, "MoDEE");

            string BCC_email = "rama.rahahleh@modee.gov.jo";
            var rec2 = new MailAddress(recip_To);
            msgObj.Subject = Subject;
            msgObj.IsBodyHtml = true;
            msgObj.Body = Message_body;
            msgObj.To.Add(rec2);
            if ((BCC_email ?? "") != (recip_To ?? ""))
            {
                msgObj.Bcc.Add(new MailAddress(BCC_email));


            }

            msgObj.From = AddressFrom;
            msgObj.BodyEncoding = Encoding.UTF8;
            client.Send(msgObj);
            return true;
        }

    }
}