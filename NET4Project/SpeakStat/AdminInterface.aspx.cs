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
    public partial class AdminInterface : System.Web.UI.Page
    {
        private string connString = ConfigurationManager.ConnectionStrings["CS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LOGGED"] == null)
            {
                Session.Clear();
                Session["LOGGED"] = "Invalid";
                Response.Redirect("index.aspx");
            }
            if (!Page.IsPostBack)
            {
                ViewUsersPanel.Visible = false;
                PromptPanel.Visible = false;
                Bind_DataList();
            }
        }

        protected void viewUsers_Click(object sender, EventArgs e)
        {
            if(ViewUsersPanel.Visible != true)
                ViewUsersPanel.Visible = true;
            else
                ViewUsersPanel.Visible = false;
        }

        protected void Bind_DataList()
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM Accounts WHERE AccID != @id", con);
            cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["AdminID"]));
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
            Response.Redirect("index.aspx");
        }

        protected void makeAdmin_Click(object sender, EventArgs e)
        {
            //make usertype admin
            Button btn = sender as Button;
            PromptPanel.Visible = true;
            Session["ACTION"] = "MakeAdmin";
            Session["ACCOUNTID"] = btn.CommandArgument;
        }

        protected void deleteUser_Click(object sender, EventArgs e)
        {
            //delete user
            Button btn = sender as Button;
            PromptPanel.Visible = true;
            Session["ACTION"] = "DeleteUser";
            Session["ACCOUNTID"] = btn.CommandArgument;
        }

        protected void cancelAction_Click(object sender, EventArgs e)
        {
            Session.Clear();
            PromptPanel.Visible = false;
        }

        protected void progressAction_Click(object sender, EventArgs e)
        {
            string action = Session["ACTION"].ToString();
            int accountID = Convert.ToInt32(Session["ACCOUNTID"]);
            string query = "";
            string message = "";
            if(action == "MakeAdmin")
            {
                query = "UPDATE Accounts SET AccType = Admin WHERE AccID = @id";
                message = "Account successfully promoted as Admin";
            }
            else if (action == "DeleteUser")
            {
                query = "DELETE FROM Accounts WHERE AccID = @id;";
                message = "Account successfully deleted.";
            }

            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@id", accountID);
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Write("<script type='language/javascript'>alert('" + message + "');</script>;");
            PromptPanel.Visible = false;
            ViewUsersPanel.Visible = false;
            DataBind();
        }
    }
}