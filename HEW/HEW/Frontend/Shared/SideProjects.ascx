<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideProjects.ascx.cs" Inherits="HEW.Frontend.Shared.SideProjects" %>

<asp:Repeater ID="rptSideProjects" runat="server">
    <HeaderTemplate>
        <div class="projects">
            <ul class="bxslider">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <a href="#">
                <img alt="" src="http://res.cloudinary.com/dlyvxs7of/image/upload/h_238,w_248/<%# GetRandomImg(Convert.ToInt32(Eval("ID")), Convert.ToInt32(Eval("ImgsCount"))) %>.jpg" title="<%#Eval("Name") %>" /></a></li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
        </div>
    </FooterTemplate>
</asp:Repeater>




