<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Internal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Frontend.Projects.Default" %>

<%@ Register Src="~/Frontend/Shared/SidePartnerships.ascx" TagPrefix="uc1" TagName="SidePartnerships" %>
<%@ Register Src="~/Frontend/Projects/LeftMenu.ascx" TagPrefix="uc2" TagName="LeftMenu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AL HUDA Engineering Works - About AL-HUDA</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="image-banner about">
        <div class="image-banner-title">
            <span class="title">PROJECTS CATEGORIES</span>
        </div>
    </div>
    <div class="content">
        <div class="left-sidebar">
            <uc2:LeftMenu runat="server" ID="LeftMenu" />

            <div class="partners">
                <uc1:SidePartnerships runat="server" ID="SidePartnerships" />
            </div>
        </div>
        <div class="right-content">

            <span class="section-title" style="margin-top: 40px;">The standard Lorem Ipsum passage, used since the 1500s</span>

            <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p>

            <div class="projectsHome">
                <ul>
                    <asp:Repeater runat="server" ID="rptProjectCategories">
                        <ItemTemplate>
                            <li>
                                <a href="ProjectsList.aspx?ProjectCategory=<%#Eval("ID") %>">
                                    <span class="text"><%#Eval("Name") %></span>
                                    <span class="image">
                                        <img src="/Content/images/ProjectsCategories/<%#Eval("ID") %>.jpg" /></span>
                                </a>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>

                </ul>
            </div>

        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
