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
            if(Convert.ToBoolean(Session["Opened"]) == true)
            {
                int classID = Convert.ToInt32(Session["currClassID"]);

                SqlConnection con = new SqlConnection(connString);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Levels WHERE ClassID = @id AND LevelNumber < 9", con);
                cmd.Parameters.AddWithValue("@id", classID);
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                EditDataList.DataSource = dt;
                EditDataList.DataBind();
                con.Close();

                EditClassLevels.Visible = true;
                ViewClassPanel.Visible = false;
                CreateClassPanel.Visible = false;
                ProgressPanel.Visible = false;
                Session["Opened"] = false;
                Bind_DataList();
            }
            else if (!Page.IsPostBack)
            {
                if (Convert.ToBoolean(Session["Opened"]) == false)
                    Response.Write("<script type='text/javascript'>alert('Successful Login!');</script>");

                ViewClassPanel.Visible = false;
                CreateClassPanel.Visible = false;
                ProgressPanel.Visible = false;
                EditClassLevels.Visible = false;
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
            ProgressPanel.Visible = false;
        }

        protected void createClass_Click(object sender, EventArgs e)
        {
            //create a class
            ViewClassPanel.Visible = false;
            CreateClassPanel.Visible = true;
            ProgressPanel.Visible = false;
        }

        protected void logoutBtn_Click(object sender, EventArgs e)
        {
            //eeege
            Session.Clear();
            Response.Redirect("index.aspx");
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

        protected void viewProgress_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            int classID = Convert.ToInt32(btn.CommandArgument);
            ProgressPanel.Visible = true;

            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand sql = new SqlCommand("SELECT A.LName, L.LevelNumber FROM Accounts A, Unlocking U, Levels L WHERE U.ClassID = @classID AND L.ClassID = @classID AND A.AccType = 'STUDENT'", con);
            sql.Parameters.AddWithValue("@classID", classID);
            SqlDataAdapter dA = new SqlDataAdapter(sql);
            DataTable table = new DataTable();
            dA.Fill(table);
            myProgress.DataSource = table;
            myProgress.DataBind();
            con.Close();

        }

        protected void editLevels_Click(object sender, EventArgs e)
        {
            //overall edit levels
            Button btn = (Button)sender;

            string classID = btn.CommandArgument.Split('-')[0].Trim();
            Session["currClassID"] = classID;

            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Levels WHERE ClassID = @id AND LevelNumber < 9", con);
            cmd.Parameters.AddWithValue("@id", classID);
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            EditDataList.DataSource = dt;
            EditDataList.DataBind();
            con.Close();

            EditClassLevels.Visible = true;
        }

        protected void EditLevel_Click(object sender, EventArgs e)
        {
            //edit specific level
            Button btn = sender as Button;
            int levelNum = Convert.ToInt32(btn.CommandArgument);
            TextBox tb = (TextBox)btn.NamingContainer.Controls[1].Controls[0].Controls[1].Controls[1];
            string link = tb.Text;
            if(!(link.ToUpper().StartsWith("HTTP://")|| link.ToUpper().StartsWith("HTTPS://")))
            {
                link = "http://" + link;
            }
            int classID = Convert.ToInt32(Session["currClassID"]);

            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand sql = new SqlCommand("UPDATE Levels SET VideoLink = @link WHERE ClassID = @class AND LevelNumber = @level", con);
            sql.Parameters.AddWithValue("@link", link);
            sql.Parameters.AddWithValue("@class", classID);
            sql.Parameters.AddWithValue("@level", levelNum);
            sql.ExecuteNonQuery();
            con.Close();
        }

        protected void AddLevel_Click(object sender, EventArgs e)
        {
            //add a level
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT TOP 1 LevelNumber FROM Levels WHERE ClassID = @id ORDER BY LevelNumber DESC", con);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["currClassID"]));
            int lastlevel = Convert.ToInt32(cmd.ExecuteScalar());

            SqlCommand com = new SqlCommand("INSERT INTO Levels VALUES (@classID, 'http://www.google.com',@level)",con);
            com.Parameters.AddWithValue("@classID", Convert.ToInt32(Session["currClassID"]));
            com.Parameters.AddWithValue("@level", lastlevel + 1);
            com.ExecuteNonQuery();
            con.Close();

            Session["Opened"] = true;

            Response.Redirect("ProfessorInterface.aspx");
        }

        protected void CloseClassPanel_Click(object sender, EventArgs e)
        {
            ViewClassPanel.Visible = false;
        }

        protected void CloseCreatePanel_Click(object sender, EventArgs e)
        {
            CreateClassPanel.Visible = false;
        }

        protected void CloseProgressPanel_Click(object sender, EventArgs e)
        {
            ProgressPanel.Visible = false;
        }

        protected void CloseClassLevels_Click(object sender, EventArgs e)
        {
            EditClassLevels.Visible = false;
        }

        protected void DeleteLevel_Click(object sender, EventArgs e)
        {
            //delete level
            int levelID = 0;
            Button btn = sender as Button;
            levelID = Convert.ToInt32(btn.CommandArgument);

            int classID, sequence, maxlevel;

            //get where the level is being deleted

            SqlConnection con = new SqlConnection(connString);
            SqlCommand com1 = new SqlCommand("SELECT CONCAT(ClassID,'+',LevelNumber) AS HEADER FROM Levels WHERE LevelID = @levelID", con);
            com1.Parameters.AddWithValue("@levelID", levelID);

            con.Open();
            //OPEN CONNECTION

            string combination = com1.ExecuteScalar().ToString();
            int pos = combination.IndexOf('+');
            classID = Convert.ToInt32(combination.Substring(0, pos));
            sequence = Convert.ToInt32(combination.Substring(pos + 1, combination.Length - pos - 1));

            //get highest levelnumber
            SqlCommand com2 = new SqlCommand("select MAX(LevelNumber) FROM Levels WHERE ClassID = @classID", con);
            com2.Parameters.AddWithValue("@classID", classID);
            maxlevel = Convert.ToInt32(com2.ExecuteScalar());

            SqlCommand com3 = new SqlCommand("UPDATE Levels SET LevelNumber = 99 WHERE LevelID = @levelID", con);
            com3.Parameters.AddWithValue("@levelID", levelID);
            com3.ExecuteNonQuery();

            //check if max level
            if (sequence == maxlevel)
                return;
            else
            {
                //decrease all level numbers of characters above
                int changes = maxlevel - sequence;
                for(int i=0;i<changes;i++)
                {
                    sequence += 1;
                    SqlCommand com4 = new SqlCommand("UPDATE Levels SET LevelNumber = LevelNumber - 1 WHERE LevelNumber = @sequence AND ClassID = @classID", con);
                    com4.Parameters.AddWithValue("@sequence", sequence);
                    com4.Parameters.AddWithValue("@classID", classID);
                    com4.ExecuteNonQuery();
                }
            }

            //CLOSED CONNECTION
            con.Close();
        }
    }
}