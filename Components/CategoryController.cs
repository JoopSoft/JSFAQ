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
using System.Collections.Generic;
using DotNetNuke.Data;

namespace JS.Modules.JSFAQ.Components
{
    class CategoryController
    {
        public void CreateCategory(Category c)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Category>();
                rep.Insert(c);
            }
        }

        public void DeleteCategory(int categoryId, int moduleId)
        {
            var t = GetCategory(categoryId, moduleId);
            DeleteItem(t);
        }

        public void DeleteItem(Category c)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Category>();
                rep.Delete(c);
            }
        }

        public IEnumerable<Category> GetCategories(int moduleId)
        {
            IEnumerable<Category> c;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Category>();
                c = rep.Get(moduleId);
            }
            return c;
        }

        public Category GetCategory(int categoryId, int moduleId)
        {
            Category c;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Category>();
                c = rep.GetById(categoryId, moduleId);
            }
            return c;
        }

        public void UpdateCategory(Category c)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<Category>();
                rep.Update(c);
            }
        }

    }
}
