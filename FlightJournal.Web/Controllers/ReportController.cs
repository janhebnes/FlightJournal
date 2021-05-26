﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net.Mime;
using System.Web.Mvc;
using FlightJournal.Web.Extensions;
using FlightJournal.Web.Models;

namespace FlightJournal.Web.Controllers
{
    public class ReportController : Controller
    {
        private FlightContext db = new FlightContext();

        /// <summary>
        /// If Route with club is used the club id is available directly from the method, it is only shown here for example as the CurrentClub method handles returning the current club in all contexts
        /// </summary>
        /// <param name="date"></param>
        /// <param name="club"></param>
        /// <returns></returns>
        public ActionResult Index(DateTime? date, string club = null)
        {
            // URL information can be reviewed using RouteData.Values["date"]
            var raw = RouteData.Values["date"];
            int year = 0;

            // YEAR Statistics
            if (!date.HasValue && raw != null)
            {
                if (int.TryParse(raw.ToString(), out year))
                {
                    if ((DateTime.Now.Year >= year) && (year > 1990))
                    {
                        var rptYear = new ReportViewModel();
                        rptYear.Date = new DateTime(year, 1, 1);
                        rptYear.FormattedDate = rptYear.Date.ToString("yyyy");

                        // Custom inline Club filtering for allowing maximum performance
                        // A copy of the logic in Flight.IsCurrent(Flight arg) 
                        rptYear.Flights = this.db.Flights.Where(f => f.Date.Year == rptYear.Date.Year && f.Deleted == null)
                            .Include("Plane").Include("StartedFrom").Include("LandedOn").Include("Pilot").Include("PilotBackseat").Include("Betaler")
                            .Where(f => ClubController.CurrentClub.ShortName == null
                                || f.StartedFromId == ClubController.CurrentClub.LocationId
                                || f.LandedOnId == ClubController.CurrentClub.LocationId
                                || (f.Pilot != null && f.Pilot.ClubId == ClubController.CurrentClub.ClubId)
                                || (f.PilotBackseat != null && f.PilotBackseat.ClubId == ClubController.CurrentClub.ClubId)
                                || (f.Betaler != null && f.Betaler.ClubId == ClubController.CurrentClub.ClubId))
                            .OrderBy(o => o.Departure)
                            .AsQueryable();

                        rptYear.DistinctLocations = rptYear.Flights.Select(d => d.StartedFrom).Distinct().OrderBy(d => d.Name);

                        return this.View("year", rptYear);
                    }
                }
            }

            // MONTH Statistics
            if (raw != null && raw.ToString().Length < 9 && raw.ToString().StartsWith("20"))
            {
                var rptMonth = new ReportViewModel();
                if (date.HasValue)
                {
                    rptMonth.Date = date.Value;
                    rptMonth.FormattedDate = rptMonth.Date.ToString("MMMM yyyy");
                }
                else
                {
                    throw new ArgumentException(string.Format("Invalid date input in url: {0}", raw));
                }

                // Custom inline Club filtering for allowing maximum performance
                // A copy of the logic in Flight.IsCurrent(Flight arg) 
                rptMonth.Flights = this.db.Flights.Where(f => f.Date.Month == rptMonth.Date.Month && f.Date.Year == rptMonth.Date.Year && f.Deleted == null)
                    .Include("Plane").Include("StartedFrom").Include("LandedOn").Include("Pilot").Include("PilotBackseat").Include("Betaler")
                    .Where(f => ClubController.CurrentClub.ShortName == null
                        || f.StartedFromId == ClubController.CurrentClub.LocationId
                        || f.LandedOnId == ClubController.CurrentClub.LocationId
                        || (f.Pilot != null && f.Pilot.ClubId == ClubController.CurrentClub.ClubId)
                        || (f.PilotBackseat != null && f.PilotBackseat.ClubId == ClubController.CurrentClub.ClubId)
                        || (f.Betaler != null && f.Betaler.ClubId == ClubController.CurrentClub.ClubId))
                    .OrderBy(o => o.Departure)
                    .AsQueryable();

                rptMonth.DistinctLocations = rptMonth.Flights.Select(d => d.StartedFrom).Distinct().OrderBy(d => d.Name);

                return this.View("month", rptMonth);
            }
            
            var rpt = new ReportViewModel();
            rpt.AvailableDates = this.AvailableDates();
            if (rpt.AvailableDates != null 
                && rpt.AvailableDates.Count > 0 
                && !date.HasValue)
            {
                rpt.Date = rpt.AvailableDates.Max(d => d.Key);
            }
            else if (date.HasValue)
            {
                rpt.Date = date.Value;
            }
            else
            {
                rpt.Date = DateTime.Today;
            }

            rpt.FormattedDate = rpt.Date.ToShortDateString();

            // Custom inline Club filtering for allowing maximum performance
            // A copy of the logic in Flight.IsCurrent(Flight arg) 
            rpt.Flights = this.db.Flights.Where(f => f.Date == rpt.Date)
                .Include("Plane").Include("StartedFrom").Include("LandedOn").Include("Pilot").Include("PilotBackseat").Include("Betaler")
                .Where(f => ClubController.CurrentClub.ShortName == null
                    || f.StartedFromId == ClubController.CurrentClub.LocationId
                    || f.LandedOnId == ClubController.CurrentClub.LocationId
                    || (f.Pilot != null && f.Pilot.ClubId == ClubController.CurrentClub.ClubId)
                    || (f.PilotBackseat != null && f.PilotBackseat.ClubId == ClubController.CurrentClub.ClubId)
                    || (f.Betaler != null && f.Betaler.ClubId == ClubController.CurrentClub.ClubId))
                .OrderBy(o => o.Departure)
                .AsQueryable();
            // Allow f.Deleted != null
            rpt.DistinctLocations = rpt.Flights.Select(d => d.StartedFrom).Distinct().OrderBy(d=>d.Name);

            return this.View(rpt);
        }

