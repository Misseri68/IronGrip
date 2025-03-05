using Microsoft.AspNetCore.Mvc;
using IronGrip.Extensions;
using IronGrip.Models;

namespace IronGrip.Controllers
{
    public class HomeController : Controller
    {
        Usuario user;

        public HomeController() {
            this.user = HttpContext.Session.GetObject<Usuario>("USER");
        }


        public IActionResult Home()
        {
            if(this.user == null)
            {
                return RedirectToAction("Login", "Auth");
            }
            return View(this.user);
        }
    }
}
