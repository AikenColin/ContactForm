using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using DatabaseHelper;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using OpenPop;
using OpenPop.Pop3;
using OpenPop.Mime;
using OpenPop.Mime.Header;
using OpenPop.Common;
using System.Net.Mail;
using System.Web.UI.HtmlControls;
using System.Configuration;
using System.Windows.Forms;

namespace WebApplication1
{
    public partial class contact_kristal_bell : System.Web.UI.Page
    {
        string PrimaryEmail = string.Empty;
        string PassWord = string.Empty;
        string CopyToEmail = string.Empty;
        string CopyToEmail2 = string.Empty;

        public string _PrimaryEmail
        {
            get
            {
                return PrimaryEmail;
            }
            set
            {
                PrimaryEmail = value;
            }
        }

        public string _PassWord
        {
            get
            {
                return PassWord;
            }
            set
            {
                PassWord = value;
            }
        }

        public string _CopyToEmail
        {
            get
            {
                return CopyToEmail;
            }
            set
            {
                CopyToEmail = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            Repeat.DataSource = SqlDataSource1;
            Repeat.DataBind();
        }
       
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtContact.Text != string.Empty && txtEmail.Text != string.Empty && txtCity.Text != string.Empty && txtState.Text != string.Empty && txtQuestion.Value != string.Empty)
            {
                FillInfo.Style.Add("display", "none;");
                btnSubmit.Visible = false;
                Connect(PrimaryEmail, PassWord, CopyToEmail);

                try
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    mail.From = new MailAddress(txtEmail.Text);
                    mail.To.Add(PrimaryEmail);
                    mail.Subject = txtContact.Text;
                    mail.Body = txtName.Text + "\n" + txtContact.Text + "\n" + txtCity.Text + "\n" + txtState.Text + "\n" + txtPhn.Text + "\n" + txtEmail.Text + "\n" + "\n" + txtQuestion.Value;
                    mail.CC.Add(CopyToEmail);
                    mail.CC.Add(CopyToEmail2);

                    SmtpServer.Port = 587;
                    SmtpServer.Credentials = new System.Net.NetworkCredential(PrimaryEmail, PassWord);
                    SmtpServer.EnableSsl = true;

                    SmtpServer.Send(mail);
                }

                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }

                try
                {
                    MailMessage mail2 = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    mail2.From = new MailAddress(txtEmail.Text);
                    mail2.To.Add(txtEmail.Text);
                    mail2.Subject = "XXXXXXXX XXXX XXXXX";
                    mail2.Body = "Hello " + txtContact.Text + "," + "\n" + "\n" + "Thank you for contacting us. A representative will be in touch shortly." + "\n" + "\n" + "Thanks," + "\n" + "XXXXXXX XXXX Staff" + "\n" + "\n" + "Please Do Not Reply to this Email. For immediate assistance please give us a call at 1-800-XXX-XXXX or 1-XXX-XXX-XXXX";

                    SmtpServer.Port = 587;
                    SmtpServer.Credentials = new System.Net.NetworkCredential(PrimaryEmail, PassWord);
                    SmtpServer.EnableSsl = true;

                    SmtpServer.Send(mail2);

                    txtName.Text = string.Empty;
                    txtContact.Text = string.Empty;
                    txtEmail.Text = string.Empty;
                    txtPhn.Text = string.Empty;
                    txtCity.Text = string.Empty;
                    txtState.Text = string.Empty;
                    txtQuestion.Value = string.Empty;

                    MessageEntry.ID.Contains("liName");
                    liName.Style.Add("display", "none;");
                    MessageEntry.ID.Contains("liContact");
                    liContact.Style.Add("display", "none");
                    MessageEntry.ID.Contains("liEmail");
                    liEmail.Style.Add("display", "none");
                    MessageEntry.ID.Contains("liPhone");
                    liPhone.Style.Add("display", "none");
                    MessageEntry.ID.Contains("liCity");
                    liCity.Style.Add("display", "none");
                    MessageEntry.ID.Contains("liState");
                    liState.Style.Add("display", "none");
                    MessageEntry.ID.Contains("liMessage");
                    liMessage.Style.Add("display", "none");
                    btnSubmit.Visible = false;
                    MessageEntry.ID.Contains("liSent");
                    liSent.Style.Add("display", "block");
                }

                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }

            else if (txtContact.Text == string.Empty || txtEmail.Text == string.Empty || txtCity.Text == string.Empty || txtState.Text == string.Empty || txtQuestion.Value == string.Empty)
            { FillInfo.Style.Add("display", "block"); }
        }

       public void Connect(string PrimaryEmail, string PassWord, string CopyToEmail)
       {
           Database db = new Database("KBellString");

           db.Command.CommandType = CommandType.StoredProcedure;
           db.Command.CommandText = "SP1";

           DataTable dt = db.ExecuteQuery();
           if (dt.Rows.Count > 0)
           {
               DataRow dr = dt.Rows[0];
               InitializeBusinessData(dr);
           }
       }

       public void InitializeBusinessData(DataRow dr)
       {
           PrimaryEmail = dr["PrimaryEmail"].ToString();
           PassWord = dr["Password"].ToString();
           CopyToEmail = dr["CopyToEmail"].ToString();
           CopyToEmail2 = dr["CopyToEmail2"].ToString();
       }

      
    }
}
