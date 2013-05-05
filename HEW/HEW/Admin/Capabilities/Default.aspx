<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="HEW.Admin.Capabilities.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <div id="breadcrumb">
        <ul>
            <li>
                <img src="/Admin/Content/images/icons/icon_breadcrumb.png" alt="Location" /></li>
            <li><strong>Location:</strong></li>
            <li><a href="/Admin/">Admin</a></li>
            <li>/</li>
            <li class="current">Capabilities</li>
        </ul>
    </div>
    <div id="rightside">
        <div class="contentcontainer med left">
            <div class="headings alt">
                <h2>Capabilities</h2>
            </div>
            <div class="contentbox">
                <form action="#">
                    <p>
                        <label for="<%=txtAssetsDev.ClientID %>"><strong>Net Assets Development:</strong></label>
                        <asp:TextBox runat="server" ID="txtAssetsDev" CssClass="inputbox" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rqvVacancy" ControlToValidate="txtAssetsDev"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <label for="<%=txtCapitalDev.ClientID %>"><strong>Net Assets Development:</strong></label>
                        <asp:TextBox runat="server" ID="txtCapitalDev" CssClass="inputbox" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtCapitalDev"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <label for="<%=txtStaff.ClientID %>"><strong>Net Assets Development:</strong></label>
                        <asp:TextBox runat="server" ID="txtStaff" CssClass="inputbox" MaxLength="50"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtStaff"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                    </p>
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="btn" />
                        <input type="button" onclick="location = 'Default.aspx'" class="btnalt" value="Back" />
                        <%if (Request.QueryString["ID"] != null)
                          { %>
                        <input type="button" onclick="location = location" class="btnalt" value="Reset" />
                        <% } %>
                        <br />
                </form>
            </div>
        </div>
    </div>
</asp:Content>
