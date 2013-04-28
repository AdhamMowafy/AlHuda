<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HEW.Admin.Login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Admin Template - Login</title>
    <link href="/Admin/Content/styles/layout.css" rel="stylesheet" type="text/css" />
    <link href="/Admin/Content/styles/login.css" rel="stylesheet" type="text/css" />
    <!-- Theme Start -->
    <link href="/Admin/Content/themes/blue/styles.css" rel="stylesheet" type="text/css" />
    <!-- Theme End -->

</head>
<body>
    <div id="logincontainer">
        <div id="loginbox">
            <div id="loginheader">
                <img src="/Content/images/logo.jpg" alt="Control Panel Login" />
            </div>
            <div id="innerlogin">
                <form runat="server" id="loginForm">
                    <p>Enter your username:</p>
                    <asp:TextBox runat="server" ID="txtUserName" CssClass="logininput"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvUserName" ControlToValidate="txtUserName" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <p>Enter your password:</p>
                    <asp:TextBox runat="server" ID="txtPassword" CssClass="logininput" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvPassword" ControlToValidate="txtPassword" ErrorMessage="*"></asp:RequiredFieldValidator>
                    <asp:Button runat="server" ID="btnLogin" Text="Login" CssClass="loginbtn" OnClick="btnLogin_Click" />
                    <br />
                </form>
            </div>
        </div>
        <img src="/Admin/Content/images/login_fade.png" alt="Fade" />
    </div>
</body>
</html>
