
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
    public partial class UrediProjekt : System.Web.UI.Page
    {
        private Projekt projekt { get; set; }
        private Klijent klijent { get; set; }
        private Djelatnik voditelj { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitSetup();
            }
        }

        private void InitSetup()
        {
            List<Djelatnik> djelatnici = Repository.GetDjelatnici();
            List<Klijent> klijenti = Repository.GetKlijenti();
            List<Djelatnik> voditelji = Repository.GetDjelatnici();

            foreach (var djelatnik in djelatnici)
            {
                if (djelatnik.TipDjelatnikaID == 2)
                {
                    voditelji.Add(djelatnik);
                }
            }

            ddlKlijent.DataSource = klijenti;
            ddlKlijent.DataTextField = "Naziv";
            ddlKlijent.DataValueField = "IDKlijent";
            ddlKlijent.DataBind();

            ddlVoditelj.DataSource = voditelji;
            ddlVoditelj.DataTextField = "PunoIme";
            ddlVoditelj.DataValueField = "IDDjelatnik";
            ddlVoditelj.DataBind();

            projekt = Session["projekt"] as Projekt;

            klijent = klijenti.Find(x => x.IDKlijent == projekt.KlijentID);
            voditelj = voditelji.Find(x => x.IDDjelatnik == projekt.VoditeljProjektaID);


            txtNaziv.Text = projekt.Naziv;
            ddlKlijent.SelectedValue = klijent.IDKlijent.ToString();
            ddlVoditelj.SelectedValue = voditelj.IDDjelatnik.ToString();

        }

        protected void UrediProjekt_Click(object sender, EventArgs e)
        {

            Projekt projekt = new Projekt
            {
                IDProjekt = (Session["projekt"] as Projekt).IDProjekt,
                Naziv = txtNaziv.Text,
                KlijentID = int.Parse(ddlKlijent.SelectedValue),
                VoditeljProjektaID = int.Parse(ddlVoditelj.SelectedValue)
            };

            Repository.AzurirajProjekt(projekt);

            Response.Redirect("~/Projekti.aspx");
        }
    }
}