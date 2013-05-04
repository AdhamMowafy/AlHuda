<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="HEW.Admin.Careers.New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" EnablePageMethods="true" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div id="rightside">
        <div class="contentcontainer med left">
            <div class="headings alt">
                <h2>Project Info</h2>
            </div>
            <div class="contentbox">
                <form action="#">
                    <p>
                        <label for="<%=txtVacancy.ClientID %>"><strong>Vacancy:</strong></label>
                        <asp:TextBox runat="server" ID="txtVacancy" CssClass="inputbox"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rqvVacancy" ControlToValidate="txtVacancy"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <label for="<%=ddlCategories.ClientID %>"><strong>Category:</strong></label>
                        <asp:DropDownList runat="server" ID="ddlCategories" DataSourceID="ldsCareersCategories" DataTextField="Name" DataValueField="ID">
                            <asp:ListItem Value="-1" Text="-- Choose a Category --"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator runat="server" ID="rfvCategory" ControlToValidate="ddlCategories"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                        <asp:LinqDataSource runat="server" ID="ldsCareersCategories" ContextTypeName="HEW.Model.HEWDataContext"
                            TableName="VacanciesCategories">
                        </asp:LinqDataSource>
                    </p>
                    <p>
                        <label for="<%=txtLocation.ClientID %>"><strong>Location:</strong></label>
                        <asp:TextBox runat="server" ID="txtLocation" CssClass="inputbox"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rqvLocation" ControlToValidate="txtLocation"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <label for="<%=txtDescription.ClientID %>"><strong>Job Description:</strong></label>
                        <asp:TextBox runat="server" ID="txtDescription" CssClass="inputbox" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rqvDescription" ControlToValidate="txtDescription"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <label for="<%=txtSkills.ClientID %>"><strong>Required Skills:</strong></label>
                        <asp:TextBox runat="server" ID="txtSkills" CssClass="inputbox" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rqvSkills" ControlToValidate="txtSkills"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <label for="<%=txtOpenings.ClientID %>"><strong>Openings:</strong></label>
                        <asp:TextBox runat="server" ID="txtOpenings" CssClass="inputbox"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ID="rfvOpenings" ControlToValidate="txtOpenings"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                        <asp:CompareValidator runat="server" ID="cvOpenings" ControlToValidate="txtOpenings" Operator="DataTypeCheck" Type="Integer"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(Value is not valid)</span>"></asp:CompareValidator>
                    </p>
                    <p>
                        <label for="<%=txtOpeningDate.ClientID %>"><strong>Opening Date:</strong></label>
                        <asp:TextBox runat="server" ID="txtOpeningDate" CssClass="inputbox"></asp:TextBox>
                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtOpeningDate" runat="server" TodaysDateFormat="dd/MM/yyyy" DaysModeTitleFormat="dd/MM/yyyy" BehaviorID="cePublishDate" FirstDayOfWeek="Saturday" Format="dd/MM/yyyy" />
                        <asp:RequiredFieldValidator runat="server" ID="rqvOpeningDate" ControlToValidate="txtOpeningDate"
                            ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox runat="server" ID="cbIsPublished" Checked="True" />
                        Is Published
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
