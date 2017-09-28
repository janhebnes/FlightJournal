﻿using System;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using FlightJournal.Web.Migrations;
using FlightJournal.Web.Migrations.ApplicationDbContext;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using System.Data.Entity;
using System.Data.SqlTypes;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.Owin;
using FlightJournal.Web.Translations;

namespace FlightJournal.Web.Models
{
    // You can add profile data for the user by adding more properties to your ApplicationUser class, please visit http://go.microsoft.com/fwlink/?LinkID=317594 to learn more.
    public class ApplicationUser : IdentityUser
    {
        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<ApplicationUser> manager)
        {
            // Note the authenticationType must match the one defined in CookieAuthenticationOptions.AuthenticationType
            var userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // Add custom user claims here
            return userIdentity;
        }
        [LocalizedDisplayName("Bound to PilotId")]
        public string BoundToPilotId { get; set; }
        [LocalizedDisplayName("Last logon")]
        public DateTime? LastLogonTimeStamp { get; set; }

        [NotMapped]
        [LocalizedDisplayName("Pilot")]
        public Pilot Pilot
        {
            get
            {
                if (BoundToPilotId == null) return null;
                using (var context = new FlightContext())
                {
                    var userPilotBinding = context.Pilots.Find(Convert.ToInt32(this.BoundToPilotId));
                    if (userPilotBinding == null) return null;

                    bool isPilotExpired = userPilotBinding.ExitDate.HasValue && userPilotBinding.ExitDate.Value < DateTime.Now;
                    if (isPilotExpired) return null;
                     
                    // Load club reference information 
                    context.Entry(userPilotBinding).Reference(p => p.Club).Load();
                    return userPilotBinding;
                }
            }
        }
    }

    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext()
            : base("FlightJournal.Membership", throwIfV1Schema: false)
        {
        }

        static ApplicationDbContext()
        {
            Database.SetInitializer<ApplicationDbContext>(new MigrateDatabaseToLatestVersion<ApplicationDbContext, Migrations.ApplicationDbContext.Configuration>());
        }

        public static ApplicationDbContext Create()
        {
            return new ApplicationDbContext();
        }
    }
}