<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageCategories.ascx.cs" Inherits="JS.Modules.JSFAQ.ManageCategories" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />
<dnn:DnnCssInclude ID="moduleCss" runat="server" FilePath="~/DesktopModules/JSFAQ/module.min.css" />

<div class="JSFaq">
    <div class="dnnForm manage">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
            <div class="dnnFormItem JSFaqMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage two-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblSubTitle" runat="server" Text="Manage Currently Categories" />
                </asp:Panel>
                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add FAQ Entry" />
                <asp:HyperLink ID="lnkSettings" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    data-toggle="tooltip" ToolTip="Settings" />
            </div>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCategory" runat="server" />
                    <asp:DropDownList ID="ddCategory" runat="server" CssClass="selectpicker form-control single-select"
                        AutoPostBack="true" OnSelectedIndexChanged="ddCategory_SelectedIndexChanged" >
                        <asp:ListItem Value="new" Text="< Create New >" />
                    </asp:DropDownList>
                </div>
                <div class="dnnFormItem">
                    <dnn:label ID="unusedLabel" runat="server" />
                    <asp:LinkButton ID="btnDeleteCategory" runat="server" CssClass="btn btn-danger link-delete"
                        ResourceKey="btnDeleteCategory" data-toggle="tooltip" ToolTip="Delete Category" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCategoryName" runat="server" />
                    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control"
                        Placeholder="Name" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCategoryDescription" runat="server" />
                    <asp:TextBox ID="txtCategoryDescription" runat="server" CssClass="form-control"
                        TextMode="MultiLine" Rows="3" Columns="20" Placeholder="Description" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblShowCategory" runat="server" />
                    <asp:CheckBox ID="cbShowCategory" runat="server" Checked="true" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblShowCategoryDescription" runat="server" />
                    <asp:CheckBox ID="cbShowCategoryDescription" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblDefaultOpenType" runat="server" />
                    <asp:CheckBox ID="cbDefaultOpenType" runat="server" CssClass="hidder" data-target=".pnlDefaultOpen" />
                </div>
                <div class="pnlDefaultOpen dnnFormItem">
                    <dnn:Label ID="lblDefaultOpen" runat="server" />
                    <asp:TextBox ID="txtDefaultOpen" runat="server" CssClass="form-control"
                        Text="0" />
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ID="lblCollapsible" runat="server" />
                    <asp:CheckBox ID="cbCollapsible" runat="server" />
                </div>
            </div>

            <%--POPUP--%>
            <asp:Panel ID="pnlPopUp" runat="server" Visible="true">
                <div class="popup-wrapper">
                    <asp:Label ID="lblPopUpIcon" runat="server" />
                    <h3>
                        <asp:Label ID="lblPopUpMsg" runat="server" CssClass="popup-msg" />
                    </h3>
                    <div class="btn-group">
                        <%--FIRST DELETION--%>
                        <asp:LinkButton ID="btnDeleteConfirm" runat="server" CssClass="btn btn-danger link-delete"
                            ResourceKey="btnDeleteConfirm"
                            data-toggle="tooltip" ToolTip="Delete Category" />



                        <%--CONFRIM DELETION AND MOVE TO EMPTY CATEGORY--%>
                        <asp:LinkButton ID="btnMoveToEmpty" runat="server" CssClass="btn btn-danger link-move"
                            ResourceKey="btnMoveToEmpty" 
                            data-toggle="tooltip" ToolTip="Move All Entries To Empty Category" />
                        <asp:LinkButton ID="btnDeleteAllEntries" runat="server" CssClass="btn btn-danger link-delete"
                            ResourceKey="btnDeleteAllEntries"
                            data-toggle="tooltip" ToolTip="Delete All Entries" />

                        <%--CONFRIM LAST DELETE--%>
                        <asp:LinkButton ID="btnDeleteLastConfirm" runat="server" CssClass="btn btn-danger link-delete"
                            ResourceKey="btnDeleteLastConfirm"
                            data-toggle="tooltip" ToolTip="Delete All" />


                    </div>
                    <asp:LinkButton ID="btnClose" runat="server" CssClass="close-action btn btn-danger link-close no-txt"
                        data-toggle="tooltip" ToolTip="Close" />
                </div>
            </asp:Panel>
            <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt"
                ToolTip="Top" />
        </fieldset>
    </div>
    <div class="dnnForm controls">
        <div class="dnnFormItem">
            <div class="btn-group" role="group" aria-label="Control buttons">
                <asp:Label ID="lblGroupStatusHolder" runat="server" />
                <asp:LinkButton ID="btnSave" runat="server" CssClass="btnSubmit btn btn-primary"
                    OnClick="btnSave_Click" />
                <asp:LinkButton ID="btnSaveAndClose" runat="server" CssClass="btnSubmit btn btn-primary" />
            </div>
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
                ResourceKey="btnCancel" OnClick="btnCancel_Click" />
        </div>
    </div>
</div>


<script type="text/javascript">
    $(function () {


    });
</script>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSFAQ/Js/main.min.js" Priority="21" />
