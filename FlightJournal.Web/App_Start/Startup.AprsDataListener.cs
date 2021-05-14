﻿using FlightJournal.Web.Aprs;
using FlightJournal.Web.Models;

namespace FlightJournal.Web
{
    public partial class Startup
    {
        private IAprsListener _aprsListener;
        private IAircraftCatalog _catalog;
        private AircraftEventHandler _aircraftEventHandler;

        public void ConfigureAprsDataListener()
        {
            _catalog = new AircraftCatalog();
            _aprsListener = new AprsListener(_catalog);

            _aircraftEventHandler = new AircraftEventHandler(_aprsListener, new FlightContext());

            _aprsListener.Start();
                      
        }
    }
}