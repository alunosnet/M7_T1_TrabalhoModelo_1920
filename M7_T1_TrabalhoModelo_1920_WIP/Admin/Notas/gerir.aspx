<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="gerir.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.Admin.Notas.gerir" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Gerir Notas
    </h1>
    Aluno:
    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server"></asp:TextBox><asp:Button CssClass="btn btn-info" ID="Button1" runat="server" Text="Pesquisar" />
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
            <asp:TemplateField HeaderText="Disciplina" SortExpression="id_disciplina">
                <EditItemTemplate>
                    <asp:DropDownList CssClass="form-control" ID="DropDownList1" runat="server" SelectedValue='<%# Bind("id_disciplina") %>' DataSourceID="SqlDisciplinas" DataTextField="nome" DataValueField="id"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [id], [nome] FROM [disciplinas] ORDER BY [nome]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="DropDownList1"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="Label1" Text='<%# Bind("disciplina") %>' ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Aluno" SortExpression="nprocesso">
                <EditItemTemplate>
                    <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" SelectedValue='<%# Bind("nprocesso") %>' DataSourceID="SqlAlunos" DataTextField="nome" DataValueField="nprocesso"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlAlunos" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT [nprocesso], [nome] FROM [alunos] ORDER BY [nome]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="DropDownList2"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("aluno") %>' ID="Label2"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nota" SortExpression="valor">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Number" PlaceHolder="Insira a nota do módulo" CssClass="form-control" Text='<%# Bind("valor") %>' runat="server" ID="valorTextBox" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="valorTextBox"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        Type="Integer" MinimumValue="0" MaximumValue="20"
                        ControlToValidate="valorTextBox"
                        ErrorMessage="A nota deve estar entre 0 e 20"></asp:RangeValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("valor") %>' ID="Label3"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Data" SortExpression="data">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Date" CssClass="form-control" Text='<%# Bind("data","{0:yyyy-MM-dd}") %>' runat="server" ID="dataTextBox" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="dataTextBox"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="dataTextBox" OnServerValidate="CustomValidator1_ServerValidate"
                        ErrorMessage="A data não é válida. Deve ser anterior ou igual à data atual."></asp:CustomValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("data","{0:dd-MM-yyyy}") %>' ID="Label4"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nº módulo" SortExpression="nrmodulo">
                <EditItemTemplate>
                    <asp:TextBox TextMode="Number" PlaceHolder="Insira o nº do módulo" CssClass="form-control" Text='<%# Bind("nrmodulo") %>' runat="server" ID="nrmoduloTextBox" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        ControlToValidate="nrmoduloTextBox"
                        ErrorMessage="Campo obrigatório"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator2" runat="server"
                        CssClass="alert-danger" Display="Dynamic"
                        Type="Integer" MinimumValue="1" MaximumValue="20"
                        ControlToValidate="nrmoduloTextBox"
                        ErrorMessage="O número do módulo deve estar entre 0 e 20"></asp:RangeValidator>

                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("nrmodulo") %>' ID="Label5"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
    </asp:GridView>

    <asp:SqlDataSource runat="server" ID="SqlNotas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' DeleteCommand="delete from notas where id=@id" 
        SelectCommand="SELECT notas.id, notas.id_disciplina, notas.nprocesso, notas.valor, notas.data, notas.nrmodulo,alunos.nome as aluno,disciplinas.nome as disciplina FROM notas INNER JOIN alunos ON notas.nprocesso = alunos.nprocesso inner join disciplinas on notas.id_disciplina=disciplinas.id WHERE (alunos.nome LIKE '%' + @nome + '%')" UpdateCommand="UPDATE notas SET id_disciplina = @id_disciplina, nprocesso = @nprocesso, valor = @valor, data = @data, nrmodulo = @nrmodulo WHERE (id = @id)">
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
