<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Internal.Master" AutoEventWireup="true" CodeBehind="ProjectsList.aspx.cs" Inherits="HEW.Frontend.Projects.ProjectsList" %>

<%@ Register Src="~/Frontend/Shared/SidePartnerships.ascx" TagPrefix="uc1" TagName="SidePartnerships" %>
<%@ Register Src="~/Frontend/Projects/LeftMenu.ascx" TagPrefix="uc2" TagName="LeftMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AL HUDA Engineering Works - Our Projects</title>
    <script type="text/javascript" src="/Scripts/fancy/jquery.colorbox.js"></script>
    <link rel="stylesheet" type="text/css" href="/Scripts/fancy/colorbox.css" />

    <script>
        $(document).ready(function () {
            $(".group1").colorbox({ rel: 'group1' });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="image-banner about">
        <div class="image-banner-title">
            <span class="title">OUR PROJECTS</span>
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
            <ul class="project-box">
                <li>
                    <a class="group1" href="http://img.dummy-image-generator.com/abstract/dummy-802x442-Mosque.jpg" title="Image 0">
                        <img alt="" src="http://img.dummy-image-generator.com/abstract/dummy-302x242-Mosque.jpg" />
                        <span>Testing Demo</span>
                    </a>
                    <div id='gallery'>
                        <a class="group1" href="http://dummy-images.com/abstract/dummy-600x500-Stripes.jpg" title="Image 1"></a>
                        <a class="group1" href="http://dummy-images.com/abstract/dummy-750x500-Utrecht.jpg" title="Image 2"></a>
                        <a class="group1" href="http://dummy-images.com/abstract/dummy-750x500-Floral.jpg" title="Image 3"></a>
                    </div>
                    </li>
            </ul>

            <br />
            <div class="clearfix"></div>
            <hr />

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
