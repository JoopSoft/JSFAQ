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
    class FAQController
    {
        public void CreateFAQ(FAQ f)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<FAQ>();
                rep.Insert(f);
            }
        }

        public void DeleteFAQ(int faqId, int moduleId)
        {
            var f = GetFAQ(faqId, moduleId);
            DeleteFAQ(f);
        }

        public void DeleteFAQ(FAQ f)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<FAQ>();
                rep.Delete(f);
            }
        }

        public IEnumerable<FAQ> GetFAQs(int moduleId)
        {
            IEnumerable<FAQ> f;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<FAQ>();
                f = rep.Get(moduleId);
            }
            return f;
        }

        public FAQ GetFAQ(int faqId, int moduleId)
        {
            FAQ f;
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<FAQ>();
                f = rep.GetById(faqId, moduleId);
            }
            return f;
        }

        public void UpdateFAQ(FAQ f)
        {
            using (IDataContext ctx = DataContext.Instance())
            {
                var rep = ctx.GetRepository<FAQ>();
                rep.Update(f);
            }
        }
    }
}
