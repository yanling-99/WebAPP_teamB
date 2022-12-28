using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplication_B.Product
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void AddBookBtn_Click(object sender, EventArgs e)
        {
            if (sellerDDL.SelectedValue == "0")
                MessageBox.Show("Please select a seller!");
            else
            {
                GV_trans_product.Columns[0].Visible = false;
                GV_trans_product.Columns[1].Visible = false;
                EditBtn.Visible = false;
                CancelBtn2.Visible = false;
                ConfirmBtn.Visible = true;
                CancelBtn1.Visible = true;
                AddBookBtn.Visible = false;
                Panel1.Visible = true;

                transIdTxt2.Text = "Auto generated";
                bookIdTxt2.Text = "Auto generated";
            }
        }
        protected int sqlConnect_getPk(string sql)
        {
            Int32 newProdID = 0;

            string s_data = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["TextbookChangedPlatformConnectionString"].ConnectionString;
            SqlConnection connection = new SqlConnection(s_data);
            SqlCommand command = new SqlCommand(sql, connection);

            connection.Open();
            newProdID = (Int32)command.ExecuteScalar();
            connection.Close();

            return (int)newProdID;
        }

        //for Add book
        protected void ConfirmBtn_Click(object sender, EventArgs e)
        {
            if (bookTitleTB.Text == "" || paymentDDL.SelectedValue == "0" || conditionDDL.SelectedValue == "0" || priceTB.Text == "")
            {
                MessageBox.Show("Must fill out all blank !", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                //sql 新增 product
                string booktitle = bookTitleTB.Text;
                string payment = paymentDDL.SelectedValue;
                string location = locationDDL.SelectedValue;
                string price = priceTB.Text;
                string condition = conditionDDL.SelectedValue;

                string sql = $"INSERT INTO Product (title, paymentID, countryID, condition, price) VALUES ('" 
                    + booktitle + "'," + payment + "," + location + "," + condition + "," + price + ");"
                    + "SELECT CAST(scope_identity() AS int);";
                int newProdId = sqlConnect_getPk(sql);

                //sql 新增 trans
                string transId = transIdTxt2.Text;
                string sellerId = sellerDDL.SelectedValue;
                string productId = newProdId.ToString();

                sql = $"INSERT INTO [Transaction] (sellerID, productID, price, statusID, buyerID) VALUES ("
                    + sellerId + "," + productId + "," + price + ", 1, 0);"
                    + "SELECT CAST(scope_identity() AS int);";
                int newTransId = sqlConnect_getPk(sql);

                GV_trans_product.DataSourceID = "selledBook";
                MessageBox.Show("The new bookID is " + newProdId.ToString() + "\nThe new transID is " + newTransId.ToString() + "\n\nAdd Sucessfully");

                /* CancelBtn1_Click做的事*/
                EditBtn.Visible = true;
                ConfirmBtn.Visible = false;
                CancelBtn1.Visible = false;
                AddBookBtn.Visible = true;

                //Panel 歸零
                bookTitleTB.Text = "";
                paymentDDL.SelectedIndex = 0;
                locationDDL.Items[locationDDL.SelectedIndex].Selected = false;
                locationDDL.Items[0].Selected = true;
                priceTB.Text = "";
                conditionDDL.SelectedIndex = 0;
                Panel1.Visible = false;
            }
        }
        protected void CancelBtn1_Click(object sender, EventArgs e)
        {
            EditBtn.Visible = true;
            ConfirmBtn.Visible = false;
            CancelBtn1.Visible = false;
            AddBookBtn.Visible = true;

            //Panel 歸零
            bookTitleTB.Text = "";
            paymentDDL.SelectedIndex = 0;
            locationDDL.Items[locationDDL.SelectedIndex].Selected = false;
            locationDDL.Items[0].Selected = true;
            priceTB.Text = "";
            conditionDDL.SelectedIndex = 0;
            Panel1.Visible = false;
        }
        protected void EditBtn_Click(object sender, EventArgs e)
        {
            if(sellerDDL.SelectedValue == "0")
                MessageBox.Show("Please select a seller!");
            else if (GV_trans_product.Rows.Count == 0)
            {
                MessageBox.Show("There is no any transaction in the list !");
                //Response.Write("<Script language='JavaScript'>alert('');</Script>");
            }
            else
            {
                CancelBtn2.Visible = true;
                EditBtn.Visible = false;
                GV_trans_product.Columns[0].Visible = true;
                GV_trans_product.Columns[1].Visible = true;
                AddBookBtn.Visible = false;
            }
        }

        protected void editLB_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
            transIdTxt2.Text = GV_trans_product.Rows[rowIndex].Cells[2].Text;
            bookIdTxt2.Text = GV_trans_product.Rows[rowIndex].Cells[4].Text;
            bookTitleTB.Text = GV_trans_product.Rows[rowIndex].Cells[5].Text;
            for (int i = 0; i < paymentDDL.Items.Count; i++)
            {
                if(paymentDDL.Items[i].Text == GV_trans_product.Rows[rowIndex].Cells[6].Text)
                    paymentDDL.SelectedIndex = i;
            }
            for (int i = 0; i < locationDDL.Items.Count; i++)
            {
                if (locationDDL.Items[i].Text == GV_trans_product.Rows[rowIndex].Cells[7].Text)
                    locationDDL.SelectedIndex = i;
            }
            priceTB.Text = GV_trans_product.Rows[rowIndex].Cells[8].Text;
            for (int i = 0; i < conditionDDL.Items.Count; i++)
            {
                if (conditionDDL.Items[i].Value == GV_trans_product.Rows[rowIndex].Cells[9].Text)
                    conditionDDL.SelectedIndex = i;
            }

            Panel1.Visible = true;
            confirm2Btn.Visible = true;
        }

        //for Edit book
        protected void ConfirmBtn2_Click(object sender, EventArgs e)
        {
            if (bookTitleTB.Text == "" || paymentDDL.SelectedValue == "0" || conditionDDL.SelectedValue == "0" || priceTB.Text == "")
            {
                MessageBox.Show("Must fill out all blank !", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                //sql 更新 product & trans price
                string transId = transIdTxt2.Text;
                string bookId = bookIdTxt2.Text;
                string booktitle = bookTitleTB.Text;
                string payment = paymentDDL.SelectedValue;
                string location = locationDDL.SelectedValue;
                string price = priceTB.Text;
                string condition = conditionDDL.SelectedValue;

                string sql = $"UPDATE Product SET title='" + booktitle + "', paymentID=" + payment
                    + ", countryID=" + location + ", condition=" + condition + ", price=" + price + " WHERE id =" + bookId + ";";
                sql += $"UPDATE [Transaction] SET price=" + price + " WHERE transID =" + transId + ";";
                sqlConnect(sql);
                MessageBox.Show("Update Sucessfully");

                /*CancelBtn2_Click 做的事*/
                EditBtn.Visible = true;
                confirm2Btn.Visible = false;
                CancelBtn2.Visible = false;
                GV_trans_product.Columns[0].Visible = false;
                GV_trans_product.Columns[1].Visible = false;
                AddBookBtn.Visible = true;

                //Panel 歸零
                bookTitleTB.Text = "";
                paymentDDL.SelectedIndex = 0;
                locationDDL.Items[locationDDL.SelectedIndex].Selected = false;
                locationDDL.Items[0].Selected = true;
                priceTB.Text = "";
                conditionDDL.SelectedIndex = 0;
                Panel1.Visible = false;
            }
        }

        protected void CancelBtn2_Click(object sender, EventArgs e)
        {
            EditBtn.Visible = true;
            confirm2Btn.Visible = false;
            CancelBtn2.Visible = false;
            GV_trans_product.Columns[0].Visible = false;
            GV_trans_product.Columns[1].Visible = false;
            AddBookBtn.Visible = true;

            //Panel 歸零
            bookTitleTB.Text = "";
            paymentDDL.SelectedIndex = 0;
            locationDDL.Items[locationDDL.SelectedIndex].Selected = false;
            locationDDL.Items[0].Selected = true;
            priceTB.Text = "";
            conditionDDL.SelectedIndex = 0;
            Panel1.Visible = false;
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

        protected void deleteLB_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((LinkButton)sender).NamingContainer).RowIndex;
            //MessageBox.Show();
            string sql = $"DELETE FROM [Transaction] WHERE transID = " + GV_trans_product.Rows[rowIndex].Cells[2].Text + ";";
            sqlConnect(sql);//因pk問題要先delete trans
            sql = $"DELETE FROM Product WHERE id = " + GV_trans_product.Rows[rowIndex].Cells[4].Text + ";";
            sqlConnect(sql);
            MessageBox.Show("Delete Sucessfully");
            GV_trans_product.DataSourceID = "selledBook";
        }
    }
}