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
using DotNetNuke.Entities.Users;
using JS.Modules.JSFAQ.Components;
using DotNetNuke.Services.Exceptions;
using System.Web.UI.WebControls;
using DotNetNuke.Entities.Tabs;

namespace JS.Modules.JSFAQ
{
    public partial class AddFAQ : JSFAQModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    lnkManageCategories.NavigateUrl = EditUrl("ManageCategories");
                    string PageName = TabController.CurrentPage.TabPath.Remove(0, 1);
                    lnkSettings.NavigateUrl = "javascript:dnnModal.show('http://" + Request.Url.Host + PageName + "/ctl/Module/ModuleId/" + ModuleId + "?ReturnURL=" + PageName + "&amp;popUp=true#msSpecificSettings',/*showReturn*/false,550,950,true,'')";
                    bool categoryPresent = false;
                    var cc = new CategoryController();
                    var ac = cc.GetCategories(ModuleId);
                    foreach (Category c in ac)
                    {
                        if (c != null)
                        {
                            categoryPresent = true;
                            ddCategory.Items.Add(c.CategoryName);
                        }
                    }
                    if (categoryPresent)
                    {
                        headerMenu.CssClass = "dnnFormMessage two-controls dnnFormTitle no-spacing";
                    }
                    else
                    {
                        headerMenu.CssClass = "dnnFormMessage one-control dnnFormTitle no-spacing";
                    }

                    var fc = new FAQController();
                    if (FaqId > 0)
                    {
                        btnSave.Text = "Update";
                        btnSave.CssClass = "btnSubmit btn btn-primary link-save";
                        btnSaveClose.Text = "Update and Close";
                        btnSaveClose.CssClass = "btnSubmit btn btn-primary link-save";
                        var f = fc.GetFAQ(FaqId, ModuleId);
                        if (f != null)
                        {
                            if (f.FaqCategory == "NotCategorized")
                            {
                                rblCategoryOption.SelectedValue = "empty";
                                txtQuestion.Text = f.FaqQuestion;
                                txtAnswer.Text = f.FaqAnswer;
                                cbHideFAQ.Checked = !f.ShowFaq;
                            }
                            else
                            {
                                rblCategoryOption.SelectedValue = "list";
                                ddCategory.SelectedValue = f.FaqCategory;
                                txtQuestion.Text = f.FaqQuestion;
                                txtAnswer.Text = f.FaqAnswer;
                                cbHideFAQ.Checked = !f.ShowFaq;
                            }
                        }
                        else
                        {
                            if (categoryPresent)
                            {
                                rblCategoryOption.SelectedValue = "list";
                            }
                            else
                            {
                                rblCategoryOption.SelectedValue = "new";
                                foreach (ListItem li in rblCategoryOption.Items)
                                {
                                    if (li.Value == "list")
                                    {
                                        li.Enabled = false;
                                    }
                                }
                            }
                        }
                    }
                    else
                    {
                        btnSave.Text = "Add";
                        btnSave.CssClass = "btnSubmit btn btn-primary link-add";
                        btnSaveClose.Text = "Add and Close";
                        btnSaveClose.CssClass = "btnSubmit btn btn-primary link-add";
                        if (categoryPresent)
                        {
                            rblCategoryOption.SelectedValue = "list";
                        }
                        else
                        {
                            rblCategoryOption.SelectedValue = "new";
                            foreach (ListItem li in rblCategoryOption.Items)
                            {
                                if (li.Value == "list")
                                {
                                    li.Enabled = false;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void btnSaveClose_Click(object sender, EventArgs e)
        {
            Save();
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void Save()
        {
            var cc = new CategoryController();
            var fc = new FAQController();
            if (FaqId > 0)
            {
                switch (rblCategoryOption.SelectedValue)
                {
                    case "new":
                        var c = new Category()
                        {
                            CategoryName = txtCategoryName.Text.Trim(),
                            CategoryDescription = txtCategoryDescription.Text.Trim(),
                            ShowCategory = true,
                            ModuleId = ModuleId
                        };
                        cc.CreateCategory(c);
                        var f = fc.GetFAQ(FaqId, ModuleId);
                        f.FaqCategory = txtCategoryName.Text.Trim();
                        f.FaqQuestion = txtQuestion.Text.Trim();
                        f.FaqAnswer = txtAnswer.Text.Trim();
                        f.ShowFaq = !cbHideFAQ.Checked;
                        f.Categorized = true;
                        f.ModuleId = ModuleId;
                        fc.UpdateFAQ(f);
                        break;
                    case "list":
                        var lf = fc.GetFAQ(FaqId, ModuleId);
                        lf.FaqCategory = ddCategory.SelectedValue;
                        lf.FaqQuestion = txtQuestion.Text.Trim();
                        lf.FaqAnswer = txtAnswer.Text.Trim();
                        lf.ShowFaq = !cbHideFAQ.Checked;
                        lf.Categorized = true;
                        lf.ModuleId = ModuleId;
                        fc.UpdateFAQ(lf);
                        break;
                    case "empty":
                        var ef = fc.GetFAQ(FaqId, ModuleId);
                        ef.FaqCategory = "NotCategorized";
                        ef.FaqQuestion = txtQuestion.Text.Trim();
                        ef.FaqAnswer = txtAnswer.Text.Trim();
                        ef.ShowFaq = !cbHideFAQ.Checked;
                        ef.Categorized = false;
                        ef.ModuleId = ModuleId;
                        fc.UpdateFAQ(ef);
                        break;
                    default:
                        break;
                }
            }
            else
            {
                switch (rblCategoryOption.SelectedValue)
                {
                    case "new":
                        var c = new Category()
                        {
                            CategoryName = txtCategoryName.Text.Trim(),
                            CategoryDescription = txtCategoryDescription.Text.Trim(),
                            ShowCategory = true,
                            ModuleId = ModuleId
                        };
                        cc.CreateCategory(c);
                        var f = new FAQ()
                        {
                            FaqCategory = txtCategoryName.Text.Trim(),
                            FaqQuestion = txtQuestion.Text.Trim(),
                            FaqAnswer = txtAnswer.Text.Trim(),
                            ShowFaq = !cbHideFAQ.Checked,
                            Categorized = true,
                            ModuleId = ModuleId
                        };
                        fc.CreateFAQ(f);
                        break;
                    case "list":
                        var lf = new FAQ()
                        {
                            FaqCategory = ddCategory.SelectedValue,
                            FaqQuestion = txtQuestion.Text.Trim(),
                            FaqAnswer = txtAnswer.Text.Trim(),
                            ShowFaq = !cbHideFAQ.Checked,
                            Categorized = true,
                            ModuleId = ModuleId
                        };
                        fc.CreateFAQ(lf);
                        break;
                    case "empty":
                        var ef = new FAQ()
                        {
                            FaqCategory = "NotCategorized",
                            FaqQuestion = txtQuestion.Text.Trim(),
                            FaqAnswer = txtAnswer.Text.Trim(),
                            ShowFaq = !cbHideFAQ.Checked,
                            Categorized = false,
                            ModuleId = ModuleId
                        };
                        fc.CreateFAQ(ef);
                        break;
                    default:
                        break;
                }
            }

        }
    }
}