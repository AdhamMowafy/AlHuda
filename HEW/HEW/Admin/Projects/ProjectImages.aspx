<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="ProjectImages.aspx.cs" Inherits="HEW.Admin.Projects.ProjectImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <script type="text/javascript">
        function uploadComplete(sender, args) {
            var done = true;
            for (var index = 0; index < sender._filesInQueue.length; ++index) {
                if (!sender._filesInQueue[index]._isUploaded) {
                    return;
                }
            }
            location = window.location;
        }

        function Error() {
            alert("Upload failed.");
        }
    </script>
    <div id="breadcrumb">
        <ul>
            <li>
                <img src="/Admin/Content/images/icons/icon_breadcrumb.png" alt="Location" /></li>
            <li><strong>Location:</strong></li>
            <li><a href="/Admin/">Admin</a></li>
            <li>/</li>
            <li><a href="/Admin/Projects/">Projects</a></li>
            <li>/</li>
            <li class="current">Projects Images</li>
        </ul>

    </div>
    <div id="rightside">
        <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </ajaxToolkit:ToolkitScriptManager>
        <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1"
            ThrobberID="myThrobber"
            ContextKeys="fred"
            AllowedFileTypes="jpg,jpeg,tiff,tif,pdf,bmp,png,gif"
            MaximumNumberOfFiles="10"
            runat="server" OnUploadComplete="UploadComplete" OnClientUploadComplete="uploadComplete" />
        <div>
            <asp:Repeater runat="server" ID="rptImages" DataSourceID="ldsProjectImages">
                <ItemTemplate>
                    <div class="imageWrap">
                        <div class="insertImage">
                            <asp:Image runat="server" ImageUrl='<%# "http://images.weserv.nl/?url=res.cloudinary.com/dlyvxs7of/image/upload/" + Eval("ImgPublicID") + ".jpg&h=162&w=176&t=absolute" %>' /></div>
                        <div class="delete">
                            <asp:LinkButton runat="server" OnClick="btnDelete_Click" CommandArgument='<%#Eval("ID")%>' Text="Delete" OnClientClick='<%# "return ConfirmationMsg(\"This Image\" );" %>'></asp:LinkButton></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div class="clear"></div>
        </div>
        <asp:LinqDataSource runat="server" ID="ldsProjectImages" TableName="ProjectsImages" Where="ProjectID=@ProjectID" ContextTypeName="HEW.Model.HEWDataContext">
            <WhereParameters>
                <asp:QueryStringParameter QueryStringField="ProjectID" Name="ProjectID" Type="Int32" DefaultValue="-1" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>

