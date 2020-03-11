<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="pesquisar.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Alunos.pesquisar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>Pesquisar aluno</h2>
    Nome:<asp:TextBox CssClass="form-control" ID="tbnome" runat="server" /><asp:Button CssClass="btn btn-info" runat="server" Text="Pesquisar" ID="bt1" />
    <asp:GridView CssClass="table" runat="server" ID="GridView1" AutoGenerateColumns="False" DataKeyNames="nprocesso" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowSelectButton="True"></asp:CommandField>
            <asp:BoundField DataField="nprocesso" HeaderText="Nº processo" ReadOnly="True" InsertVisible="False" SortExpression="nprocesso"></asp:BoundField>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="morada" HeaderText="Morada" SortExpression="morada"></asp:BoundField>
            <asp:BoundField DataField="cp" HeaderText="Cód. Postal" SortExpression="cp"></asp:BoundField>
            <asp:BoundField DataField="data_nascimento" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Data nascimento" SortExpression="data_nascimento"></asp:BoundField>
            <asp:BoundField DataField="genero" HeaderText="Género" SortExpression="genero"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [alunos] WHERE ([nome] LIKE '%' + @nome + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbnome" PropertyName="Text" Name="nome" Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <h2>Notas</h2>
    <asp:GridView CssClass="table" EmptyDataText="Selecione um aluno para ver as notas" runat="server" ID="GridView2" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="nrmodulo" HeaderText="Nº módulo" SortExpression="nrmodulo"></asp:BoundField>
            <asp:BoundField DataField="data" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Data" SortExpression="data"></asp:BoundField>
            <asp:BoundField DataField="valor" HeaderText="Nota" SortExpression="valor"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT disciplinas.nome, notas.nrmodulo, notas.data, notas.valor FROM notas INNER JOIN disciplinas ON notas.id_disciplina = disciplinas.id WHERE (notas.nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="nprocesso"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
