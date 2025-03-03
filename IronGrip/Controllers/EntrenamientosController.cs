using Microsoft.AspNetCore.Mvc;

namespace IronGrip.Controllers
{
    public class EntrenamientosController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Create()
        {
            return View();
        }
    }
}
