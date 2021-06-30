
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
    public partial class DodajDjelatnika : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitSetup();
            }
        }

        private void InitSetup()
        {
            List<TipDjelatnika> tipoviDjelatnika = Repository.GetTipoviDjelatnika();
            List<Tim> timovi = Repository.GetTimovi();

            ddlTipDjelatnika.DataSource = tipoviDjelatnika;
            ddlTipDjelatnika.DataTextField = "Naziv";
            ddlTipDjelatnika.DataValueField = "IDTipDjelatnika";
            ddlTipDjelatnika.DataBind();

            ddlTimovi.DataSource = timovi;
            ddlTimovi.DataTextField = "Naziv";
            ddlTimovi.DataValueField = "IDTim";
            ddlTimovi.DataBind();
        }

        protected void DodajDjelatnika_Click(object sender, EventArgs e)
        {
            Djelatnik djelatnik = new Djelatnik {
                    Ime = txtIme.Text,
                    Prezime = txtPrezime.Text,
                    Email = txtEmail.Text,
                    DatumZaposljenja = DateTime.Now,
                    Zaporka = txtZaporka.Text,
                    TipDjelatnikaID = int.Parse(ddlTipDjelatnika.SelectedValue),
                    TimID = int.Parse(ddlTimovi.SelectedValue),
                    JeAktivan = true
                };

            Repository.DodajDjelatnika(djelatnik);

            Response.Redirect("~/Djelatnici.aspx");
        }
    }
}