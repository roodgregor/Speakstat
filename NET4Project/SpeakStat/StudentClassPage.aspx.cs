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
    public partial class StudentClassPage : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        int id,classid,levelid;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["StudentID"]);
            Loaddata();
        }

        protected void LevelUp_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("LevelUp", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@StudID", id);
            cmd.Parameters.AddWithValue("@ClassID", classid);
            cmd.ExecuteNonQuery(); 
            con.Close();
            Loaddata();
        }

        protected void Bind_DataList()
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT VideoLink FROM Levels WHERE LevelID = @levelid AND ClassID = @classid", con);
            cmd.Parameters.AddWithValue("@levelid", levelid);
            cmd.Parameters.AddWithValue("@classid", classid);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            myVid.DataSource = dt;
            myVid.DataBind();
            con.Close();
        }

        protected void Loaddata()
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmdCheck = new SqlCommand("SELECT ClassID from Classes WHERE ClassName = @name", con);
            cmdCheck.Parameters.AddWithValue("@name", (string)Session["CLASSNAME"]);
            classid = Convert.ToInt32(cmdCheck.ExecuteScalar());
            SqlCommand cmd = new SqlCommand("SELECT LevelID from Joining WHERE StudID = @studid AND ClassID = @classid", con);
            cmd.Parameters.AddWithValue("@studid", id);
            cmd.Parameters.AddWithValue("@classid", classid);
            levelid = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            Bind_DataList();
        }
    }
}