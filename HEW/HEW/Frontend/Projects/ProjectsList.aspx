<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Internal.Master" AutoEventWireup="true" CodeBehind="ProjectsList.aspx.cs" Inherits="HEW.Frontend.Projects.ProjectsList" %>

<%@ Register Src="~/Frontend/Shared/SidePartnerships.ascx" TagPrefix="uc1" TagName="SidePartnerships" %>
<%@ Register Src="~/Frontend/Projects/LeftMenu.ascx" TagPrefix="uc2" TagName="LeftMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content">
        <div class="left-sidebar">
            <uc2:LeftMenu runat="server" ID="LeftMenu" />

            <div class="partners">
                <uc1:SidePartnerships runat="server" ID="SidePartnerships" />
            </div>
        </div>
        <div class="right-content">
            <asp:Repeater runat="server" ID="rptProjectCategories">
                <HeaderTemplate>
                    <ul class="project-box">
                </HeaderTemplate>
                <ItemTemplate>
                    <li>
                        <a href="ProjectDetails.aspx?ProjectID=<%#Eval("ID") %>">
                            <img alt="" src="http://res.cloudinary.com/dlyvxs7of/image/upload/h_242,w_302/<%# HEW.Model.Repositories.ProjectsRepository.GetRandomImg(Convert.ToInt32(Eval("ID")), Convert.ToInt32(Eval("ImgsCount"))) %>.png" />
                            <span><%#Eval("Name") %></span>
                        </a>
                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="clearfix"></div>
</asp:Content>
