<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="HEW.Frontend.Shared.Header" %>
<div class="header clearfix">
    <div class="header_left">
        <a href="/Frontend/">
            <img src="/Content/images/logo.jpg" alt="logo" />
        </a>
    </div>
    <div class="header_right">
        <div class="miniMenu">
            <a href="#">contact us</a> <a href="/Frontend/Careers/">careers</a>
        </div>
        <ul class="sf-menu">
            <li class="<%=StrHomeSelected %>">
                <a href="/Frontend/" title="HOME">Home
                </a>
            </li>
            <li class="submenu <%=StrAboutSelected %>">
                <a href="/Frontend/About/" title="About us ">About us 
                </a>
                <ul>
                    <li>
                        <a href="/Frontend/About/">Our Vesion
                        </a>
                    </li>
                    <li>
                        <a href="#">Our Mission
                        </a>
                    </li>
                    <li>
                        <a href="#">Message From MD and GM
                        </a>
                    </li>
                    <li>
                        <a href="#">Company Organogram
                        </a>
                    </li>
                    <li>
                        <a href="#">Resources
                        </a>
                    </li>
                    <li>
                        <a href="#">What We Do
                        </a>
                    </li>
                    <li>
                        <a href="#">Our Clients
                        </a>
                    </li>
                    <li>
                        <a href="#">Iso Certificates
                        </a>
                    </li>
                </ul>
            </li>
            <li class="submenu <%=StrBoardSelected %>">
                <a href="#" title="board of directors">board of directors
                </a>
                <ul>
                    <li>
                        <a href="#">Submenu Here
                        </a>
                    </li>
                    <li>
                        <a href="#">Submenu Here
                        </a>
                    </li>
                    <li>
                        <a href="#">Submenu Here
                        </a>
                    </li>
                </ul>
            </li>
            <li class="submenu <%=StrPartnershipsSelected %>">
                <a href="/Frontend/Partnerships/" title="partnerships">partnerships
                </a>
                <ul>
                    <li>
                        <a href="/Frontend/Partnerships/">Partners
                        </a>
                    </li>
                    <li>
                        <a href="#">Sister Companies
                        </a>
                    </li>
                </ul>
            </li>
            <li class="submenu <%=StrProjectsSelected %>">
                <a href="/Frontend/Projects/">Projects
                </a>
                <ul>
                    <asp:Repeater runat="server" ID="rptProjectCategories">
                        <ItemTemplate>
                            <li><a href="/Frontend/Projects/ProjectsList.aspx?ProjectCategory=<%#Eval("ID") %>"><%#Eval("Name") %></a></li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </li>
            <li class="<%=StrNewsSelected %>">
                <a href="#" title="News">News
                </a>
            </li>
        </ul>
    </div>
    <div class="mobile_menu">
        <select>
            <option value="/Frontend/" selected='<%=StrHomeSelected %>'>HOME</option>
            <option value="/Frontend/About/" selected='<%=StrAboutSelected %>'>About Us</option>
            <option value="/Frontend/Board/" selected='<%=StrBoardSelected %>'>Board Of Directors</option>
            <option value="/Frontend/Partnerships/" selected='<%=StrPartnershipsSelected %>'>Partnerships</option>
            <option value="/Frontend/Projects/" selected='<%=StrProjectsSelected %>'>Projects</option>
            <option value="/Frontend/News/" selected='<%=StrNewsSelected %>'>News</option>
            <option value="/Frontend/Contact/" selected='<%=StrContactSelected %>'>Contact Us</option>
            <option value="/Frontend/Careers/" selected='<%=StrCareersSelected %>'>Careers</option>
        </select>
    </div>
</div>
