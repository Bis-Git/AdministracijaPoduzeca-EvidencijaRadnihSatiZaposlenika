
using RWA_DAL;
using RWA_DAL.Models;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aplikacija_za_administraciju
{
    public partial class Projekti : System.Web.UI.Page
    {
        private Button btnAdd;

        private Table table;
        private List<string> header = new List<string> { "Naziv", "Klijent", "Datum otvaranja", "Voditelj projekta", "" };
        private List<Projekt> projekti = Repository.GetProjekti();

        protected void Page_Load(object sender, EventArgs e)
        {
            table = ((AdminSite)Master).dataTableProperty;
            InitSetup();


            PrikaziProjekte(table, header, projekti);
        }

        private void InitSetup()
        {
            btnAdd = ((AdminSite)Master).BtnAdd;
            btnAdd.Text = "Dodaj projekt";
            btnAdd.Click += BtnAdd_Click;
        }

        private void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EntityForms/DodajProjekt.aspx");
        }

        private void PrikaziProjekte(Table table, List<string> header, List<Projekt> projekti)
        {
            TableHeaderRow headerRow = new TableHeaderRow();


            for (int i = 0; i < header.Count; i++)
            {
                TableHeaderCell headerCell = new TableHeaderCell();
                headerCell.Text = header[i];
                headerCell.CssClass = "th";
                headerRow.Cells.Add(headerCell);
            }

            table.Rows.Add(headerRow);

            for (int i = 0; i < projekti.Count; i++)
            {
                TableRow row = new TableRow();

                Djelatnik d = Repository.GetDjelatnik(projekti[i].VoditeljProjektaID);

                FillCell(projekti[i].Naziv, row);
                FillCell(Repository.GetKlijent(projekti[i].KlijentID).Naziv, row);
                FillCell(projekti[i].DatumOtvaranja.ToLongDateString(), row);
                FillCell(d.ToString(), row);

                if (!projekti[i].JeAktivan)
                {
                    row.BackColor = Color.DarkRed;
                    row.ForeColor = Color.White;
                    AddButtons(row, projekti[i].IDProjekt, projekti[i].JeAktivan);
                }
                else
                {
                    AddButtons(row, projekti[i].IDProjekt, projekti[i].JeAktivan);
                }

                table.Rows.Add(row);
            }
        }
        private void FillCell(string text, TableRow row)
        {
            TableCell cell = new TableCell();
            cell.Text = text;

            row.Cells.Add(cell);
        }

        private void AddButtons(TableRow row, int id, bool aktivan)
        {
            TableCell cell = new TableCell();
            HiddenField idField = new HiddenField
            {
                Value = id.ToString()
            };

            cell.Controls.Add(idField);

            if (aktivan)
            {
                Button update = new Button
                {
                    Text = "Izmjeni",
                    CssClass = "btn btn-warning btn-sm",
                    CausesValidation = false
                };
                Button delete = new Button
                {
                    Text = "Deaktiviraj",
                    CssClass = "btn btn-danger btn-sm",
                    CausesValidation = false
                };


                delete.Click += Deactivate_Click;
                update.Click += btnUpdate_Click;

                cell.Controls.Add(update);
                cell.Controls.Add(delete);
            }
            else
            {
                Button activate = new Button
                {
                    Text = "Aktiviraj",
                    CssClass = "btn btn-success btn-sm",
                    CausesValidation = false
                };

                activate.Click += Activate_Click;

                cell.Controls.Add(activate);
            }

            row.Cells.Add(cell);
        }

        private void Activate_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            ControlCollection controls = btn.Parent.Controls;
            HiddenField field = controls[0] as HiddenField;

            Repository.AktivirajProjekt(int.Parse(field.Value));
            Response.Redirect("Projekti.aspx");
        }

        private void Deactivate_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            ControlCollection controls = btn.Parent.Controls;
            HiddenField field = controls[0] as HiddenField;

            Repository.DeaktivirajProjekt(int.Parse(field.Value));
            Response.Redirect("Projekti.aspx");
        }

        


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            ControlCollection controls = btn.Parent.Controls;
            HiddenField field = controls[0] as HiddenField;

            Session["projekt"] = projekti.Find(x => x.IDProjekt == int.Parse(field.Value));
            Response.Redirect("~/EntityForms/UrediProjekt.aspx");
        }
    }
}