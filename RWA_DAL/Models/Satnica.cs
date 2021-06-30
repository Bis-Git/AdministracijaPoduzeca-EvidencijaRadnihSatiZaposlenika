using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_DAL.Models
{
    public class Satnica
    {
        public int IDSatnica { get; set; }
        public DateTime Datum { get; set; }
        public string RadniSati { get; set; }
        public string PrekovremeniSati { get; set; }
        public string Komentar { get; set; }
        public bool JePoslano { get; set; }
        public bool JePotvrdeno { get; set; }
        public bool JeOdbijeno { get; set; }
        public int VoditeljTimaID { get; set; }
        public int DjelatnikID { get; set; }
    }
}
