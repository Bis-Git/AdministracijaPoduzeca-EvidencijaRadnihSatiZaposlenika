
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
    public partial class DodajTim : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void DodajTim_Click(object sender, EventArgs e)
        {
            Tim tim = new Tim
            {
                Naziv = txtNaziv.Text,
                DatumKreiranja = DateTime.Now,
                JeAktivan = true
            };

            Repository.DodajTim(tim);

            Response.Redirect("~/Timovi.aspx");
        }
    }
}