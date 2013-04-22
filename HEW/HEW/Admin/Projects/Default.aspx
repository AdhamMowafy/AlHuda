<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Admin.Projects.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <asp:ScriptManager runat="server" ID="sm"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="panel">
        <ContentTemplate>
            <asp:GridView ID="gvProjects" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ldsProjects" PageSize="5" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Name" HeaderText="Project Name" />
                    <asp:HyperLinkField DataTextFormatString="Edit" DataNavigateUrlFields="ID"
                        DataNavigateUrlFormatString="New.aspx?ID={0}" DataTextField="ID"></asp:HyperLinkField>
                    <asp:HyperLinkField DataTextFormatString="Images" DataNavigateUrlFields="ID"
                        DataNavigateUrlFormatString="ProjectImages.aspx?ProjectID={0}" DataTextField="ID"></asp:HyperLinkField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:ImageButton ImageUrl="" CommandArgument='<%#Eval("ID")%>' runat="server" Text="Delete" OnClick="btnDelete_Click" OnClientClick='<%# "return ConfirmationMsg(\"" +Eval("Name") + "\" );" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </ContentTemplate>


    </asp:UpdatePanel>
    <asp:LinqDataSource ID="ldsProjects" runat="server" ContextTypeName="HEW.Model.HEWDataContext"
        TableName="Projects">
    </asp:LinqDataSource>
</asp:Content>
