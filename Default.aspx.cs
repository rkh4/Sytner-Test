using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{

    //Open New Database
    SqlConnection db = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True");
    static SqlDataReader dr;


    protected void Page_Load(object sender, EventArgs e)
    {

    }


    //Called when Table Button Clicked
    protected void GridView1_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteRow")
        {
            int rowID = Convert.ToInt32(e.CommandArgument);
            deleteFnc(rowID);
        }
        else if (e.CommandName == "UpdateRow")
        {
            int rowID = Convert.ToInt32(e.CommandArgument);
            updateFnc(rowID);
        }
    }


    //UPDATE
    protected void updateFnc(int id)
    {
        SqlCommand update1 = new SqlCommand("SELECT * FROM Cars WHERE Id = @id", db);
        update1.Parameters.AddWithValue("@id", id);

        db.Open();
        dr = update1.ExecuteReader();
        if (dr.Read())
        {
            debug.Text = id.ToString();
            txtMake.Text = dr[1].ToString();
            txtModel.Text = dr[2].ToString();
            txtYear.Text = dr[3].ToString();
        }
        db.Close();
    }
    protected void updateConfirm(object sender, EventArgs e)
    {
        SqlCommand update2 = new SqlCommand("UPDATE Cars SET Make = @Make, Model = @Model, Year = @Year WHERE Id = @Id", db);
        update2.Parameters.AddWithValue("@id", debug.Text);
        update2.Parameters.AddWithValue("@Make", txtMake.Text);
        update2.Parameters.AddWithValue("@Model", txtModel.Text);
        update2.Parameters.AddWithValue("@Year", txtYear.Text);

        db.Open();
        update2.ExecuteNonQuery();
        db.Close();

        GridView1.DataBind();


    }


    //DELETE
    protected void deleteFnc(int id)
    {
        SqlCommand delete = new SqlCommand("DELETE FROM Cars WHERE Id = @Id", db);
        delete.Parameters.AddWithValue("@id", id);

        db.Open();
        delete.ExecuteNonQuery();
        db.Close();

        GridView1.DataBind();
    }


    //INSERT
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        debug.Text = "insert clicked";

        SqlCommand Insert = new SqlCommand("INSERT INTO Cars(make, model, year) VALUES (@make, @model, @year)", db);
        Insert.Parameters.AddWithValue("@make", txtMake.Text);
        Insert.Parameters.AddWithValue("@model", txtModel.Text);
        Insert.Parameters.AddWithValue("@year", txtYear.Text);

        db.Open();
        Insert.ExecuteNonQuery();
        db.Close();

        GridView1.DataBind();
        
    }
}