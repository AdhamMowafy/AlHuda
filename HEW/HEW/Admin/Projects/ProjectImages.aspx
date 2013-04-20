<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="ProjectImages.aspx.cs" Inherits="HEW.Admin.Projects.ProjectImages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <script type = "text/javascript">
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
            document.getElementById("lblMessage").innerHTML = "Upload failed.";
        }
</script>
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1"
        ThrobberID="myThrobber"
        ContextKeys="fred"
        AllowedFileTypes="jpg,jpeg,tiff,tif,pdf,bmp,png,gif"
        MaximumNumberOfFiles="10"
        runat="server" OnUploadComplete="UploadComplete" OnClientUploadComplete="uploadComplete" />
    <div style="width: 300px">
        <asp:Repeater runat="server" ID="rptImages">
            <ItemTemplate>
                <asp:Image runat="server" ImageUrl='<%# "/Frontend/Projects/Images/Thumbnail/" + Request.QueryString["ProjectID"] + "/" + Container.DataItem%>' />
                <br />
                <asp:LinkButton runat="server" OnClick="btnDelete_Click" CommandArgument='<%#Container.DataItem%>' Text="Delete" OnClientClick='<%# "return ConfirmationMsg(\"This Image\" );" %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    </div>

</asp:Content>

