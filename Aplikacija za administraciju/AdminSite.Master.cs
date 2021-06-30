using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aplikacija_za_administraciju
{
    public partial class AdminSite : System.Web.UI.MasterPage
    {
        public Table dataTableProperty {
            get {
                return dataTable;
            }
            set {
                dataTable = value;
            }
        }
        public Button BtnAdd {
            get {
                return btnAdd;
            }
            set {
                btnAdd = value;
            }
        }

        private int date = DateTime.Now.Year;

        protected void Page_Load(object sender, EventArgs e)
        {
            lblFooter.Text = $"&copy Visoko učilište Algebra - {date}";
        }
    }
}