
using RWA_DAL;
using RWA_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aplikacija_za_administraciju.EntityForms
{
    public partial class DodajKlijenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DodajKlijenta_Click(object sender, EventArgs e)
        {
            Klijent klijent = new Klijent
            {
                Naziv = txtNaziv.Text,
                Email = txtEmail.Text,
                Telefon = txtTelefon.Text
            };

            Repository.DodajKlijenta(klijent);

            Response.Redirect("~/Klijenti.aspx");
        }
    }
}