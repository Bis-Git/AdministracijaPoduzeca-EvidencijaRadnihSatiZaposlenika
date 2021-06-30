
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
    public partial class Timovi : System.Web.UI.Page
    {
        private Button btnAdd;

        Table table;
        List<string> header = new List<string> { "Naziv", "Datum kreiranja", "" };
        List<Tim> timovi = Repository.GetTimovi();



        protected void Page_Load(object sender, EventArgs e)
        {
            InitSetup();

            table = ((AdminSite)Master).dataTableProperty;
            PrikaziTimove(table, header, timovi);
        }

        private void InitSetup()
        {
            btnAdd = ((AdminSite)Master).BtnAdd;
            btnAdd.Text = "Dodaj tim";
            btnAdd.Click += BtnAdd_Click;
        }

        private void BtnAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/EntityForms/DodajTim.aspx");
        }

        private void PrikaziTimove(Table table, List<string> header, List<Tim> timovi)
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

            for (int i = 0; i < timovi.Count; i++)
            {
                TableRow row = new TableRow();

                FillCell(timovi[i].Naziv, row);
                FillCell(timovi[i].DatumKreiranja.ToLongDateString(), row);
                if (!timovi[i].JeAktivan)
                {
                    row.BackColor = Color.DarkRed;
                    row.ForeColor = Color.White;
                    AddButtons(row, timovi[i].IDTim, timovi[i].JeAktivan);
                }
                else
                {
                    AddButtons(row, timovi[i].IDTim, timovi[i].JeAktivan);
                }
                

                table.Rows.Add(row);
            }
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

            Repository.AktivirajTim(int.Parse(field.Value));
            Response.Redirect("Timovi.aspx");
        }

        private void FillCell(string text, TableRow row)
        {
            TableCell cell = new TableCell();
            cell.Text = text;

            row.Cells.Add(cell);
        }

        private void Deactivate_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            ControlCollection controls = btn.Parent.Controls;
            HiddenField field = controls[0] as HiddenField;

            Repository.DeaktivirajTim(int.Parse(field.Value));
            Response.Redirect("Timovi.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;

            ControlCollection controls = btn.Parent.Controls;
            HiddenField field = controls[0] as HiddenField;

            Session["tim"] = timovi.Find(x => x.IDTim == int.Parse(field.Value));
            Response.Redirect("~/EntityForms/UrediTim.aspx");
        }
    }
}