using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T1_TrabalhoModelo_1920_WIP.Admin.Alunos
{
    public partial class editarAluno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // página para admin
            if (Session["perfil"] == null || Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");

            //no cache
            Response.Cache.SetNoStore();
            Response.Cache.AppendCacheExtension("no-cache");
            Response.Expires = 0;

        }
        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string texto = args.Value.Trim();

            if (texto.Length < 3)
            {
                args.IsValid = false;
                return;
            }
            args.IsValid = true;
        }

        protected void CustomValidator3_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string texto = args.Value.Trim();

            if (texto.Length != 8)
            {
                args.IsValid = false;
                return;
            }
            //validar a posição do -
            //if(texto.IndexOf('-')!=4)
            if (texto[4] != '-')
            {
                args.IsValid = false;
                return;
            }

            //validar numeros antes e depois do -
            // 3500-123 
            // [0] = 3500
            // [1] = 123
            string[] partes_cp = texto.Split('-');
            int resultado = 0;
            if (int.TryParse(partes_cp[0], out resultado) == false)
            {
                args.IsValid = false;
                return;
            }
            if (int.TryParse(partes_cp[1], out resultado) == false)
            {
                args.IsValid = false;
                return;
            }
            args.IsValid = true;
        }

        protected void SqlAlunos_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            //nprocesso da querystring
            string nprocesso = Request.QueryString["nprocesso"].ToString();
            //ficheiro
            FileUpload ficheiro = FormView1.FindControl("FileUpload1") as FileUpload;

            if (ficheiro.HasFile)
            {
                ficheiro.SaveAs(Server.MapPath("~/Public/Imagens/") + nprocesso + ".jpg");
            }
        }
    }
}