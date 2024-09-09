﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FlightJournal.Web.Controllers
{
    [NoCache]
    [Authorize(Roles = "Administrator")]
    public class ImportController : Controller
    {
        //
        // GET: /Import/
        public ActionResult Index()
        {
            
            return View();
        }
	}
}