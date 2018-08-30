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
            SqlCommand cmd = new SqlCommand("SELECT * FROM Classes WHERE InstructorID = @id", con);
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
            //check if existing
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("AddClass",con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ClassName", classcode);
            cmd.Parameters.AddWithValue("@InstructorID", id);
            cmd.ExecuteNonQuery();

            SqlCommand retrieve = new SqlCommand("SELECT ClassID From Classes WHERE ClassName = @name", con);
            retrieve.Parameters.AddWithValue("@name", classcode);
            int classID = Convert.ToInt32(retrieve.ExecuteScalar());

            SqlCommand createLevel = new SqlCommand("AddLevel", con);
            createLevel.CommandType = CommandType.StoredProcedure;
            createLevel.Parameters.AddWithValue("@ClassID", classID);
            createLevel.Parameters.AddWithValue("@VideoLink", "http://www.youtube.com");
            createLevel.Parameters.AddWithValue("@LevelNumber", 1);
            createLevel.ExecuteNonQuery();

            Response.Write("<script type='text/javascript'>alert('Success!');</script>");
            con.Close();

            //string message = "Success! Your class name is " + classcode + " with Class ID of " + classID + "\n" +
            //    "Refer this code to your students for joining.";

            //Response.Write("<script type='text/javascript'>alert('"+message+"');</script>");
            Response.Redirect("ProfessorInterface.aspx");

        }

        protected void selectClass_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Session["CLASSNAME"] = btn.CommandArgument.ToString();
            Response.Redirect("ProfessorClassPage.aspx");
        }
    }
}