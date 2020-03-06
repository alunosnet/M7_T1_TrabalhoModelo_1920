<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="notas_aluno.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Aluno.notas_aluno" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>As minhas notas</h1>
    <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlNotas">
        <Columns>
            <asp:BoundField DataField="nome" HeaderText="nome" SortExpression="nome"></asp:BoundField>
            <asp:BoundField DataField="nrmodulo" HeaderText="nrmodulo" SortExpression="nrmodulo"></asp:BoundField>
            <asp:BoundField DataField="valor" HeaderText="valor" SortExpression="valor"></asp:BoundField>
            <asp:BoundField DataField="data" DataFormatString="{0:dd-MM-yyyy}" HeaderText="data" SortExpression="data"></asp:BoundField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT disciplinas.nome, notas.nrmodulo, notas.valor, notas.data FROM notas INNER JOIN disciplinas ON notas.id_disciplina = disciplinas.id WHERE (notas.nprocesso = @nprocesso)">
        <SelectParameters>
            <asp:SessionParameter SessionField="nprocesso" Name="nprocesso"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
