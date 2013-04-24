<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Footer.ascx.cs" Inherits="HEW.Frontend.Shared.Footer" %>
<div class="footer">
    <ul class="footer_banner_box_container clearfix">
        <li class="footer_banner_box super_light_orange">
            <h2>careers
            </h2>
            <p>
                <a class="icon_small_arrow right_white" href="#">view job openings and join the family and grow into the biggest company in qatar</a>
            </p>
        </li>
        <li class="footer_banner_box light_orange">
            <h2>contact
            </h2>
            <p>
                <a class="icon_small_arrow right_white" href="#">contact us via online form, or emails or give us a visit at 4 of our offices</a>
            </p>
        </li>
        <li class="footer_banner_box orange">
            <h2>live camera
            </h2>
            <p>
                <a class="icon_small_arrow right_white" href="#">we operate in different sectors and different countries, found out about them</a>
            </p>
        </li>
    </ul>
    <div class="footer_box_container clearfix">
        <div class="footer_box">
            <h3 class="box_header">Al Huda
            </h3>
            <p class="info">
                Mauris adipiscing mauris fringilla turpis interdum sed pulvinar nisi malesuada individual.
            </p>
            <ul class="footer_contact_info_container clearfix">
                <li class="footer_contact_info_row">
                    <div class="footer_contact_info_left">
                        Al Huda
                    </div>
                </li>
                <li class="footer_contact_info_row">
                    <div class="footer_contact_info_left">
                        33 Farlane Street
                    </div>
                    <div class="footer_contact_info_right">
                        +123 655 655
                    </div>
                </li>
                <li class="footer_contact_info_row">
                    <div class="footer_contact_info_left">
                        Keilor East
                    </div>
                    <div class="footer_contact_info_right">
                        +123 755 755
                    </div>
                </li>
                <li class="footer_contact_info_row">
                    <div class="footer_contact_info_left">
                        VIC 3033, Australia
                    </div>
                    <div class="footer_contact_info_right">
                        <a href="mailto:medicenter@mail.com" title="Send Email">medicenter@mail.com
                        </a>
                    </div>
                </li>
            </ul>

        </div>
        <div class="footer_box">
            <div class="clearfix">
                <div class="header_left">
                    <h3 class="box_header">latest news
                    </h3>
                </div>
            </div>
            <div class="scrolling_list_wrapper">
                <ul class="scrolling_list footer_recent_posts">
                    <asp:Repeater runat="server" ID="rptFooterNews">
                        <ItemTemplate>
                            <li class="icon_small_arrow right_white">
                                <a href="#"><%#Eval("Title") %>
                                </a>
                                <abbr class="timeago"><%#Convert.ToDateTime(Eval("PublishDate")).ToString("dd MMMM yyyy") %></abbr>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>
        </div>
        <div class="footer_box last">
            <div class="clearfix">
                <div class="header_left">
                    <h3 class="box_header">Connect with us
                    </h3>
                </div>
            </div>
            <div class="scrolling_list_wrapper">
                <h5>Subscribe to our newsletter</h5>
                <div class="newsletter">
                    <asp:TextBox runat="server" ID="txtMail" Text="Enter Your Email" onblur="if (this.value=='') this.value = 'Enter Your Email'" onfocus="if (this.value=='Enter Your Email') this.value = ''"></asp:TextBox>
                    <asp:LinkButton runat="server" ID="btnRegister" CssClass="submitButton" OnClick="btnRegister_Click">
                        <asp:Image ID="imgFolder" runat="server" ImageUrl="/Content/images/subscribebutton.png" />
                    </asp:LinkButton>
                    <asp:RequiredFieldValidator runat="server" ID="rfvMail" ControlToValidate="txtMail"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator runat="server" ID="revMail" ControlToValidate="txtMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <div class="clearfix"></div>
                </div>
                <h5>join us on social media</h5> 
                <div class="socialButtons">
                    <ul>
                        <li><a href="#">
                            <img alt="" src="/Content/images/fbicon.png" /></a></li>
                        <li><a href="#">
                            <img alt="" src="/Content/images/twittericon.png" /></a></li>
                        <li><a href="#">
                            <img alt="" src="/Content/images/linkedinicon.png" /></a></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <div class="copyright_area clearfix">
        <div class="copyright_left">
            © Copyright - <a href="#">AlHuda Engeneering Works</a>
        </div>
        <div class="copyright_right">
            <a class="scroll_top icon_small_arrow top_white" href="#top" title="Scroll to top">Top</a>
        </div>
    </div>
</div>
