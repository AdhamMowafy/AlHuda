<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Internal.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Frontend.Contact.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>AL HUDA Engineering Works - Contact AL-HUDA</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="image-banner about">
        <div class="image-banner-title">
            <span class="title">CONTACT AL HUDA</span>
        </div>
    </div>
    <div class="content">
        <div class="page_layout page_margin_top clearfix">
            <div class="clearfix">
                <iframe width="990" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Qatar+Foundation,+Ar-Rayy%C4%81n,+Al+Rayyan,+Qatar&amp;aq=0&amp;oq=Qatar+Foundation&amp;sll=37.0625,-95.677068&amp;sspn=40.137381,86.572266&amp;ie=UTF8&amp;hq=Qatar+Foundation,&amp;hnear=Ar-Rayy%C4%81n,+Al+Rayyan,+Qatar&amp;t=m&amp;ll=25.313348,51.433214&amp;spn=0.028804,0.025826&amp;output=embed"></iframe>
                <div class="page_margin_top clearfix">
                    <div class="page_left">
                        <h3 class="box_header">Online Form
                        </h3>
                        <div class="contact_form" id="contact_form">
                            <fieldset class="left">
                                <label>First Name</label>
                                <div class="block">
                                    <input class="text_input" name="first_name" value="" type="text" />
                                </div>
                                <label>Date of Birth (mm/dd/yyyy)</label>
                                <div class="block">
                                    <input id="dp1367075985318" class="text_input hasDatepicker" name="date_of_birth" value="" type="text" />
                                </div>
                                <label>Phone Number</label>
                                <div class="block">
                                    <input class="text_input" name="phone_number" value="" type="text" />
                                </div>
                            </fieldset>
                            <fieldset class="right">
                                <label>Last Name</label>
                                <div class="block">
                                    <input class="text_input" name="last_name" value="" type="text" />
                                </div>
                                <label>Country</label>
                                <div class="block">
                                    <input class="text_input" name="country" value="" type="text" />
                                </div>
                                <label>E-mail</label>
                                <div class="block">
                                    <input class="text_input" name="email" value="" type="text" />
                                </div>
                            </fieldset>
                            <fieldset style="clear: both;">
                                <label>Message</label>
                                <div class="block">
                                    <textarea name="message"></textarea>
                                </div>
                                <input name="action" value="contact_form" type="hidden">
                                <input name="submit" value="Send" class="more blue" type="submit" />
                            </fieldset>
                        </div>
                    </div>
                    <div class="page_right">
                        <h3 class="box_header">Visit us
                        </h3>

                        <ul class="columns no_padding page_margin_top clearfix">
                            <li class="column_left">Alhuda Engineering<br />
                                Street Street Street<br />
                                Building Street<br />
                                1234 QATAR, Duha
                            </li>
                            <li class="column_right">Phone: +123 456 7789<br />
                                Fax: +123 123123 123<br />
                                Extension: 1231234 
                            </li>
                        </ul>
                        <ul class="contact_data page_margin_top">
                            <li class="clearfix">
                                <span class="social_icon phone"></span>
                                <p class="value">
                                    Phone: <strong>1-800-643-4300</strong>
                                </p>
                            </li>
                            <li class="clearfix">
                                <span class="social_icon mail"></span>
                                <p class="value">
                                    E-mail: <a href="mailto:contact@alhuda.com">contact@alhuda.com</a>
                                </p>
                            </li>
                            <li class="clearfix">
                                <span class="social_icon facebook"></span>
                                <p class="value">
                                    <a href="http://facebook.com/alhuda" title="Facebook" target="_blank">facebook.com/alhuda</a>
                                </p>
                            </li>
                            <li class="clearfix">
                                <span class="social_icon twitter"></span>
                                <p class="value">
                                    <a href="http://twitter.com/alhuda" title="Twitter" target="_blank">twitter.com/alhuda</a>
                                </p>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
