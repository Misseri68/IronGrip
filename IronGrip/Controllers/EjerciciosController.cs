using Microsoft.AspNetCore.Mvc;

namespace IronGrip.Controllers
{
    public class EjerciciosController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
