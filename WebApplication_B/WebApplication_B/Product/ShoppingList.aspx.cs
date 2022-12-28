using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplication_B.Product
{
    public partial class ShoppingList : System.Web.UI.Page
    {
        float price = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                price += float.Parse(GridView2.Rows[i].Cells[6].Text);//商品價格
            }
            PriceTxt.Text = "Total Price : US " + price.ToString("0.00");//商品價格


            if (GridView2.Rows.Count != 0)
                conditiontxt.Visible = true;
            else
                conditiontxt.Visible = false;
        }

        protected void EditBtn_Click(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count == 0)
            {
                MessageBox.Show("There is no any product in the shopping cart !");
            }
            else
            {
                SelectAllBtn.Visible = true;
                NotSelectAllBtn.Visible = true;
                DeleteBtn.Visible = true;
                CancelBtn.Visible = true;
                PriceTxt.Visible = false;
                EditBtn.Visible = false;
                GridView2.Columns[0].Visible = true;

                buyertxt.Visible = false;
                buyerDDL.Visible = false;
                buyBtn.Visible = false;
            }
        }

        protected void CancelBtn_Click(object sender, EventArgs e)
        {
            SelectAllBtn.Visible = false;
            NotSelectAllBtn.Visible = false;
            DeleteBtn.Visible = false;
            CancelBtn.Visible = false;
            PriceTxt.Visible = true;
            EditBtn.Visible = true;
            GridView2.Columns[0].Visible = false;
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                System.Web.UI.WebControls.CheckBox ck = (System.Web.UI.WebControls.CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                ck.Checked = false;
            }

            buyertxt.Visible = true;
            buyerDDL.Visible = true;
            buyBtn.Visible = true;
        }

        protected void SelectAllBtn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                System.Web.UI.WebControls.CheckBox ck = (System.Web.UI.WebControls.CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                ck.Checked = true;
            }
        }

        protected void NotSelectAllBtn_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                System.Web.UI.WebControls.CheckBox ck = (System.Web.UI.WebControls.CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                ck.Checked = false;
            }
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            List<string> bookIDValue = new List<string>();
            for (int i = 0; i < GridView2.Rows.Count; i++)
            {
                System.Web.UI.WebControls.CheckBox ck = GridView2.Rows[i].FindControl("CheckBox1") as System.Web.UI.WebControls.CheckBox;
                if (ck.Checked == true)
                {
                    bookIDValue.Add(GridView2.Rows[i].Cells[1].Text);
                    //GridView2.Rows[i].Visible = false;
                    GridView2.DataSourceID = "shopping";

                    price -= float.Parse(GridView2.Rows[i].Cells[6].Text);//刪除商品 價格改變
                }
            }
            PriceTxt.Text = "Total Price : US " + price.ToString("0.00");//刪除商品 價格改變

            if (bookIDValue.Count != 0)
            {
                for (int i = 0; i < bookIDValue.Count; i++)
                {
                    string sql = $"DELETE FROM shopping WHERE BookID =" + bookIDValue[i];
                    sqlConnect(sql);
                }
                Response.Write("<Script language='JavaScript'>alert('Delete Sucessfully!');</Script>");
                
                //跟cancel做一樣的事
                SelectAllBtn.Visible = false;
                NotSelectAllBtn.Visible = false;
                DeleteBtn.Visible = false;
                CancelBtn.Visible = false;
                PriceTxt.Visible = true;
                EditBtn.Visible = true;
                GridView2.Columns[0].Visible = false;
                for (int i = 0; i < GridView2.Rows.Count; i++)
                {
                    System.Web.UI.WebControls.CheckBox ck = (System.Web.UI.WebControls.CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                    ck.Checked = false;
                }
                buyertxt.Visible = true;
                buyerDDL.Visible = true;
                buyBtn.Visible = true;
            }
            else
                MessageBox.Show("Please select ONE at least to delete product(s) !");
        }

        protected void sqlConnect(string sql)
        {
            string s_data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TextbookChangedPlatformConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(s_data);
            connection.Open();
            SqlCommand command = new SqlCommand(sql, connection);

            command.ExecuteNonQuery();
            connection.Close();
        }
           
        protected void buyBtn_Click(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count == 0)
            {
                MessageBox.Show("There is no any product in the shopping cart !");
            }
            else if (buyerDDL.SelectedValue == "0")
            {
                MessageBox.Show("Please select a buyer to purchase the product(s) !");
            }
            else
            {
                for (int i = 0; i < GridView2.Rows.Count; i++)
                {
                    string sql = $"UPDATE [Transaction] SET statusID = 0 WHERE productID =" + GridView2.Rows[i].Cells[1].Text + ";";
                    sql += $"UPDATE [Transaction] SET buyerID =" + buyerDDL.SelectedValue + " WHERE productID =" + GridView2.Rows[i].Cells[1].Text + ";";
                    GridView3.Rows[i].Cells[4].Text = "close";
                    sql += $"DELETE FROM shopping WHERE BookID =" + GridView2.Rows[i].Cells[1].Text + ";";
                    sqlConnect(sql);
                }
                GridView3.Visible = true;
                MessageBox.Show("Purchase Sucessfully!");

                //跟cancel做部分一樣的事
                SelectAllBtn.Visible = false;
                NotSelectAllBtn.Visible = false;
                DeleteBtn.Visible = false;
                CancelBtn.Visible = false;
                EditBtn.Visible = true;
                GridView2.Columns[0].Visible = false;
                for (int i = 0; i < GridView2.Rows.Count; i++)
                {
                    System.Web.UI.WebControls.CheckBox ck = (System.Web.UI.WebControls.CheckBox)GridView2.Rows[i].FindControl("CheckBox1");
                    ck.Checked = false;
                }
            }
        }
    }
}