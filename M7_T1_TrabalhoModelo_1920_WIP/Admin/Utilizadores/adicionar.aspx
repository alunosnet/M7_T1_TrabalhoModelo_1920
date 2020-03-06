<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="adicionar.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Utilizadores.adicionar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Adicionar conta de utilizador</h1>
    <asp:FormView DefaultMode="Insert" Width="100%" ID="FormView1" runat="server" DataKeyNames="nome" DataSourceID="SqlUtilizadores">
        <EditItemTemplate>
            nome:
            <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel1" /><br />
            palavra_passe:
            <asp:TextBox Text='<%# Bind("palavra_passe") %>' runat="server" ID="palavra_passeTextBox" /><br />
            perfil:
            <asp:TextBox Text='<%# Bind("perfil") %>' runat="server" ID="perfilTextBox" /><br />
            nprocesso:
            <asp:TextBox Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            Nome:
            <asp:TextBox MaxLength="40" CssClass="form-control" Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="nomeTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <br />
            Palavra passe:
            <asp:TextBox TextMode="Password" CssClass="form-control"  Text='<%# Bind("palavra_passe") %>' runat="server" ID="palavra_passeTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="palavra_passeTextBox"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <br />
            Confirmar a palavra passe:
            <asp:TextBox TextMode="Password" CssClass="form-control"  runat="server" ID="confirmaPP" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="confirmaPP"
                ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ErrorMessage="As palavras passe não são iguais."
                ControlToValidate="confirmaPP" ControlToCompare="palavra_passeTextBox"
                Type="String" Operator="Equal"
                ></asp:CompareValidator>
            <br />
            Nº de processo:
            <asp:DropDownList CssClass="form-control" SelectedValue='<%# Bind("nprocesso") %>' ID="DropDownList1" runat="server" DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nprocesso], [nome] FROM [alunos]
where nprocesso not in (SELECT nprocesso from utilizadores where nprocesso is not null)"></asp:SqlDataSource>
            <br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            nome:
            <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /><br />
            palavra_passe:
            <asp:Label Text='<%# Bind("palavra_passe") %>' runat="server" ID="palavra_passeLabel" /><br />
            perfil:
            <asp:Label Text='<%# Bind("perfil") %>' runat="server" ID="perfilLabel" /><br />
            nprocesso:
            <asp:Label Text='<%# Bind("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            <asp:LinkButton runat="server" Text="New" CommandName="New" ID="NewButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlUtilizadores" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' InsertCommand="INSERT INTO utilizadores(nome, palavra_passe, perfil, nprocesso) VALUES (@nome, HASHBYTES('SHA2_512', @palavra_passe), 1, @nprocesso)" SelectCommand="SELECT * FROM [utilizadores]">
        <InsertParameters>
            <asp:Parameter Name="nome" DbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="palavra_passe" DbType="AnsiString"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
