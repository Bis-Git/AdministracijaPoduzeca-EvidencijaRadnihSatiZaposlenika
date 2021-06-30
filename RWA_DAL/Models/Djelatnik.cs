using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_DAL.Models
{
    public class Djelatnik
    {
        public int IDDjelatnik { get; set; }
        public string Ime { get; set; }
        public string Prezime { get; set; }
        public string Email { get; set; }
        public DateTime DatumZaposljenja { get; set; }
        public string Zaporka { get; set; }
        public int TipDjelatnikaID { get; set; }
        public int? TimID { get; set; }
        public bool JeAktivan { get; set; }
        public string PunoIme { get => ToString(); }

        public override string ToString() => $"{Ime} {Prezime}";
    }
}
