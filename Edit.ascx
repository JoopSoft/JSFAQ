﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Edit.ascx.cs" Inherits="JS.Modules.JSFAQ.Edit" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />

<div class="JSFaq">
    <div class="dnnForm edit">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
        </div>
        <div class="dnnFormSectionHead">
            <div class="dnnFormItem JSFaqMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage two-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblSubTitle" runat="server" Text="Add/Edit FAQ Entry" />
                </asp:Panel>
                <%--<asp:HyperLink ID="lnkNewCategory" runat="server" CssClass="btn btn-primary link-exch no-txt"
                    data-toggle="tooltip" ToolTip="Create New Category" />--%>
                <asp:LinkButton ID="btnEditCategoriesList" runat="server" CssClass="btn btn-primary link-edit-square no-txt"
                    data-toggle="tooltip" ToolTip="Edit Category Lists" />
                <asp:HyperLink ID="lnkManageCategories" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    data-toggle="tooltip" ToolTip="Manage Categories" />
            </div>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCategoryOption" runat="server" />
                    <asp:RadioButtonList ID="rblCategoryOption" runat="server" CssClass="hidder-radio-option"
                        data-grouped-class=".categoryOption" >
                        <asp:ListItem data-target=".createOption" Value="new" Text="Create New"></asp:ListItem>
                        <asp:ListItem data-target=".selectOption" Value="list" Text="Select from Available List" Selected="True"></asp:ListItem>
                        <asp:ListItem data-target=".emptyOption" Value="null" Text="Empty"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="fieldset">
                <div class="categoryOption createOption dnnFormItem">
                    <dnn:label ID="lblCategoryName" runat="server" />
                    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control"
                        Placeholder="Name" />
                </div>
                <div class="categoryOption createOption dnnFormItem">
                    <dnn:label ID="lblCategoryDescription" runat="server" />
                    <asp:TextBox ID="txtCategoryDescription" runat="server" CssClass="form-control"
                        TextMode="MultiLine" Rows="3" Columns="20"
                        Placeholder="Description"  />
                </div>
                <div class="categoryOption createOption dnnFormItem">
                    <dnn:label ID="unusedLabel" runat="server" />
                    <asp:LinkButton ID="btnCreateCategory" runat="server" CssClass="btn btn-primary link-add"
                        Text="Create Category" />
                </div>

                <div class="categoryOption selectOption dnnFormItem no-spacing">
                    <dnn:label ID="lblCategory" runat="server" />
                    <asp:DropDownList ID="ddCategory" runat="server" CssClass="selectpicker form-control single-select">
                        <asp:ListItem Value="category1" Text="Category 1" />
                        <asp:ListItem Value="category2" Text="Category 2" />
                        <asp:ListItem Value="category3" Text="Category 3" />
                    </asp:DropDownList>
                </div>
                <div class="categoryOption emptyOption dnnFormItem no-spacing">
                    <dnn:label ID="unusedLabel2" runat="server" />
                    <asp:TextBox ID="txtEmptyCategory" runat="server" CssClass="form-control"
                        Text="The Category is undefined" Enabled="false" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblQuestion" runat="server" />
                    <asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control"
                        TextMode="MultiLine" Rows="3" Columns="20"
                        Placeholder="Question" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblAnswer" runat="server" />
                    <asp:TextBox ID="txtAnswer" runat="server" CssClass="form-control"
                        TextMode="MultiLine" Rows="3" Columns="20"
                        Placeholder="Answer" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblHideFAQ" runat="server" />
                    <asp:CheckBox ID="cbHideFAQ" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblPublishFromTo" runat="server" />
                    <asp:TextBox ID="txtPublishFromTo" runat="server" CssClass="datePicker form-control" />
                </div>
            </div>
            <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt"
                ToolTip="Top" />
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

<!-- Include Required Prerequisites -->
<script type="text/javascript" src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap/latest/css/bootstrap.css" />

<!-- Include Date Range Picker -->
<script type="text/javascript" src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />



<script type="text/javascript">
    $(function () {

        //DATEPICKIER MODULE DEFINITION
        $('.JSFaq .datePicker').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            locale: {
                format: 'MM/DD/YYYY h:mm A'
            }
        });

    });
</script>


<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSFAQ/Js/main.min.js" Priority="21" />
