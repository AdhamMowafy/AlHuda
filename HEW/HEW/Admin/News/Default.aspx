<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Admin.News.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <asp:ScriptManager runat="server" ID="sm"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="panel">
        <ContentTemplate>
            <asp:GridView ID="gvNews" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ldsNews" PageSize="5" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="Title" />
                    <asp:BoundField DataField="PublishDate" HeaderText="Publish Date" />
                    <asp:HyperLinkField DataTextFormatString="Edit" DataNavigateUrlFields="ID"
                        DataNavigateUrlFormatString="New.aspx?ID={0}" DataTextField="ID"></asp:HyperLinkField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" ImageUrl="" CommandArgument='<%#Eval("ID")%>' runat="server" Text="Delete" OnClick="btnDelete_Click" OnClientClick='<%# "return ConfirmationMsg(\"" +Eval("Title") + "\" );" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>


    </asp:UpdatePanel>
    <asp:LinqDataSource ID="ldsNews" runat="server" ContextTypeName="HEW.Model.HEWDataContext"
        TableName="News">
    </asp:LinqDataSource>
</asp:Content>
