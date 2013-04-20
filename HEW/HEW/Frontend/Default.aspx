<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Frontend.Default" %>

<%@ Register Src="~/Frontend/Shared/Header.ascx" TagPrefix="uc1" TagName="Header" %>
<%@ Register Src="~/Frontend/Shared/Footer.ascx" TagPrefix="uc1" TagName="Footer" %>

<!DOCTYPE html>
<html>
<head>
    <title>:: Alhuda Engineering ::</title>
    <!--meta-->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="format-detection" content="telephone=no" />
    <meta name="keywords" content="Alhuda Engineering" />
    <meta name="description" content="Alhuda Engineering" />
    <!--style-->
    <link href='http://fonts.googleapis.com/css?family=Lato:100,300,400,900' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="/Content/style/reset.css" />
    <link rel="stylesheet" type="text/css" href="/Content/style/superfish.css" />
    <link rel="stylesheet" type="text/css" href="/Content/style/jquery-ui-1.9.2.custom.css" />
    <link rel="stylesheet" type="text/css" href="/Content/style/style.css" />
    <link rel="stylesheet" type="text/css" href="/Content/style/responsive.css" />
    <!--js-->
    <script type="text/javascript" src="/Scripts/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery-ui-1.9.2.custom.min.js"></script>
    <script type="text/javascript" src="/Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="/Scripts/jquery.carouFredSel-5.6.4-packed.js"></script>
    <script type="text/javascript" src="/Scripts/jquery.sliderControl.js"></script>
    <script type="text/javascript" src="/Scripts/main.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#slider-code').tinycarousel();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#slider-code2').tinycarousel();
        });
    </script>
