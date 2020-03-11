<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="adicionar.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Notas.adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!--Validações
    RequiredFieldValidator para todos campos
    Nota
        inteiro 0 e 20 (RangeValidator)
    Data
        textmode=date
        Validar datas não permitindo datas no futuro (Custom)
    Nrmodulo
        inteiro 1 e 20 (RangeValidator)
    -->
    <h1>Adicionar notas</h1>
    <asp:FormView DefaultMode="Insert" Width="100%" ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="SqlNotas">
        <EditItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel1" /><br />
            id_disciplina:
            <asp:TextBox Text='<%# Bind("id_disciplina") %>' runat="server" ID="id_disciplinaTextBox" /><br />
            nprocesso:
            <asp:TextBox Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoTextBox" /><br />
            valor:
            <asp:TextBox Text='<%# Bind("valor") %>' runat="server" ID="valorTextBox" /><br />
            data:
            <asp:TextBox Text='<%# Bind("data") %>' runat="server" ID="dataTextBox" /><br />
            nrmodulo:
            <asp:TextBox Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Disciplina:
            <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" SelectedValue='<%# Bind("id_disciplina") %>' DataSourceID="SqlDisciplinas" DataTextField="nome" DataValueField="id"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id], [nome] FROM [disciplinas] ORDER BY [nome]"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="DropDownList1"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="DropDownList1"
                ErrorMessage="Este aluno já tem nota nesta disciplina e módulo"
                OnServerValidate="CustomValidator2_ServerValidate" ></asp:CustomValidator>
            <br />
            Nº processo:
            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" SelectedValue='<%# Bind("nprocesso") %>' DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nprocesso], [nome] FROM [alunos] ORDER BY [nome]"></asp:SqlDataSource>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="DropDownList2"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <br />
            Valor da nota:
            <asp:TextBox TextMode="Number" PlaceHolder="Insira a nota do módulo" CssClass="form-control" Text='<%# Bind("valor") %>' runat="server" ID="valorTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="valorTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                Type="Integer" MinimumValue="0" MaximumValue="20"
                ControlToValidate="valorTextBox"
                ErrorMessage="A nota deve estar entre 0 e 20"></asp:RangeValidator>
            <br />
            Data:
            <asp:TextBox TextMode="Date" CssClass="form-control" Text='<%# Bind("data") %>' runat="server" ID="dataTextBox" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="dataTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="dataTextBox" OnServerValidate="CustomValidator1_ServerValidate"
                ErrorMessage="A data não é válida. Deve ser anterior ou igual à data atual."></asp:CustomValidator>
            <br />
            Nº módulo:
            <asp:TextBox TextMode="Number" PlaceHolder="Insira o nº do módulo" CssClass="form-control" Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="nrmoduloTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator2" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                Type="Integer" MinimumValue="1" MaximumValue="20"
                ControlToValidate="nrmoduloTextBox"
                ErrorMessage="O número do módulo deve estar entre 0 e 20"></asp:RangeValidator>
            <br />
            <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            id:
            <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /><br />
            id_disciplina:
            <asp:Label Text='<%# Bind("id_disciplina") %>' runat="server" ID="id_disciplinaLabel" /><br />
            nprocesso:
            <asp:Label Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            valor:
            <asp:Label Text='<%# Bind("valor") %>' runat="server" ID="valorLabel" /><br />
            data:
            <asp:Label Text='<%# Bind("data") %>' runat="server" ID="dataLabel" /><br />
            nrmodulo:
            <asp:Label Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloLabel" /><br />
            <asp:LinkButton  runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' InsertCommand="INSERT INTO notas(id_disciplina, nprocesso, valor, data, nrmodulo) VALUES (@id_disciplina, @nprocesso, @valor, @data, @nrmodulo)" SelectCommand="SELECT * FROM [notas]">
        <InsertParameters>
            <asp:Parameter Name="id_disciplina"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
            <asp:Parameter Name="valor"></asp:Parameter>
            <asp:Parameter Name="data" DbType="Date"></asp:Parameter>
            <asp:Parameter Name="nrmodulo"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
