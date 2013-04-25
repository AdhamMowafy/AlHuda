<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Internal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Frontend.Careers.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AL HUDA Engineering Works - Careers at AL-HUDA</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="image-banner careers">
        <div class="image-banner-title">
            <span class="title">CAREERS</span>
        </div>
    </div>
    <div class="careersWrap">
        <div class="content">
            <div class="fullwidth">
                <div class="careers">
                    <h1>join our team of excelence, and be a part of the change.</h1>
                    <asp:Repeater runat="server" ID="rptCareers">
                        <HeaderTemplate>
                            <div class="careerTable">
                                <table>
                                    <tr>
                                        <th class="title">Title</th>
                                        <th class="category">Category</th>
                                        <th class="location">Location</th>
                                        <th class="date">Date</th>
                                    </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("Vacancy1") %>
                                </td>
                                <td><%#Eval("VacanciesCategory.Name") %>
                                </td>
                                <td><%#Eval("Location") %>
                                </td>
                                <td><%#Convert.ToDateTime(Eval("OpeningDate")).ToString("dd MMMM yyyy") %>
                                </td>
                            </tr>
                            <tr class="brief">
                                <td colspan="3">
                                    <span>Brief:</span>
                                    <p><%#Eval("JobDescription") %></p>
                                </td>
                                <td>
                                    <a href="javascript:void(0)" onclick="document.getElementById('light_<%#Eval("ID") %>').style.display='block';document.getElementById('fade').style.display='block'">APPLY NOW!</a>
                                </td>
                            </tr>
                            <div id="light_<%#Eval("ID") %>" class="white_content">
                                <div class="title">
                                    <h2><%#Eval("Vacancy1") %></h2>
                                    <div class="close">
                                        <a href="javascript:void(0)" onclick="document.getElementById('light_<%#Eval("ID") %>').style.display='none';document.getElementById('fade').style.display='none'">
                                            <img src="/Content/images/close.png" /></a>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                                <span>Job posted on: <%#Convert.ToDateTime(Eval("OpeningDate")).ToString("dd MMMM yyyy") %> - Category: <%#Eval("VacanciesCategory.Name") %></span>
                                <p>
                                    <%#Eval("RequiredSkills") %>
                                </p>
                                <div class="linkApply"><a href="mailto:hr@alhudaengineeringworks.com" target="blank">Apply Now!</a></div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </div>
                        <div id="fade" class="black_overlay"></div>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
