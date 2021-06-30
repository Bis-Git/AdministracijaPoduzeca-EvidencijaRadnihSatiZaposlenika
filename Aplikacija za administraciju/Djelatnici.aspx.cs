using RWA_DAL;
using RWA_DAL.Models;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Aplikacija_za_administraciju
{
    public partial class Djelatnici : System.Web.UI.Page
    {
        private Button btnAdd;

        private Table table;
        private List<string> header = new List<string> { "Ime", "Prezime", "E-mail", "Datum zaposljenja", "Tip djelatnika", "Tim", "" };
        private List<Djelatnik> djelatnici = Repository.GetDjelatnici();

        protected override void OnInit(EventArgs e)
        {
            InitSetup();
            base.OnInit(e);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            table = ((AdminSite)Master).dataTableProperty;

            PrikaziDjelatnike(table, header, djelatnici);

        }


        private void InitSetup()
        {
            btnAdd = ((AdminSite)Master).BtnAdd;
            btnAdd.Text = "Dodaj djelatnika";
            btnAdd.Click += BtnAdd_Click;
        }

        private void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EntityForms/DodajDjelatnika.aspx");
        }

        private void PrikaziDjelatnike(Table table, List<string> header, List<Djelatnik> djelatnici)
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

            for (int i = 0; i < djelatnici.Count; i++)
            {
                TableRow row = new TableRow();

                string tipDjelatnika = Repository.GetTipDjelatnika(djelatnici[i].TipDjelatnikaID).Naziv;
                string tim = Repository.GetTim(djelatnici[i].TimID).Naziv;

                
                FillCell(djelatnici[i].Ime, row);
                FillCell(djelatnici[i].Prezime, row);
                FillCell(djelatnici[i].Email, row);
                FillCell(djelatnici[i].DatumZaposljenja.ToLongDateString(), row);
                FillCell(tipDjelatnika, row);
                FillCell(tim, row);

                if (!djelatnici[i].JeAktivan)
                {
                    row.BackColor = Color.DarkRed;
                    row.ForeColor = Color.White;
                    AddButtons(row, djelatnici[i].IDDjelatnik, djelatnici[i].JeAktivan);
                }
                else
                {
                    AddButtons(row, djelatnici[i].IDDjelatnik, djelatnici[i].JeAktivan);
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
                
                update.Click += Update_Click;
                deactivate.Click += Deactivate_Click;

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

            Repository.AktivirajDjelatnika(int.Parse(field.Value));

            Response.Redirect("Djelatnici.aspx");
        }

        private void Deactivate_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            ControlCollection controls = btn.Parent.Controls;
            HiddenField field = controls[0] as HiddenField;

            Repository.DeaktivirajDjelatnika(int.Parse(field.Value));
            Response.Redirect("Djelatnici.aspx");
        }

        private void Update_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            ControlCollection controls = btn.Parent.Controls;
            HiddenField field = controls[0] as HiddenField;

            Session["djelatnik"] = djelatnici.Find(x => x.IDDjelatnik == int.Parse(field.Value));
            Response.Redirect("~/EntityForms/UrediDjelatnika.aspx");
        }

    }
}