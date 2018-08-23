using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace SpeakStat
{
    public partial class LandingPage : System.Web.UI.Page
    {        
        private string connString = @"Data Source=MEDONUTEST1999\JREMEDINA;Initial Catalog=SPKSTAT;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                Session["usertype"] = String.Empty;
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("SELECT AccID FROM Account where Username='" + LoginUsernametxt.Text + "' and UserPass ='" + LoginUserpasstxt.Text + "'", con);
            con.Open();

            Response.Write("<script type='text/javascript'>alert('Success!');</script>");
            //Response.Redirect("Page.aspx");

            con.Close();

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            if ((string)Session["usertype"] == String.Empty)
            {
                Response.Write("<script type='text/javascript'>alert('Please select a user type!');</script>");
            }

            else
            {
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd = new SqlCommand("AddUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@FName", givenName.Text);
                cmd.Parameters.AddWithValue("@LName", lastName.Text);
                cmd.Parameters.AddWithValue("@Email", Emailtxt.Text);
                cmd.Parameters.AddWithValue("@UserName", registerUsername.Text);
                cmd.Parameters.AddWithValue("@Userpass", Passwordtxt.Text);
                cmd.Parameters.AddWithValue("@AccType", (string)Session["usertype"]);
                cmd.Parameters.AddWithValue("@JoinDate", DateTime.Today);
                cmd.ExecuteNonQuery();

                Response.Write("<script type='text/javascript'>alert('Success!');</script>");
                //Response.Redirect("Page.aspx");
            }
        }

        protected void Studentbtn_Click(object sender, EventArgs e)
        {
             Session["usertype"] = "Student";
        }

        protected void Parentbtn_Click(object sender, EventArgs e)
        {
            Session["usertype"] = "Parent";
        }

        protected void Teacherbtn_Click(object sender, EventArgs e)
        {
            Session["usertype"] = "Teacher";
        }
    }
}