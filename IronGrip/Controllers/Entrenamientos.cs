using Microsoft.AspNetCore.Mvc;

namespace IronGrip.Controllers
{
    public class Entrenamientos : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
