﻿using System.Configuration;
using System.Security.Claims;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using Microsoft.Owin.Security.Cookies;
using FlightJournal.Web.Models;
using Microsoft.Owin.Security.Google;
using Owin;
using System;
using FlightJournal.Web.Configuration;
using Microsoft.Azure.Services.AppAuthentication;

namespace FlightJournal.Web {
    public partial class Startup {
        // For more information on configuring authentication, please visit http://go.microsoft.com/fwlink/?LinkId=301864
        public void ConfigureAuth(IAppBuilder app) {

            // will look for SQL connection strings that contain Authentication=Active Directory Interactive. When found, they will use the AzureServiceTokenProvider to fetch an access token to authenticate with Azure SQL Database.
            // https://www.pluralsight.com/guides/how-to-use-managed-identity-with-azure-sql-database
            System.Data.SqlClient.SqlAuthenticationProvider.SetProvider(System.Data.SqlClient.SqlAuthenticationMethod.ActiveDirectoryInteractive, new SqlAppAuthenticationProvider());

            // Configure the db context, user manager and role manager to use a single instance per request
            app.CreatePerOwinContext(ApplicationDbContext.Create);
            app.CreatePerOwinContext<ApplicationUserManager>(ApplicationUserManager.Create);
            app.CreatePerOwinContext<ApplicationRoleManager>(ApplicationRoleManager.Create);

            // Enable the application to use a cookie to store information for the signed in user
            // and to use a cookie to temporarily store information about a user logging in with a third party login provider
            // Configure the sign in cookie
            app.UseCookieAuthentication(new CookieAuthenticationOptions {
                AuthenticationType = DefaultAuthenticationTypes.ApplicationCookie,
                LoginPath = new PathString("/Account/Login"),
                Provider = new CookieAuthenticationProvider {
                    // Enables the application to validate the security stamp when the user logs in.
                    // This is a security feature which is used when you change a password or add an external login to your account.  
                    OnValidateIdentity = SecurityStampValidator.OnValidateIdentity<ApplicationUserManager, ApplicationUser>(
                        validateInterval: TimeSpan.FromMinutes(30),
                        regenerateIdentity: (manager, user) => user.GenerateUserIdentityAsync(manager))
                }
            });
            app.UseExternalSignInCookie(DefaultAuthenticationTypes.ExternalCookie);

            // Enables the application to temporarily store user information when they are verifying the second factor in the two-factor authentication process.
            app.UseTwoFactorSignInCookie(DefaultAuthenticationTypes.TwoFactorCookie, TimeSpan.FromMinutes(5));

            // Enables the application to remember the second login verification factor such as phone or email.
            // Once you check this option, your second step of verification during the login process will be remembered on the device where you logged in from.
            // This is similar to the RememberMe option when you log in.
            app.UseTwoFactorRememberBrowserCookie(DefaultAuthenticationTypes.TwoFactorRememberBrowserCookie);

            if (!string.IsNullOrWhiteSpace(Settings.FacebookAppId) 
                && !string.IsNullOrWhiteSpace(Settings.FacebookAppSecret)) 
            {
                app.UseFacebookAuthentication(
                   appId: Settings.FacebookAppId,
                   appSecret: Settings.FacebookAppSecret);
            }
            
            // Uncomment the following lines to enable logging in with third party login providers
            //app.UseMicrosoftAccountAuthentication(
            //    clientId: "",
            //    clientSecret: "");

            //app.UseTwitterAuthentication(
            //   consumerKey: "dKwmoLMH1zkqnvMblCMcQ",
            //   consumerSecret: "G71eTw0Cm1s0ygVQygPQrw7ckSCR4WfbBWxGWqfiO4");

            if (!string.IsNullOrWhiteSpace(Settings.GoogleClientId) 
                && !string.IsNullOrWhiteSpace(Settings.GoogleClientSecret))
            {
                //var googleOAuth2AuthenticationOptions = new GoogleOAuth2AuthenticationOptions
                //{
                //    ClientId = settings.GoogleClientId,
                //    ClientSecret = settings.GoogleClientSecret,
                //    CallbackPath = new PathString("/Account/ExternalLoginCallback"),
                //    Provider = new GoogleOAuth2AuthenticationProvider()
                //    {
                //        OnAuthenticated = async context =>
                //        {
                //            context.Identity.AddClaim(new Claim("picture", context.User.GetValue("picture").ToString()));
                //            context.Identity.AddClaim(new Claim("profile", context.User.GetValue("profile").ToString()));
                //        }
                //    }
                //};

                //googleOAuth2AuthenticationOptions.Scope.Add("email");
                //app.UseGoogleAuthentication(googleOAuth2AuthenticationOptions);
                app.UseGoogleAuthentication(
                    clientId: Settings.GoogleClientId,
                    clientSecret: Settings.GoogleClientSecret);
            }
            // var externalIdentity = HttpContext.GetOwinContext().Authentication.GetExternalIdentityAsync(DefaultAuthenticationTypes.ExternalCookie);
            // var pictureClaim = externalIdentity.Result.Claims.FirstOrDefault(c => c.Type.Equals("picture"));
            // var pictureUrl = pictureClaim.Value;
        }
    }
}