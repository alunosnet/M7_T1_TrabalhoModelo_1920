using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T1_TrabalhoModelo_1920_WIP
{
    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //verificar se o cookie existe
            HttpCookie cookie = Request.Cookies["M7_SI"];
            if (cookie != null)
                div_aviso.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //criar o cookie
            HttpCookie novo = new HttpCookie("M7_SI");
            novo.Expires = DateTime.Now.AddYears(1);
            Response.Cookies.Add(novo);
            //esconder a div do aviso
            div_aviso.Visible = false;
        }
    }
}