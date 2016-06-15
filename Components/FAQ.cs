/*
' Copyright (c) 2016 JoopSoft.com
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
using System.Web.Caching;
using DotNetNuke.Common.Utilities;
using DotNetNuke.ComponentModel.DataAnnotations;
using DotNetNuke.Entities.Content;

namespace JS.Modules.JSFAQ.Components
{
    [TableName("JSFAQ_FAQs")]
    //setup the primary key for table
    [PrimaryKey("FaqId", AutoIncrement = true)]
    //configure caching using PetaPoco
    [Cacheable("FAQs", CacheItemPriority.Default, 20)]
    //scope the objects to the ModuleId of a module on a page (or copy of a module on a page)
    [Scope("ModuleId")]
    class FAQ
    {
        public int FaqId { get; set; }
        public string FaqCategory { get; set; }
        public string FaqQuestion { get; set; }
        public string FaqAnswer { get; set; }
        public bool ShowFaq { get; set; }
        public bool Categorized { get; set; }
        public int ModuleId { get; set; }
    }
}
