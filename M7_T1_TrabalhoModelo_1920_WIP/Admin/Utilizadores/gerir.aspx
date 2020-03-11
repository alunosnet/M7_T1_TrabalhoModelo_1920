<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Utilizadores.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Gerir utilizadores</h2>
    <asp:GridView CssClass="table" runat="server" ID="gv1" AutoGenerateColumns="False" DataKeyNames="nome" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ControlStyle-CssClass="btn btn-danger" ShowDeleteButton="True"></asp:CommandField>
            <asp:BoundField DataField="nome" HeaderText="Nome" ReadOnly="True" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="perfil" HeaderText="Perfil" SortExpression="perfil"></asp:BoundField>
            <asp:BoundField DataField="nprocesso" HeaderText="Nº processo" SortExpression="nprocesso"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="SELECT nome, palavra_passe, perfil, nprocesso FROM utilizadores WHERE (nome = @nome)" SelectCommand="SELECT * FROM [utilizadores]">
        <DeleteParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>
