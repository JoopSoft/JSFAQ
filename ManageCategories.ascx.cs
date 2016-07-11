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
using System.Web.UI.WebControls;

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
                    var cc = new CategoryController();
                    CategoryDropdownFill(cc);
                    if (CategoryId > 0)
                    {
                        var c = cc.GetCategory(CategoryId, ModuleId);
                        if (c != null)
                        {
                            LoadPage(c);
                        }
                        btnDeleteCategory.Visible = true;
                    }
                    else
                    {
                        ddCategory.SelectedValue = "new";
                        btnDeleteCategory.Visible = false;
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

        protected void btnSaveAndClose_Click(object sender, EventArgs e)
        {
            Save();
            Response.Redirect(DotNetNuke.Common.Globals.NavigateURL());
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
                    LoadPage(c);
                    btnDeleteCategory.Visible = true;
                    break;
                }
            }
            if (ddCategory.SelectedValue == "new")
            {
                txtCategoryName.Text = String.Empty;
                txtCategoryDescription.Text = String.Empty;
                cbShowCategory.Checked = true;
                cbShowCategoryDescription.Checked = true;
                cbActive.Checked = false;
                cbCollapsible.Checked = false;
                btnDeleteCategory.Visible = false;
            }
            headerMenu.CssClass = "dnnFormMessage two-controls dnnFormTitle no-spacing";
            lblSubTitle.Text = "Manage Existing Categories";
            lnkAdd.CssClass = "btn btn-primary link-add no-txt";
            lnkSettings.CssClass = "btn btn-primary link-settings no-txt";
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

        protected void Save()
        {
            var cc = new CategoryController();
            var c = new Category();
            string active = "false";
            string status;
            if (cbActive.Checked)
            {
                active = txtCurretlyActive.Text.Trim();
            }
            ListItem category = new ListItem(txtCategoryName.Text);
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
                c.ShowCategoryDescription = cbShowCategoryDescription.Checked;
                c.Active = active;
                c.Collapsible = cbCollapsible.Checked;
                c.ModuleId = ModuleId;
                cc.UpdateCategory(c);
                lblSubTitle.Text = "Category Updated!";
                status = "success";
                
            }
            else if(!ddCategory.Items.Contains(category))
            {
                c = new Category()
                {
                    CategoryName = txtCategoryName.Text.Trim(),
                    CategoryDescription = txtCategoryDescription.Text.Trim(),
                    ShowCategory = cbShowCategory.Checked,
                    ShowCategoryDescription = cbShowCategoryDescription.Checked,
                    Active = active,
                    Collapsible = cbCollapsible.Checked,
                    ModuleId = ModuleId
                };
                cc.CreateCategory(c);
                CategoryDropdownFill(cc);
                lblSubTitle.Text = "Category Added!";
                status = "success";
            }
            else
            {
                lblSubTitle.Text = "Category with this Name already Exists!";
                status = "error";
            }
            HeaderMenuStatus(status);
        }

        void CategoryDropdownFill(CategoryController cc)
        {
            ddCategory.Items.Clear();
            ListItem categoryName = new ListItem("< Create New >", "new");
            ddCategory.Items.Add(categoryName);
            var ac = cc.GetCategories(ModuleId);
            foreach (var c in ac)
            {
                categoryName = new ListItem(c.CategoryName);
                if (c.CategoryId > 0 && !ddCategory.Items.Contains(categoryName))
                {
                    ddCategory.Items.Add(categoryName);
                }
            }
        }

        void LoadPage(Category c)
        {
            ddCategory.SelectedValue = c.CategoryName;
            txtCategoryName.Text = c.CategoryName;
            txtCategoryDescription.Text = c.CategoryDescription;
            cbShowCategory.Checked = c.ShowCategory;
            cbShowCategoryDescription.Checked = c.ShowCategoryDescription;
            cbActive.Checked = c.Active != "false";
            if (c.Active != "false")
            {
                txtCurretlyActive.Text = c.Active;
            }
        }

        void LoadNew()
        {
            ddCategory.SelectedValue = "new";
            txtCategoryDescription.Text = txtCategoryName.Text = string.Empty;
            cbShowCategory.Checked = cbShowCategoryDescription.Checked = true;
            cbActive.Checked = cbCollapsible.Checked = false;
            btnDeleteCategory.Visible = false;
        }

        void HeaderMenuStatus(string status)
        {
            headerMenu.CssClass = "dnnFormMessage two-controls dnnFormTitle no-spacing " + status;
            lnkAdd.CssClass = "btn btn-primary link-add no-txt " + status;
            lnkSettings.CssClass = "btn btn-primary link-settings no-txt " + status;
        }

        protected void btnDeleteCategory_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = true;
            btnDeleteConfirm.Visible = true;
            btnDeleteAllEntries.Visible = false;
            btnMoveToEmpty.Visible = false;
            btnDeleteLastConfirm.Visible = false;
            lblPopUpMsg.Text = "Delete Category?";
        }

        protected void btnDeleteConfirm_Click(object sender, EventArgs e)
        {
            var cc = new CategoryController();
            var fc = new FAQController();
            bool emptyCategory = true;
            foreach (var c in cc.GetCategories(ModuleId))
            {
                if (c.CategoryName == ddCategory.SelectedValue)
                {
                    categoryId.Text = c.CategoryId.ToString();
                }
            }
            foreach (var f in fc.GetFAQs(ModuleId))
            {
                if (f.FaqCategory == ddCategory.SelectedValue)
                {
                    emptyCategory = false;
                }
            }
            if (emptyCategory)
            {
                cc.DeleteCategory(Convert.ToInt32(categoryId.Text.Trim()), ModuleId);
                CategoryDropdownFill(cc);
                LoadNew();
                pnlPopUp.Visible = false;
                lblSubTitle.Text = "Category Deleted!";
                HeaderMenuStatus("success");
            }
            else
            {
                lblPopUpMsg.Text = "Category Contains FAQ Entries! <br>What to Do With Them?";
                btnMoveToEmpty.Visible = btnDeleteAllEntries.Visible = true;
                btnDeleteConfirm.Visible = false;
            }
        }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            pnlPopUp.Visible = false;
        }

        protected void btnMoveToEmpty_Click(object sender, EventArgs e)
        {
            var cc = new CategoryController();
            var fc = new FAQController();
            foreach (var c in cc.GetCategories(ModuleId))
            {
                if (c.CategoryName == ddCategory.SelectedValue)
                {
                    categoryId.Text = c.CategoryId.ToString();
                }
            }
            cc.DeleteCategory(Convert.ToInt32(categoryId.Text.Trim()), ModuleId);
            foreach (var f in fc.GetFAQs(ModuleId))
            {
                if (f.FaqCategory == ddCategory.SelectedValue)
                {
                    f.Categorized = false;
                    f.FaqCategory = "NotCategorized";
                    fc.UpdateFAQ(f);
                }
            }
            lblSubTitle.Text = "Category Deleted! FAQ Entries Moved to Not Categorized!";
            pnlPopUp.Visible = false;
            CategoryDropdownFill(cc);
            LoadNew();
        }

        protected void btnDeleteAllEntries_Click(object sender, EventArgs e)
        {
            btnDeleteAllEntries.Visible = btnMoveToEmpty.Visible = false;
            btnDeleteLastConfirm.Visible = true;
            lblPopUpMsg.Text = "Delete All FAQ Entries in the Category?";
        }

        protected void btnDeleteLastConfirm_Click(object sender, EventArgs e)
        {
            var cc = new CategoryController();
            var fc = new FAQController();
            foreach (var c in cc.GetCategories(ModuleId))
            {
                if (c.CategoryName == ddCategory.SelectedValue)
                {
                    categoryId.Text = c.CategoryId.ToString();
                }
            }
            cc.DeleteCategory(Convert.ToInt32(categoryId.Text.Trim()), ModuleId);
            foreach (var f in fc.GetFAQs(ModuleId))
            {
                if (f.FaqCategory == ddCategory.SelectedValue)
                {
                    fc.DeleteFAQ(f);
                }
            }
            lblSubTitle.Text = "Category Deleted! FAQ Entries Deleted!";
            pnlPopUp.Visible = false;
            CategoryDropdownFill(cc);
            LoadNew();
        }
    }
}