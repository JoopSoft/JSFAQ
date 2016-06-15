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
                lnkFirstButton.NavigateUrl = lnkAdd.NavigateUrl = EditUrl("AddFAQ");
                lnkManage.NavigateUrl = EditUrl("ManageCategories");
                string PageName = TabController.CurrentPage.TabPath.Remove(0, 1);
                lnkSettings.NavigateUrl = "javascript:dnnModal.show('http://" + Request.Url.Host + PageName + "/ctl/Module/ModuleId/" + ModuleId + "?ReturnURL=" + PageName + "&amp;popUp=true#msSpecificSettings',/*showReturn*/false,550,950,true,'')";
                bool faqPresent = false;
                bool categoryPresent = false;
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
                    if (c.CategoryId > 0)
                    {
                        categoryPresent = true;
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
                        if (f.FaqCategory == categoryName.Text && f.ShowFaq)
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
                    if (f.FaqCategory == "NotCategorized" && f.ShowFaq)
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
    }
}