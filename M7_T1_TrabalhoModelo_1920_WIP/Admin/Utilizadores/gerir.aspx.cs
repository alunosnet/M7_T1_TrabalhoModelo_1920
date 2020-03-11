using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T1_TrabalhoModelo_1920_WIP.Admin.Utilizadores
{
    public partial class gerir : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //iniciou sessão?
            if (Session["perfil"] == null)
                Response.Redirect("~/index.aspx");
            //é admin?
            if (Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");

        }
    }
}