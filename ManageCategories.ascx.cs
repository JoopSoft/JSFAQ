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
                    lnkNewFAQEntry.NavigateUrl = EditUrl("AddFAQ");
                    lnkEditCategoriesList.NavigateUrl = EditUrl("ListCategories");
                    btnSave_Name();
                    bool categoryPresent = false;
                    var cc = new CategoryController();
                    var ac = cc.GetCategories(ModuleId);
                    foreach (var c in ac)
                    {
                        if (c.CategoryId > 0)
                        {
                            categoryPresent = true;
                            break;
                        }
                    }
                    lnkEditCategoriesList.Visible = categoryPresent;
                    if (categoryPresent)
                    {
                        headerMenu.CssClass = "dnnFormMessage three-controls dnnFormTitle no-spacing";
                    }
                    else
                    {
                        headerMenu.CssClass = "dnnFormMessage two-controls dnnFormTitle no-spacing";
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
        }

        protected void btnSave_Name()
        {
            if (ddCategory.SelectedValue == "new")
            {
                btnSave.Text = "Create";
            }
            else
            {
                btnSave.Text = "Update";
            }
        }
    }
}