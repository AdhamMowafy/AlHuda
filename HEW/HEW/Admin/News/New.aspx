<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeBehind="New.aspx.cs" Inherits="HEW.Admin.News.New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyPlaceHolder" runat="server">
    <script type="text/javascript">
        function uploadComplete() {
            PageMethods.GetImageID1(uploadSuccess1, uploadFailed);
        }
        
        function uploadFailed() {

            alert('error occurred');
        }
        
        function uploadSuccess1(result) {
            $("#<%=hdnImage.ClientID %>").val(result);
            alert('Upload Succeded');
        }

        $(document).ready(function () {
            if (querystring('ID') != '') {
                HideUploader();
            }
            else {
                ShowUploader();
                $("#lnkCancel").hide();
            }
        });

        function ShowUploader() {
            $("#<%=afuImage1.ClientID %>").show();
            $("#lnkCancel").show();

            $("#<%=imgNews.ClientID %>").hide();
            $("#lnkChange").hide();
        }

        function HideUploader() {
            $("#<%=afuImage1.ClientID %>").hide();
            $("#lnkCancel").hide();
            $("#<%=hdnImage.ClientID %>").val('');

            $("#<%=imgNews.ClientID %>").show();
            $("#lnkChange").show();
        }

        function querystring(key) {
            var re = new RegExp('(?:\\?|&)' + key + '=(.*?)(?=&|$)', 'gi');
            var r = [], m;
            while ((m = re.exec(document.location.search)) != null) r.push(m[1]);
            return r;
        }

        function vld(sender, args) {
            if ($("#<%=afuImage1.ClientID %>").is(":visible")) {
                if ($("#<%=hdnImage.ClientID %>").val() != '')
                    args.IsValid = true;
                else
                    args.IsValid = false;
            } else
                args.IsValid = true;
        }
    </script>

    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" EnablePageMethods="true" runat="server">
    </ajaxToolkit:ToolkitScriptManager>
    <div id="rightside">
    <div class="contentbox">
        <form action="#">
            <p>
                <label for="<%=txtTitle.ClientID %>"><strong>Title:</strong></label>
                <asp:TextBox runat="server" ID="txtTitle" CssClass="inputbox"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="rqvTitle" ControlToValidate="txtTitle"
                    ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label for="<%=txtBody.ClientID %>"><strong>Body:</strong></label>
                <asp:TextBox runat="server" ID="txtBody" CssClass="inputbox" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="rqvBody" ControlToValidate="txtBody"
                    ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
            </p>
            <p>
                <label for="<%=txtPublishDate.ClientID %>"><strong>Publish Date:</strong></label>
                <asp:TextBox runat="server" ID="txtPublishDate" CssClass="inputbox"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" TargetControlID="txtPublishDate" runat="server" TodaysDateFormat="dd/MM/yyyy" DaysModeTitleFormat="dd/MM/yyyy" BehaviorID="cePublishDate" FirstDayOfWeek="Saturday" Format="dd/MM/yyyy" />
                <asp:RequiredFieldValidator runat="server" ID="rqvPublishDate" ControlToValidate="txtPublishDate"
                    ErrorMessage="<img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'><br /><span class='smltxt red'>(This is a required field)</span>"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:CheckBox runat="server" ID="cbIsPublished" Checked="True" />
                Is Published
            </p>
            <p>
                <ajaxToolkit:AsyncFileUpload ID="afuImage1"
                    AllowedFileTypes="jpg,jpeg,tiff,tif,pdf,bmp,png,gif"
                    OnClientUploadComplete="uploadComplete"
                    runat="server" OnUploadedComplete="UploadComplete" />
                <p>
                    <a id="lnkCancel" href="JAVASCRIPT:void(0)" onclick="HideUploader()" title="">Cancel</a>
                    <asp:Image ID="imgNews" runat="server" Visible="False" />
                    <a id="lnkChange" href="JAVASCRIPT:void(0)" onclick="ShowUploader()" title="">Change</a>
                    <asp:CustomValidator ID="cvImage" runat="server" ClientValidationFunction="vld" EnableClientScript="True" ErrorMessage="&lt;img src='/Admin/Content/images/icons/icon_missing.png' alt='Error'&gt;&lt;br /&gt;&lt;span class='smltxt red'&gt;(This is a required field)&lt;/span&gt;"></asp:CustomValidator>
                    <input type="hidden" id="hdnImage" runat="server" />
                </p>
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
                <p>
                </p>
            </p>
        </form>
    </div>
        </div>
</asp:Content>
