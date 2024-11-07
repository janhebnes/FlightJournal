﻿using System.Globalization;
using FlightJournal.Web.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using System;
using System.Linq;
using System.Security;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using FlightJournal.Web.Configuration;
using FlightJournal.Web.Extensions;
using FlightJournal.Web.Validators;
using SignInStatus = FlightJournal.Web.Models.SignInStatus;

namespace FlightJournal.Web.Controllers
{
    [NoCache]
    [Authorize]
    public class AccountController : Controller
    {
        public AccountController()
        {
        }

        public AccountController(ApplicationUserManager userManager)
        {
            UserManager = userManager;
        }

        private ApplicationUserManager _userManager;
        public ApplicationUserManager UserManager
        {
            get
            {
                return _userManager ?? HttpContext.GetOwinContext().GetUserManager<ApplicationUserManager>();
            }
            private set
            {
                _userManager = value;
            }
        }

        //
        // GET: /Account/Login
        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            ViewBag.LiveDemoMemberships = Demo.GetLiveDemoMemberships();
            ViewBag.EnableDemo = Demo.IsDemoEnvironment();
            ViewBag.EnableMobil = UserManager.TwoFactorProviders.ContainsKey("PhoneCode");

            var initialModel = new LoginViewModel()
            {
                LoginState = ViewBag.EnableDemo ? LoginViewModel.State.Demo : LoginViewModel.State.Login
            };

            var lastEmailLogin = Request.Cookies["LastEmailLogin"];
            if (lastEmailLogin != null && EmailValidator.IsValid(lastEmailLogin.Value))
            {
                initialModel.Email = lastEmailLogin.Value;
            }

            return View(initialModel);
        }

        [AllowAnonymous]
        public ActionResult TokenLogin(string returnUrl)
        {
            return RedirectToAction("Login", new {returnUrl = returnUrl});
        }

        private SignInHelper _helper;

        private SignInHelper SignInHelper
        {
            get
            {
                if (_helper == null)
                {
                    _helper = new SignInHelper(UserManager, AuthenticationManager);
                }
                return _helper;
            }
        }

