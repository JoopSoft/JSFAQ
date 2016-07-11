<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSFAQ.View" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
<%--<dnn:DnnCssInclude ID="bootstrapCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" />--%>
<dnn:DnnCssInclude ID="bootstrapSelectCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" />
<%--<dnn:DnnCssInclude ID="moduleCss" runat="server" FilePath="~/DesktopModules/JSFAQ/module.min.css" />--%>

<div class="JSFaq">
    <div class="view">

        <%--FIRST CONTROLS--%>
        <asp:Panel ID="pnlFirstButton" runat="server" CssClass="btn-group">
            <asp:HyperLink ID="lnkFirstButton" runat="server" CssClass="btn btn-primary link-add"
                ResourceKey="lnkFirstButton" />
        </asp:Panel>

        <%--EDIT MODE GROUP BUTTONS--%>
        <asp:Panel ID="pnlAdmin" runat="server" Visible="true" CssClass="pnl-admin">
            <div class="btn-group" role="group" aria-label="Control buttons">
                <asp:Label ID="lblContentHolder" runat="server" />
                <asp:Label ID="lblContentHolderActivate" runat="server" />

                <asp:LinkButton ID="lnkCheckLicenseKey" runat="server"
                    OnClick="lnkCheckLicenseKey_Click" />
                <asp:LinkButton ID="lnkGetOwnerInfo" runat="server"
                    OnClick="lnkMoreInfo_Click" />

                <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                    ResourceKey="lnkAdd" ToolTip="Add FAQ Entry" />
                <asp:HyperLink ID="lnkManage" runat="server" CssClass="btn btn-primary link-manage no-txt"
                    ResourceKey="lnkManage" ToolTip="Manage Categories" />
                <asp:LinkButton ID="btnHiddenFaq" runat="server" CssClass="btn btn-primary link-show no-txt"
                    ResourceKey="btnHiddenFaq" ToolTip="Show Hidden FAQs" OnClick="btnHiddenFaq_Click" />
                <asp:HyperLink ID="lnkSettings" runat="server" CssClass="btn btn-primary link-settings no-txt"
                    ResourceKey="lnkManage" ToolTip="Settings" />

            </div>
        </asp:Panel>

        <asp:Panel ID="pnlCategoryType" runat="server" CssClass="col-xs-12 col-sm-3">

            <asp:BulletedList ID="blNavMenu" runat="server" CssClass="nav nav-tabs nav-stacked"
                BulletStyle="Disc" BorderStyle="None" DisplayMode="HyperLink">
                <asp:ListItem class="active" Value="#section-1" Text="Section One" />
                <asp:ListItem Value="#section-2" Text="Section Two" />
                <asp:ListItem Value="#section-3" Text="Section Three" />
                <asp:ListItem Value="#section-4" Text="Section Four" />
                <asp:ListItem Value="#section-5" Text="Section Five" />
            </asp:BulletedList>

        </asp:Panel>

        <div class="wrapper col-xs-12 col-sm-9">
            <div class="row" style="text-align: right; padding: 15px 0;">
                <asp:DropDownList ID="ddCategoryItems" runat="server" CssClass="">
                    <asp:ListItem Value="category-1" Text="Category Item 1" />
                    <asp:ListItem Value="category-2" Text="Category Item 2" />
                    <asp:ListItem Value="category-3" Text="Category Item 3" />
                </asp:DropDownList>
            </div>

            <asp:Repeater ID="rptCategory" runat="server">
                <ItemTemplate>
                    <h3>
                        <asp:Label ID="CategoryName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"CategoryName").ToString() %>' />
                    </h3>
                    <asp:Repeater ID="rptFaqEntries" runat="server" OnItemCommand="rptFaqEntries_ItemCommand">
                        <HeaderTemplate>
                            <div class="accordion">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Panel ID="pnlFaqItem" runat="server" CssClass="faq-item four-controls">
                                <asp:Label ID="faqId" runat="server" Visible="false"
                                    Text='<%#DataBinder.Eval(Container.DataItem,"FaqId").ToString() %>' />
                                <h3>
                                    <asp:Label ID="faqQuestion" runat="server" CssClass=""
                                        Text='<%#DataBinder.Eval(Container.DataItem,"FaqQuestion").ToString() %>' />
                                </h3>
                                <div>
                                    <asp:Label ID="faqAnswer" runat="server" CssClass=""
                                        Text='<%#DataBinder.Eval(Container.DataItem,"FaqAnswer").ToString() %>' />
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="pnlControlButtonsAdmin" runat="server" CssClass="pnl-controls">
                                <asp:HyperLink ID="lnkSortingUp" runat="server" CssClass="btn btn-primary control-btn link-up no-txt"
                                    data-toggle="tooltip" ToolTip="Move Up" />
                                <asp:HyperLink ID="lnkSortingDown" runat="server" CssClass="btn btn-primary control-btn link-down no-txt"
                                    data-toggle="tooltip" ToolTip="Move Down" />
                                <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary control-btn link-edit no-txt"
                                    data-toggle="tooltip" ToolTip="Edit" />
                                <asp:LinkButton ID="btnDeleteFaq" runat="server" CssClass="btn btn-primary control-btn link-delete error no-txt"
                                    data-toggle="tooltip" ToolTip="Delete" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"FaqId").ToString() %>' />
                            </asp:Panel>
                        </ItemTemplate>
                        <FooterTemplate>
                            </div>
                        <a href="#" class="btn btn-primary custom-acc-ctrl">Expand All</a>
                        </FooterTemplate>
                    </asp:Repeater>
                </ItemTemplate>
            </asp:Repeater>

            <asp:Repeater ID="rptNotCategorized" runat="server" OnItemCommand="rptFaqEntries_ItemCommand">
                <HeaderTemplate>
                    <div class="accordion">
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Panel ID="pnlFaqItem" runat="server" CssClass="faq-item four-controls">
                        <asp:Label ID="faqId" runat="server" Visible="false"
                            Text='<%#DataBinder.Eval(Container.DataItem,"FaqId").ToString() %>' />
                        <h3>
                            <asp:Label ID="FaqQuestion" runat="server" CssClass=""
                                Text='<%#DataBinder.Eval(Container.DataItem,"FaqQuestion").ToString() %>' />
                        </h3>
                        <div>
                            <asp:Label ID="FaqAnswer" runat="server" CssClass=""
                                Text='<%#DataBinder.Eval(Container.DataItem,"FaqAnswer").ToString() %>' />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnlControlButtonsAdmin" runat="server" CssClass="pnl-controls">
                        <asp:HyperLink ID="lnkSortingUp" runat="server" CssClass="btn btn-primary control-btn link-up no-txt"
                            data-toggle="tooltip" ToolTip="Move Up" />
                        <asp:HyperLink ID="lnkSortingDown" runat="server" CssClass="btn btn-primary control-btn link-down no-txt"
                            data-toggle="tooltip" ToolTip="Move Down" />
                        <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary control-btn link-edit no-txt"
                            data-toggle="tooltip" ToolTip="Edit" />
                        <asp:LinkButton ID="btnDeleteFaq" runat="server" CssClass="btn btn-primary control-btn link-delete error no-txt"
                            data-toggle="tooltip" ToolTip="Delete" CommandName="Delete" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"FaqId").ToString() %>' />
                    </asp:Panel>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                <a href="#" class="btn btn-primary custom-acc-ctrl">Expand All</a>
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <%--POPUP--%>
        <asp:Panel ID="pnlPopUp" runat="server" Visible="false" CssClass="popup">
            <div class="popup-wrapper">
                <asp:Label ID="lblPopUpIcon" runat="server" />
                <h3>
                    <asp:Label ID="lblPopUpMsg" runat="server" CssClass="popup-msg" />
                </h3>
                <asp:Panel ID="pnlInputGroups" runat="server" CssClass="input-group">
                    <asp:Label ID="lblKey" runat="server" CssClass="input-group-addon"
                        ClientIDMode="Static" />
                    <asp:TextBox ID="txtKey" runat="server" CssClass="form-control" Enabled="true"
                        aria-describedby="lblKey"
                        Placeholder="Enter Installed Key" />
                    <span class="input-group-btn">
                        <asp:HyperLink ID="lnkSubmit" runat="server" CssClass="btn btn-primary link-key no-txt"
                            data-toggle="tooltip" />
                    </span>
                </asp:Panel>
                <asp:Panel ID="pnlAlerts" runat="server" CssClass="alert alert-danger alert-dismissible">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true" class="link-close no-txt">&times;</span>
                    </button>
                    <asp:Label ID="lblStatusMsg" runat="server"
                        Text="Error messaging status text.." />
                </asp:Panel>
                <asp:Panel ID="pnlOwnerInfo" runat="server" ClientIDMode="Static">
                    <div class="owner-wrapper">
                        <asp:Label ID="lblInfoInstalledKey" runat="server" />
                        <asp:Label ID="lblInfoConfirmKey" runat="server" />
                        <asp:Label ID="lblInfoCompany" runat="server" />
                        <asp:Label ID="lblInfoEmail" runat="server" />
                        <asp:Label ID="lblInfoCellPhone" runat="server" />
                        <asp:Label ID="lblInfoDomain" runat="server" />
                    </div>
                </asp:Panel>

                <asp:Label ID="lblDeleteFaqId" runat="server" Visible="false" />
                <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger link-delete"
                    OnClick="btnDelete_Click" ResourceKey="lnkDelete"
                    data-toggle="tooltip" ToolTip="Delete Entry" />
                <asp:LinkButton ID="btnClose" runat="server" CssClass="close-action btn btn-danger link-close no-txt" OnClick="btnClose_Click"
                    data-toggle="tooltip" ToolTip="Close" />
            </div>
        </asp:Panel>


    </div>
