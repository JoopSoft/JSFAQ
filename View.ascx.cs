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
using System.Web.UI.WebControls;
using JS.Modules.JSFAQ.Components;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Services.Localization;
using DotNetNuke.UI.Utilities;
using System.Collections.Generic;

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
            try
            {
                lnkFirstButton.NavigateUrl = lnkAdd.NavigateUrl = EditUrl("AddFAQ");
                lnkEdit.NavigateUrl = EditUrl("ListCategories");
                lnkManage.NavigateUrl = EditUrl("ManageCategories");
                lnkSettings.NavigateUrl = "javascript:dnnModal.show('http://dnndev.me/JS-FAQ/ctl/Module/ModuleId/" + ModuleId + "?ReturnURL=/JS-FAQ&amp;popUp=true',/*showReturn*/false,550,950,true,'')";
                bool faqPresent = false;
                bool categoryPresent = false;
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
                foreach (var c in ac)
                {
                    if (c.CategoryId > 0)
                    {
                        categoryPresent = true;
                        break;
                    }
                }
                if (IsEditable)
                {
                pnlFirstButton.Visible = !faqPresent;
                lnkEdit.Visible = categoryPresent;
                }
                else
                {
                    pnlFirstButton.Visible = pnlAdmin.Visible = false;
                }
                rptCategory.DataSource = cc.GetCategories(ModuleId);
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
                        },
                        {
                            GetNextActionID(), Localization.GetString("ListCategories", LocalResourceFile), "", "", "",
                            EditUrl("ListCategories"), false, SecurityAccessLevel.Edit, true, false
                        }
                    };
                return actions;
            }
        }
    }
}