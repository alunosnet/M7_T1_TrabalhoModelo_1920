using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M7_T1_TrabalhoModelo_1920_WIP.Admin.Notas
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
            DateTime data = DateTime.Parse(args.Value);

            if (data > DateTime.Now.Date)
            {
                args.IsValid = false;
                return;
            }
            args.IsValid = true;
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //disciplina
            DropDownList DDDisciplina = FormView1.FindControl("DropDownList1")
                as DropDownList;
            int id_disciplina = int.Parse(DDDisciplina.SelectedValue);
            //aluno
            DropDownList DDAluno = FormView1.FindControl("DropDownList2")
                as DropDownList;
            int nprocesso = int.Parse(DDAluno.SelectedValue);

            //nr modulo
            TextBox TBModulo = FormView1.FindControl("nrmoduloTextBox")
                as TextBox;
            int nrmodulo = int.Parse(TBModulo.Text);

            //string ligação
            string strLigacao = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            //abrir ligação à base de dados
            SqlConnection ligacao = new SqlConnection(strLigacao);
            ligacao.Open();
            //comando sql
            string sql = $@"SELECT * FROM Notas WHERE nprocesso={nprocesso}
                        AND id_disciplina={id_disciplina}
                        AND nrmodulo={nrmodulo}";
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