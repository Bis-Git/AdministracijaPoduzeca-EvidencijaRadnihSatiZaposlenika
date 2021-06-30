
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
    public partial class DodajProjekt : System.Web.UI.Page
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

            List<Djelatnik> djelatnici = Repository.GetDjelatnici();
            List<Djelatnik> voditelji = new List<Djelatnik>();
            List<Klijent> klijenti = Repository.GetKlijenti();
 
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

        }

        protected void DodajProjekt_Click(object sender, EventArgs e)
        {

            Repository.DodajProjekt(txtNaziv.Text, int.Parse(ddlKlijent.SelectedValue), int.Parse(ddlVoditelj.SelectedValue));

            Response.Redirect("~/Projekti.aspx");
        }
    }
}