        public FileContentResult Export(int year, int? month)
        {
            if (month.HasValue)
            {
                var flights = this.db.Flights.Where(f => f.Date.Month == month.Value && f.Date.Year == year && f.Deleted == null).OrderBy(o => o.Departure).ToList().Where(f => f.IsCurrentClubPilots());
                var csv = Enumerable.Aggregate(flights, this.SafeCSVParser(Flight.CsvHeaders), (current, flight) => current + this.SafeCSVParser(flight.ToCsvString()));
                return File(new System.Text.UTF8Encoding().GetBytes(csv), "text/csv", "Startlist-" + year + "-" + month + ".csv");
            }
            else
            {
                var flights = this.db.Flights.Where(f => f.Date.Year == year && f.Deleted == null).OrderBy(o => o.Departure).ToList().Where(f => f.IsCurrentClubPilots());
                var csv = Enumerable.Aggregate(flights, this.SafeCSVParser(Flight.CsvHeaders), (current, flight) => current + this.SafeCSVParser(flight.ToCsvString()));
                return File(new System.Text.UTF8Encoding().GetBytes(csv), "text/csv", "Startlist-" + year + ".csv");
            }
        }

        private string SafeCSVParser(string input)
        {
            // HACK: Fix for Encoding Issue with Danish letters and not wanting to use a component for creating the csv.
            var csv = input.Replace("æ", "ae");
            csv = csv.Replace("Æ", "AE");
            csv = csv.Replace("ø", "oe");
            csv = csv.Replace("Ø", "OE");
            csv = csv.Replace("å", "aa");
            csv = csv.Replace("Å", "AA");
            csv = csv.Replace("é", "e");
            return csv;
        }