</div>

<script type="text/javascript">
    (function ($, Sys) {

        var $lnkCollapse = '<i class="fa fa-compress"></i>',
            $lnkExpand = '<i class="fa fa-expand"></i>';

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
              header: '> .faq-item > h3',
              heightStyle: 'content', // 'auto', 'fill', 'content'
              icons: icons
          })
        //  .sortable({
        //      axis: "y",
        //      handle: "h3",
        //      stop: function (event, ui) {
        //          // IE doesn't register the blur when sorting
        //          // so trigger focusout handlers to remove .ui-state-focus
        //          ui.item.children("h3").triggerHandler("focusout");
        //
        //          // Refresh accordion to handle new order
        //          $(this).accordion("refresh");
        //      }
        //  })
        .disableSelection()
        ;



        var headers = $('.accordion .accordion-header');
        var contentAreas = $('.accordion .ui-accordion-content ').hide();
        var expandLink = $('.custom-acc-ctrl');
<%--        var expandLink = $('#<%= lnkExpandCollapse.ClientID %>');--%>
        headers.click(function () {
            var panel = $(this).next();
            var isOpen = panel.is(':visible');

            // open or close as necessary
            panel[isOpen ? 'slideUp' : 'slideDown']()
                // trigger the correct custom event
                .trigger(isOpen ? 'hide' : 'show');

            // stop the link from causing a pagescroll
            return false;
        });

        // hook up the expand/collapse all
        expandLink
            .html($lnkExpand + ' Expand all')
            .click(function () {
                var isAllOpen = $(this).data('isAllOpen');

                contentAreas[isAllOpen ? 'hide' : 'show']()
                    .trigger(isAllOpen ? 'hide' : 'show');
            });
        // when panels open or close, check to see if they're all open
        contentAreas.on({
            // whenever we open a panel, check to see if they're all open
            // if all open, swap the button to collapser
            show: function () {
                var isAllOpen = !contentAreas.is(':hidden');
                if (isAllOpen) {
                    expandLink.text('Collapse All')
                        .data('isAllOpen', true);
                }
            },
            // whenever we close a panel, check to see if they're all open
            // if not all open, swap the button to expander
            hide: function () {
                var isAllOpen = !contentAreas.is(':hidden');
                if (!isAllOpen) {
                    expandLink.text('Expand all')
                    .data('isAllOpen', false);
                }
            }
        });

        // Expand/Collapse all
        //    $('#<= lnkExpandCollapse.ClientID %>')
        //        .html($lnkExpand + ' Expand all')
        //        .click(function() {
        //            $('.JSFaq .accordion .ui-accordion-header:not(.ui-state-active)').next().slideToggle();
        //            $('.JSFaq .accordion .ui-accordion-header:not(.ui-state-active)').next().toggleClass('ui-icon-plus ui-icon-minus');
        //            $(this).html($(this).html() === ($lnkExpand + ' Expand all') ? ($lnkCollapse + ' Collapse all') : ($lnkExpand + ' Expand all'));
        //            $(this).toggleClass('collapse');
        //
        //
        //            return false;
        //            //$('.JSFaq .accordion').accordion("refresh");
        //        });


        $('body')
            .attr('data-spy', 'scroll')
            .attr('data-target', '#<%= pnlCategoryType.ClientID %>');


        $("#<%= blNavMenu.ClientID %>").affix({
            offset: {
                top: 195
            }
        });
        //$("#blNavMenu").on('affixed.bs.affix', function(){
        //    alert("The left navigation menu has been affixed. Now it doesn't scroll with the page.");
        //});


    })(jQuery, window.Sys);
</script>

<dnn:DnnJsInclude ID="jqueryUIJs" runat="server" FilePath="//code.jquery.com/ui/1.11.4/jquery-ui.js" />
<dnn:DnnJsInclude ID="bootstrapJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" Priority="19" />
<dnn:DnnJsInclude ID="bootstrapSelectJs" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js" Priority="20" />
<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSFAQ/Js/main.min.js" Priority="22" />
