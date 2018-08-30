using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SpeakStat
{
    public partial class ProfessorInterface : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["ProfessorID"]);
            if (!Page.IsPostBack)
            {
                ViewClassPanel.Visible = false;
                CreateClassPanel.Visible = false;
                Bind_DataList();
            }
        }

        protected void Bind_DataList()
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT ClassName FROM Classes WHERE InstructorID = @id", con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            myClasses.DataSource = dt;
            myClasses.DataBind();
            con.Close();
        }

        protected void viewClass_Click(object sender, EventArgs e)
        {
            //display Classes of Professor
            ViewClassPanel.Visible = true;
            CreateClassPanel.Visible = false;
        }

        protected void createClass_Click(object sender, EventArgs e)
        {
            //create a class
            ViewClassPanel.Visible = false;
            CreateClassPanel.Visible = true;
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            //eeege
            Session.Clear();
            Response.Redirect("LandingPage.aspx");
        }

        protected void createNewClass_Click(object sender, EventArgs e)
        {
            //crate class
            string classcode = classNameBox.Text;
            int id = Convert.ToInt32(Session["ProfessorID"]);
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("AddClass",con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ClassName", classcode);
            cmd.Parameters.AddWithValue("@InstructorID", id);
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script type='text/javascript'>alert('Success!');</script>");
        }

        protected void selectClass_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Session["CLASSNAME"] = btn.CommandArgument.ToString();
            Response.Redirect("ProfessorClassPage.aspx");
        }
    }
}