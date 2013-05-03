<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Internal.Master" AutoEventWireup="true" CodeBehind="NewsDetails.aspx.cs" Inherits="HEW.Frontend.News.NewsDetails" %>

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
            <asp:Repeater runat="server" ID="rptOtherNews">
                <HeaderTemplate>
                    <div class="navig">
                        <h2>Other News</h2>
                        <ul class="newsListing">
                </HeaderTemplate>
                <ItemTemplate>
                    <li><a href="NewsDetails?ID=<%#Eval("ID") %>"><%#Eval("Title") %> <span>Date: <%#Convert.ToDateTime(Eval("PublishDate")).ToString("d/M/yyyy") %></span></a></li>
                </ItemTemplate>
                <FooterTemplate>
                    </ul>
            </div>
                </FooterTemplate>
            </asp:Repeater>
            <uc1:SideProjects runat="server" ID="SideProjects" />
            <div class="partners">
                <uc1:SidePartnerships runat="server" ID="SidePartnerships" />
            </div>
        </div>
        <div class="right-content">
            <div class="newsAreaInner">
                <h2 class="newsName"><%=strNewsTitle %></h2>
                <h3 class="date">Date of post: <%=strPiblishDate %></h3>
                <div class="newsImageInner">
                    <img width="680" height="300" src="http://res.cloudinary.com/dlyvxs7of/image/upload/h_300,w_680/<%=strNewsImgPublicId %>.jpg" alt="" /></div>
                <br/>
                <%=strNewsBody %>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>


