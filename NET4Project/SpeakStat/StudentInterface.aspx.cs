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
    public partial class StudentInterface : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Session["StudentID"]);
            if (!Page.IsPostBack)
            {
                ViewClassPanel.Visible = false;
                JoinClassPanel.Visible = false;
                GamePanel.Visible = false;
                Bind_DataList();
            }
        }

        protected void viewClass_Click(object sender, EventArgs e)
        {
            ViewClassPanel.Visible = true;
            JoinClassPanel.Visible = false;
        }

        protected void joinClass_Click(object sender, EventArgs e)
        {
            JoinClassPanel.Visible = true;
            ViewClassPanel.Visible = false;
            Bind_DataList();
        }

        protected void joinClassButton_Click(object sender, EventArgs e)
        {
            //this checks the code for joining
            string classCode = classCodeBox.Text;
            SqlConnection conn = new SqlConnection(connString);
            conn.Open();
            SqlCommand cmdCheck = new SqlCommand("SELECT ClassID from Classes WHERE ClassID = @ID", conn);
            cmdCheck.Parameters.AddWithValue("@ID", classCode);
            int classID = Convert.ToInt32(cmdCheck.ExecuteScalar());
            if(classID != 0)
            {
                //check if already in class
                SqlCommand checkJoin = new SqlCommand("SELECT JoinID from Joining WHERE StudID = @id AND ClassID = @classID", conn);
                checkJoin.Parameters.AddWithValue("@id", id);
                checkJoin.Parameters.AddWithValue("@classID", classID);
                int joinID = Convert.ToInt32(checkJoin.ExecuteScalar());
                if(joinID == 0)
                {
                    //command found that class ID
                    SqlCommand joinClass = new SqlCommand("JoinClass", conn);
                    joinClass.CommandType = CommandType.StoredProcedure;
                    joinClass.Parameters.AddWithValue("@StudID", id);
                    joinClass.Parameters.AddWithValue("@ClassID", classID);
                    joinClass.Parameters.AddWithValue("@LevelID", 1);
                    joinClass.ExecuteNonQuery();
                    Response.Write("<script type='text/javascript'>alert('Successfully joined class!');</script>");
                }
                else
                {
                    Response.Write("<script type='text/javascript'>alert('You are already in this class.');</script>");
                }
            }
            else
            {
                Response.Write("<script type='text/javascript'>alert('Class not found.');</script>");
            }
            conn.Close();
            Response.Redirect("StudentInterface.aspx");
        }
        protected void Bind_DataList()
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Classes WHERE ClassID IN (SELECT ClassID FROM Joining WHERE StudID = @id)", con);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            myClasses.DataSource = dt;
            myClasses.DataBind();
            con.Close();
        }
        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            //eeege
            Session.Clear();
            Response.Redirect("LandingPage.aspx");
        }

        protected void selectClass_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            Label lbl = (Label)btn.Parent.Parent.Controls[1].Controls[1];
            Session["CLASSNAME"] = lbl.Text;
            classname.Text = Session["CLASSNAME"].ToString();

            //check number of levels
            SqlConnection con = new SqlConnection(connString);
            Label lbo = (Label)btn.Parent.Parent.Controls[0].Controls[1];
            Session["CLASSID"] = lbo.Text;
            SqlCommand sql = new SqlCommand("SELECT COUNT(*) FROM Levels WHERE ClassID = @ID", con);
            sql.Parameters.AddWithValue("@ID", Convert.ToInt32(Session["CLASSID"]));
            int levelCount = Convert.ToInt32(sql.ExecuteScalar());

            GamePanel.Visible = true;

        }

        protected void CloseMap_Click(object sender, EventArgs e)
        {
            GamePanel.Visible = false;
        }
    }
}