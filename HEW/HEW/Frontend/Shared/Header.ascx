<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="HEW.Frontend.Shared.Header" %>
<div class="header clearfix">
    <div class="header_left">
        <a href="#">
            <img src="/Content/images/logo.jpg" alt="logo" />
        </a>
    </div>
    <div class="header_right">
        <div class="miniMenu">
            <a href="#">contact us</a> <a href="#">careers</a>
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
                <a href="#" title="partnerships">partnerships
                </a>
                <ul>
                    <li>
                        <a href="#">Partners
                        </a>
                    </li>
                    <li>
                        <a href="#">Sister Companies
                        </a>
                    </li>
                </ul>
            </li>
            <li class="submenu <%=StrProjectsSelected %>">
                <a href="#">Projects
                </a>
                <ul>
                    <li>
                        <a href="#">Highrises & Towers
                        </a>
                    </li>
                    <li>
                        <a href="#">Headquarters & Residence
                        </a>
                    </li>
                    <li>
                        <a href="#">Places & VIP Residences
                        </a>
                    </li>
                    <li>
                        <a href="#">Education & Academic Building
                        </a>
                    </li>
                    <li>
                        <a href="#">Sports Facilities & Landscaping
                        </a>
                    </li>
                    <li>
                        <a href="#">Highways, Bridges & Infrastructure
                        </a>
                    </li>
                    <li>
                        <a href="#">Micro Tunneing & Pilling
                        </a>
                    </li>
                    <li>
                        <a href="#">Industrial & Environment
                        </a>
                    </li>
                    <li>
                        <a href="#">Industrial & Electromechanical
                        </a>
                    </li>
                    <li>
                        <a href="#">Architectual / Interior Design
                        </a>
                    </li>
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
