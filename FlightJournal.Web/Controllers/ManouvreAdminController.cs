﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FlightJournal.Web.Models;
using FlightJournal.Web.Models.Training.Catalogue;
using FlightJournal.Web.Models.Training.Predefined;

namespace FlightJournal.Web.Controllers
{
    [Authorize(Roles = "Administrator,Manager")]
    public class ManouvreAdminController : Controller
    {
        private FlightContext db = new FlightContext();
        public ActionResult Index()
        {
            var model = db.Manouvres;
            return View(model);
        }


        public ViewResult Details(int id)
        {
            var manouvre = db.Manouvres.Find(id);
            return View(manouvre);
        }

        public ActionResult Create()
        {
            var manouvre= new Manouvre();
            return View(manouvre);
        }
        [HttpPost]
        public ActionResult Create(Manouvre manouvre)
        {
            if (ModelState.IsValid)
            {
                db.Manouvres.Add(manouvre);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(manouvre);
        }

        public ActionResult Edit(int id)
        {
            var manouvre = db.Manouvres.Find(id);
            return View(manouvre);
        }

        [HttpPost]
        public ActionResult Edit(Manouvre manouvre)
        {
            if (ModelState.IsValid)
            {
                db.Entry(manouvre).State = EntityState.Modified;
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(manouvre);
        }


        public ActionResult Delete(int id)
        {
            var manouvre = db.Manouvres.Find(id);
            return View(manouvre);
        }


        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            var manouvre = db.Manouvres.Find(id);
            db.Manouvres.Remove(manouvre);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }



    }
}