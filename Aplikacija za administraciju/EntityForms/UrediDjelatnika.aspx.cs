
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
    public partial class UrediDjelatnika : System.Web.UI.Page
    {
        public Djelatnik djelatnik { get; set; }
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
            HiddenField id = new HiddenField();
            
            ddlTipDjelatnika.DataSource = tipoviDjelatnika;
            ddlTipDjelatnika.DataTextField = "Naziv";
            ddlTipDjelatnika.DataValueField = "IDTipDjelatnika";
            ddlTipDjelatnika.DataBind();

            ddlTimovi.DataSource = timovi;
            ddlTimovi.DataTextField = "Naziv";
            ddlTimovi.DataValueField = "IDTim";
            ddlTimovi.DataBind();


            djelatnik = Session["djelatnik"] as Djelatnik;
            
            idValue.Value = djelatnik.IDDjelatnik.ToString();
            txtIme.Text = djelatnik.Ime;
            txtPrezime.Text = djelatnik.Prezime;
            txtEmail.Text = djelatnik.Email;
            ddlTipDjelatnika.SelectedValue = djelatnik.TipDjelatnikaID.ToString();
            ddlTimovi.SelectedValue = djelatnik.TimID.ToString();
        }

        protected void UrediDjelatnika_Click(object sender, EventArgs e)
        {
            Djelatnik djelatnik = new Djelatnik {
                    IDDjelatnik = int.Parse(idValue.Value),
                    Ime = txtIme.Text,
                    Prezime = txtPrezime.Text,
                    Email = txtEmail.Text,
                    TipDjelatnikaID = int.Parse(ddlTipDjelatnika.SelectedValue),
                    TimID = int.Parse(ddlTimovi.SelectedValue)
                };

            Repository.AzurirajDjelatnika(djelatnik);

            Response.Redirect("~/Djelatnici.aspx");
        }
    }
}