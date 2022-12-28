using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_B.Product
{
    public partial class Search : System.Web.UI.Page
    {
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.Text == "bookID")
            {
                GridView1.DataSource = SqlDataSource2;
            }
            else if (DropDownList1.Text == "title")
            {
                GridView1.DataSource = SqlDataSource1;
            }
            else if(DropDownList1.Text == "condition")
            {
                GridView1.DataSource = SqlDataSource4;
            }
            else if(DropDownList1.Text == "location")
            {
                GridView1.DataSource = SqlDataSource3;
            }
            GridView1.DataBind();

            if (DropDownList1.Text == "please select" || TextBox1.Text == "")
                conditiontxt.Visible = false;
            else conditiontxt.Visible = true;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
        }

        protected void buyBtn_Click(object sender, EventArgs e)
        {
            //Response.Write("<Script language='JavaScript'>alert('GridView1.Rows[currentRowIndex].Cells.Count');</Script>");

            //取得row index
            int rowIndex = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;

            //存gridview row 的資料
            List<string> shoppingItem = new List<string>();
            for (int i = 1; i < GridView1.Rows[rowIndex].Cells.Count; i++)
            {             
                shoppingItem.Add(GridView1.Rows[rowIndex].Cells[i].Text);
            }
            GridView1.Rows[rowIndex].Visible = false;

            //sql connection
            string s_data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TextbookChangedPlatformConnectionString"].ConnectionString;//從config找到資料庫位置[]內放的是Web.config的connectionStrings的name。
            SqlConnection connection = new SqlConnection(s_data);//建立與資料庫建立起連接的通道，以s_data內的連接字串連接所對應的資料庫。
            connection.Open();//開啟通道
            string sql = $"INSERT INTO [shopping](BookID, Title, Payment, City, Country, Price, Condition, sellerID)VALUES  (@BookID, @Title, @Payment, @City, @Country, @Price, @Condition, @sellerID)";
            SqlCommand command = new SqlCommand(sql, connection);//要對SQL Server下什麼SQL指令。

            command.Parameters.Add("@BookID", SqlDbType.Int); //給@參數加入資料型態
            command.Parameters["@BookID"].Value = shoppingItem[0]; //@參數的值是shoppingItem[0]
            command.Parameters.Add("@Title", SqlDbType.VarChar);
            command.Parameters["@Title"].Value = shoppingItem[1];
            command.Parameters.Add("@Payment", SqlDbType.VarChar);
            command.Parameters["@Payment"].Value = shoppingItem[2];
            command.Parameters.Add("@City", SqlDbType.VarChar);
            command.Parameters["@City"].Value = shoppingItem[3];
            command.Parameters.Add("@Country", SqlDbType.VarChar);
            command.Parameters["@Country"].Value = shoppingItem[4];
            command.Parameters.Add("@Price", SqlDbType.Float);
            command.Parameters["@Price"].Value = shoppingItem[5];
            command.Parameters.Add("@Condition", SqlDbType.Int);
            command.Parameters["@Condition"].Value = shoppingItem[6];
            command.Parameters.Add("@sellerID", SqlDbType.Int);
            command.Parameters["@sellerID"].Value = shoppingItem[7];

            command.ExecuteNonQuery();//執行command的SQL語法，回傳受影響的資料數目。
            connection.Close();//關閉與資料庫連線的通道
            //Response.Redirect(Request.Url.ToString()); FilePath
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            if (DropDownList1.Text == "bookID")
            {
                GridView1.DataSource = SqlDataSource2;
            }
            else if (DropDownList1.Text == "title")
            {
                GridView1.DataSource = SqlDataSource1;
            }
            else if (DropDownList1.Text == "condition")
            {
                GridView1.DataSource = SqlDataSource4;
            }
            else if (DropDownList1.Text == "location")
            {
                GridView1.DataSource = SqlDataSource3;
            }
            GridView1.DataBind();
        }
    }
}