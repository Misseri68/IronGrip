using IronGrip.Extensions;
using IronGrip.Models;
using IronGrip.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace IronGrip.Controllers
{
    public class AuthController : Controller
    {
        private AuthRepository repo;
        public AuthController(AuthRepository repo)
        {
            this.repo = repo;
        }
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string email, string pwd)
        {
            Usuario user = await this.repo.LoginAsync(email, pwd);
            if (user != null) {
                ViewData["MENSAJE"] = "Bienvenido A IRONGRIP, " + user.Nombre;
            }
            else
            {
                HttpContext.Session.SetObject("USER", user);
            }
                return View();
        }

        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(string email, string name, string pwd)
        {
            await this.repo.RegisterAsync(email, name, pwd);
            return RedirectToAction("Login") ;
        }
    }
}
