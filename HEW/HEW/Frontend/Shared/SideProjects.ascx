<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideProjects.ascx.cs" Inherits="HEW.Frontend.Shared.SideProjects" %>

<asp:Repeater ID="rptSideProjects" runat="server">
    <HeaderTemplate>
        <div class="projects">
            <ul class="bxslider">
    </HeaderTemplate>
    <ItemTemplate>
        <li>
            <a href="#">
                <img alt="" src="http://images.weserv.nl/?url=res.cloudinary.com/dlyvxs7of/image/upload/<%# GetRandomImg(Convert.ToInt32(Eval("ID")), Convert.ToInt32(Eval("ImgsCount"))) %>.jpg&h=238&w=248&t=absolute" title="<%#Eval("Name") %>" /></a></li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
        </div>
    </FooterTemplate>
</asp:Repeater>




