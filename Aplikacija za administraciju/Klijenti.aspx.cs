
using RWA_DAL;
using RWA_DAL.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aplikacija_za_administraciju
{
    public partial class Klijenti : System.Web.UI.Page
    {

        private List<string> header = new List<string> { "Naziv", "Telefon", "E-mail", "" };
        private List<Klijent> klijenti = Repository.GetKlijenti();
        Table table;


        private Button btnAdd;
        protected void Page_Load(object sender, EventArgs e)
        {
            table = ((AdminSite)Master).dataTableProperty;
            InitSetup();

            PrikaziKlijente(table, header, klijenti);
        }

        private void InitSetup()
        {
            btnAdd = ((AdminSite)Master).BtnAdd;
            btnAdd.Text = "Dodaj klijenta";
            btnAdd.Click += BtnAdd_Click;
        }

        private void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EntityForms/DodajKlijenta.aspx");
        }

        private void PrikaziKlijente(Table table, List<string> header, List<Klijent> klijenti)
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

            for (int i = 0; i < klijenti.Count; i++)
            {
                TableRow row = new TableRow();

                FillCell(klijenti[i].Naziv, row);
                FillCell(klijenti[i].Telefon, row);
                FillCell(klijenti[i].Email, row);
                if (!klijenti[i].JeAktivan)
                {
                    row.BackColor = Color.DarkRed;
                    row.ForeColor = Color.White;
                    AddButtons(row, klijenti[i].IDKlijent, klijenti[i].JeAktivan);
                }
                else
                {
                    AddButtons(row, klijenti[i].IDKlijent, klijenti[i].JeAktivan);
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

        private void AddButtons(TableRow row, int id, bool active)
        {
            TableCell cell = new TableCell();
            HiddenField idField = new HiddenField
            {
                Value = id.ToString()
            };
            cell.Controls.Add(idField);

            if (active)
            {
                Button update = new Button
                {
                    Text = "Izmjeni",
                    CssClass = "btn btn-warning btn-sm",
                    CausesValidation = false
                };
                Button deactivate = new Button
                {
                    Text = "Deaktiviraj",
                    CssClass = "btn btn-danger btn-sm",
                    CausesValidation = false
                };

                deactivate.Click += Deactivate_Click;
                update.Click += btnUpdate_Click;

                cell.Controls.Add(update);
                cell.Controls.Add(deactivate);
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

            Repository.AktivirajKlijenta(int.Parse(field.Value));
            Response.Redirect("Klijenti.aspx");
        }

        private void Deactivate_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            ControlCollection controls = btn.Parent.Controls;
            HiddenField field = controls[0] as HiddenField;

            Repository.DeaktivirajKlijenta(int.Parse(field.Value));
            Response.Redirect("Klijenti.aspx");
        }

        

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            ControlCollection controls = btn.Parent.Controls;
            HiddenField field = controls[0] as HiddenField;

            Session["klijent"] = klijenti.Find(x => x.IDKlijent == int.Parse(field.Value));
            Response.Redirect("~/EntityForms/UrediKlijenta.aspx");

        }
    }
}