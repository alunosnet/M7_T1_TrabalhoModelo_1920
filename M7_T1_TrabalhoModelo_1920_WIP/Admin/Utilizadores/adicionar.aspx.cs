using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T1_TrabalhoModelo_1920_WIP.Admin.Utilizadores
{
    public partial class adicionar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // página para admin
            if (Session["perfil"] == null || Session["perfil"].Equals("0") == false)
                Response.Redirect("~/index.aspx");
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //nome de utilizador
            string nome = args.Value;

            //string ligação
            string strLigacao = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            //abrir ligação à base de dados
            SqlConnection ligacao = new SqlConnection(strLigacao);
            ligacao.Open();
            //comando sql
            string sql = $@"SELECT * FROM Utilizadores WHERE nome='{nome}'";
            //executar comando
            SqlCommand comando = new SqlCommand(sql, ligacao);
            SqlDataReader dados = comando.ExecuteReader();
            if (dados.HasRows)
            {
                args.IsValid = false;
                //fechar ligação
                dados = null;
                comando = null;
                ligacao.Close();
                return;
            }
            args.IsValid = true;
            //fechar ligação
            dados = null;
            comando = null;
            ligacao.Close();
            return;
        }
    }
}