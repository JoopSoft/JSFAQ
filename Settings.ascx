<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Settings.ascx.cs" Inherits="JS.Modules.JSFAQ.Settings" %>
<%@ Register TagName="label" TagPrefix="dnn" Src="~/controls/LabelControl.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />
<dnn:DnnCssInclude ID="moduleCss" runat="server" FilePath="~/DesktopModules/JSFAQ/module.min.css" />

<div class="JSFaq">
    <div class="dnnForm settings">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
            <div class="dnnFormItem JSFaqMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage three-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblSubTitle" runat="server" Text="Settings" />
                </asp:Panel>
                <asp:HyperLink ID="lnkNewFAQEntry" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add FAQ Entry" />
                <asp:HyperLink ID="lnkEditCategoriesList" runat="server" CssClass="btn btn-primary link-edit-square no-txt"
                    data-toggle="tooltip" ToolTip="Edit Category Lists" />
                <asp:HyperLink ID="lnkManageCategories" runat="server" CssClass="btn btn-primary link-manage no-txt"
                    data-toggle="tooltip" ToolTip="Manage Categories" />
            </div>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem group">
                    <dnn:Label ID="lblCategoryType" runat="server" />
                    <asp:DropDownList ID="ddCategoryType" runat="server" CssClass="selectpicker form-control single-select" >
                        <asp:ListItem Value="list" Text="List" />
                        <asp:ListItem Value="tree" Text="Tree view" />
                        <asp:ListItem Value="dropdown" Text="Dropdown list" />                        
                    </asp:DropDownList>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblExpandCollapse" runat="server" />
                    <asp:CheckBox ID="cbExpandCollapse" runat="server" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblEmptyCategory" runat="server" />
                    <asp:CheckBox ID="cbEmptyCategory" runat="server" />
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
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblAnimationType" runat="server" />
                    <asp:CheckBox ID="cbAnimationBoolType" runat="server" CssClass="" />
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ID="Label2" runat="server" />
                    <asp:TextBox ID="txtAnimationNumberType" runat="server" CssClass="form-control" />
                </div>
                <div class="dnnFormItem">
                    <dnn:Label ID="Label1" runat="server" />
                    <asp:DropDownList ID="ddAnimationStringType" runat="server" CssClass="selectpicker form-control single-select">
                        <asp:ListItem Value="linear" Text="Linear" />
                        <asp:ListItem Value="swing" Text="Swing" />
                        <asp:ListItem Value="easeInQuad" Text="Ease In Quad" />
                        <asp:ListItem Value="easeOutQuad" Text="Ease Out Quad" />
                        <asp:ListItem Value="easeInOutQuad" Text="Ease In Out Quad" />
                        <asp:ListItem Value="easeInCubic" Text="Ease In Cubic" />
                        <asp:ListItem Value="easeOutCubic" Text="Ease Out Cubic" />
                        <asp:ListItem Value="easeInOutCubic" Text="Ease In Out Cubic" />
                        <asp:ListItem Value="easeInQuart" Text="Ease In Quart" />
                        <asp:ListItem Value="easeOutQuart" Text="Ease Out Quart" />
                        <asp:ListItem Value="easeInOutQuart" Text="Ease In Out Quart" />
                        <asp:ListItem Value="easeInQuint" Text="Ease In Quint" />
                        <asp:ListItem Value="easeOutQuint" Text="Ease Out Quint" />
                        <asp:ListItem Value="easeInOutQuint" Text="Ease In Out Quint" />
                        <asp:ListItem Value="easeInExpo" Text="Ease In Expo" />
                        <asp:ListItem Value="easeOutExpo" Text="Ease Out Expo" />
                        <asp:ListItem Value="easeInOutExpo" Text="Ease In Out Expo" />
                        <asp:ListItem Value="easeInSine" Text="Ease In Sine" />
                        <asp:ListItem Value="easeOutSine" Text="Ease Out Sine" />
                        <asp:ListItem Value="easeInOutSine" Text="Ease In Out Sine" />
                        <asp:ListItem Value="easeInCirc" Text="Ease In Circ" />
                        <asp:ListItem Value="easeOutCirc" Text="Ease Out Circ" />
                        <asp:ListItem Value="easeInOutCirc" Text="Ease In Out Circ" />
                        <asp:ListItem Value="easeInElastic" Text="Ease In Elastic" />
                        <asp:ListItem Value="easeOutElastic" Text="Ease Out Elastic" />
                        <asp:ListItem Value="easeInOutElastic" Text="Ease In Out Elastic" />
                        <asp:ListItem Value="easeInBack" Text="Ease In Back" />
                        <asp:ListItem Value="easeOutBack" Text="Ease Out Back" />
                        <asp:ListItem Value="easeInOutBack" Text="Ease In Out Back" />
                        <asp:ListItem Value="easeInBounce" Text="Ease In Bounce" />
                        <asp:ListItem Value="easeOutBounce" Text="Ease Out Bounce" />
                        <asp:ListItem Value="easeInOutBounce" Text="Ease In Out Bounce" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblDisabled" runat="server" />
                    <asp:CheckBox ID="cbDisabled" runat="server" CssClass="" />
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblEvent" runat="server" />
                    <asp:DropDownList ID="ddEvent" runat="server" CssClass="selectpicker form-control single-select" >
                        <asp:ListItem Value="click" Text="Click" />                      
                        <asp:ListItem Value="mouseover" Text="Mouse Over" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblHeightStyle" runat="server" />
                    <asp:DropDownList ID="ddHeightStyle" runat="server" CssClass="selectpicker form-control single-select" >
                        <asp:ListItem Value="auto" Text="Auto" />                      
                        <asp:ListItem Value="fill" Text="Fill" />
                        <asp:ListItem Value="content" Text="Content" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblIconsType" runat="server" />
                    <asp:DropDownList ID="ddIconsType" runat="server" CssClass="selectpicker form-control single-select" >
                        <asp:ListItem Value="none" Text="None" />                      
                        <asp:ListItem Value="plus-minus" Text="Plus - Minus" />
                        <asp:ListItem Value="arrowup-arrowdown" Text="Arrow Up - Arrow Down" />
                        <asp:ListItem Value="Add-more" Text="Add More" />
                    </asp:DropDownList>
                </div>
            </div>
            

            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:Label ID="lblIsSorted" runat="server" />
                    <asp:CheckBox ID="cbIsSorted" runat="server" CssClass="hidder" data-target=".pnlSortNews" />
                </div>
                <asp:Panel ID="pnlSortBy" runat="server" class="pnlSortNews dnnFormItem group">
                    <dnn:Label ID="lblSortBy" runat="server" />
                    <asp:DropDownList ID="sortByList" runat="server" CssClass="selectpicker single-select form-control" />
                </asp:Panel>
                <asp:Panel ID="pnlSortType" runat="server" class="pnlSortNews dnnFormItem group">
                    <dnn:Label ID="lblSortType" runat="server" />
                    <asp:DropDownList ID="sortTypeList" runat="server" CssClass="selectpicker single-select form-control" />
                </asp:Panel>
            </div>
            <asp:LinkButton ID="btnScrollTop" runat="server" CssClass="scroll-action btn btn-primary link-up no-txt" 
                ToolTip="Top"/>

        </fieldset>
    </div>
</div>

<script type="text/javascript">

</script>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSFAQ/Js/main.min.js" Priority="21" />