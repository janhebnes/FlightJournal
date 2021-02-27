﻿using System.Data.Entity;
using System.Linq;
using System.Web.Mvc;
using FlightJournal.Web.Models;
using FlightJournal.Web.Models.Training.Predefined;

namespace FlightJournal.Web.Controllers
{
    [Authorize(Roles = "Administrator,Manager")]
    public class CommentaryAdminController : Controller
    {
        private FlightContext db = new FlightContext();
        public ActionResult Index()
        {
            var model = db.Commentaries;
            ViewBag.CanDelete = model.ToDictionary(x => x.CommentaryId, x => !IsCommentaryInUse(x.CommentaryId));
            return View(model);
        }


        public ActionResult Create()
        {
            var commentary= new Commentary();
            return View(commentary);
        }
        [HttpPost]
        public ActionResult Create(Commentary commentary)
        {
            if (ModelState.IsValid)
            {
                db.Commentaries.Add(commentary);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(commentary);
        }

        public ActionResult Edit(int id)
        {
            var commentary = db.Commentaries.Find(id);
            ViewBag.IsInUse = IsCommentaryInUse(id);
            return View(commentary);
        }

        [HttpPost]
        public ActionResult Edit(Commentary commentary)
        {
            if (ModelState.IsValid)
            {
                db.Entry(commentary).State = EntityState.Modified;
                db.SaveChanges();

                return RedirectToAction("Index");
            }
            return View(commentary);
        }


        public ActionResult Delete(int id)
        {
            var commentary = db.Commentaries.Find(id);
            return View(commentary);
        }


        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            var commentary = db.Commentaries.Find(id);
            db.Commentaries.Remove(commentary);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }


        private bool IsCommentaryInUse(int commentaryId)
        {
            var inUse = db.TrainingFlightAnnotations.SelectMany(x => x.TrainingFlightAnnotationCommentCommentTypes)
                .Any(y => y.CommentaryId == commentaryId);

            return inUse;
        }
    }
}