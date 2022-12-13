using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_B.Trans
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            if (cols.Text == "transID")
            {
                GridView1.DataSource = trans;
            }
            else if (cols.Text == "sellerID")
            {
                GridView1.DataSource = seller;
            }
            else if (cols.Text == "productID")
            {
                GridView1.DataSource = product;
            }
            else if (cols.Text == "status")
            {
                GridView1.DataSource = status;
            }
            else if (cols.Text == "buyerID")
            {
                GridView1.DataSource = buyer;
            }
            GridView1.DataBind();

            if (keyTB.Text == "" || cols.Text == "please select")
                SearchResult.Visible = false;
            else
                SearchResult.Visible = true;

        }
    }
}