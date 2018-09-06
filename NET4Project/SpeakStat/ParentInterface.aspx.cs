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
        int id;
        int myChild;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["ParentID"]);
            if (!Page.IsPostBack)
            {
                //check if in Parents
                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT 1 FROM Parents WHERE ParentID = @id", con);
                cmd.Parameters.AddWithValue("@id", id);
                SqlDataReader dr = cmd.ExecuteReader();
                if(!dr.HasRows)
                {
                    ShowConfirm();
                }
                else
                {
                    dr.Close();
                    SqlCommand com = new SqlCommand("SELECT (FName + ' ' + LName) AS Name FROM Accounts WHERE AccID = (SELECT ChildID FROM Parents WHERE ParentID = @id)", con);
                    com.Parameters.AddWithValue("@id", id);
                    ChildName.Text = com.ExecuteScalar().ToString();

                    SqlCommand childID = new SqlCommand("SELECT ChildID FROM Parents WHERE ParentID = @id", con);
                    childID.Parameters.AddWithValue("@id", id);
                    myChild = Convert.ToInt32(childID.ExecuteScalar());

                    Bind_DataList();

                    ProgressPanel.Style.Value = "visiblity: visible;";
                    ViewMyChild.Style.Value = "visibility: hidden;";
                }
                dr.Close();
                con.Close();
            }
        }

        protected void ShowConfirm()
        {
            //show panel
            ProgressPanel.Style.Value = "visibility: hidden;";
        }

        protected void Bind_DataList()
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT J.StudID, C.ClassName, L.LevelNumber FROM Classes C, Levels L, Joining J WHERE J.StudID = @id AND J.ClassID = C.ClassID AND J.LevelID = L.LevelID", con);
            cmd.Parameters.AddWithValue("@id", myChild);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            myProgress.DataSource = dt;
            myProgress.DataBind();
            con.Close();
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            //eeege
            Session.Clear();
            Response.Redirect("LandingPage.aspx");
        }

        protected void submitDetails_Click(object sender, EventArgs e)
        {
            //submit
            SqlConnection con = new SqlConnection(connString);
            con.Open();
                SqlCommand cmd = new SqlCommand("LinkParent", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@first", ChildFName.Text);
                cmd.Parameters.AddWithValue("@last", ChildLName.Text);
                cmd.Parameters.AddWithValue("@username", ChildUsername.Text);
                int i = cmd.ExecuteNonQuery();

            if (i <= 0)
                Response.Write("<script type='text/javascript'>alert('Such user does not exist. You may have entered the wrong details.');</script>");

            con.Close();

            Response.Redirect("ParentInterface.aspx");
        }
    }
}