<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Frontend.Partnerships.Default" MasterPageFile="/MasterPages/Internal.Master" %>

<%@ Register Src="~/Frontend/Partnerships/LeftMenu.ascx" TagPrefix="uc1" TagName="LeftMenu" %>
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

        </div>
        <div class="right-content">
            <ul class="partner-box">
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
                <li>
                    <img src="/Content/images/partner-logo.png" />
                </li>
            </ul>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
