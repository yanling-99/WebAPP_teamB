using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_B.Product
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (DropDownList1.Text == "bookID")
            {
                GridView1.DataSource = SqlDataSource2;
            }
            else if (DropDownList1.Text == "title")
            {
                GridView1.DataSource = SqlDataSource1;
                //GridView1.Columns[0].ItemStyle.HorizontalAlign = HorizontalAlign.Center; 
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

            if (TextBox1.Text == "" || DropDownList1.Text == "please select")
                SearchResult.Visible = false;
            else
            { 
                SearchResult.Visible = true;    
            }
        }

    }
}