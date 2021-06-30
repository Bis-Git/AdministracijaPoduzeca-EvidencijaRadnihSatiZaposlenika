using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_DAL.Models
{
    public class SatnicaPoProjektu
    {
        public int IDSatnicaProjekt { get; set; }
        public string RadniSati { get; set; }
        public string PrekovremeniSati { get; set; }
        public int ProjektID { get; set; }
        public int SatnicaID { get; set; }
    }
}
