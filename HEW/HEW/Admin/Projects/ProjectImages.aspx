﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="ProjectImages.aspx.cs" Inherits="HEW.Admin.Projects.ProjectImages" %>

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
    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1"
        ThrobberID="myThrobber"
        ContextKeys="fred"
        AllowedFileTypes="jpg,jpeg,tiff,tif,pdf,bmp,png,gif"
        MaximumNumberOfFiles="10"
        runat="server" OnUploadComplete="UploadComplete" OnClientUploadComplete="uploadComplete" />
    <div style="width: 300px">
        <asp:Repeater runat="server" ID="rptImages" DataSourceID="ldsProjectImages">
            <ItemTemplate>
                <asp:Image runat="server" ImageUrl='<%# "http://res.cloudinary.com/dlyvxs7of/image/upload/h_162,w_176/" + Eval("ImgPublicID") + ".png" %>' />
                <br />
                <asp:LinkButton runat="server" OnClick="btnDelete_Click" CommandArgument='<%#Eval("ID")%>' Text="Delete" OnClientClick='<%# "return ConfirmationMsg(\"This Image\" );" %>'></asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <asp:LinqDataSource runat="server" ID="ldsProjectImages" TableName="ProjectsImages" Where="ProjectID=@ProjectID" ContextTypeName="HEW.Model.HEWDataContext">
        <WhereParameters>
            <asp:QueryStringParameter QueryStringField="ProjectID" Name="ProjectID" Type="Int32" DefaultValue="-1" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>

