﻿using System;
using System.Linq;
using Boerman.AprsClient;
using Boerman.AprsClient.Enums;
using Boerman.AprsClient.Models;
using Boerman.Core.Spatial;
using FlightJournal.Web.Logging;
using Skyhop.FlightAnalysis;
using Skyhop.FlightAnalysis.Models;

namespace FlightJournal.Web.Aprs
{
    public interface IAprsListener : IDisposable
    {
        EventHandler<AircraftEvent> OnAircraftTakeoff { get; set; }
        EventHandler<AircraftEvent> OnAircraftLanding { get; set; }

        void Start();
    }

    public class AircraftEvent
    {
        public Aircraft Aircraft { get; }
        public DateTime? Time { get; }

        public AircraftEvent(Aircraft a, DateTime? t)
        {
            Aircraft = a;
            Time = t?.ToLocalTime();
        }
    }
    public class AprsListener : IAprsListener
    {
        private readonly IAircraftCatalog _catalog;
        private static Listener _aprsClient;
        private static readonly FlightContextFactory FlightContextFactory = new();

        public EventHandler<AircraftEvent> OnAircraftTakeoff { get; set; }
        public EventHandler<AircraftEvent> OnAircraftLanding { get; set; }


        public AprsListener(IAircraftCatalog catalog)
        {
            _catalog = catalog;


            FlightContextFactory.OnTakeoff += OnTakeoff;
            FlightContextFactory.OnLanding += OnLanding;
            FlightContextFactory.OnRadarContact += OnRadarContact;
            FlightContextFactory.OnContextDispose += OnContactLost;

            _aprsClient = new Listener(new Config
            {
                Callsign = "0",
                Password = "-1",
                Uri = "aprs.glidernet.org",
                UseOgnAdditives = true,
                Port = 14580, //10152: Full feed, 14580: Filtered
                Filter = "r/55.84/10.63/220" //DK center 220km radius - multiple filters seem not to work ?
            });

            _aprsClient.DataReceived += OnAprsDataReceived;
            _aprsClient.PacketReceived += OnAprsPacketReceived;
        }

        private void OnAprsPacketReceived(object sender, PacketReceivedEventArgs e)
        {
            switch (e.AprsMessage.DataType)
            {
                case DataType.Status:
                    //                        Console.WriteLine(e.AprsMessage);
                    break;
                case DataType.PositionWithTimestampNoAprsMessaging:
                case DataType.PositionWithTimestampWithAprsMessaging:
                    //                        Console.WriteLine(e.AprsMessage);
                    try
                    {
                        var positionUpdate = new Skyhop.FlightAnalysis.Models.PositionUpdate(
                            e.AprsMessage.Callsign,
                            e.AprsMessage.ReceivedDate,
                            e.AprsMessage.Latitude.ToDegreesFixed(),
                            e.AprsMessage.Longitude.ToDegreesFixed(),
                            e.AprsMessage.Altitude.FeetAboveSeaLevel,
                            e.AprsMessage.Speed.Knots,
                            e.AprsMessage.Direction.ToDegrees());

                        FlightContextFactory.Enqueue(positionUpdate);
                    }
                    catch (NullReferenceException ex)
                    {
                        //                    Console.WriteLine(nullReferenceException.Message);
                        //throw;
                    }
                    break;
                default:
                    break;
            }

        }

        private void OnAprsDataReceived(object sender, AprsDataReceivedEventArgs e)
        {
            //Console.WriteLine($"{DateTime.UtcNow}: {e.Data} - DataReceived");
        }

        private void OnRadarContact(object sender, OnRadarContactEventArgs e)
        {
            var lastPositionUpdate = e.Flight.PositionUpdates.OrderByDescending(q => q.TimeStamp).First();
            var aircraft = _catalog.AircraftInfo((e.Flight.Aircraft));
            Log.Debug($"{nameof(AprsListener)}: {lastPositionUpdate.TimeStamp}: {e.Flight.Aircraft} {aircraft.Info()} - Radar contact at ({lastPositionUpdate.Latitude:N4}, {lastPositionUpdate.Longitude:N4}) @ {lastPositionUpdate.Altitude:N0}ft");
        }
        private void OnContactLost(object sender, OnContextDisposedEventArgs e)
        {
            var aircraft = _catalog.AircraftInfo((e.Context.Flight.Aircraft));
            Log.Debug($"{nameof(AprsListener)}: {e.Context.Flight.Aircraft} {aircraft.Info()} - contact lost");
        }

        private void OnTakeoff(object sender, OnTakeoffEventArgs e)
        {
            var aircraft = _catalog.AircraftInfo((e.Flight.Aircraft));

            var ae = new AircraftEvent(aircraft, e.Flight.StartTime);
            Log.Debug($"{nameof(AprsListener)}: {e.Flight.Aircraft} {ae.Aircraft.Info()} - Took off from ({e.Flight.DepartureLocation.Y:N4},{e.Flight.DepartureLocation.X:N4}) at {ae.Time}");
            OnAircraftTakeoff?.Invoke(this, ae);
        }

        private void OnLanding(object sender, OnLandingEventArgs e)
        {
            var aircraft = _catalog.AircraftInfo((e.Flight.Aircraft));

            var ae = new AircraftEvent(aircraft, e.Flight.EndTime);
            Log.Debug($"{nameof(AprsListener)}: {e.Flight.Aircraft} {ae.Aircraft.Info()} - Landed at ({e.Flight.ArrivalLocation.Y:N4}, {e.Flight.ArrivalLocation.X:N4}) at {ae.Time}");
            OnAircraftLanding?.Invoke(this, ae);
        }

        public void Start()
        {
            _aprsClient.Open();
        }

        public void Dispose()
        {
            _aprsClient.Dispose();
        }
    }


    public static class LocationExtensions
    {
        public static double ToDegreesFixed(this LatitudeLongitudeBase latlong)
        {
            var h = latlong.Vector;
            if (h.Minutes > 60)
            {
                var m = h.Minutes / 100;

                return (double)h.Degrees + (double)m / 60.0;

            }
            else
                return h.ToDegrees();
        }
    }

}