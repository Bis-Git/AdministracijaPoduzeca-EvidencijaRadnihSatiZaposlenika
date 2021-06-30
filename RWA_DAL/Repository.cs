using Microsoft.ApplicationBlocks.Data;
using RWA_DAL.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RWA_DAL
{
    public static class Repository
    {
        private static string cs = "Server=.;Database=PRA_RWA_DB;Uid=sa;Pwd=SQL";

        public static bool AutorizacijaAdmin(string email, string pass)
        {
            DataTable table = SqlHelper.ExecuteDataset(cs, "GetDjelatnikByEmailAndPassword", email, pass).Tables[0];
            Djelatnik d;

            if (table.Rows.Count != 0)
            {
                var row = table.Rows[0];
                d = new Djelatnik
                {
                    IDDjelatnik = int.Parse(row["IDDjelatnik"].ToString()),
                    Ime = row["Ime"].ToString(),
                    Prezime = row["Prezime"].ToString(),
                    Email = row["Email"].ToString(),
                    DatumZaposljenja = DateTime.Parse(row["DatumZaposlenja"].ToString()),
                    Zaporka = row["Zaporka"].ToString(),
                    TipDjelatnikaID = int.Parse(row["TipDjelatnikaID"].ToString()),
                    TimID = row["TimID"].ToString().Equals("") ? (int?)null : int.Parse(row["TimID"].ToString()),
                    JeAktivan = bool.Parse(row["JeAktivan"].ToString())
                };


                if ((d.JeAktivan && d.TipDjelatnikaID == 2) || d.TipDjelatnikaID == 1)
                {
                    return true;
                }
                return false;
            }
            return false;
        }

        public static Djelatnik AutorizacijaDjelatnik(string email, string pass)
        {
            DataTable table = SqlHelper.ExecuteDataset(cs, "GetDjelatnikByEmailAndPassword", email, pass).Tables[0];
            Djelatnik d;

            if (table.Rows.Count != 0)
            {
                var row = table.Rows[0];
                d = new Djelatnik
                {
                    IDDjelatnik = int.Parse(row["IDDjelatnik"].ToString()),
                    Ime = row["Ime"].ToString(),
                    Prezime = row["Prezime"].ToString(),
                    Email = row["Email"].ToString(),
                    DatumZaposljenja = DateTime.Parse(row["DatumZaposlenja"].ToString()),
                    Zaporka = row["Zaporka"].ToString(),
                    TipDjelatnikaID = int.Parse(row["TipDjelatnikaID"].ToString()),
                    TimID = row["TimID"].ToString().Equals("") ? (int?)null : int.Parse(row["TimID"].ToString()),
                    JeAktivan = bool.Parse(row["JeAktivan"].ToString())
                };

                if (d.JeAktivan)
                {
                    return d;
                }
                return null;
            }
            return null;
        }

        public static object GetSatnica(int satnicaID)
        {
            DataTable table = SqlHelper.ExecuteDataset(cs, nameof(GetSatnica), satnicaID).Tables[0];

            if (table.Rows.Count != 0)
            {
                var row = table.Rows[0];
                return new Satnica
                {
                    IDSatnica = int.Parse(row["IDSatnica"].ToString()),
                    Datum = DateTime.Parse(row["Datum"].ToString()),
                    RadniSati = row["RadniSati"].ToString(),
                    PrekovremeniSati = row["PrekovremeniSati"].ToString(),
                    Komentar = row["Komentar"].ToString(),
                    JePoslano = bool.Parse(row["JePoslano"].ToString()),
                    JePotvrdeno = bool.Parse(row["JePotvreno"].ToString()),
                    JeOdbijeno = bool.Parse(row["JeOdbijeno"].ToString()),
                    VoditeljTimaID = int.Parse(row["VoditeljTimaID"].ToString()),
                    DjelatnikID = int.Parse(row["DjelatnikID"].ToString())
                };
            }
            return null;
        }

        public static void ClearSatnice(int satnicaId)
        {
            SqlHelper.ExecuteNonQuery(cs, nameof(ClearSatnice), satnicaId);
        }

        public static int PredajSatnicu(Satnica satnica)
        {
            int result = SqlHelper.ExecuteNonQuery(cs, nameof(PredajSatnicu), satnica.IDSatnica);
            return result;
        }

        public static IEnumerable<SatnicaPoProjektu> GetSatniceProjekataPoDjelatnikuIDatumu(Djelatnik user, DateTime datum)
        {
            DataTable table = SqlHelper.ExecuteDataset(cs, nameof(GetSatniceProjekataPoDjelatnikuIDatumu), user.IDDjelatnik, datum).Tables[0];
            foreach (DataRow row in table.Rows)
            {
                yield return new SatnicaPoProjektu
                {
                    IDSatnicaProjekt = int.Parse(row["IDSatnicaProjekt"].ToString()),
                    RadniSati = row["RadniSati"].ToString(),
                    PrekovremeniSati = row["PrekovremeniSati"].ToString(),
                    ProjektID = int.Parse(row["ProjetID"].ToString()),
                    SatnicaID = int.Parse(row["SatnicaID"].ToString())
                };
            }
        }

        public static Satnica GetSatnicaPoDjelatnikuIDatumu(Djelatnik user, DateTime datum)
        {
            DataTable table = SqlHelper.ExecuteDataset(cs, nameof(GetSatnicaPoDjelatnikuIDatumu), user.IDDjelatnik, datum).Tables[0];

            if (table.Rows.Count != 0)
            {
                var row = table.Rows[0];
                return new Satnica
                {
                    IDSatnica = int.Parse(row["IDSatnica"].ToString()),
                    Datum = DateTime.Parse(row["Datum"].ToString()),
                    RadniSati = row["RadniSati"].ToString(),
                    PrekovremeniSati = row["PrekovremeniSati"].ToString(),
                    Komentar = row["Komentar"].ToString(),
                    JePoslano = bool.Parse(row["JePoslano"].ToString()),
                    JePotvrdeno = bool.Parse(row["JePotvreno"].ToString()),
                    JeOdbijeno = bool.Parse(row["JeOdbijeno"].ToString()),
                    VoditeljTimaID = int.Parse(row["VoditeljTimaID"].ToString()),
                    DjelatnikID = int.Parse(row["DjelatnikID"].ToString())
                };
            }
            return null;
        }

        public static int PotvrdiSatnice(int idSatnica)
        {
            int result = SqlHelper.ExecuteNonQuery(cs,
                nameof(PotvrdiSatnice), idSatnica);
            return result;
        }

        public static IEnumerable<SatnicaPoProjektu> GetSatniceProjekataPoSatnicaID(int satnicaId)
        {
            DataTable table = SqlHelper.ExecuteDataset(cs, nameof(GetSatniceProjekataPoSatnicaID), satnicaId).Tables[0];
            foreach (DataRow row in table.Rows)
            {
                yield return new SatnicaPoProjektu
                {
                    IDSatnicaProjekt = int.Parse(row["IDSatnicaProjekt"].ToString()),
                    RadniSati = row["RadniSati"].ToString(),
                    PrekovremeniSati = row["PrekovremeniSati"].ToString(),
                    ProjektID = int.Parse(row["ProjetID"].ToString()),
                    SatnicaID = satnicaId
                };
            }
        }

        public static int InsertSatnica(DateTime datum, string rSati, string pSati, string komentar, int voditeljID, int djelatnikID)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();
                using(SqlCommand cmd = con.CreateCommand())
                {
                    cmd.CommandText = nameof(InsertSatnica);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@rSati", rSati);
                    cmd.Parameters.AddWithValue("@pSati", pSati);
                    cmd.Parameters.AddWithValue("@komentar", komentar);
                    cmd.Parameters.AddWithValue("@voditeljID", voditeljID);
                    cmd.Parameters.AddWithValue("@djelatnikID", djelatnikID);
                    cmd.Parameters.AddWithValue("@datum", datum);

                    var id = cmd.Parameters.Add("@id", SqlDbType.Int);
                    id.Direction = ParameterDirection.Output;
                    cmd.ExecuteNonQuery();

                    return (int)id.Value;
                }
            }
        }

        public static int UpdateSatnicaPoProjektu(string rSati, string pSati, int projektID, int satnicaID)
        {
            int result = SqlHelper.ExecuteNonQuery(cs,
                nameof(UpdateSatnicaPoProjektu), rSati, pSati, projektID, satnicaID);
            return result;
        }

        public static int UpdateSatnica(string ukupniRadniSati, string ukupniPrekovremeniSati, string komentar, int satnicaId)
        {
            int result = SqlHelper.ExecuteNonQuery(cs, nameof(UpdateSatnica), ukupniRadniSati, ukupniPrekovremeniSati, komentar, satnicaId);
            return result;
        }

        public static int InsertSatnicaPoProjektu(string rSati, string pSati, int projektID, int satnicaID)
        {
            int result = SqlHelper.ExecuteNonQuery(cs,
                "InsertSatnicaPoProjektu", rSati, pSati, projektID, satnicaID);
            return result;
        }

        public static Djelatnik GetVoditeljTimaPoTimID(int? timId)
        {
            if (timId != null)
            {
                Tim tim = GetTim(timId);
                List<Djelatnik> djelatnici = GetDjelatnici();
                return djelatnici.Find(d => d.TimID == tim.IDTim && d.TipDjelatnikaID == 2);
            }
            return null;
        }

        public static IEnumerable<Satnica> GetSatnice(int voditeljTimaID)
        {

            DataTable table = SqlHelper.ExecuteDataset(cs, "GetSatnice", voditeljTimaID).Tables[0];
            foreach (DataRow row in table.Rows)
            {
                yield return new Satnica
                {
                    IDSatnica = int.Parse(row["IDSatnica"].ToString()),
                    Datum = DateTime.Parse(row["Datum"].ToString()),
                    RadniSati = row["RadniSati"].ToString(),
                    PrekovremeniSati = row["PrekovremeniSati"].ToString(),
                    Komentar = row["Komentar"].ToString(),
                    JePoslano = bool.Parse(row["JePoslano"].ToString()),
                    JePotvrdeno = bool.Parse(row["JePotvreno"].ToString()),
                    JeOdbijeno = bool.Parse(row["JeOdbijeno"].ToString()),
                    VoditeljTimaID = int.Parse(row["VoditeljTimaID"].ToString()),
                    DjelatnikID = int.Parse(row["DjelatnikID"].ToString())
                };
            }

        }

        public static int PromjeniLozinku(int id, string newPass)
        {
            int result = SqlHelper.ExecuteNonQuery(cs, "UpdateZaporka", id, newPass);
            return result;
        }

        public static Djelatnik GetDjelatnik(int idDjelatnik)
        {
            DataTable table = SqlHelper.ExecuteDataset(cs, "GetDjelatnik", idDjelatnik).Tables[0];

            if (table.Rows.Count != 0)
            {
                var row = table.Rows[0];
                return new Djelatnik
                {
                    IDDjelatnik = int.Parse(row["IDDjelatnik"].ToString()),
                    Ime = row["Ime"].ToString(),
                    Prezime = row["Prezime"].ToString(),
                    Email = row["Email"].ToString(),
                    DatumZaposljenja = DateTime.Parse(row["DatumZaposlenja"].ToString()),
                    Zaporka = row["Zaporka"].ToString(),
                    TipDjelatnikaID = int.Parse(row["TipDjelatnikaID"].ToString()),
                    TimID = row["TimID"].ToString().Equals("") ? (int?)null : int.Parse(row["TimID"].ToString()),
                    JeAktivan = bool.Parse(row["JeAktivan"].ToString())
                };
            }
            return null;
        }

        public static List<Projekt> GetProjektiDjelatnika(int djelatnikId)
        {
            List<Projekt> projekti = new List<Projekt>();

            DataTable table = SqlHelper.ExecuteDataset(cs, "GetProjektiDjelatnika", djelatnikId).Tables[0];
            foreach (DataRow row in table.Rows)
            {
                projekti.Add(new Projekt
                {
                    IDProjekt = int.Parse(row["IDProjekt"].ToString()),
                    KlijentID = int.Parse(row["KlijentID"].ToString()),
                    DatumOtvaranja = DateTime.Parse(row["DatumOtvaranja"].ToString()),
                    Naziv = row["Naziv"].ToString(),
                    VoditeljProjektaID = int.Parse(row["VoditeljProjektaID"].ToString())
                });
            }

            return projekti;
        }

        public static List<Djelatnik> GetDjelatnici()
        {
            List<Djelatnik> djelatnici = new List<Djelatnik>();
            var kolekcija = SqlHelper.ExecuteDataset(cs, "GetDjelatnici").Tables[0];

            foreach (DataRow row in kolekcija.Rows)
            {
                djelatnici.Add(new Djelatnik
                {
                    IDDjelatnik = int.Parse(row["IDDjelatnik"].ToString()),
                    Ime = row["Ime"].ToString(),
                    Prezime = row["Prezime"].ToString(),
                    Email = row["Email"].ToString(),
                    DatumZaposljenja = DateTime.Parse(row["DatumZaposlenja"].ToString()),
                    Zaporka = row["Zaporka"].ToString(),
                    TipDjelatnikaID = int.Parse(row["TipDjelatnikaID"].ToString()),
                    TimID = row["TimID"].ToString().Equals("") ? (int?)null : int.Parse(row["TimID"].ToString()),
                    JeAktivan = bool.Parse(row["JeAktivan"].ToString())
                });
            }

            return djelatnici;
        }

        public static Tim GetTim(int? idTim)
        {
            var kolekcija = SqlHelper.ExecuteDataset(cs, "GetTim", idTim).Tables[0];

            if (idTim != null)
            {
                return new Tim
                {
                    IDTim = (int)idTim,
                    Naziv = kolekcija.Rows[0]["Naziv"].ToString(),
                    DatumKreiranja = DateTime.Parse(kolekcija.Rows[0]["DatumKreiranja"].ToString())
                };
            }
            else
            {
                return new Tim
                {
                    IDTim = 0,
                    Naziv = "",
                    DatumKreiranja = DateTime.Now
                };
            }
        }

        public static TipDjelatnika GetTipDjelatnika(int tipDjelatnikaId)
        {

            var kolekcija = SqlHelper.ExecuteDataset(cs, "GetTipDjelatnika", tipDjelatnikaId).Tables[0];

            return new TipDjelatnika
            {
                IDTipDjelatnika = tipDjelatnikaId,
                Naziv = kolekcija.Rows[0]["Naziv"].ToString()
            };
        }

        public static List<Klijent> GetKlijenti()
        {
            List<Klijent> klijenti = new List<Klijent>();
            var kolekcija = SqlHelper.ExecuteDataset(cs, "GetKlijenti").Tables[0];

            foreach (DataRow row in kolekcija.Rows)
            {
                klijenti.Add(new Klijent
                {
                    IDKlijent = int.Parse(row["IDKlijent"].ToString()),
                    Naziv = row["Naziv"].ToString(),
                    Telefon = row["Telefon"].ToString(),
                    Email = row["Email"].ToString(),
                    JeAktivan = bool.Parse(row["JeAktivan"].ToString())
                });
            }

            return klijenti;
        }

        public static Klijent GetKlijent(int idKlijent)
        {
            List<Klijent> klijenti = new List<Klijent>();
            DataTable table = SqlHelper.ExecuteDataset(cs, "GetKlijent", idKlijent).Tables[0];

            if (table.Rows.Count != 0)
            {
                var row = table.Rows[0];
                return new Klijent
                {
                    IDKlijent = int.Parse(row["IDKlijent"].ToString()),
                    Naziv = row["Naziv"].ToString(),
                    Telefon = row["Telefon"].ToString(),
                    Email = row["Email"].ToString(),
                    JeAktivan = bool.Parse(row["JeAktivan"].ToString())
                };
            }
            return null;
        }

        public static List<Projekt> GetProjekti()
        {
            List<Projekt> projekti = new List<Projekt>();
            var kolekcija = SqlHelper.ExecuteDataset(cs, "GetProjekti").Tables[0];

            foreach (DataRow row in kolekcija.Rows)
            {
                projekti.Add(new Projekt
                {
                    IDProjekt = int.Parse(row["IDProjekt"].ToString()),
                    Naziv = row["Naziv"].ToString(),
                    KlijentID = int.Parse(row["KlijentID"].ToString()),
                    DatumOtvaranja = DateTime.Parse(row["DatumOtvaranja"].ToString()),
                    VoditeljProjektaID = int.Parse(row["VoditeljProjektaID"].ToString()),
                    JeAktivan = bool.Parse(row["JeAktivan"].ToString())
                });
            }
            return projekti;
        }

        public static List<Tim> GetTimovi()
        {
            List<Tim> timovi = new List<Tim>();
            var kolekcija = SqlHelper.ExecuteDataset(cs, "GetTimovi").Tables[0];

            foreach (DataRow row in kolekcija.Rows)
            {
                timovi.Add(new Tim
                {
                    IDTim = int.Parse(row["IDTim"].ToString()),
                    Naziv = row["Naziv"].ToString(),
                    DatumKreiranja = DateTime.Parse(row["DatumKreiranja"].ToString()),
                    JeAktivan = bool.Parse(row["JeAktivan"].ToString())
                });
            }

            return timovi;
        }

        public static void AktivirajProjekt(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "ActivateProjekt", id);
        }

        public static void AktivirajTim(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "ActivateTim", id);
        }

        public static void AktivirajDjelatnika(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "ActivateDjelatnik", id);
        }

        public static void AktivirajKlijenta(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "ActivateKlijent", id);
        }

        public static int DodajProjekt(string naziv, int klijentId, int voditeljId)
        {
            int result = SqlHelper.ExecuteNonQuery(cs, "InsertProjekt", naziv, DateTime.Now, klijentId, voditeljId);

            return result;
        }

        public static int AzurirajProjekt(Projekt projekt)
        {
            int result = SqlHelper.ExecuteNonQuery(cs, "UpdateProjekt", projekt.IDProjekt, projekt.Naziv, projekt.KlijentID, projekt.VoditeljProjektaID);

            return result;
        }

        public static int DodajDjelatnika(Djelatnik d)
        {
            int result = SqlHelper.ExecuteNonQuery(cs,
                "InsertDjelatnik",
                d.Ime,
                d.Prezime,
                d.Email,
                d.DatumZaposljenja,
                d.Zaporka,
                d.TipDjelatnikaID,
                d.TimID);
            return result;
        }

        public static int DodajTim(Tim t)
        {
            int result = SqlHelper.ExecuteNonQuery(cs,
                "InsertTim", t.Naziv, t.DatumKreiranja);
            return result;
        }

        public static int DodajKlijenta(Klijent k)
        {
            int result = SqlHelper.ExecuteNonQuery(cs,
                "InsertKlijent", k.Naziv, k.Telefon, k.Email);
            return result;
        }

        public static int AzurirajDjelatnika(Djelatnik d)
        {
            int result = SqlHelper.ExecuteNonQuery(cs, "UpdateDjelatnik", d.IDDjelatnik, d.Ime, d.Prezime, d.Email, d.TipDjelatnikaID, d.TimID);

            return result;
        }

        public static int AzurirajKlijenta(Klijent k)
        {
            int result = SqlHelper.ExecuteNonQuery(cs, "UpdateKlijent", k.IDKlijent, k.Naziv, k.Telefon, k.Email);

            return result;
        }

        public static int AzurirajTim(int idTim, Tim t)
        {
            int result = SqlHelper.ExecuteNonQuery(cs, "UpdateTim", idTim, t.Naziv);

            return result;
        }

        public static List<TipDjelatnika> GetTipoviDjelatnika()
        {
            List<TipDjelatnika> tipovi = new List<TipDjelatnika>();
            var kolekcija = SqlHelper.ExecuteDataset(cs, "GetTipoviDjelatnika").Tables[0];

            foreach (DataRow row in kolekcija.Rows)
            {
                tipovi.Add(new TipDjelatnika
                {
                    IDTipDjelatnika = int.Parse(row["IDTipDjelatnika"].ToString()),
                    Naziv = row["Naziv"].ToString()
                });
            }

            return tipovi;
        }

        public static void DeaktivirajDjelatnika(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "DeactivateDjelatnik", id);
        }

        public static void DeaktivirajKlijenta(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "DeactivateKlijent", id);
        }

        public static void DeaktivirajTim(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "DeactivateTim", id);
        }

        public static void DeaktivirajProjekt(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "DeactivateProjekt", id);
        }
    }
}
