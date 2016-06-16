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
using DotNetNuke.Entities.Tabs;

namespace JS.Modules.JSFAQ
{
    public partial class ManageCategories : JSFAQModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    lnkAdd.NavigateUrl = EditUrl("AddFAQ");
                    string PageName = TabController.CurrentPage.TabPath.Remove(0, 1);
                    lnkSettings.NavigateUrl = "javascript:dnnModal.show('http://" + Request.Url.Host + PageName + "/ctl/Module/ModuleId/" + ModuleId + "?ReturnURL=" + PageName + "&amp;popUp=true#msSpecificSettings',/*showReturn*/false,550,950,true,'')";
                    btnSave_Name();
                    bool categoryPresent = false; 
                    var cc = new CategoryController();
                    var ac = cc.GetCategories(ModuleId);
                    foreach (var c in ac)
                    {
                        if (c.CategoryId > 0)
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
                    if (CategoryId > 0)
                    {
                        var c = cc.GetCategory(CategoryId, ModuleId);
                        if (c != null)
                        {
                            ddCategory.SelectedValue = c.CategoryName;
                            txtCategoryName.Text = c.CategoryName;
                            txtCategoryDescription.Text = c.CategoryDescription;
                            cbShowCategory.Checked = c.ShowCategory;
                        }
                    }
                    else
                    {
                        ddCategory.SelectedValue = "new";
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
            var cc = new CategoryController();
            var c = new Category();
            if (ddCategory.SelectedValue != "new")
            {
                int tempId = CategoryId;
                var ac = cc.GetCategories(ModuleId);
                foreach (var cat in ac)
                {
                    if (cat.CategoryName == ddCategory.SelectedValue)
                    {
                        tempId = cat.CategoryId;
                    }
                }
                c = cc.GetCategory(tempId, ModuleId);
                c.CategoryName = txtCategoryName.Text.Trim();
                c.CategoryDescription = txtCategoryDescription.Text.Trim();
                c.ShowCategory = cbShowCategory.Checked;
                c.ModuleId = ModuleId;
                cc.UpdateCategory(c);
            }
            else
            {
                c = new Category()
                {
                    CategoryName = txtCategoryName.Text.Trim(),
                    CategoryDescription = txtCategoryDescription.Text.Trim(),
                    ShowCategory = cbShowCategory.Checked,
                    ModuleId = ModuleId
                };
                cc.CreateCategory(c);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
        }

        protected void ddCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            btnSave_Name();
            var cc = new CategoryController();
            var ac = cc.GetCategories(ModuleId);
            foreach (var c in ac)
            {
                if (c.CategoryName == ddCategory.SelectedValue)
                {
                    txtCategoryName.Text = c.CategoryName;
                    txtCategoryDescription.Text = c.CategoryDescription;
                    cbShowCategory.Checked = c.ShowCategory;
                    break;
                }
            }
        }

        protected void btnSave_Name()
        {
            if (ddCategory.SelectedValue == "new")
            {
                btnSave.Text = "Create";
                btnSaveAndClose.Text = "Create And Close";
                lblGroupStatusHolder.CssClass = "group-stat-holder link-add";
            }
            else
            {
                btnSave.Text = "Update";
                btnSaveAndClose.Text = "Update And Close";
                lblGroupStatusHolder.CssClass = "group-stat-holder link-save";
            }
        }
    }
}