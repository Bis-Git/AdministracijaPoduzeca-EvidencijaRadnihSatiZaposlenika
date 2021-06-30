
using RWA_DAL;
using RWA_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aplikacija_za_administraciju.EntityForms
{
    public partial class UrediTim : System.Web.UI.Page
    {
        public Tim Tim { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Tim = Session["tim"] as Tim;
            if (!IsPostBack)
            {
                InitSetup(); 
            }
            
        }

        private void InitSetup()
        {
            txtNaziv.Text = Tim.Naziv;
        }

        protected void UrediTim_Click(object sender, EventArgs e)
        {
            Tim tim = new Tim
            {
                Naziv = txtNaziv.Text
            };

            Repository.AzurirajTim(Tim.IDTim ,tim);

            Response.Redirect("~/Timovi.aspx");
        }
    }
}