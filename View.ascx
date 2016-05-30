<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="View.ascx.cs" Inherits="JS.Modules.JSFAQ.View" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="dnn" TagName="label" Src="~/controls/LabelControl.ascx" %>

<dnn:DnnCssInclude ID="fontAwesomeCss" runat="server" FilePath="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />

<div class="JSFaq">

    <asp:Repeater ID="rptItemList" runat="server" OnItemDataBound="rptItemListOnItemDataBound" OnItemCommand="rptItemListOnItemCommand">
        <HeaderTemplate>
            <ul class="tm_tl">
        </HeaderTemplate>

        <ItemTemplate>
            <li class="tm_t">
                <h3>
                    <asp:Label ID="lblitemName" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ItemName").ToString() %>' />
                </h3>
                <asp:Label ID="lblItemDescription" runat="server" Text='<%#DataBinder.Eval(Container.DataItem,"ItemDescription").ToString() %>' CssClass="tm_td" />

                <asp:Panel ID="pnlAdmin" runat="server" Visible="false">
                    <asp:HyperLink ID="lnkEdit" runat="server" ResourceKey="EditItem.Text" Visible="false" Enabled="false" />
                    <asp:LinkButton ID="lnkDelete" runat="server" ResourceKey="DeleteItem.Text" Visible="false" Enabled="false" CommandName="Delete" />
                </asp:Panel>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
        </FooterTemplate>
    </asp:Repeater>


    <%--FIRST CONTROLS--%>
    <asp:Panel ID="pnlFirstButton" runat="server" CssClass="btn-group">
        <asp:HyperLink ID="lnkFirstButton" runat="server" CssClass="btn btn-primary link-add"
            ResourceKey="lnkFirstButton" />
    </asp:Panel>

    <%--EDIT MODE GROUP BUTTONS--%>
    <asp:Panel ID="pnlAdmin" runat="server" Visible="true" CssClass="pnl-admin pull-right">
        <div class="btn-group" role="group" aria-label="Control buttons">
            <asp:Label ID="lblContentHolder" runat="server" CssClass="content-holder" />
            <asp:HyperLink ID="lnkAdd" runat="server" CssClass="btn btn-primary link-add no-txt"
                ResourceKey="lnkAdd" ToolTip="Add FAQ Entry" />
            <asp:HyperLink ID="lnkEdit" runat="server" CssClass="btn btn-primary link-list no-txt"
                ResourceKey="lnkEdit" ToolTip="Edit Category Lists" />
            <asp:HyperLink ID="lnkManage" runat="server" CssClass="btn btn-primary link-settings no-txt"
                ResourceKey="lnkManage" ToolTip="Manage Categories" />

        </div>
    </asp:Panel>

    <asp:Repeater ID="rptCategory" runat="server">
        <HeaderTemplate></HeaderTemplate>
        <ItemTemplate>
            <asp:Repeater ID="rptFaqEntries" runat="server">
                <ItemTemplate></ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>

    <h3>Category 1</h3>
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

    <asp:HyperLink ID="lnkExpandCollapse" runat="server" CssClass="btn btn-primary custom-acc-ctrl" />

</div>


<dnn:DnnJsInclude ID="DnnJsInclude1" runat="server" FilePath="//code.jquery.com/ui/1.11.4/jquery-ui.js" />

<script type="text/javascript">

    var $lnkCollapse = '<i class="fa fa-minus-circle"></i>',
        $lnkExpand = '<i class="fa fa-plus-circle"></i>';

    $('.JSFaq #<%= lblContentHolder.ClientID %>')
    .html('JSFaq Module: ' + <%= ModuleId %>);


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
        var expandLink = $('#<%= lnkExpandCollapse.ClientID %>');

        headers.click(function() {
            var panel = $(this).next();
            var isOpen = panel.is(':visible');
 
            // open or close as necessary
            panel[isOpen? 'slideUp': 'slideDown']()
                // trigger the correct custom event
                .trigger(isOpen? 'hide': 'show');

            // stop the link from causing a pagescroll
            return false;
        });

        // hook up the expand/collapse all
    expandLink
        .html($lnkExpand + ' Expand all')
        .click(function(){
            var isAllOpen = $(this).data('isAllOpen');
    
            contentAreas[isAllOpen? 'hide': 'show']()
                .trigger(isAllOpen? 'hide': 'show');
        });
        // when panels open or close, check to see if they're all open
        contentAreas.on({
            // whenever we open a panel, check to see if they're all open
            // if all open, swap the button to collapser
            show: function(){
                var isAllOpen = !contentAreas.is(':hidden');   
                if(isAllOpen){
                    expandLink.text('Collapse All')
                        .data('isAllOpen', true);
                }
            },
            // whenever we close a panel, check to see if they're all open
            // if not all open, swap the button to expander
            hide: function(){
                var isAllOpen = !contentAreas.is(':hidden');
                if(!isAllOpen){
                    expandLink.text('Expand all')
                    .data('isAllOpen', false);
                } 
            }
        });

    // Expand/Collapse all
    //    $('#<%= lnkExpandCollapse.ClientID %>')
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

</script>

<dnn:DnnJsInclude ID="mainJs" runat="server" FilePath="~/DesktopModules/JSFAQ/Js/main.min.js" Priority="22" />
