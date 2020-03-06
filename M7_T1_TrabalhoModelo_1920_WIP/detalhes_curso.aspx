<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="detalhes_curso.aspx.cs" Inherits="M7_T1_TrabalhoModelo_1920_WIP.detalhes_curso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h1>Ver detalhes do curso</h1>
    <a href="/index.aspx">Voltar</a>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDisciplinas" DataKeyNames="id">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nrmodulos") %>' runat="server" ID="nrmodulosLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("curso") %>' runat="server" ID="cursoLabel" /></td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" />
                </td>
                <td>
                    <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel1" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("curso") %>' runat="server" ID="cursoTextBox" /></td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
                <td>
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" />
                    <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" />
                </td>
                <td>&nbsp;</td>
                <td>
                    <asp:TextBox Text='<%# Bind("nome") %>' runat="server" ID="nomeTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("nrmodulos") %>' runat="server" ID="nrmodulosTextBox" /></td>
                <td>
                    <asp:TextBox Text='<%# Bind("curso") %>' runat="server" ID="cursoTextBox" /></td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nrmodulos") %>' runat="server" ID="nrmodulosLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("curso") %>' runat="server" ID="cursoLabel" /></td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table runat="server" id="itemPlaceholderContainer" style="" border="0">
                            <tr runat="server" style="">
                                <th runat="server">id</th>
                                <th runat="server">nome</th>
                                <th runat="server">nrmodulos</th>
                                <th runat="server">curso</th>
                            </tr>
                            <tr runat="server" id="itemPlaceholder"></tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style=""></td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label Text='<%# Eval("id") %>' runat="server" ID="idLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nome") %>' runat="server" ID="nomeLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("nrmodulos") %>' runat="server" ID="nrmodulosLabel" /></td>
                <td>
                    <asp:Label Text='<%# Eval("curso") %>' runat="server" ID="cursoLabel" /></td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource runat="server" ID="SqlDisciplinas" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [disciplinas] WHERE ([curso] = @curso) ORDER BY [nome]">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="curso" Name="curso" Type="String"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
