<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="pesquisar.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Utilizadores.pesquisar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Pesquisar utilizadores</h2>
    Nome do utilizador: <asp:TextBox CssClass="form-control" runat="server" ID="tbnome"></asp:TextBox><asp:Button CssClass="btn btn-info" runat="server" ID="bt1" Text="Pesquisar" />
    <asp:GridView CssClass="table" runat="server" ID="gv1" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="nome">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="nome" ReadOnly="True" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="perfil" HeaderText="perfil" SortExpression="perfil"></asp:BoundField>
            <asp:BoundField DataField="nprocesso" HeaderText="nprocesso" SortExpression="nprocesso"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [utilizadores] WHERE ([nome] LIKE '%' + @nome + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbnome" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
