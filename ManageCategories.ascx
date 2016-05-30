<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManageCategories.ascx.cs" Inherits="JS.Modules.JSFAQ.ManageCategories" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />

<div class="JSFaq">
    <div class="dnnForm manage">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
        </div>
        <div class="dnnFormSectionHead">
            <div class="dnnFormItem JSFaqMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage two-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblSubTitle" runat="server" Text="Manage Currently Categories" />
                </asp:Panel>
                <asp:HyperLink ID="lnkNewFAQEntry" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add FAQ Entry" />
                <asp:LinkButton ID="btnEditCategoriesList" runat="server" CssClass="btn btn-primary link-edit-square no-txt"
                    data-toggle="tooltip" ToolTip="Edit Category Lists" />
            </div>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCategory" runat="server" />
                    <asp:DropDownList ID="ddCategory" runat="server" CssClass="selectpicker form-control single-select" >
                        <asp:ListItem Value="new" Text="Create New" />
                        <asp:ListItem Value="category1" Text="Category 1" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCategoryName" runat="server" />
                    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" 
                        Text="Category 1" Placeholder="Name" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCategoryDescription" runat="server" />
                    <asp:TextBox ID="txtCategoryDescription" runat="server" CssClass="form-control"
                        TextMode="MultiLine" Rows="3" Columns="20" Text="Saved content here.." 
                        Placeholder="Description" />
                </div>
                <div class="dnnFormItem">
                    <dnn:label ID="unusedLabel" runat="server" />
                    <asp:LinkButton ID="btnCreateCategory" runat="server" CssClass="btn btn-primary link-add"
                        Text="Create Category" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblShowCategory" runat="server" />
                    <asp:CheckBox ID="cbShowCategory" runat="server" Checked="true" />
                </div>
            </div>

            <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt" 
                ToolTip="Top"/>
        </fieldset>
    </div>
    <div class="dnnForm controls">
        <div class="dnnFormItem">
            <asp:LinkButton ID="btnSave" runat="server" CssClass="btnSubmit btn btn-primary link-save"
                ResourceKey="btnSave" />
            <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-default link-cancel"
                ResourceKey="btnCancel" />
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
