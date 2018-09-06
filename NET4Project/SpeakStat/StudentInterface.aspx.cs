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

        protected void visibleAll()
        {
            btn2.Visible = true;
            btn3.Visible = true;
            btn4.Visible = true;
            btn5.Visible = true;
            btn6.Visible = true;
            btn7.Visible = true;
            btn8.Visible = true;
        }

        protected void selectClass_Click(object sender, EventArgs e)
        {
            visibleAll();

            Button btn = sender as Button;
            Label lbl = (Label)btn.Parent.Parent.Controls[1].Controls[1];
            Session["CLASSNAME"] = lbl.Text;
            classname.Text = Session["CLASSNAME"].ToString();

            //check number of levels
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            Label lbo = (Label)btn.Parent.Parent.Controls[0].Controls[1];
            Session["CLASSID"] = lbo.Text;
            SqlCommand sql = new SqlCommand("SELECT COUNT(*) FROM Levels WHERE ClassID = @ID", con);
            sql.Parameters.AddWithValue("@ID", Convert.ToInt32(Session["CLASSID"]));
            int levelCount = Convert.ToInt32(sql.ExecuteScalar());
            con.Close();

            switch (levelCount)
            {
                case 1:
                    {
                        btn2.Visible = false;
                        goto case 2;
                    }
                case 2:
                    {
                        btn3.Visible = false;
                        goto case 3;
                    }
                case 3:
                    {
                        btn4.Visible = false;
                        goto case 4;
                    }
                case 4:
                    {
                        btn5.Visible = false;
                        goto case 5;
                    }
                case 5:
                    {
                        btn6.Visible = false;
                        goto case 6;
                    }
                case 6:
                    {
                        btn7.Visible = false;
                        goto case 7;
                    }
                case 7:
                    {
                        btn8.Visible = false;
                        goto default;
                    }
                default: break;
            }
            GamePanel.Visible = true;
        }

        protected void CloseMap_Click(object sender, EventArgs e)
        {
            GamePanel.Visible = false;
            Session["CLASSID"] = null;
        }

        protected void level_Clicked(object sender, EventArgs e)
        {
            ImageButton btn = sender as ImageButton;
            string level = btn.ID.Substring(3, 1);
            int mustHave = Convert.ToInt32(level) - 1;

            SqlConnection con = new SqlConnection(connString);
            con.Open();

            SqlCommand checkLevel = new SqlCommand("SELECT 5 FROM Unlocking WHERE StudID = @stud AND ClassID = @class AND LevelID = @level", con);
            checkLevel.Parameters.AddWithValue("@stud", Convert.ToInt32(Session["StudentID"]));
            checkLevel.Parameters.AddWithValue("@level", mustHave);
            checkLevel.Parameters.AddWithValue("@class", Convert.ToInt32(Session["CLASSID"]));
            SqlDataReader dro = checkLevel.ExecuteReader();
            if(!dro.HasRows && mustHave != 0)
            {
                dro.Close();
                Response.Write("<script type='text/javascript'>alert('This level is still locked!!!');</script>");
                return;
            }
            dro.Close();
            SqlCommand cmd = new SqlCommand("SELECT VideoLink From Levels WHERE LevelNumber = @num AND ClassID = @ID", con);
            cmd.Parameters.AddWithValue("@num", Convert.ToInt32(level));
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(Session["CLASSID"]));
            string videolink = cmd.ExecuteScalar().ToString();

            SqlCommand get = new SqlCommand("SELECT LevelID From Levels WHERE LevelNumber = @num AND ClassID = @ID", con);
            get.Parameters.AddWithValue("@num", Convert.ToInt32(level));
            get.Parameters.AddWithValue("@ID", Convert.ToInt32(Session["CLASSID"]));
            int levelID = Convert.ToInt32(get.ExecuteScalar());

            Session["VIDEOLINK"] = videolink;

            Session["LEVELID"] = levelID;

            SqlCommand check = new SqlCommand("SELECT 55 FROM Unlocking WHERE StudID = @stud AND ClassID = @class AND LevelID = @level", con);
            check.Parameters.AddWithValue("@stud", Convert.ToInt32(Session["StudentID"]));
            check.Parameters.AddWithValue("@level", Convert.ToInt32(Session["LEVELID"]));
            check.Parameters.AddWithValue("@class", Convert.ToInt32(Session["CLASSID"]));
            SqlDataReader dr = check.ExecuteReader();
            if(!dr.HasRows)
            {
                dr.Close();
                SqlCommand watch = new SqlCommand("INSERT INTO Unlocking VALUES (" + Session["StudentID"].ToString() + "," + Session["CLASSID"].ToString() + "," + level + ")", con);
                watch.ExecuteNonQuery();
            }
            
            con.Close();

            //Response.Redirect("StudentClassPage.aspx");

            Response.Write("<script type='text/javascript'>window.open('"+Session["VIDEOLINK"]+"','_blank');</script>");

            Response.Write("<script type='text/javascript'>alert('You have completed Level "+level+" of this class!');</script>");
        }
    }
}