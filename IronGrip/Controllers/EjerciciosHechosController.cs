using IronGrip.Extensions;
using IronGrip.Models;
using IronGrip.Repositories;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;

namespace IronGrip.Controllers
{
    public class EjerciciosHechosController : Controller
    {
        private IMemoryCache memoryCache;
        private EjercicioRepository repoEjercicio;

        public EjerciciosHechosController(IMemoryCache memoryCache, EjercicioRepository repoEjercicio)
        {
            this.memoryCache = memoryCache;
            this.repoEjercicio = repoEjercicio;
        }


        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Create()
        {
            int idUsuario = HttpContext.Session.GetObject<Usuario>("USER").Id;

            VistaEntrenamiento vista = this.memoryCache.Get<VistaEntrenamiento>("NEWENTRENAMIENTO");
            if(vista.EjerciciosHechosModel == null)
            {
                vista.EjerciciosHechosModel = new List<PartialEjercicioModel>();
                this.memoryCache.Set("NEWENTRENAMIENTO", vista);
            }
            List<Ejercicio> ejercicios = await this.repoEjercicio.GetEjerciciosAsync(idUsuario);
            return View(ejercicios);
        }


        [HttpPost]
        public async Task<IActionResult> Create(int ejercicio)
        {
            VistaEntrenamiento vista = this.memoryCache.Get<VistaEntrenamiento>("NEWENTRENAMIENTO");
            PartialEjercicioModel ejModel = new PartialEjercicioModel();

            Ejercicio ej = await this.repoEjercicio.FindEjercicioAsync(ejercicio);
            ejModel.Ejercicio = ej;
            vista.EjerciciosHechosModel.Add(ejModel);
            return RedirectToAction("CreateSeries", new {idEjercicio = ejercicio});
        }

        public async Task<IActionResult> CreateSeries(int idEjercicio)
        {
            Ejercicio ejercicio = await this.repoEjercicio.FindEjercicioAsync(idEjercicio);
            return View(ejercicio);

        }
    }
}
