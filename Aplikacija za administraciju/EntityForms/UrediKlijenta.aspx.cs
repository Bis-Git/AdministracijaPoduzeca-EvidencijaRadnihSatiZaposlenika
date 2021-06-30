
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
    public partial class UrediKlijenta : System.Web.UI.Page
    {
        public Klijent klijent { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitSetup();
            }
        }

        private void InitSetup()
        {
            klijent = Session["klijent"] as Klijent;

            txtNaziv.Text = klijent.Naziv;
            txtEmail.Text = klijent.Email;
            txtTelefon.Text = klijent.Telefon;
        }

        protected void UrediKlijenta_Click(object sender, EventArgs e)
        {
            Klijent klijent = new Klijent
            {
                IDKlijent = (Session["klijent"] as Klijent).IDKlijent,
                Naziv = txtNaziv.Text,
                Email = txtEmail.Text,
                Telefon = txtTelefon.Text
            };


            Repository.AzurirajKlijenta(klijent);

            Response.Redirect("~/Klijenti.aspx");
        }
    }
}