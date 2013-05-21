<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Internal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Frontend.News.Default" %>

<%@ Register Src="~/Frontend/Shared/SidePartnerships.ascx" TagPrefix="uc1" TagName="SidePartnerships" %>
<%@ Register Src="~/Frontend/Shared/SideProjects.ascx" TagPrefix="uc1" TagName="SideProjects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AL HUDA Engineering Works - Latest News</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="image-banner about">
        <div class="image-banner-title">
            <span class="title">LATEST NEWS</span>
        </div>
    </div>
    <div class="content">
        <div class="left-sidebar">
            <uc1:SideProjects runat="server" ID="SideProjects" />
            <div class="partners">
                <uc1:SidePartnerships runat="server" ID="SidePartnerships" />
            </div>
        </div>
        <div class="right-content">
            <div class="newsList">
                <asp:Repeater runat="server" ID="rptNews">
                    <HeaderTemplate>
                        <ul>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <div class="image">
                                <img src="http://images.weserv.nl/?url=res.cloudinary.com/dlyvxs7of/image/upload/<%#Eval("ImgPublicID") %>.jpg&h=100&w=120&t=absolute" alt="" />
                            </div>
                            <div class="text">
                                <h2><a href="#"><%#Eval("Title") %></a></h2>
                                <span>Date: <%# Convert.ToDateTime(Eval("PublishDate")).ToString("dd/MM/yyyy") %></span>
                                <p><%#Eval("Body") %></p>
                                <a href="NewsDetails.aspx?ID=<%#Eval("ID") %>" class="readmore">Read More</a>
                                <div class="clearfix"></div>
                            </div>
                            <div class="clearfix"></div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>

