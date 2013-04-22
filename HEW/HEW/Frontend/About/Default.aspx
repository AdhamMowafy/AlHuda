<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Internal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Frontend.About.Default" %>

<%@ Register Src="~/Frontend/About/LeftMenu.ascx" TagPrefix="uc1" TagName="LeftMenu" %>
<%@ Register Src="~/Frontend/Shared/SidePartnerships.ascx" TagPrefix="uc1" TagName="SidePartnerships" %>
<%@ Register Src="~/Frontend/Shared/SideProjects.ascx" TagPrefix="uc1" TagName="SideProjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AL HUDA Engineering Works - About AL-HUDA</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="image-banner about">
        <div class="image-banner-title">
            <span class="title">ABOUT AL HUDA</span>
        </div>
    </div>
    <div class="content">
        <div class="left-sidebar">
            <uc1:LeftMenu runat="server" ID="LeftMenu" />

            <uc1:SideProjects runat="server" ID="SideProjects" />
            <div class="partners">
                <uc1:SidePartnerships runat="server" ID="SidePartnerships" />
            </div>
        </div>
        <div class="right-content">
            <span class="section-title">The standard Lorem Ipsum passage, used since the 1500s</span>

            <p>"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."</p>
            <ul class="content-box">
                <li>
                    <span class="main"><%=strNetAssets %></span>
                    <span class="desc">Net Assets Development</span>
                </li>
                <li>
                    <span class="main"><%=strCapital %></span>
                    <span class="desc">Capital Development</span>
                </li>
                <li>
                    <span class="main"><%=strStaff %></span>
                    <span class="desc">total employees in alhuda</span>
                </li>
            </ul>
            <div class="clearfix"></div>
            <span class="section-title" style="margin-top: 40px;">The standard Lorem Ipsum passage, used since the 1500s</span>

            <p>"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?"</p>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
