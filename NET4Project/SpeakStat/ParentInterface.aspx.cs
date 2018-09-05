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
    public partial class ParentInterface : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //ViewClassPanel.Visible = false;
                ProgressPanel.Visible = false;
                //Bind_DataList();
            }
        }

        //protected void Bind_DataList()
        //{
        //    SqlConnection con = new SqlConnection(connString);
        //    con.Open();
        //    SqlCommand cmd = new SqlCommand("SELECT * FROM Classes WHERE InstructorID = @id", con);
        //    cmd.Parameters.AddWithValue("@id", id);
        //    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    adapter.Fill(dt);
        //    myClasses.DataSource = dt;
        //    myClasses.DataBind();
        //    con.Close();
        //}


        protected void createClass_Click(object sender, EventArgs e)
        {
            //create a class
            ViewClassPanel.Visible = false;
            ProgressPanel.Visible = false;
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            //eeege
            Session.Clear();
            Response.Redirect("LandingPage.aspx");
        }

        //protected void viewProgress_Click(object sender, EventArgs e)
        //{
        //    Button btn = sender as Button;
        //    int classID = Convert.ToInt32(btn.CommandArgument);
        //    ProgressPanel.Visible = true;

        //    SqlConnection con = new SqlConnection(connString);
        //    con.Open();
        //    SqlCommand sql = new SqlCommand("SELECT A.LName, L.LevelNumber FROM Accounts A, Unlocking U, Levels L WHERE U.ClassID = @classID AND L.ClassID = @classID AND A.AccType = 'STUDENT'", con);
        //    sql.Parameters.AddWithValue("@classID", classID);
        //    SqlDataAdapter dA = new SqlDataAdapter(sql);
        //    DataTable table = new DataTable();
        //    dA.Fill(table);
        //    myProgress.DataSource = table;
        //    myProgress.DataBind();
        //    con.Close();

        //}
    }
}