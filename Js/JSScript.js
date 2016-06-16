/*globals jQuery, window, Sys */
(function ($, Sys) {
    //function dnnEditBasicSettings() {
    //    $('#dnnEditBasicSettings').dnnPanels();
    //    $('#dnnEditBasicSettings .dnnFormExpandContent a').dnnExpandAll({ expandText: '<%=Localization.GetString("ExpandAll", LocalResourceFile)%>', collapseText: '<%=Localization.GetString("CollapseAll", LocalResourceFile)%>', targetArea: '#dnnEditBasicSettings' });
    //}

    $(document).ready(function () {

        //dnnEditBasicSettings();
        //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
        //    dnnEditBasicSettings();
        //});

        //CUSTOM MODULE FOR CHECKING EXISTING AN ELEMENS
        $.fn.exists = function () { return this.length > 0; }

        var $lnkAdd = '<i class="fa fa-plus-circle"></i>',
            $lnkEdit = '<i class="fa fa-pencil"></i>',
            $lnkEditSquare = '<i class="fa fa-pencil-square-o"></i>',
            $lnkDelete = '<i class="fa fa-trash-o"></i>',
            $lnkBack = '<i class="fa fa-angle-left"></i>',
            $lnkUp = '<i class="fa fa-angle-up"></i>',
            $lnkDown = '<i class="fa fa-angle-down"></i>',
            $lnkHome = '<i class="fa fa-home"></i>',
            $lnkAll = '<i class="fa fa-external-link"></i>',
            $lnkUpload = '<i class="fa fa-upload"></i>',
            $lnkSave = '<i class="fa fa-floppy-o"></i>',
            $lnkCancel = '<i class="fa fa-ban"></i>',
            $lnkSuccess = '<i class="fa fa-check-circle"></i>',
            $lnkInfo = '<i class="fa fa-info-circle"></i>',
            $lnkInfo2x = '<i class="fa fa-info fa-2x"></i>',
            $lnkList = '<i class="fa fa-list"></i>',
            $lnkExch = '<i class="fa fa-exchange"></i>',
            $lnkImage = '<i class="fa fa-picture-o"></i>',
            $lnkClose = '<i class="fa fa-close"></i>',
            $lnkWarning = '<i class="fa fa-warning"></i>',
            $lnkSettings = '<i class="fa fa-cog"></i>',
            $lnkCheck = '<i class="fa fa-check"></i>',
            $lnkManage = '<i class="fa fa-wrench"></i>',
            $lnkShow = '<i class="fa fa-eye"></i>',
            $lnkHide = '<i class="fa fa-eye-slash"></i>',
            $lnkMove = '<i class="fa fa-arrows"></i>',
            $lnkMove = '<i class="fa fa-arrows"></i>',
            $lnkLock = '<i class="fa fa-lock"></i>',
            $lnkUnlock = '<i class="fa fa-unlock"></i>',

            $lnkSelUp = '<i class="fa fa-arrow-circle-up"></i>',
            $lnkSelDown = '<i class="fa fa-arrow-circle-down"></i>',
            $lnkSelRight = '<i class="fa fa-arrow-circle-right"></i>',
            $lnkSelLeft = '<i class="fa fa-arrow-circle-left"></i>',

            $lnkPrev = '<i class="fa fa-angle-left"></i>',
            $lnkNext = '<i class="fa fa-angle-right"></i>',
            $largeIcon = 'fa-lg';

        //PUSHED MIXED UP ICON AND TEXT IN TO THE ELEMENTS
        function loadIcons() {

            $('.JSFaq .link-add').prepend($lnkAdd + ' ');
            $('.JSFaq .link-edit').prepend($lnkEdit + ' ');
            $('.JSFaq .link-edit-square').prepend($lnkEditSquare + ' ');
            $('.JSFaq .link-delete').prepend($lnkDelete + ' ');
            $('.JSFaq .link-back').prepend($lnkBack + ' ');
            $('.JSFaq .link-up').prepend($lnkUp + ' ');
            $('.JSFaq .link-down').prepend($lnkDown + ' ');

            $('.JSFaq .link-select-up').append(' ' + $lnkSelUp);
            $('.JSFaq .link-select-down').append(' ' + $lnkSelDown);
            $('.JSFaq .link-select-right').append(' ' + $lnkSelRight);
            $('.JSFaq .link-select-left').append(' ' + $lnkSelLeft);

            $('.JSFaq .link-home').prepend($lnkHome + ' ');
            $('.JSFaq .link-all').prepend($lnkAll + ' ');
            $('.JSFaq .link-upload').prepend($lnkUpload + ' ');
            $('.JSFaq .link-save').prepend($lnkSave + ' ');
            $('.JSFaq .link-cancel').prepend($lnkCancel + ' ');
            $('.JSFaq .link-info').prepend($lnkInfo + ' ');
            $('.JSFaq .link-info2x').prepend($lnkInfo2x + ' ');
            $('.JSFaq .link-prev').prepend($lnkPrev + ' ');
            $('.JSFaq .link-close').prepend($lnkClose + ' ');
            $('.JSFaq .link-warning').prepend($lnkWarning + ' ');
            $('.JSFaq .link-settings').prepend($lnkSettings + ' ');
            $('.JSFaq .link-check').prepend($lnkCheck + ' ');
            $('.JSFaq .link-manage').prepend($lnkManage + ' ');
            $('.JSFaq .link-show').prepend($lnkShow + ' ');
            $('.JSFaq .link-hide').prepend($lnkHide + ' ');
            $('.JSFaq .link-move').prepend($lnkMove + ' ');
            $('.JSFaq .link-lock').prepend($lnkLock + ' ');
            $('.JSFaq .link-unlock').prepend($lnkUnlock + ' ');
            $('.JSFaq .link-success').prepend($lnkSuccess + ' ');
            $('.JSFaq .link-list').prepend($lnkList + ' ');
            $('.JSFaq .link-exch').prepend($lnkExch + ' ');
            $('.JSFaq .link-image').prepend($lnkImage + ' ');
            $('.JSFaq .link-next').append(' ' + $lnkNext);

            //PUSHED ONLY ICONS ON ELEMTNS
            $('.JSFaq .link-add.no-txt').html($lnkAdd);
            $('.JSFaq .link-edit.no-txt').html($lnkEdit);
            $('.JSFaq .link-edit-square.no-txt').html($lnkEditSquare + ' ');
            $('.JSFaq .link-delete.no-txt').html($lnkDelete);
            $('.JSFaq .link-back.no-txt').html($lnkBack);
            $('.JSFaq .link-up.no-txt').html($lnkUp);
            $('.JSFaq .link-down.no-txt').html($lnkDown);

            $('.JSFaq .link-select-up.no-txt').html($lnkSelUp);
            $('.JSFaq .link-select-down.no-txt').html($lnkSelDown);
            $('.JSFaq .link-select-right.no-txt').html($lnkSelRight);
            $('.JSFaq .link-select-left.no-txt').html($lnkSelLeft);

            $('.JSFaq .link-home.no-txt').html($lnkHome);
            $('.JSFaq .link-all.no-txt').html($lnkAll);
            $('.JSFaq .link-upload.no-txt').html($lnkUpload);
            $('.JSFaq .link-save.no-txt').html($lnkSave);
            $('.JSFaq .link-cancel.no-txt').html($lnkCancel);
            $('.JSFaq .link-info.no-txt').html($lnkInfo);
            $('.JSFaq .link-info2x.no-txt').html($lnkInfo2x);
            $('.JSFaq .link-prev.no-txt').html($lnkPrev);
            $('.JSFaq .link-next.no-txt').html($lnkNext);
            $('.JSFaq .link-close.no-txt').html($lnkClose);
            $('.JSFaq .link-warning.no-txt').html($lnkWarning);
            $('.JSFaq .link-settings.no-txt').html($lnkSettings);
            $('.JSFaq .link-check.no-txt').html($lnkCheck);
            $('.JSFaq .link-manage.no-txt').html($lnkManage);
            $('.JSFaq .link-show.no-txt').html($lnkShow);
            $('.JSFaq .link-hide.no-txt').html($lnkHide);
            $('.JSFaq .link-move.no-txt').html($lnkMove);
            $('.JSFaq .link-lock.no-txt').html($lnkLock);
            $('.JSFaq .link-unlock.no-txt').html($lnkUnlock);
            $('.JSFaq .link-success.no-txt').html($lnkSuccess);
            $('.JSFaq .link-list.no-txt').html($lnkList);
            $('.JSFaq .link-exch.no-txt').html($lnkExch);
            $('.JSFaq .link-image.no-txt').html($lnkImage);

            $('.JSFaq a.dnnFormHelp').prepend($lnkInfo);

        }

        loadIcons();

        //CUTTING TEXT BY ELLIPSIS PLUGIN
        if ($('.JSFaq .edit .ellipsis').exists()) $('.JSFaq .edit .ellipsis').ellipsis({
            row: 1,
            onlyFullWords: false
        });

        if ($('.JSFaq .select .ellipsis').exists()) $('.JSFaq .select .ellipsis').ellipsis({
            row: 1,
            onlyFullWords: false
        });

        //POPUP INPUT TEXTBOX - TABLE 
        $('.JSFaq .dnnFormItem table input[type=text]')
            .focus(function () {
                var $this = $(this);

                $('.JSFaq .dnnFormItem table tr.active td')
                    .addClass('no-edit-cell');

                $this
                    .tooltip('destroy')
                    .keyup(function (e) {
                        var code = (e.keyCode ? e.keyCode : e.which);
                        if (code === 27) {
                            $('.JSFaq .dnnFormItem table tr.active td').removeClass('no-edit-cell');
                            $this.closest('td').removeClass('edit-cell').find('button').remove();
                            $this.blur().tooltip({ placement: 'auto bottom' });
                        }
                    })
                    .closest('td').removeClass('no-edit-cell').addClass('edit-cell');

                if (!$this.closest('td').find('button').exists()) $this.closest('td').append($('<button>', { 'class': 'btn btn-primary' })
                        .html($lnkSuccess)
                        .bind('click', function () {
                            $(this).remove();
                            $('.JSFaq .dnnFormItem table tr.active td').removeClass('no-edit-cell');
                            $this.closest('td').removeClass('edit-cell');
                            $this.blur().tooltip({ placement: 'auto bottom' });

                        }))
                        .find('i').addClass('fa-2x');
            });

        //BIGGER CONTROL ICONS ON EDIT TABLE
        $('.JSFaq .dnnFormItem table .active td:last').find('i').addClass('fa-lg');

        //REMOVING TOOLTIPS FROM ALL DISABLED ELEMENTS
        $('.JSFaq [disbled="disabled"], .JSFaq .aspNetDisabled, .JSFaq .dnnDisabled').tooltip('destroy');

        //BIG CLOSE ICON
        $('.JSFaq .close-action .fa').addClass('fa-5x');

        //AUTO CLOSE POPUP PANEL
        $('.JSFaq .popup').each(function () {

            var $this = $(this),
                $timer = 0,
                $total = 4;

            if ($this.is('.auto-close-box')) {

                $this.find('.popup-wrapper')
                    .append($('<div>', { 'class': 'progress-bar' }).css('width', '0%'));

                var $interval = setInterval(function () {

                    $timer++; //$timer = ($timer + 1) % 361;

                    $this.find('.progress-bar').css('width', '100%');

                    if ($timer === $total) {
                        clearInterval($interval);
                        $('.JSFaq .popup.auto-close-box').remove();
                    }
                    //console.log($timer);

                }, 1000);
            }

            //if ($this.is('.confirm-box')) $('.JSNews .popup.confirm-box').remove();

        });


        //CHECKBOX DEFINITION: SELECT/DESELECT ALL CHECKBOXES
        $('.JSFaq table tbody .cbSelect input:checkbox')
            .each(function () {
                var $n = parseInt($('.JSFaq table tbody .cbSelect input:checked').length),
                    $t = parseInt($('.JSFaq table tbody .cbSelect input:checkbox').length);

                if ($n === $t) $('.JSFaq table thead .cbSelectAll input:checkbox').prop('checked', true);
                else $('.JSFaq table thead .cbSelectAll input:checkbox').prop('checked', false);

                if ($('.JSFaq .edit .txtFileName').val() === '') {
                    $('.JSFaq .controls .btnSubmit').addClass('disabled');
                    $('.JSFaq .edit .btnAddUpdateList').addClass('disabled');
                } else {
                    $('.JSFaq .controls btnSubmit').removeClass('disabled');
                    $('.JSFaq .edit btnAddUpdateList').removeClass('disabled');
                }
            })
            .bind('change', function () {
                var $n = parseInt($('.JSFaq table tbody .cbSelect input:checked').length),
                    $t = parseInt($('.JSFaq table tbody .cbSelect input:checkbox').length);

                if ($n === $t) $('.JSFaq table thead .cbSelectAll input:checkbox').prop('checked', true);
                else $('.JSFaq table thead .cbSelectAll input:checkbox').prop('checked', false);

                if ($n != 0) {
                    if ($('.JSFaq .edit .txtFileName').val() === '') {
                        $('.JSFaq .controls .btnSubmit').addClass('disabled');
                        $('.JSFaq .edit .btnAddUpdateList').addClass('disabled');
                    } else {
                        $('.JSFaq .controls .btnSubmit').removeClass('disabled');
                        $('.JSFaq .edit .btnAddUpdateList').removeClass('disabled');
                    }
                } else {
                    $('.JSFaq .controls .btnSubmit').addClass('disabled');
                    $('.JSFaq .edit .btnAddUpdateList').addClass('disabled');
                }
            });

        $('.JSFaq table thead .cbSelectAll input:checkbox')
            //.each(function () {
            //    $('.JSFaq table tbody .cbSelect input:checkbox').prop('checked', $(this).prop('checked'));
            //})
            .bind('change', function () {
                var $n = parseInt($('.JSFaq table tbody .cbSelect input:checked').length);

                $('.JSFaq table tbody .cbSelect input:checkbox').prop('checked', $(this).prop('checked'));

                if ($n != 0) {
                    if ($('.JSFaq .edit .txtFileName').val() === '') {
                        $('.JSFaq .controls .btnSubmit').addClass('disabled');
                        $('.JSFaq .edit .btnAddUpdateList').addClass('disabled');
                    } else {
                        $('.JSFaq .controls .btnSubmit').removeClass('disabled');
                        $('.JSFaq .edit .btnAddUpdateList').removeClass('disabled');
                    }
                } else {
                    $('.JSFaq .controls .btnSubmit').addClass('disabled');
                    $('.JSFaq .edit .btnAddUpdateList').addClass('disabled');
                }
            });


        //SCROLL TABLES
        if ($('.JSFaq .edit .table tbody').height() == 185) $('.JSFaq .edit .table').addClass('scroll').find('thead tr').append('<th class="add-custom"></th>');
        else $('.JSFaq .edit .table').removeClass('scroll').find('thead tr .add-custom').remove();

        if ($('.JSFaq .select .table tbody').height() == 245) $('.JSFaq .select .table').addClass('scroll').find('thead tr').append('<th class="add-custom"></th>');
        else $('.JSFaq .select .table').removeClass('scroll').find('thead tr .add-custom').remove();


        //DISPALY/HIDE PANEL DEFINITION
        $('.JSFaq .hidder input:checkbox')
            .each(function () {
                var $target = $(this).parent().data('target');

                if ($(this).is(':checked')) $($target).show(); else $($target).hide();
            })
            .bind('change', function () {
                var $target = $(this).parent().data('target');

                if ($(this).is(':checked')) $($target).show(); else $($target).hide();
            });

        $('.JSFaq .unhidder input:checkbox')
            .each(function () {
                var $target = $(this).parent().data('target');

                if ($(this).is(':checked')) $($target).hide(); else $($target).show();
            })
            .bind('change', function () {
                var $target = $(this).parent().data('target');

                if ($(this).is(':checked')) $($target).hide(); else $($target).show();
            });

        $('.JSFaq input:file')
            .each(function () {
                var $this = $(this),
                    $target = $this.data('target');

                if ($this.val() != '') {
                    $($target).show();
                    $($target + '.reverse').hide();
                } else {
                    $($target).hide();
                    $($target + '.reverse').show();
                }
            })
            .bind('change', function () {
                var $this = $(this),
                    $target = $this.data('target');

                if ($this.val() != '') {
                    $($target).show();
                    $($target + '.reverse').hide();
                } else {
                    $($target).hide();
                    $($target + '.reverse').show();
                }
            });

        $('.JSFaq .check-equal')
            .each(function () {
                if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();
                else $($(this).data('target')).hide();
            })
            .bind('change', function () {
                if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();
                else $($(this).data('target')).hide();
            });

        $('.JSFaq .uncheck-equal')
            .each(function () {
                if ($(this).val() !== $(this).data('equal')) $($(this).data('target')).show();
                else $($(this).data('target')).hide();
            })
            .bind('change', function () {
                if ($(this).val() !== $(this).data('equal')) $($(this).data('target')).show();
                else $($(this).data('target')).hide();
            });

        $('.JSFaq .hidder-radio input:radio')
            .each(function () {
                if ($(this).is(':checked')) {
                    if ($(this).val() !== 'auto') $($(this).closest('.hidder-radio').data('target')).show();
                    else $($(this).closest('.hidder-radio').data('target')).hide();
                }
            })
            .bind('change', function () {
                if ($(this).is(':checked')) {
                    if ($(this).val() !== 'auto') $($(this).closest('.hidder-radio').data('target')).show();
                    else $($(this).closest('.hidder-radio').data('target')).hide();
                }
            });

        $('.JSFaq .hidder-radio-option input:radio')
            .each(function () {
                if ($(this).is(':checked')) $($(this).parent().data('target')).show();
                else $($(this).parent().data('target')).hide();
            })
            .bind('change', function () {
                if ($(this).is(':checked')) {
                    var $groupedClass = $(this).closest('.hidder-radio-option').data('grouped-class');
                    $('.JSFaq ' + $groupedClass).hide();
                    $($(this).parent().data('target')).show();
                }
            });


        //SELECT PICKER CUSTOM PLUGIN DEFINITION
        //SINGLE SELECT OPTIONS
        if ($('.JSFaq .selectpicker.single-select').exists()) $('.JSFaq .selectpicker.single-select').selectpicker({
            actionsBox: false,
            //container: false,
            //countSelectedText:'',
            //dropupAuto: true,
            //header: false,
            //hideDisabled: false,
            //iconBase: 'glyphicon',
            liveSearch: false,
            liveSearchPlaceholder: 'Search',
            maxOptions: 1,
            mobile: false,
            multipleSeparator: ' | ',
            noneSelectedText: 'Select',
            selectedTextFormat: 'values',
            selectOnTab: false,
            showContent: true,
            showIcon: true,
            showSubtext: false,
            showTick: true,
            size: 'auto',
            style: 'btn-primary',
            tickIcon: 'glyphicon-ok',
            title: null,
            width: '50%'
        });

        //MULTI SELECT OPTIONS
        if ($('.JSFaq .selectpicker.multi-select').exists()) $('.JSFaq .selectpicker.multi-select').selectpicker({
            actionsBox: false,
            //container: false,
            //countSelectedText:'',
            //dropupAuto: true,
            //header: false,
            //hideDisabled: false,
            //iconBase: 'glyphicon',
            liveSearch: false,
            liveSearchPlaceholder: 'Search',
            maxOptions: false,
            mobile: false,
            multipleSeparator: ' | ',
            noneSelectedText: 'Select',
            selectedTextFormat: 'values', //'count'
            selectOnTab: false,
            showContent: true,
            showIcon: true,
            showSubtext: false,
            showTick: false,
            size: 'auto',
            style: 'btn-primary',
            tickIcon: 'glyphicon-ok',
            title: null,
            width: '50%'
        });

        //SINGLE SELECT ON TABLE
        if ($('.JSFaq .selectpicker.table-select').exists()) $('.JSFaq .selectpicker.table-select').selectpicker({
            actionsBox: false,
            //container: false,
            //countSelectedText:'',
            //dropupAuto: true,
            //header: false,
            //hideDisabled: false,
            //iconBase: 'glyphicon',
            liveSearch: false,
            liveSearchPlaceholder: 'Search',
            maxOptions: 1,
            mobile: false,
            multipleSeparator: ' | ',
            noneSelectedText: 'Select',
            selectedTextFormat: 'values',
            selectOnTab: false,
            showContent: true,
            showIcon: true,
            showSubtext: false,
            showTick: true,
            size: 'auto',
            style: 'btn-primary',
            tickIcon: 'glyphicon-ok',
            title: null,
            width: '150px'
        });


        //GET PARTIAL POSTBACK ON UPDATEPANEL REFRESH
        var prm = Sys.WebForms.PageRequestManager.getInstance();

        if (prm != null) {
            prm.add_endRequest(function (sender, e) {
                if (sender._postBackSettings.panelsToUpdate != null) {
                    RefreshPostBack();
                }
            });
        };

        function RefreshPostBack() {

            loadIcons();

            //CUSTOM ANIMATION & TRANSITION SELECT DEFINITION
            $('.JSFaq .lbAnimation, .JSFaq .lbTransition')
                .each(function () {
                    var $value = $(this).val(),
                        //$length = $(this).find(':selected').length,
                        $equal = $(this).data('equal');

                    if ($value !== null) {
                        if ($value.toString() === $equal) {
                            //console.log('ONLY RANDOM');
                            $(this).find('[class=JSRandom]').prop('disabled', false);
                            $(this).find('[class=JSAnimType]').prop('disabled', true);
                            //$(this).selectpicker('refresh');
                        } else {
                            //console.log("REST OF ITEMS");
                            $(this).find('[class=JSRandom]').prop('disabled', true);
                            $(this).find('[class=JSAnimType]').prop('disabled', false);
                            //$(this).selectpicker('refresh');
                        }
                    }
                    else {
                        //console.log("NULL ITEMS");
                        $(this).find('[class=JSRandom]').prop('disabled', false);
                        $(this).find('[class=JSAnimType]').prop('disabled', false);
                        //$(this).selectpicker('refresh');
                    }
                })
                .bind('change', function () {
                    var $value = $(this).val(),
                        //$length = $(this).find(':selected').length,
                        $equal = $(this).data('equal');

                    if ($value !== null) {
                        if ($value.toString() === $equal) {
                            //console.log('ONLY RANDOM');
                            $(this).find('[class=JSRandom]').prop('disabled', false);
                            $(this).find('[class=JSAnimType]').prop('disabled', true);
                            $(this).selectpicker('refresh');
                        } else {
                            //console.log("REST OF ITEMS");
                            $(this).find('[class=JSRandom]').prop('disabled', true);
                            $(this).find('[class=JSAnimType]').prop('disabled', false);
                            $(this).selectpicker('refresh');
                        }
                    }
                    else {
                        //console.log("NULL ITEMS");
                        $(this).find('[class=JSRandom]').prop('disabled', false);
                        $(this).find('[class=JSAnimType]').prop('disabled', false);
                        $(this).selectpicker('refresh');
                    }
                });

            //SELECT PICKER CUSTOM PLUGIN DEFINITION
            if ($('.JSFaq .selectpicker.single-select').exists()) $('.JSFaq .selectpicker.single-select').selectpicker({
                actionsBox: false,
                //container: false,
                //countSelectedText:'',
                //dropupAuto: true,
                //header: false,
                //hideDisabled: false,
                //iconBase: 'glyphicon',
                liveSearch: false,
                liveSearchPlaceholder: 'Search',
                maxOptions: 1,
                mobile: false,
                multipleSeparator: ' | ',
                noneSelectedText: 'Select',
                selectedTextFormat: 'values',
                selectOnTab: false,
                showContent: true,
                showIcon: true,
                showSubtext: false,
                showTick: true,
                size: 'auto',
                style: 'btn-primary',
                tickIcon: 'glyphicon-ok',
                title: null,
                width: '50%'
            });
            if ($('.JSFaq .selectpicker.multi-select').exists()) $('.JSFaq .selectpicker.multi-select').selectpicker({
                actionsBox: false,
                //container: false,
                //countSelectedText:'',
                //dropupAuto: true,
                //header: false,
                //hideDisabled: false,
                //iconBase: 'glyphicon',
                liveSearch: false,
                liveSearchPlaceholder: 'Search',
                maxOptions: false,
                mobile: false,
                multipleSeparator: ' | ',
                noneSelectedText: 'Select',
                selectedTextFormat: 'values', //'count'
                selectOnTab: false,
                showContent: true,
                showIcon: true,
                showSubtext: false,
                showTick: false,
                size: 'auto',
                style: 'btn-primary',
                tickIcon: 'glyphicon-ok',
                title: null,
                width: '50%'
            });
            if ($('.JSFaq .selectpicker.table-select').exists()) $('.JSFaq .selectpicker.table-select').selectpicker({
                actionsBox: false,
                //container: false,
                //countSelectedText:'',
                //dropupAuto: true,
                //header: false,
                //hideDisabled: false,
                //iconBase: 'glyphicon',
                liveSearch: false,
                liveSearchPlaceholder: 'Search',
                maxOptions: 1,
                mobile: false,
                multipleSeparator: ' | ',
                noneSelectedText: 'Select',
                selectedTextFormat: 'values',
                selectOnTab: false,
                showContent: true,
                showIcon: true,
                showSubtext: false,
                showTick: true,
                size: 'auto',
                style: 'btn-primary',
                tickIcon: 'glyphicon-ok',
                title: null,
                width: '150px'
            });

            //DISPALY/HIDE PANEL DEFINITION
            $('.JSFaq .hidder input:checkbox')
                .each(function () {
                    var $target = $(this).parent().data('target');

                    if ($(this).is(':checked')) $($target).show(); else $($target).hide();
                })
                .bind('change', function () {
                    var $target = $(this).parent().data('target');

                    if ($(this).is(':checked')) $($target).show(); else $($target).hide();
                });

            $('.JSFaq .unhidder input:checkbox')
                .each(function () {
                    var $target = $(this).parent().data('target');

                    if ($(this).is(':checked')) $($target).hide(); else $($target).show();
                })
                .bind('change', function () {
                    var $target = $(this).parent().data('target');

                    if ($(this).is(':checked')) $($target).hide(); else $($target).show();
                });

            $('.JSFaq input:file')
                .each(function () {
                    var $this = $(this),
                        $target = $this.data('target');

                    if ($this.val() != '') {
                        $($target).show();
                        $($target + '.reverse').hide();
                    } else {
                        $($target).hide();
                        $($target + '.reverse').show();
                    }
                })
                .bind('change', function () {
                    var $this = $(this),
                        $target = $this.data('target');

                    if ($this.val() != '') {
                        $($target).show();
                        $($target + '.reverse').hide();
                    } else {
                        $($target).hide();
                        $($target + '.reverse').show();
                    }
                });

            $('.JSFaq .check-equal')
                .each(function () {
                    if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();
                    else $($(this).data('target')).hide();
                })
                .bind('change', function () {
                    if ($(this).val() === $(this).data('equal')) $($(this).data('target')).show();
                    else $($(this).data('target')).hide();
                });

            $('.JSFaq .hidder-radio input:radio')
                .each(function () {
                    if ($(this).is(':checked')) {
                        if ($(this).val() !== 'auto') $($(this).closest('.hidder-radio').data('target')).show();
                        else $($(this).closest('.hidder-radio').data('target')).hide();
                    }
                })
                .bind('change', function () {
                    if ($(this).is(':checked')) {
                        if ($(this).val() !== 'auto') $($(this).closest('.hidder-radio').data('target')).show();
                        else $($(this).closest('.hidder-radio').data('target')).hide();
                    }
                });

        }

        //CHECK TO SEE IF THE WINDOW IS TOP IF NOT THEN DISPLAY BUTTON
        $(window).scroll(function () {
            if ($(this).scrollTop() > 100) $('.JSFaq .scroll-action').fadeIn();                
            else $('.JSFaq .scroll-action').fadeOut();
        });

        //CLICK EVENT TO SCROLL TO TOP
        $('.JSFaq .scroll-action').click(function () {
            $('html, body').animate({ scrollTop: 0 }, 300);
            return false;
        });

        //FUNCTIONS BY BOOTSTRAP FRAMEWORK
        //$('.JSFaq [data-toggle="collapse"]').collapse();
        //$('.JSFaq [data-toggle="popover"]').popover();

        $('.JSFaq [data-toggle="tooltip"]')
            .tooltip({
                placement: 'auto bottom',
            });


        //$('.JSFaq input[name="daterange"]').daterangepicker();



    });

}(jQuery, window.Sys));