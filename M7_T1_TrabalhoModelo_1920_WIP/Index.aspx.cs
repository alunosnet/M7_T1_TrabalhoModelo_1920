using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T1_TrabalhoModelo_1920_WIP
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["perfil"] != null)
                divLogin.Visible = false;
        }

        protected void DetailsView1_DataBound(object sender, EventArgs e)
        {
            //verificar se o login falhou
            if (DetailsView1.Rows.Count == 0)
            {
                if (IsPostBack)
                    Label1.Text = "O login falhou. Tente novamente.";
                return;
            }
            //iniciar sessão
            //nome
            Session["nome"] = DetailsView1.Rows[0].Cells[1].Text;
            //perfil
            Session["perfil"] = DetailsView1.Rows[2].Cells[1].Text;
            //nprocesso
            Session["nprocesso"] = DetailsView1.Rows[3].Cells[1].Text;
            //esconder a div do login
            divLogin.Visible = false;
        }
    }
}