</head>
<body>
    <form runat="server" id="Form1">
        <div class="site_container">
            <!-- START HEADER -->
            <div class="header_container">
                <uc1:Header runat="server" ID="Header" />
            </div>
            <!-- END HEADER -->

            <!-- START SLIDER -->
            <ul class="slider">
                <li style="background-image: url('/Content/images/imageslider1.jpg');">&nbsp;
                </li>
                <li style="background-image: url('/Content/images/imageslider2.jpg');">&nbsp;
                </li>
                <li style="background-image: url('/Content/images/imageslider3.jpg');">&nbsp;
                </li>
                <li style="background-image: url('/Content/images/imageslider4.jpg');">&nbsp;
                </li>
                <li style="background-image: url('/Content/images/imageslider5.jpg');">&nbsp;
                </li>

            </ul>
            <div class="page relative noborder">
                <div class="slider_content_box clearfix">
                    <div class="slider_content" style="display: block;">
                        <h1 class="title">building a better world
                        </h1>
                        <h2 class="subtitle">one block at a time ..
                        </h2>
                        <div class="fixBox">ss</div>
                    </div>
                    <div class="slider_content">
                        <h1 class="title">building a better world
                        </h1>
                        <h2 class="subtitle">one block at a time ..
                        </h2>
                        <div class="fixBox">ss</div>
                    </div>
                    <div class="slider_content">
                        <h1 class="title">building a better world
                        </h1>
                        <h2 class="subtitle">one block at a time ..
                        </h2>
                        <div class="fixBox">ss</div>
                    </div>
                    <div class="slider_content">
                        <h1 class="title">building a better world
                        </h1>
                        <h2 class="subtitle">one block at a time ..
                        </h2>
                        <div class="fixBox">ss</div>
                    </div>
                    <div class="slider_content">
                        <h1 class="title">building a better world
                        </h1>
                        <h2 class="subtitle">one block at a time ..
                        </h2>
                        <div class="fixBox">ss</div>
                    </div>
                </div>
                <!-- home box -->
                <ul class="home_box_container clearfix">
                    <li class="home_box light_orange">
                        <h2>
                            <a href="#">Our Clients
                            </a>
                        </h2>
                        <div class="news clearfix">
                            <p class="text">
                                All aspects of our clients projects including conducting studies on the technical, logistical, legal environmental and financial aspects.
                            </p>
                        </div>
                    </li>
                    <li class="home_box orange">
                        <h2>
                            <a href="#">Our projects
                            </a>
                        </h2>
                        <div class="news clearfix">
                            <p class="text">
                                Optimal systems, infrastructures, process, buildings and diving structures, we develop cutting edge solutions and combine them with tried and tested technologies
                            </p>
                        </div>
                    </li>
                    <li class="home_box dark_orange">
                        <h2>Values & Competences
                        </h2>
                        <div class="news clearfix">
                            <p class="text">
                                Complex programs, delivering one-off projects and managing ongoing process to reduce time scales, cost and disruption, allowing our clients to focus on their core operations.
                            </p>
                        </div>
                    </li>
                </ul>
                <!-- END SLIDER -->

                <!-- START CONTENT -->
                <div class="page_layout page_margin_top clearfix">
                    <div class="homepageContent">
                        <div class="topContent">
                            <div class="text">
                                <p>Al Huda Engineering Works ( AHEW ) is one of the leading construction companies in the State of Qatar. With Qatar’s booming construction industry and considered as the fastest growing market in the region, Al Huda Engineering Works has been involved and played a major role in the development of Qatar’s booming construction industry with it’s solid and reliable staff, Al Huda Engineering Works continues to contribute to this development and faces with vigor all the challenges brought by this development in all the fields of construction industry.</p>
                            </div>
                            <div class="image">
                                <img alt="" src="/Content/images/maincontenttopimage.jpg" />
                            </div>
                            <div class="clearfix"></div>
                        </div>

                        <blockquote class="lightorangeline">
                            <div class="left">
                                <h1>Latest News updates and events.</h1>
                                <a href="#">GO TO ALL</a>
                            </div>
                            <div class="right">
                                <div class="newsList">
                                    <ul>
                                        <asp:Repeater runat="server" ID="rptNews">
                                            <ItemTemplate>
                                                <li>
                                                    <h1><a href="#"><%#Eval("Title") %></a></h1>
                                                    <div class="image">
                                                        <img alt="" src="/FrontEnd/News/Images/<%#Eval("ID") %>/Thumbnail.jpg" />
                                                    </div>
                                                    <p><%#Eval("Body") %></p>
                                                    <div class="clearfix"></div>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </blockquote>
                        <blockquote class="mindorangeline">
                            <div class="left">
                                <h1>our latest projects and clients</h1>
                                <a href="#">GO TO ALL</a>
                            </div>
                            <div class="right">
                                <div class="latestProjects">

                                    <div id="slider-code">
                                        <a class="buttons prev" href="#">
                                            <img alt="" src="/Content/images/leftarrow.png" /></a>
                                        <div class="viewport">
                                            <ul class="overview">
                                                <asp:Repeater runat="server" ID="rptHomeProjects">
                                                    <ItemTemplate>
                                                        <li>
                                                            <a href="#">
                                                                <span><%#Eval("Name") %></span>
                                                                <img style="width: 176px; height: 162px" alt="" src="/FrontEnd/Projects/Images/Thumbnail/<%#Eval("ID") %>/<%#GetRandomProjectImage(Convert.ToInt32(Eval("ID"))) %>" />
                                                            </a>
                                                        </li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </div>
                                        <a class="buttons next" href="#">
                                            <img alt="" src="/Content/images/rightarrow.png" /></a>
                                    </div>

                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </blockquote>

                        <blockquote class="darkorangeline">
                            <div class="left">
                                <h1>our
                                <br />
                                    partnerships</h1>
                                <a href="#">GO TO ALL</a>
                            </div>
                            <div class="right">
                                <div class="latestProjects">

                                    <div id="slider-code2">
                                        <a class="buttons prev" href="#">
                                            <img alt="" src="/Content/images/leftarrow.png" /></a>
                                        <div class="viewport">
                                            <ul class="overview">
                                                <li>
                                                    <a href="#">
                                                        <img alt="" src="/Content/images/client1.jpg" />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img alt="" src="/Content/images/client1.jpg" />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img alt="" src="/Content/images/client1.jpg" />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img alt="" src="/Content/images/client1.jpg" />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img alt="" src="/Content/images/client1.jpg" />
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#">
                                                        <img alt="" src="/Content/images/client1.jpg" />
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                        <a class="buttons next" href="#">
                                            <img alt="" src="/Content/images/rightarrow.png" /></a>
                                    </div>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                        </blockquote>

                    </div>
                </div>
                <!-- END CONTENT -->
            </div>

            <!-- START FOOTER -->
            <div class="footer_container">
                <uc1:Footer runat="server" ID="Footer" />
            </div>
            <!-- END FOOTER -->
        </div>
    </form>
</body>
</html>
<!-- Localized -->
