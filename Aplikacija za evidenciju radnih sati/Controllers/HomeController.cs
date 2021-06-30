using RWA_DAL;
using RWA_DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Aplikacija_za_evidenciju_radnih_sati.Controllers
{
    public class HomeController : Controller
    {

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(string email, string password)
        {
            Djelatnik model = Repository.AutorizacijaDjelatnik(email, password);
            

            if (model != null)
            {
                Session["user"] = model;
                if (model.TipDjelatnikaID > 3)
                {
                    return RedirectToAction("HonorarniSatnice");
                }
                else
                {
                    return RedirectToAction("Satnice");
                }
            }
            else
            {
                return View("Login");
            }
        }

        [HttpGet]
        public ActionResult Profil()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Profil(int id, string oldPass, string newPass, string passCheck)
        {

            if (oldPass.Equals((Repository.GetDjelatnik(id)).Zaporka) && newPass == passCheck)
            {
                Repository.PromjeniLozinku(id, newPass);
            }
            else
            {
                ViewBag.ErrMsg = "Progrešan unos zaporke";
            }
            return View();
        }

        [HttpGet]
        public ActionResult Satnice()
        {
            Djelatnik user = Session["user"] as Djelatnik;
            List<SatnicaPoProjektu> model = Repository.GetSatniceProjekataPoDjelatnikuIDatumu(user, DateTime.Now.Date).ToList();
            if (model.Count != 0)
            {
                Session["satnicaId"] = model[0].SatnicaID;
            }
            return View(model);
        }

        [HttpGet]
        public ActionResult HonorarniSatnice()
        {
            Djelatnik user = Session["user"] as Djelatnik;
            List<SatnicaPoProjektu> model = Repository.GetSatniceProjekataPoDjelatnikuIDatumu(user, DateTime.Now.Date).ToList();
            if (model.Count != 0)
            {
                Session["satnicaId"] = model[0].SatnicaID;
            }
            return View(model);
        }

        [HttpPost]
        [ActionName("SatniceDatum")]
        public ActionResult Satnice(DateTime datum)
        {
            Djelatnik user = Session["user"] as Djelatnik;
            List<SatnicaPoProjektu> model = Repository.GetSatniceProjekataPoDjelatnikuIDatumu(user, datum).ToList();
            return View(model);
        }

        [HttpPost]
        public ActionResult PredajSatnice(List<string> rSati, List<string> pSati, string komentar, List<int> projektID, DateTime datum)
        {
            Djelatnik user = Session["user"] as Djelatnik;
            Satnica satnica = Repository.GetSatnicaPoDjelatnikuIDatumu(user, datum);
            if (satnica != null)
            {
                Repository.PredajSatnicu(satnica);
                if (user.TipDjelatnikaID <= 3)
                {
                    return View("Satnice"); 
                }
                else
                {
                    return View("HonorarniSatnice");
                }
            }
            else
            {
                if (user.TipDjelatnikaID <= 3)
                {
                    return RedirectToAction("SatnicePOSTData", routeValues: new { rSati, pSati, komentar, projektID, datum }); 
                }
                else
                {
                    return RedirectToAction("HonorarniSatnicePOSTData", routeValues: new { rSati, komentar, projektID, datum });
                }
            }
            
        }
        [HttpGet]
        public ActionResult Odustani()
        {
            Djelatnik user = Session["user"] as Djelatnik;
            int satnicaId = (int)Session["satnicaId"];

            Repository.ClearSatnice(satnicaId);
            if (user.TipDjelatnikaID <= 3)
            {
                return RedirectToAction("Satnice"); 
            }
            else
            {
                return RedirectToAction("HonorarniSatnice");
            }
        }

        [HttpGet]
        public ActionResult PotvrdiSatnice(int idSatnica)
        {
            Repository.PotvrdiSatnice(idSatnica);
            return RedirectToAction("PregledSatnica");
        }

        [HttpPost]
        [ActionName("SatnicePOSTData")]
        public ActionResult Satnice(List<string> rSati, List<string> pSati, string komentar, List<int> projektID, DateTime datum)
        {
            CreateSatnice(rSati, pSati, komentar, projektID, datum);

            return View();
        }

        [HttpPost]
        [ActionName("HonorarniSatnicePOSTData")]
        public ActionResult HonorarniSatnice(List<string> rSati, string komentar, List<int> projektID, DateTime datum)
        {
            CreateSatnice(rSati, null, komentar, projektID, datum);

            return RedirectToAction("HonorarniSatnice");
        }

        [HttpGet]
        [ActionName("PregledSatniceDjelatnika")]
        public ActionResult Satnice(int satnicaId, int djelatnikId)
        {
            ViewBag.DjelatnikId = djelatnikId;
            ViewBag.PregledSatnice = Repository.GetSatnica(satnicaId);
            Djelatnik djelatnik = Repository.GetDjelatnik(djelatnikId);
                
            if (djelatnik.TipDjelatnikaID <= 3)
            {
                return View("Satnice");
            }
            else
            {
                return View("HonorarniSatnice");
            }
        }

        public ActionResult PregledSatnica()
        {
            var model = Repository.GetSatnice((Session["user"] as Djelatnik).IDDjelatnik);
            return View(model);
        }

        private void CreateSatnice(List<string> rSati, List<string> pSati, string komentar, List<int> projektID, DateTime datum)
        {
            Djelatnik djelatnik = Session["user"] as Djelatnik;
            int radniSati = 0;
            int prekovremeniSati = 0;
            string p;

            for (int i = 0; i < rSati.Count; i++)
            {
                string s = rSati[i];
                if (pSati != null)
                {
                   p = pSati[i];
                }
                else
                {
                    p = "";
                }
                

                if (!string.IsNullOrEmpty(s))
                {
                    radniSati += HelperUtil.CalculateSeconds(s);
                }

                if (!string.IsNullOrEmpty(p))
                {
                    prekovremeniSati += HelperUtil.CalculateSeconds(p);
                }

            }

            string ukupniRadniSati = HelperUtil.FormatTime(radniSati);
            string ukupniPrekovremeniSati = HelperUtil.FormatTime(prekovremeniSati);
            int satnicaID;

            Satnica satnica = Repository.GetSatnicaPoDjelatnikuIDatumu(djelatnik, datum);
            if (satnica == null)
            {
                satnicaID = Repository.InsertSatnica(datum, ukupniRadniSati, ukupniPrekovremeniSati, komentar, Repository.GetVoditeljTimaPoTimID(djelatnik.TimID).IDDjelatnik, djelatnik.IDDjelatnik);
            }
            else
            {
                Repository.UpdateSatnica(ukupniRadniSati, ukupniPrekovremeniSati, komentar, satnica.IDSatnica);
                satnicaID = satnica.IDSatnica;
            }
            

            for (int i = 0; i < rSati.Count; i++)
            {
                string s = rSati[i];
                if (pSati != null)
                {
                    p = pSati[i];
                }
                else
                {
                    p = "";
                }

                if (satnica == null)
                {
                    Repository.InsertSatnicaPoProjektu(s, p, projektID[i], satnicaID); 
                }
                else{
                    Repository.UpdateSatnicaPoProjektu(s, p, projektID[i], satnicaID);
                }
            }
        }

    }
}