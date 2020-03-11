<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="pesquisar.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Notas.pesquisar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>Pesquisar notas</h2>
    Nome do aluno: <asp:TextBox CssClass="form-control" ID="tbnome" runat="server"></asp:TextBox><asp:Button CssClass="btn btn-info" runat="server" ID="bt1" Text="Pesquisar" />
    <asp:GridView CssClass="table" runat="server" ID="GV1" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="Nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="valor" HeaderText="Nota" SortExpression="valor"></asp:BoundField>
            <asp:BoundField DataField="data" DataFormatString="{0:dd-MM-yyyy}" HeaderText="Data" SortExpression="data"></asp:BoundField>
            <asp:BoundField DataField="nrmodulo" HeaderText="Nº módulo" SortExpression="nrmodulo"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT disciplinas.nome, notas.valor, notas.data, notas.nrmodulo FROM alunos INNER JOIN notas ON alunos.nprocesso = notas.nprocesso INNER JOIN disciplinas ON notas.id_disciplina = disciplinas.id WHERE (alunos.nome LIKE '%' + @nome + '%')">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbnome" PropertyName="Text" Name="nome"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
