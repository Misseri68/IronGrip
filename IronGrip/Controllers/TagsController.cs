using IronGrip.Extensions;
using IronGrip.Models;
using Microsoft.AspNetCore.Mvc;

namespace IronGrip.Controllers
{
    public class TagsController : Controller
    {
        Usuario user;
        public TagsController() {
            this.user = HttpContext.Session.GetObject<Usuario>("USER");
        }
        public async Task<IActionResult> Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(string nombre, string color)
        {
            this.repo
            return View();
        }
    }
}
