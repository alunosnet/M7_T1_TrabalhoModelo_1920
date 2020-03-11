<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="perfil_aluno.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Aluno.perfil_aluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Área de aluno</h1>
    <asp:FormView Width="100%" ID="FormView1" runat="server" DataKeyNames="nprocesso" DataSourceID="SqlAluno">
        <EditItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("nprocesso","~/Public/imagens/{0}.jpg") %>' Width="200px" />
            <br />
            Nº processo:
            <asp:Label CssClass="form-control" Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel1" /><br />
            Nome:
            <asp:Label CssClass="form-control" Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            Morada:
            <asp:TextBox MaxLength="100"  CssClass="form-control" Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="moradaTextBox"
                ErrorMessage="O campo é obrigatório"></asp:RequiredFieldValidator>
            <br />Código postal:
            <asp:TextBox MaxLength="8" CssClass="form-control" Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                CssClass="alert-danger" Display="Dynamic"
                ControlToValidate="cpTextBox"                
                ErrorMessage="O campo é obrigatório."></asp:RequiredFieldValidator>            
            <br />Data nascimento:
            <asp:Label CssClass="form-control" Text='<%# Bind("data_nascimento","{0:dd-MM-yyy}") %>' runat="server" ID="data_nascimentoTextBox" /><br />
            Género:
            <asp:Label CssClass="form-control" Text='<%# Bind("genero") %>' runat="server" ID="generoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            nome:
            <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /><br />
            morada:
            <asp:TextBox Text='<%# Bind("morada") %>' runat="server" ID="moradaTextBox" /><br />
            cp:
            <asp:TextBox Text='<%# Bind("cp") %>' runat="server" ID="cpTextBox" /><br />
            data_nascimento:
            <asp:TextBox Text='<%# Bind("data_nascimento") %>' runat="server" ID="data_nascimentoTextBox" /><br />
            genero:
            <asp:TextBox Text='<%# Bind("genero") %>' runat="server" ID="generoTextBox" /><br />
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("nprocesso","~/Public/imagens/{0}.jpg") %>' Width="200px" />
            <br />
            Nº processo:
            <asp:Label CssClass="form-control" Text='<%# Eval("nprocesso") %>' runat="server" ID="nprocessoLabel" /><br />
            Nome:
            <asp:Label CssClass="form-control" Text='<%# Bind("nome") %>' runat="server" ID="nomeLabel" /><br />
            Morada:
            <asp:Label CssClass="form-control" Text='<%# Bind("morada") %>' runat="server" ID="moradaLabel" /><br />
            Código postal:
            <asp:Label CssClass="form-control" Text='<%# Bind("cp") %>' runat="server" ID="cpLabel" /><br />
            Data nascimento:
            <asp:Label CssClass="form-control" Text='<%# Bind("data_nascimento","{0:dd-MM-yyy}") %>' runat="server" ID="data_nascimentoLabel" /><br />
            Género:
            <asp:Label CssClass="form-control" Text='<%# Bind("genero") %>' runat="server" ID="generoLabel" /><br />
            <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" ID="EditButton" CausesValidation="False" />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlAluno" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [alunos]
where nprocesso=@nprocesso"
        UpdateCommand="UPDATE alunos SET morada = @morada, cp = @cp WHERE (nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:SessionParameter SessionField="nprocesso" Name="nprocesso"></asp:SessionParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="morada"></asp:Parameter>
            <asp:Parameter Name="cp"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
