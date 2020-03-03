<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--login-->
    <div runat="server" id="divLogin">
        Nome:<asp:TextBox ID="TBNome" runat="server"></asp:TextBox>
        Password:<asp:TextBox ID="TBPassword" TextMode="Password" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Login" />
        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        <asp:DetailsView OnDataBound="DetailsView1_DataBound" ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="nome" DataSourceID="SqlLogin">
            <Fields>
                <asp:BoundField DataField="nome" HeaderText="nome" ReadOnly="True" SortExpression="nome"></asp:BoundField>
                <asp:BoundField DataField="palavra_passe" HeaderText="palavra_passe" SortExpression="palavra_passe"></asp:BoundField>
                <asp:BoundField DataField="perfil" HeaderText="perfil" SortExpression="perfil"></asp:BoundField>
                <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" SortExpression="nprocesso"></asp:BoundField>
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource runat="server" ID="SqlLogin" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' 
            SelectCommand="SELECT * FROM [utilizadores] WHERE (([nome] = @nome) AND ([palavra_passe] =HASHBYTES('SHA2_512', @palavra_passe)))">
            <SelectParameters>
                <asp:ControlParameter ControlID="TBNome" PropertyName="Text" Name="nome" DbType="AnsiString" ></asp:ControlParameter>
                <asp:ControlParameter ControlID="TBPassword" PropertyName="Text" Name="palavra_passe" DbType="AnsiString" ></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <!--Lista de cursos-->
    <div runat="server" id="divCursos"></div>
    <!--Lista disciplinas-->
    <div runat="server" id="divDisciplinas"></div>
</asp:Content>
