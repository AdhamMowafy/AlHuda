<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Admin.News.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <asp:ScriptManager runat="server" ID="sm"></asp:ScriptManager>
    <div id="breadcrumb">
        <ul>
            <li>
                <img src="/Admin/Content/images/icons/icon_breadcrumb.png" alt="Location" /></li>
            <li><strong>Location:</strong></li>
            <li><a href="/Admin/">Admin</a></li>
            <li>/</li>
            <li class="current">News</li>
        </ul>

    </div>
    <div id="rightside">
        <asp:UpdatePanel runat="server" ID="panel">
            <ContentTemplate>
                <asp:GridView ID="gvNews" runat="server" Width="1000" AllowPaging="True" AllowSorting="True" DataSourceID="ldsNews" PageSize="5" AutoGenerateColumns="False">
                    <AlternatingRowStyle CssClass="alt"></AlternatingRowStyle>
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="PublishDate" HeaderText="Publish Date" />
                        <asp:HyperLinkField DataTextFormatString="<img src='/Admin/Content/images/icons/icon_edit.png' />" DataNavigateUrlFields="ID"
                            DataNavigateUrlFormatString="New.aspx?ID={0}" DataTextField="ID"></asp:HyperLinkField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" ImageUrl="/Admin/Content/images/icons/icon_delete.png" CommandArgument='<%#Eval("ID")%>' runat="server" Text="Delete" OnClick="btnDelete_Click" OnClientClick='<%# "return ConfirmationMsg(\"" +Eval("Title") + "\" );" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:LinqDataSource ID="ldsNews" runat="server" ContextTypeName="HEW.Model.HEWDataContext"
        TableName="News">
    </asp:LinqDataSource>
</asp:Content>
