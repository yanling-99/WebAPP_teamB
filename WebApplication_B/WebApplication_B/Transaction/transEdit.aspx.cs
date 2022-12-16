using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_B.Trans
{
    public partial class Edit : System.Web.UI.Page
    {


        protected void Button3_Click(object sender, EventArgs e)
        {
            GridView1.Visible= false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

 
    }
}