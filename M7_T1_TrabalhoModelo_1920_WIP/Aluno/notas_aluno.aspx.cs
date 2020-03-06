using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T1_TrabalhoModelo_1920_WIP.Aluno
{
    public partial class notas_aluno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // página para aluno
            if (Session["perfil"] == null || Session["perfil"].Equals("1") == false)
                Response.Redirect("~/index.aspx");
        }
    }
}