        //
        // POST: /Account/Login
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Login(LoginViewModel model, string returnUrl)
        {
            if (!EmailValidator.IsValid(model.Email))
            {
                ModelState.AddModelError("Email", "Email kunne ikke valideres som værende korrekt email format.");
            }
            else
            {
                model.Email = EmailValidator.ParseEmail(model.Email);
            }

            if (!ModelState.IsValid)
            {
                ViewBag.ReturnUrl = returnUrl;
                ViewBag.LiveDemoMemberships = Demo.GetLiveDemoMemberships();
                ViewBag.EnableDemo = Demo.IsDemoEnvironment();
                ViewBag.EnableMobil = UserManager.TwoFactorProviders.ContainsKey("PhoneCode");
                model.LoginState = LoginViewModel.State.Login;
                return View(model);
            }

            // This doen't count login failures towards lockout only two factor authentication
            // To enable password failures to trigger lockout, change to shouldLockout: true
            var result = await SignInHelper.PasswordSignIn(model.Email, model.Password, model.RememberMe, shouldLockout: false);
            switch (result)
            {
                case SignInStatus.Success:

                    var cookie = new HttpCookie("LastEmailLogin", model.Email);
                    cookie.Expires = DateTime.Now.AddMonths(1);
                    Response.AppendCookie(cookie);

                    return RedirectToLocal(returnUrl);
                case SignInStatus.UnConfirmed:
                    return RedirectToAction("EmailNotConfirmed", new { email = model.Email });
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresTwoFactorAuthentication:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl });
                case SignInStatus.Failure:
                default:
                    ViewBag.ReturnUrl = returnUrl;
                    ViewBag.LiveDemoMemberships = Demo.GetLiveDemoMemberships();
                    ViewBag.EnableDemo = Demo.IsDemoEnvironment();
                    ViewBag.EnableMobil = UserManager.TwoFactorProviders.ContainsKey("PhoneCode");
                    model.LoginState = LoginViewModel.State.Login;
                    ModelState.AddModelError("", "Invalid login attempt.");
                    return View(model);
            }
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> TokenLogin(LoginViewModel model, string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            ViewBag.LiveDemoMemberships = Demo.GetLiveDemoMemberships();
            ViewBag.EnableDemo = Demo.IsDemoEnvironment();
            ViewBag.EnableMobil = UserManager.TwoFactorProviders.ContainsKey("PhoneCode");
            model.LoginState = LoginViewModel.State.TokenLogin;

            if (!model.MobilNumberValidated)
            {
                if (!MobilNumberValidator.IsValid(model.MobilNumber, true))
                {
                    ModelState.AddModelError("MobilNumber", "Der blev ikke fundet en pilot med dette nummer.");
                    return View("Login", model);
                }
                else
                {
                    model.MobilNumberValidated = true;
                    model.MobilNumber = MobilNumberValidator.ParseMobilNumber(model.MobilNumber);

                    var result = await SignInHelper.MobilSignIn(model.MobilNumber, model.RememberBrowser);
                    switch (result)
                    {
                        case SignInStatus.LockedOut:
                            return View("Lockout");
                        case SignInStatus.UnConfirmed:
                        case SignInStatus.Success:
                        case SignInStatus.RequiresTwoFactorAuthentication:
                            model.MobilNumberValidated = true;

                            // Does not function because we are working prior to cookies being written.
                            //var userId = await SignInHelper.GetVerifiedUserIdAsync();
                            var user = await UserManager.FindByNameAsync(model.MobilNumber);
                            var userId = user.Id;
                            if (userId == null)
                            {
                                model.MobilNumberValidated = false;
                                ModelState.AddModelError("MobilNumber", "Unable to find verified user");
                                return View("Login", model);
                            }
                            var userFactors = await UserManager.GetValidTwoFactorProvidersAsync(userId);
                            if (userFactors.All(p => p != "PhoneCode"))
                            {
                                model.MobilNumberValidated = false;
                                ModelState.AddModelError("MobilNumber", "SMS Provider not available");
                                return View("Login", model);
                            }

                            if (!await SignInHelper.SendTwoFactorCode("PhoneCode", userId))
                            {
                                model.MobilNumberValidated = false;
                                ModelState.AddModelError("MobilNumber", "Unable to send verification code");
                                return View("Login", model);
                            }

                            if (HttpContext.IsDebuggingEnabled)
                            {
                                // To exercise the flow without actually sending codes, uncomment the following line
                                ModelState.AddModelError("VerifyCode", "For DEMO purposes the current verification code is: " + await UserManager.GenerateTwoFactorTokenAsync(userId, "PhoneCode"));
                            }

                            return View("Login", model);
                        case SignInStatus.Failure:
                        default:
                            model.MobilNumberValidated = false;
                            ModelState.AddModelError("MobilNumber", "Unable to sign-in");
                            return View("Login", model);
                    }
                }
            }

            // Ready to handle Verification Code 
            if (!string.IsNullOrWhiteSpace(model.VerifyCode))
            {
                var result = await SignInHelper.TwoFactorSignIn("PhoneCode", model.VerifyCode, model.RememberBrowser, false);
                switch (result)
                {
                    case SignInStatus.Success:
                        return RedirectToLocal(returnUrl);
                    case SignInStatus.UnConfirmed:
                        return RedirectToAction("EmailNotConfirmed"); // State should not be possible to reach on mobil login accounts
                    case SignInStatus.LockedOut:
                        return View("Lockout");
                    case SignInStatus.Failure:
                    default:
                        ModelState.AddModelError("VerifyCode", "Invalid code");
                        return View("Login", model);
                }
            }    

            return View("Login", model);
        }

        //
        // GET: /Account/VerifyCode
        [AllowAnonymous]
        public async Task<ActionResult> VerifyCode(string provider, string returnUrl)
        {
            // Require that the user has already logged in via username/password or external login
            if (!await SignInHelper.HasBeenVerified())
            {
                return View("Error");
            }
            var user = await UserManager.FindByIdAsync(await SignInHelper.GetVerifiedUserIdAsync());
            if (user != null && HttpContext.IsDebuggingEnabled)
            {
                // To exercise the flow without actually sending codes, uncomment the following line
                ViewBag.Status = "For DEMO purposes the current " + provider + " code is: " + await UserManager.GenerateTwoFactorTokenAsync(user.Id, provider);
            }
            return View(new VerifyCodeViewModel { Provider = provider, ReturnUrl = returnUrl });
        }

        //
        // POST: /Account/VerifyCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> VerifyCode(VerifyCodeViewModel model)
        {
            if (!ModelState.IsValid)
            {
                return View(model);
            }

            var result = await SignInHelper.TwoFactorSignIn(model.Provider, model.Code, isPersistent: false, rememberBrowser: model.RememberBrowser);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(model.ReturnUrl);
                case SignInStatus.UnConfirmed:
                    return RedirectToAction("EmailNotConfirmed");
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.Failure:
                default:
                    ModelState.AddModelError("", "Invalid code.");
                    return View(model);
            }
        }

        //
        // GET: /Account/Register
        [AllowAnonymous]
        public ActionResult Register()
        {
            return View();
        }

        //
        // POST: /Account/Register
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Register(RegisterViewModel model)
        {
            if (!EmailValidator.IsValid(model.Email))
            {
                ModelState.AddModelError("Email", "Email kunne ikke valideres som værende korrekt email format.");
            }
            else
            {
                model.Email = EmailValidator.ParseEmail(model.Email);
            }

            if (ModelState.IsValid)
            {
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user, model.Password);
                if (result.Succeeded)
                {
                    var callbackUrl = await GenerateEmailConfirmationEmail(user);
                    ViewBag.Link = callbackUrl;
                    return View("DisplayEmail");
                }
                AddErrors(result);
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        private async Task<string> GenerateEmailConfirmationEmail(ApplicationUser user)
        {
            var code = await UserManager.GenerateEmailConfirmationTokenAsync(user.Id);
            var callbackUrl = Url.Action("ConfirmEmail", "Account", new {userId = user.Id, code = code}, protocol: Request.Url.Scheme);
            await UserManager.SendEmailAsync(user.Id, "Startlist.club - Confirm your account", "Please confirm your account at " + callbackUrl);
            return callbackUrl;
        }

        [AllowAnonymous]
        public ActionResult EmailNotConfirmed(string email)
        {
            @ViewBag.Email = email;
            return View("DisplayEmail");
        }

        [AllowAnonymous]
        public async Task<ActionResult> ReGenerateEmailConfirmationEmail(string email)
        {
            var user = await UserManager.FindByNameAsync(email);
            if (user == null)
                throw new Exception("The user was not found");

            if (await UserManager.IsEmailConfirmedAsync(user.Id))
                return View("ConfirmEmail");
            
            var callbackUrl = GenerateEmailConfirmationEmail(user);
            ViewBag.Link = await callbackUrl;

            return View("DisplayEmail");
        }

        //
        // GET: /Account/ConfirmEmail
        [AllowAnonymous]
        public async Task<ActionResult> ConfirmEmail(string userId, string code)
        {
            if (userId == null || code == null)
            {
                return View("Error");
            }
            var result = await UserManager.ConfirmEmailAsync(userId, code);
            if (result.Succeeded)
            {
                return View("ConfirmEmail");
            }
            AddErrors(result);
            return View();
        }

        //
        // GET: /Account/ForgotPassword
        [AllowAnonymous]
        public ActionResult ForgotPassword()
        {
            return View();
        }

        //
        // POST: /Account/ForgotPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ForgotPassword(ForgotPasswordViewModel model)
        {
            if (!EmailValidator.IsValid(model.Email))
            {
                ModelState.AddModelError("Email", "Email kunne ikke valideres som værende korrekt email format.");
            }
            else
            {
                model.Email = EmailValidator.ParseEmail(model.Email);
            }

            if (ModelState.IsValid)
            {
                var user = await UserManager.FindByNameAsync(model.Email);
                if (user == null)
                {
                    // Don't reveal that the user does not exist or is not confirmed
                    //return View("ForgotPasswordConfirmation");

                    if (!EmailValidator.IsValid(model.Email))
                        return View("ForgotPasswordMissingAccount");

                    var pilots = EmailValidator.FindPilotsByEmail(model.Email);
                    if (!pilots.Any())
                        return View("ForgotPasswordMissingAccount");

                    // HACK: We only attach to the first pilot profil in this setup.
                    var pilot = pilots.First();

                    var email = EmailValidator.ParseEmail(model.Email);
                    // Create mobilPhone Application User, Email is required and + is removed 
                    user = new ApplicationUser()
                    {
                        UserName = email,
                        Email = email,
                        EmailConfirmed = true,
                        BoundToPilotId = pilot.PilotId.ToString(),
                        PhoneNumberConfirmed = false,
                        PhoneNumber = string.Empty,
                        TwoFactorEnabled = false
                    };
                    var result = UserManager.Create(user);
                    if (!result.Succeeded)
                    {
                        throw new SecurityException(string.Format("Failed to generate user {0} for {1}", email, result.Errors.FirstOrDefault()));
                    }
                    result = UserManager.SetLockoutEnabled(user.Id, false);

                    var welcomecode = await UserManager.GeneratePasswordResetTokenAsync(user.Id);
                    var callbackWelcomeUrl = Url.Action("ResetPassword", "Account", new { userId = user.Id, code = welcomecode }, protocol: Request.Url.Scheme);
                    await UserManager.SendEmailAsync(user.Id, "Startlist.club - Set Password", "Please set your password at " + callbackWelcomeUrl);
                    ViewBag.Link = callbackWelcomeUrl;
                    ViewBag.Pilot = pilot.Name;
                    ViewBag.Email = email;
                    return View("ForgotPasswordGeneratedAccount");
                }

                if (!(await UserManager.IsEmailConfirmedAsync(user.Id)))
                {
                    ViewBag.Email = user.Email;
                    return View("DisplayEmail");
                }

                var code = await UserManager.GeneratePasswordResetTokenAsync(user.Id);
                var callbackUrl = Url.Action("ResetPassword", "Account", new { userId = user.Id, code = code }, protocol: Request.Url.Scheme);
                await UserManager.SendEmailAsync(user.Id, "Startlist.club - Reset Password", "Please reset your password at " + callbackUrl);
                ViewBag.Link = callbackUrl;
                return View("ForgotPasswordConfirmation");
            }

            // If we got this far, something failed, redisplay form
            return View(model);
        }

        //
        // GET: /Account/ForgotPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ForgotPasswordConfirmation()
        {
            return View();
        }

        //
        // GET: /Account/ResetPassword
        [AllowAnonymous]
        public ActionResult ResetPassword(string code)
        {
            return code == null ? View("Error") : View();
        }

        //
        // POST: /Account/ResetPassword
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ResetPassword(ResetPasswordViewModel model)
        {
            if (!EmailValidator.IsValid(model.Email))
            {
                ModelState.AddModelError("Email", "Email kunne ikke valideres som værende korrekt email format.");
            }
            else
            {
                model.Email = EmailValidator.ParseEmail(model.Email);
            }

            if (!ModelState.IsValid)
            {
                return View(model);
            }
            var user = await UserManager.FindByNameAsync(model.Email);
            if (user == null)
            {
                // Don't reveal that the user does not exist
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            var result = await UserManager.ResetPasswordAsync(user.Id, model.Code, model.Password);
            if (result.Succeeded)
            {
                return RedirectToAction("ResetPasswordConfirmation", "Account");
            }
            AddErrors(result);
            return View();
        }

        //
        // GET: /Account/ResetPasswordConfirmation
        [AllowAnonymous]
        public ActionResult ResetPasswordConfirmation()
        {
            return View();
        }

        //
        // POST: /Account/ExternalLogin
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult ExternalLogin(string provider, string returnUrl)
        {
            // Request a redirect to the external login provider
            return new ChallengeResult(provider, Url.Action("ExternalLoginCallback", "Account", new { ReturnUrl = returnUrl }));
        }

        //
        // GET: /Account/SendCode
        [AllowAnonymous]
        public async Task<ActionResult> SendCode(string returnUrl)
        {
            var userId = await SignInHelper.GetVerifiedUserIdAsync();
            if (userId == null)
            {
                return View("Error");
            }
            var userFactors = await UserManager.GetValidTwoFactorProvidersAsync(userId);
            var factorOptions = userFactors.Select(purpose => new SelectListItem { Text = purpose, Value = purpose }).ToList();
            return View(new SendCodeViewModel { Providers = factorOptions, ReturnUrl = returnUrl });
        }

        //
        // POST: /Account/SendCode
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> SendCode(SendCodeViewModel model)
        {
            // Generate the token and send it
            if (!ModelState.IsValid)
            {
                return View();
            }

            if (!await SignInHelper.SendTwoFactorCode(model.SelectedProvider))
            {
                return View("Error");
            }
            return RedirectToAction("VerifyCode", new { Provider = model.SelectedProvider, ReturnUrl = model.ReturnUrl });
        }

        //
        // GET: /Account/ExternalLoginCallback
        [AllowAnonymous]
        public async Task<ActionResult> ExternalLoginCallback(string returnUrl)
        {
            var loginInfo = await AuthenticationManager.GetExternalLoginInfoAsync();
            if (loginInfo == null)
            {
                return RedirectToAction("Login");
            }

            // Sign in the user with this external login provider if the user already has a login
            var result = await SignInHelper.ExternalSignIn(loginInfo, isPersistent: false);
            switch (result)
            {
                case SignInStatus.Success:
                    return RedirectToLocal(returnUrl);
                case SignInStatus.UnConfirmed:
                    return RedirectToAction("EmailNotConfirmed", new { email = loginInfo.Email });
                case SignInStatus.LockedOut:
                    return View("Lockout");
                case SignInStatus.RequiresTwoFactorAuthentication:
                    return RedirectToAction("SendCode", new { ReturnUrl = returnUrl });
                case SignInStatus.Failure:
                default:
                    // If the user does not have an account, then prompt the user to create an account
                    ViewBag.ReturnUrl = returnUrl;
                    ViewBag.LoginProvider = loginInfo.Login.LoginProvider;
                    return View("ExternalLoginConfirmation", new ExternalLoginConfirmationViewModel { Email = loginInfo.Email });
            }
        }

        //
        // POST: /Account/ExternalLoginConfirmation
        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> ExternalLoginConfirmation(ExternalLoginConfirmationViewModel model, string returnUrl)
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Manage");
            }

            if (ModelState.IsValid)
            {
                // Get the information about the user from the external login provider
                var info = await AuthenticationManager.GetExternalLoginInfoAsync();
                if (info == null)
                {
                    return View("ExternalLoginFailure");
                }
                if (!EmailValidator.IsValid(model.Email))
                {
                    ViewBag.Message = string.Format("Unable to validate email '{0}' as email.", model.Email);
                    return View("ExternalLoginFailure");
                }
                else
                {
                    model.Email = EmailValidator.ParseEmail(model.Email);
                }
                var user = new ApplicationUser { UserName = model.Email, Email = model.Email };
                var result = await UserManager.CreateAsync(user);
                if (result.Succeeded)
                {
                    result = await UserManager.AddLoginAsync(user.Id, info.Login);
                    if (result.Succeeded)
                    {
                        // We dont log the user in until there email has been validated.
                        //await SignInHelper.SignInAsync(user, isPersistent: false, rememberBrowser: false);
                        
                        // Generete token email
                        var callbackUrl = GenerateEmailConfirmationEmail(user);
                        ViewBag.Link = callbackUrl;

                        return RedirectToAction("DisplayEmail");
                        //return RedirectToLocal(returnUrl);
                    }
                }
                AddErrors(result);
            }

            ViewBag.ReturnUrl = returnUrl;
            return View(model);
        }

        //
        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            AuthenticationManager.SignOut();
            return RedirectToAction("Index", "About");
        }

        //
        // GET: /Account/ExternalLoginFailure
        [AllowAnonymous]
        public ActionResult ExternalLoginFailure()
        {
            return View();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing && _userManager != null)
            {
                _userManager.Dispose();
                _userManager = null;
            }
            base.Dispose(disposing);
        }

        #region Helpers
        // Used for XSRF protection when adding external logins
        private const string XsrfKey = "XsrfId";

        private IAuthenticationManager AuthenticationManager
        {
            get
            {
                return HttpContext.GetOwinContext().Authentication;
            }
        }

        private void AddErrors(IdentityResult result)
        {
            foreach (var error in result.Errors)
            {
                ModelState.AddModelError("", error);
            }
        }

        private ActionResult RedirectToLocal(string returnUrl)
        {
            if (Url.IsLocalUrl(returnUrl))
            {
                return Redirect(returnUrl);
            }
            return RedirectToAction("Index", "About");
        }

        internal class ChallengeResult : HttpUnauthorizedResult
        {
            public ChallengeResult(string provider, string redirectUri)
                : this(provider, redirectUri, null)
            {
            }

            public ChallengeResult(string provider, string redirectUri, string userId)
            {
                LoginProvider = provider;
                RedirectUri = redirectUri;
                UserId = userId;
            }

            public string LoginProvider { get; set; }
            public string RedirectUri { get; set; }
            public string UserId { get; set; }

            public override void ExecuteResult(ControllerContext context)
            {
                var properties = new AuthenticationProperties { RedirectUri = RedirectUri };
                if (UserId != null)
                {
                    properties.Dictionary[XsrfKey] = UserId;
                }
                context.HttpContext.GetOwinContext().Authentication.Challenge(properties, LoginProvider);
            }
        }
        #endregion
    }
}