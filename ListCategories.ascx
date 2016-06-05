<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListCategories.ascx.cs" Inherits="JS.Modules.JSFAQ.ListCategories" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.UI.WebControls" Assembly="DotNetNuke" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />
<dnn:DnnCssInclude ID="moduleCss" runat="server" FilePath="~/DesktopModules/JSFAQ/module.min.css" />

<div class="JSFaq">
    <div class="dnnForm list">
        <div class="dnnFormSectionHead">
            <h3 class="dnnFormMessage dnnFormTitle dnnFormIcon no-spacing">
                <%=LocalizeString("Title")%>
                <asp:HyperLink ID="joopSoft" runat="server" />
            </h3>
            <div class="dnnFormItem JSFaqMenu">
                <asp:Panel ID="headerMenu" runat="server" CssClass="dnnFormMessage three-controls dnnFormTitle no-spacing">
                    <asp:Label ID="lblSubTitle" runat="server" Text="List Currently Categories" />
                </asp:Panel>
                <asp:HyperLink ID="lnkNewFAQEntry" runat="server" CssClass="btn btn-primary link-add no-txt"
                    data-toggle="tooltip" ToolTip="Add FAQ Entry" />
                <asp:HyperLink ID="lnkManageCategories" runat="server" CssClass="btn btn-primary link-manage no-txt"
                    data-toggle="tooltip" ToolTip="Manage Categories" />
                <asp:HyperLink ID="lnkSettings" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    data-toggle="tooltip" ToolTip="Settings" />
            </div>
        </div>
        <fieldset>
            <div class="fieldset">
                <div class="dnnFormItem">
                    <dnn:label ID="lblCategory" runat="server" />
                    <asp:DropDownList ID="ddCategory" runat="server" CssClass="selectpicker form-control single-select" >
                        <asp:ListItem Value="category1" Text="Category 1" />
                        <asp:ListItem Value="category2" Text="Category 2" />
                        <asp:ListItem Value="category3" Text="Category 3" />
                    </asp:DropDownList>
                </div>
            </div>
            <div class="dnnFormItem">
                    <h3 class="no-spacing"><asp:Label ID="lblCategoryName" runat="server" Text="Category 1" /></h3>
                    <asp:TextBox ID="txtCategoryDescription" runat="server" Text="Some saved content..." Enabled="false" />
                <div class="accordion">
                    <h3>Section 1</h3>
                    <div>
                        <p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p>
                    </div>

                    <h3>Section 2</h3>
                    <div>
                        <p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna. </p>
                    </div>

                    <h3>Section 3</h3>
                    <div>
                        <p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui. </p>
                        <ul>
                            <li>List item one</li>
                            <li>List item two</li>
                            <li>List item three</li>
                        </ul>
                    </div>

                    <h3>Section 4</h3>
                    <div>
                        <p>Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia mauris vel est. </p>
                        <p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. </p>
                    </div>

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

<script type="text/javascript">
    var $lnkCollapse = '<i class="fa fa-minus-circle"></i>',
        $lnkExpand = '<i class="fa fa-plus-circle"></i>';

    var icons = {
        header: 'ui-icon-plus',
        activeHeader: 'ui-icon-minus'
    };

    $('.JSFaq .accordion')
      .accordion({
          active: false, // Int {0}, Bool {false:collapse all}
          //animate: 200, //Bool, Num, Str, Obj
          collapsible: true, // false, true
          disabled: false, // false, true
          event: 'click', // 'click', 'mouseover'
          //header: '> div > h3',
          heightStyle: 'content', // 'auto', 'fill', 'content'
          icons: icons
      })
      .sortable({
         // axis: "y",
         // handle: "h3",
          placeholder: "ui-state-highlight"
         // stop: function (event, ui) {
         //     // IE doesn't register the blur when sorting
         //     // so trigger focusout handlers to remove .ui-state-focus
         //     ui.item.children("h3").triggerHandler("focusout");
         //
         //     // Refresh accordion to handle new order
         //     $(this).accordion("refresh");
         // }
      })
      .disableSelection()
    ;



</script>

<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSFAQ/Js/main.min.js" Priority="21" />
