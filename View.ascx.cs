/*
' Copyright (c) 2016  JoopSoft.com
'  All rights reserved.
' 
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
' DEALINGS IN THE SOFTWARE.
' 
*/

using System;
using JS.Modules.JSFAQ.Components;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Localization;
using DotNetNuke.UI.Utilities;
using System.Collections.Generic;
using DotNetNuke.Entities.Tabs;
using System.Web.UI.WebControls;

namespace JS.Modules.JSFAQ
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The View class displays the content
    /// 
    /// Typically your view control would be used to display content or functionality in your module.
    /// 
    /// View may be the only control you have in your project depending on the complexity of your module
    /// 
    /// Because the control inherits from JSFAQModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class View : JSFAQModuleBase, IActionable
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadPage();
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
            pnlPopUp.Visible = false;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var fc = new FAQController();
            fc.DeleteFAQ(Convert.ToInt32(lblDeleteFaqId.Text.Trim()), ModuleId);
            pnlPopUp.Visible = false;
            LoadPage();
        }

        protected void rptFaqEntries_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                pnlPopUp.Visible = true;
                pnlPopUp.CssClass = "popup confirm-box warning";
                lblPopUpMsg.Text = "Delete this FAQ Entry?";
                lblPopUpIcon.CssClass = "popup-icon link-delete no-txt";
                lblDeleteFaqId.Text = e.CommandArgument.ToString();
            }
        }

        protected void LoadPage()
        {
            try
            {
                //Code should be improved
                lblContentHolder.Text = "<strong class='link-key'>Installed Key: </strong>jDEnn#$%rfdDGessd&$^Iskh";
                lblContentHolder.CssClass = "content-holder warning";

                lblContentHolderActivate.Text = "<strong class='link-unlock'>Activated</strong>";
                lblContentHolderActivate.CssClass = "content-holder success";

                lnkCheckLicenseKey.Text = "Activate";
                lnkCheckLicenseKey.ToolTip = "Activate Module";
                lnkCheckLicenseKey.CssClass = "btn btn-danger link-lock";

                lnkGetOwnerInfo.ToolTip = "Owner Info";
                lnkGetOwnerInfo.CssClass = "btn btn-success link-info no-txt";

                lblInfoInstalledKey.Text = "<strong class='link-key'>Installed Key: </strong>47334jLJND#@fsssdg#dvjjbb343#$$";
                lblInfoConfirmKey.Text = "<strong class='link-key'>Confirm Key: </strong>fsjjdv34347bbs33D#@#$s4jLJNdg#$";
                lblInfoCompany.Text = "<strong class='link-company'>Company: </strong>JoopSOFT Ltd.";
                lblInfoEmail.Text = "<strong class='link-mail'>Email: </strong><a href='mailto:iliya@devedjiev.me' title='Send mail to iliya@devedjiev.me'>iliya@devedjiev.me</a>";
                lblInfoCellPhone.Text = "<strong class='link-phone'>Phone: </strong>+359878/209292";
                lblInfoDomain.Text = "<strong class='link-globe'>Installed on: </strong><a href='www.devedjiev.me' title='Installed on www.devedjiev.me' target='_blank'>www.devedjiev.me</a>";

                //End of this

                lnkFirstButton.NavigateUrl = lnkAdd.NavigateUrl = EditUrl("AddFAQ");
                lnkManage.NavigateUrl = EditUrl("ManageCategories");
                string PageName = TabController.CurrentPage.TabPath.Remove(0, 1);
                lnkSettings.NavigateUrl = "javascript:dnnModal.show('http://" + Request.Url.Host + PageName + "/ctl/Module/ModuleId/" + ModuleId + "?ReturnURL=" + PageName + "&amp;popUp=true#msSpecificSettings',/*showReturn*/false,550,950,true,'')";
                bool faqPresent = false;
                bool emptyCategory = true;
                var cc = new CategoryController();
                var fc = new FAQController();
                var af = fc.GetFAQs(ModuleId);
                var ac = cc.GetCategories(ModuleId);
                foreach (var f in af)
                {
                    if (f.FaqId > 0)
                    {
                        faqPresent = true;
                    }
                }
                List<Category> categorySource = new List<Category>();
                foreach (var c in ac)
                {
                    foreach (var f in af)
                    {
                        if (c.CategoryName == f.FaqCategory)
                        {
                            emptyCategory = false;
                        }
                    }
                    if (c.ShowCategory && !emptyCategory)
                    {
                        categorySource.Add(c);
                    }
                }
                if (IsEditable)
                {
                    pnlFirstButton.Visible = !faqPresent;
                }
                else
                {
                    pnlFirstButton.Visible = pnlAdmin.Visible = false;
                }
                rptCategory.DataSource = categorySource;
                rptCategory.DataBind();
                foreach (RepeaterItem ri in rptCategory.Items)
                {
                    var rptFaqEntries = ri.FindControl("rptFaqEntries") as Repeater;
                    var categoryName = ri.FindControl("CategoryName") as Label;
                    List<FAQ> faqSource = new List<FAQ>();
                    foreach (FAQ f in af)
                    {
                        if (f.FaqCategory == categoryName.Text && (f.ShowFaq || btnHiddenFaq.ToolTip == "Hide Hidden FAQs"))
                        {
                            faqSource.Add(f);
                        }

                    }
                    rptFaqEntries.DataSource = faqSource;
                    rptFaqEntries.DataBind();
                    foreach (RepeaterItem fi in rptFaqEntries.Items)
                    {
                        var lnkEdit = fi.FindControl("lnkEdit") as HyperLink;
                        var faqId = fi.FindControl("faqId") as Label;
                        var pnlAdmin = fi.FindControl("pnlControlButtonsAdmin") as Panel;
                        var pnlFaqItem = fi.FindControl("pnlFaqItem") as Panel;
                        pnlAdmin.Visible = IsEditable;
                        if (IsEditable)
                        {
                            pnlFaqItem.CssClass = "faq-item four-controls";
                        }
                        else
                        {
                            pnlFaqItem.CssClass = "faq-item no-controls";
                        }
                        lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddFAQ", "fid=" + Convert.ToInt32(faqId.Text));
                    }
                }
                List<FAQ> notCategorizedSource = new List<FAQ>();
                rptNotCategorized.Visible = false;
                foreach (var f in af)
                {
                    if (f.FaqCategory == "NotCategorized" && (f.ShowFaq || btnHiddenFaq.ToolTip == "Hide Hidden FAQs"))
                    {
                        notCategorizedSource.Add(f);
                        rptNotCategorized.Visible = true;
                    }
                }
                rptNotCategorized.DataSource = notCategorizedSource;
                rptNotCategorized.DataBind();
                foreach (RepeaterItem nci in rptNotCategorized.Items)
                {
                    var lnkEdit = nci.FindControl("lnkEdit") as HyperLink;
                    var faqId = nci.FindControl("faqId") as Label;
                    var pnlAdmin = nci.FindControl("pnlControlButtonsAdmin") as Panel;
                    var pnlFaqItem = nci.FindControl("pnlFaqItem") as Panel;
                    pnlAdmin.Visible = IsEditable;
                    if (IsEditable)
                    {
                        pnlFaqItem.CssClass = "faq-item four-controls";
                    }
                    else
                    {
                        pnlFaqItem.CssClass = "faq-item no-controls";
                    }
                    lnkEdit.NavigateUrl = EditUrl(string.Empty, string.Empty, "AddFAQ", "fid=" + Convert.ToInt32(faqId.Text));
                }

            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }

        protected void lnkMoreInfo_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = true;
            pnlPopUp.CssClass = "popup overlay success";
            lblPopUpIcon.CssClass = "popup-icon link-info";
            lblPopUpMsg.Text = "Owner Info";
            pnlInputGroups.Visible = false;
            pnlAlerts.Visible = false;
            pnlOwnerInfo.Visible = true;
            pnlOwnerInfo.CssClass = "pnl-owner-info";
            btnDelete.Visible = false;
        }

        protected void lnkCheckLicenseKey_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = true;
            pnlPopUp.CssClass = "popup overlay warning";
            lblPopUpIcon.CssClass = "popup-icon link-lock";
            lblPopUpMsg.Text = "Activate Module";
            pnlInputGroups.Visible = true;
            pnlAlerts.Visible = true;
            pnlOwnerInfo.Visible = false;
            txtKey.Focus();
            txtKey.Attributes["Placeholder"] = "Enter Confirmation Key";
            lblKey.Text = "<strong>Confirmation Key</strong>";
            lnkSubmit.CssClass = "btn btn-primary link-lock no-txt";
            lnkSubmit.ToolTip = "Activate Module";
            btnDelete.Visible = false;
        }

        public ModuleActionCollection ModuleActions
        {
            get
            {
                var actions = new ModuleActionCollection
                    {
                        {
                            GetNextActionID(), Localization.GetString("AddFAQ", LocalResourceFile), "", "", "",
                            EditUrl("AddFAQ"), false, SecurityAccessLevel.Edit, true, false
                        },
                        {
                            GetNextActionID(), Localization.GetString("ManageCategories", LocalResourceFile), "", "", "",
                            EditUrl("ManageCategories"), false, SecurityAccessLevel.Edit, true, false
                        }
                    };
                return actions;
            }
        }

        protected void btnHiddenFaq_Click(object sender, EventArgs e)
        {
            if (btnHiddenFaq.ToolTip == "Show Hidden FAQs")
            {
                btnHiddenFaq.ToolTip = "Hide Hidden FAQs";
            }
            else
            {
                btnHiddenFaq.ToolTip = "Show Hidden FAQs";
            }
            LoadPage();
        }
    }
}