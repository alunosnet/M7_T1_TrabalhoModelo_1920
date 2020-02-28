<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Notas.gerir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir Notas
    </h1>
    Aluno:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><asp:Button ID="Button1" runat="server" Text="Pesqusiar" />
    <asp:GridView EmptyDataText="Não tem notas registadas nesse aluno." CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlNotas" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton runat="server" Text="Update" CommandName="Update" CausesValidation="True" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:LinkButton runat="server" Text="Edit" CommandName="Edit" CausesValidation="False" ID="LinkButton1"></asp:LinkButton>&nbsp;<asp:LinkButton OnClientClick="return confirm('Tem a certeza que pretende remover esta nota?')" runat="server" Text="Delete" CommandName="Delete" CausesValidation="False" ID="LinkButton2"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" InsertVisible="False" SortExpression="id"></asp:BoundField>
            <asp:TemplateField HeaderText="id_disciplina" SortExpression="id_disciplina">
                <EditItemTemplate>
                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" SelectedValue='<%# Bind("id_disciplina") %>' DataSourceID="SqlDisciplinas" DataTextField="nome" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id], [nome] FROM [disciplinas] ORDER BY [nome]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="DropDownList1"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("id_disciplina") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nprocesso" SortExpression="nprocesso">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("nprocesso") %>' ID="TextBox2"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nprocesso") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="valor" SortExpression="valor">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("valor") %>' ID="TextBox3"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("valor") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="data" SortExpression="data">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Date" runat="server" Text='<%# Bind("data","{0:yyyy-MM-dd}") %>' ID="TextBox4"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("data","{0:dd-MM-yyyy}") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="nrmodulo" SortExpression="nrmodulo">
                <EditItemTemplate>
                    <asp:TextBox runat="server" Text='<%# Bind("nrmodulo") %>' ID="TextBox5"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nrmodulo") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="delete from notas where id=@id" SelectCommand="SELECT notas.id, notas.id_disciplina, notas.nprocesso, notas.valor, notas.data, notas.nrmodulo FROM notas INNER JOIN alunos ON notas.nprocesso = alunos.nprocesso WHERE (alunos.nome LIKE '%' + @nome + '%')" UpdateCommand="UPDATE notas SET id_disciplina = @id_disciplina, nprocesso = @nprocesso, valor = @valor, data = @data, nrmodulo = @nrmodulo WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id"></asp:Parameter>
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" PropertyName="Text" Name="nome"></asp:ControlParameter>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_disciplina"></asp:Parameter>
            <asp:Parameter Name="nprocesso"></asp:Parameter>
            <asp:Parameter Name="valor"></asp:Parameter>
            <asp:Parameter Name="data" DbType="Date"></asp:Parameter>
            <asp:Parameter Name="nrmodulo"></asp:Parameter>
            <asp:Parameter Name="id"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
