using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpeakStat
{
    public partial class LandingPage : System.Web.UI.Page
    {
        private string usertype = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection("Connection String");
            //SqlCommand cmd = new SqlCommand("SELECT AccID FROM Account where Username='"+LoginUsernametxt.Text+"' and UserPass ='" + LoginUserpasstxt.Text +"'",con);
            //con.Open();
            
            //Response.Redirect("Page.aspx");

            //con.Close();

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if (usertype == "")
            {

            }

            else
            {
                //SqlConnection con = new SqlConnection("Connection String");
                //con.Open();
                //SqlCommand cmd = new SqlCommand("AddUser", con);
                //cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@FName", givenName.Text);
                //cmd.Parameters.AddWithValue("@LName", lastName.Text );
                //cmd.Parameters.AddWithValue("@Email", Emailtxt.Text);
                //cmd.Parameters.AddWithValue("@UserName", registerUsername.Text);
                //cmd.Parameters.AddWithValue("@Userpass", Passwordtxt.Text);
                //cmd.Parameters.AddWithValue("@AccType", usertype);
                //cmd.Parameters.AddWithValue("@JoinDate", DateTime.Today );
                //cmd.ExecuteNonQuery();

                //Response.Redirect("Page.aspx");
            }
        }

        protected void Studentbtn_Click(object sender, EventArgs e)
        {
            usertype = "Student";
        }

        protected void Parentbtn_Click(object sender, EventArgs e)
        {
            usertype = "Parent";
        }

        protected void Teacherbtn_Click(object sender, EventArgs e)
        {
            usertype = "Teacher";
        }
    }
}