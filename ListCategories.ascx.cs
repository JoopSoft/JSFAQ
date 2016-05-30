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
    /// -----------------------------------------------------------------------------
    /// <summary>   
    /// The Edit class is used to manage content
    /// 
    /// Typically your edit control would be used to create new content, or edit existing content within your module.
    /// The ControlKey for this control is "Edit", and is defined in the manifest (.dnn) file.
    /// 
    /// Because the control inherits from JSFAQModuleBase you have access to any custom properties
    /// defined there, as well as properties from DNN such as PortalId, ModuleId, TabId, UserId and many more.
    /// 
    /// </summary>
    /// -----------------------------------------------------------------------------
    public partial class ListCategories : JSFAQModuleBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //    //Implement your edit logic for your module
            //    if (!Page.IsPostBack)
            //    {
            //        //get a list of users to assign the user to the Object
            //        ddlAssignedUser.DataSource = UserController.GetUsers(PortalId);
            //        ddlAssignedUser.DataTextField = "Username";
            //        ddlAssignedUser.DataValueField = "UserId";
            //        ddlAssignedUser.DataBind();
            //
            //        //check if we have an ID passed in via a querystring parameter, if so, load that item to edit.
            //        //ItemId is defined in the ItemModuleBase.cs file
            //        if (ItemId > 0)
            //        {
            //            var tc = new ItemController();
            //
            //            var t = tc.GetItem(ItemId, ModuleId);
            //            if (t != null)
            //            {
            //                txtName.Text = t.ItemName;
            //                txtDescription.Text = t.ItemDescription;
            //                ddlAssignedUser.Items.FindByValue(t.AssignedUserId.ToString()).Selected = true;
            //            }
            //        }
            //    }
            //}
            //catch (Exception exc) //Module failed to load
            //{
            //    Exceptions.ProcessModuleLoadException(this, exc);
            //}
        }        
    }
}