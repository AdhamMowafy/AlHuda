<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="HEW.Admin.Projects.New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <div id="rightside">
        <div class="contentbox">
            <form action="#">
                <p>
                    <label for="<%=txtName.ClientID %>"><strong>Name:</strong></label>
                    <asp:TextBox runat="server" ID="txtName" CssClass="inputbox"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rqvTitle" ControlToValidate="txtName"
                        ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <label for="<%=ddlCategories.ClientID %>"><strong>Category:</strong></label>
                    <asp:DropDownList runat="server" ID="ddlCategories" DataSourceID="ldsProjectCategories" DataTextField="Name" DataValueField="ID">
                        <asp:ListItem Value="-1" Text="-- Choose a Category --"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvCategory" ControlToValidate="ddlCategories"
                        ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                    <asp:LinqDataSource runat="server" ID="ldsProjectCategories" ContextTypeName="HEW.Model.HEWDataContext"
                        TableName="ProjectsCategories">
                    </asp:LinqDataSource>
                </p>
                <p>
                    <label for="<%=txtDescription.ClientID %>"><strong>Description:</strong></label>
                    <asp:TextBox runat="server" ID="txtDescription" CssClass="inputbox" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rqvDescription" ControlToValidate="txtDescription"
                        ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                </p>
                <p>
                    <asp:CheckBox runat="server" ID="cbIsHome" />
                    Appears in Home Page
                </p>
                <p>
                    <asp:CheckBox runat="server" ID="cbIsSideMenu" />
                    Appears in Side Menu
                </p>
                <p>
                    <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" CssClass="btn" />
                    <input type="button" onclick="location = 'Default.aspx'" class="btnalt" value="Back" />
                    <%if (Request.QueryString["ID"] != null)
                      { %>
                    <input type="button" onclick="location = location" class="btnalt" value="Reset" />
                    <% } %>
                    <br />
                </p>
            </form>
        </div>
    </div>
</asp:Content>
