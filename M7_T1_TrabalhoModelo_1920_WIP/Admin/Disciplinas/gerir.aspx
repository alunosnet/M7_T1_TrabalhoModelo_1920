<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Disciplinas.gerir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Gerir disciplinas</h1>
    <asp:GridView PageSize="15" CssClass="table" runat="server" ID="GridView1" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDisciplinas" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton CssClass="btn btn-danger" runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton CssClass="btn btn-info" runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton CssClass="btn btn-info" runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton OnClientClick="return confirm('Tem a certeza que pretende remover esta disciplina?')" CssClass="btn btn-danger"  runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:TemplateField HeaderText="Nome" SortExpression="nome">
                <EditItemTemplate>
                    <asp:TextBox  MaxLength="40" CssClass="form-control" runat="server" Text='<%# Bind("nome") %>' ID="nomeTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="nomeTextBox"
                ErrorMessage="Campo obrigatório"
                Display="Dynamic" CssClass="alert-danger"
                ></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator1" runat="server" 
                ErrorMessage="O nome deve ter pelo menos 2 letras"
                ControlToValidate="nomeTextBox"
                Display="Dynamic" CssClass="alert-danger"
                OnServerValidate="CustomValidator1_ServerValidate"
                ></asp:CustomValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nome") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nº módulos" SortExpression="nrmodulos">
                <EditItemTemplate>
                    <asp:TextBox CssClass="form-control" TextMode="Number" runat="server" Text='<%# Bind("nrmodulos") %>' ID="nrmodulosTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="nrmodulosTextBox"
                ErrorMessage="Campo obrigatório"
                Display="Dynamic" CssClass="alert-danger"
                ></asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                ErrorMessage="O número de módulos deve estar entre 1 e 20"
                Display="Dynamic" CssClass="alert-danger"
                ControlToValidate="nrmodulosTextBox"
                Type="Integer" MinimumValue="1" MaximumValue="20"
                ></asp:RangeValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nrmodulos") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Curso" SortExpression="curso">
                <EditItemTemplate>
                    <asp:TextBox MaxLength="40" CssClass="form-control" runat="server" Text='<%# Bind("curso") %>' ID="cursoTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="cursoTextBox"
                ErrorMessage="Campo obrigatório"
                Display="Dynamic" CssClass="alert-danger"
                ></asp:RequiredFieldValidator>
            <asp:CustomValidator ID="CustomValidator2" runat="server" 
                ErrorMessage="O curso deve ter pelo menos 2 letras"
                ControlToValidate="cursoTextBox"
                Display="Dynamic" CssClass="alert-danger"
                OnServerValidate="CustomValidator1_ServerValidate"
                ></asp:CustomValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("curso") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="delete from disciplinas WHERE        (id = @id)" SelectCommand="SELECT * FROM [disciplinas]" UpdateCommand="UPDATE disciplinas SET nome = @nome, nrmodulos = @nrmodulos, curso = @curso WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="nome"></asp:Parameter>
            <asp:Parameter Name="nrmodulos"></asp:Parameter>
            <asp:Parameter Name="curso"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