        internal DateTime GetCentralEuropeStandardTimeNow()
        {
            DateTime timeUtc = DateTime.UtcNow;
            try
            {
                TimeZoneInfo cstZone = TimeZoneInfo.FindSystemTimeZoneById("Central European Standard Time");
                DateTime cestTime = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, cstZone);
                return cestTime;

            }
            catch (TimeZoneNotFoundException tzex)
            {
                throw new Exception("The registry does not define the Central European Standard Time zone.", tzex);
            }
            catch (InvalidTimeZoneException ivex)
            {
                throw new Exception("Registry data on the Central European Standard Time zone has been corrupted.", ivex);
            }
        }

        public Dictionary<DateTime, int> AvailableDates()
        {
            // Cleared by the Flight Controller Create action if a creation is done on another day than the last creation
            if (HttpContext.Application["AvailableDates" + ClubController.CurrentClub.ShortName] != null)
            {
                var cache = HttpContext.Application["AvailableDates" + ClubController.CurrentClub.ShortName] as Dictionary<DateTime, int>;

                var todaysDate = GetCentralEuropeStandardTimeNow().Date;

                // we always check todays flights
                var todaysFlights = this.db.Flights.Where(f => f.Deleted == null && f.Date == todaysDate)
                .Include("Pilot").Include("PilotBackseat").Include("Betaler")
                .Where(f => ClubController.CurrentClub.ShortName == null
                    || f.StartedFromId == ClubController.CurrentClub.LocationId
                    || f.LandedOnId == ClubController.CurrentClub.LocationId
                    || (f.Pilot != null && f.Pilot.ClubId == ClubController.CurrentClub.ClubId)
                    || (f.PilotBackseat != null && f.PilotBackseat.ClubId == ClubController.CurrentClub.ClubId)
                    || (f.Betaler != null && f.Betaler.ClubId == ClubController.CurrentClub.ClubId));

                if (todaysFlights.Any())
                {
                    cache.Remove(todaysDate);
                    cache.Add(todaysDate, todaysFlights.Count());
                }

                return HttpContext.Application["AvailableDates" + ClubController.CurrentClub.ShortName] as Dictionary<DateTime, int>;
            }

            // Original implementation
            //var availableDates = this.db.Flights.GroupBy(p => p.Date).Select(g => new { Date = g.Key, Flights = this.db.Flights.Where(d => d.Date == g.Key) });
            //return availableDates.Select(d => new { d.Date, Hours = d.Flights.Count() }).ToDictionary(x => x.Date, x => x.Hours);

            // Tweaked implementation that did not perform good enough
            ////var availableDates = this.db.Flights.ToList().Where(f => f.IsCurrent()).GroupBy(p => p.Date).Select(
            ////    g => new { Date = g.Key, Flights = this.db.Flights.Where(d => d.Date == g.Key) });

            // Custom inline Club filtering for allowing maximum performance (SQL Profiler is your friend LINQpad4 did not work with this entity version)
            // A copy of the logic in Flight.IsCurrent(Flight arg) 
            var availableDates = this.db.Flights.Where(f=>f.Deleted == null)
                .Include("Pilot").Include("PilotBackseat").Include("Betaler")
                .Where(f => ClubController.CurrentClub.ShortName == null 
                    || f.StartedFromId == ClubController.CurrentClub.LocationId
                    || f.LandedOnId == ClubController.CurrentClub.LocationId 
                    || (f.Pilot != null && f.Pilot.ClubId == ClubController.CurrentClub.ClubId) 
                    || (f.PilotBackseat != null && f.PilotBackseat.ClubId == ClubController.CurrentClub.ClubId) 
                    || (f.Betaler != null && f.Betaler.ClubId == ClubController.CurrentClub.ClubId))
                    .GroupBy(p => p.Date);

            if (availableDates.Any())
            {
                HttpContext.Application["AvailableDates" + ClubController.CurrentClub.ShortName] = availableDates.Select(g => new { Date = g.Key, FlightCount = g.Count() }).ToDictionary(x => x.Date, x => x.FlightCount);
                return HttpContext.Application["AvailableDates" + ClubController.CurrentClub.ShortName] as Dictionary<DateTime, int>;
            }

            return null;
        }
    }
}
