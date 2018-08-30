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
    public partial class ProfessorClassPage : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        int accID, classID;
        protected void Page_Load(object sender, EventArgs e)
        {
            accID = Convert.ToInt32(Session["ProfessorID"]);
            LoadData();
        }

        protected void AddLevel_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("AddLevel", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@ClassID", classID);
            cmd.Parameters.AddWithValue("@LevelNumber", 1);
            cmd.Parameters.AddWithValue("@VideoLink", TextBox1.Text);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        protected void LoadData()
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Classes WHERE ClassName = @classname", con);
            cmd.Parameters.AddWithValue("@classname", Session["CLASSNAME"].ToString());
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            con.Close();
            ClassName.Text = dt.Rows[0][1].ToString();
            NumberofStdnt.Text = dt.Rows[0][3].ToString();
            classID = Convert.ToInt32(dt.Rows[0][0]);

        }
    }
}