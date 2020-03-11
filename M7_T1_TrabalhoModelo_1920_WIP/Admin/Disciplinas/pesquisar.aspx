<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="pesquisar.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Disciplinas.pesquisar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Curso:<asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox><asp:Button CssClass="btn btn-info" ID="Button1" runat="server" Text="Pesquisar" />
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDisciplinas1">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="nrmodulos" HeaderText="Nº módulos" SortExpression="nrmodulos"></asp:BoundField>
            <asp:BoundField DataField="curso" HeaderText="Curso" SortExpression="curso"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [disciplinas] WHERE ([curso] LIKE '%' + @curso + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="curso" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <hr />
    Curso:<asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlCursos" DataTextField="curso" DataValueField="curso"></asp:DropDownList>
    <asp:SqlDataSource runat="server" ID="SqlCursos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT DISTINCT [curso] FROM [disciplinas]"></asp:SqlDataSource>
    <asp:GridView CssClass="table" ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDisciplinas2">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="nrmodulos" HeaderText="Nº módulos" SortExpression="nrmodulos"></asp:BoundField>
            <asp:BoundField DataField="curso" HeaderText="Curso" SortExpression="curso"></asp:BoundField>
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlDisciplinas2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [disciplinas] WHERE ([curso] = @curso)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" PropertyName="SelectedValue" Name="curso" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
