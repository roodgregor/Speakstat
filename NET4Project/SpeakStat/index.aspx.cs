using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SpeakStat
{
    public partial class LandingPage : System.Web.UI.Page
    {        
        private string connString = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
           if (!Page.IsPostBack)
                Session["usertype"] = String.Empty;
           if(Session["LOGGED"] != null)
            {
                if (Session["LOGGED"].ToString() == "Invalid")
                {
                    Response.Write("<script type='text/javascript'>alert('Log In to Continue!');</script>");
                    Session.Clear();
                }
            }
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("SELECT AccID FROM Accounts where Username='" + LoginUsernametxt.Text + "' and UserPass ='" + LoginUserpasstxt.Text + "'", con);
            SqlCommand com = new SqlCommand("SELECT AccID FROM Accounts where Email='" + LoginUsernametxt.Text + "' and UserPass ='" + LoginUserpasstxt.Text + "'", con);
            con.Open();

            bool exists = true;
            int id = Convert.ToInt32(cmd.ExecuteScalar());
            if(id==0)
            {
                id = Convert.ToInt32(com.ExecuteScalar());
                if (id == 0)
                    exists = false;                
            }

            if(exists==true)
            {
                SqlCommand type = new SqlCommand("SELECT AccType FROM Accounts Where AccID = '" + id.ToString() + "'", con);
                string usertype = type.ExecuteScalar().ToString();

                Session["LOGGED"] = "Success";

                if (usertype.ToUpper() == "TEACHER")
                {
                    Session["ProfessorID"] = id;
                    Response.Redirect("ProfessorInterface.aspx");
                }
                else if (usertype.ToUpper() == "ADMIN")
                {
                    Session["AdminID"] = id;
                    Response.Redirect("AdminInterface.aspx");
                }
                else if (usertype.ToUpper() == "PARENT")
                {
                    Session["ParentID"] = id;
                    Response.Redirect("ParentInterface.aspx");
                }
                else
                {
                    Session["StudentID"] = id;
                    Response.Redirect("StudentInterface.aspx");
                }
            }
            else
                Response.Write("<script type='text/javascript'>alert('No such user exists!');</script>");

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
                //check if existing
                SqlCommand cmd1 = new SqlCommand("SELECT 1 FROM Accounts WHERE Username = @user", con);
                cmd1.Parameters.AddWithValue("@user", registerUsername.Text);
                SqlDataReader rd = cmd1.ExecuteReader();
                if(!rd.HasRows)
                {
                    rd.Close();
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
                else
                {
                    rd.Close();
                    Response.Write("<script type='text/javascript'>alert('Username is already taken!');</script>");
                }

            }
        }

        protected void Studentbtn_Click(object sender, EventArgs e)
        {
            Session["usertype"] = "Student";
            forStudent.Style.Value = "opacity: 1";
            forTeacher.Style.Value = "opacity: 0.5";
            forParent.Style.Value = "opacity: 0.5";
        }

        protected void Parentbtn_Click(object sender, EventArgs e)
        {
            Session["usertype"] = "Parent";
            forStudent.Style.Value = "opacity: 0.5";
            forTeacher.Style.Value = "opacity: 0.5";
            forParent.Style.Value = "opacity: 1";
        }

        protected void Teacherbtn_Click(object sender, EventArgs e)
        {
            Session["usertype"] = "Teacher";
            forStudent.Style.Value = "opacity: 0.5";
            forTeacher.Style.Value = "opacity: 1";
            forParent.Style.Value = "opacity: 0.5";
        }
    }
}