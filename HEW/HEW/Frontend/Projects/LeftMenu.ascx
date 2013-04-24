<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftMenu.ascx.cs" Inherits="HEW.Frontend.Projects.LeftMenu" %>
<asp:Repeater runat="server" ID="rptProjectCategories">
    <HeaderTemplate>
        <div class="navig">
            <ul>
    </HeaderTemplate>
    <ItemTemplate>
        <li><a href="ProjectsList.aspx?ProjectCategory=<%#Eval("ID") %>" class="<%#Eval("Class") %>"><%#Eval("Name") %></a></li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
</div>
    </FooterTemplate>
</asp:Repeater>
