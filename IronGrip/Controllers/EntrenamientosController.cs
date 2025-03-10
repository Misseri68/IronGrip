using IronGrip.Extensions;
using IronGrip.Models;
using IronGrip.Repositories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Caching.Memory;

namespace IronGrip.Controllers
{
    public class EntrenamientosController : Controller
    {
        private IMemoryCache memoryCache;
        private EntrenamientoRepository repo;
        private TagRepository tagRepo;

        public EntrenamientosController(IMemoryCache memoryCache, EntrenamientoRepository repo, TagRepository tagRepo) 
        {
            this.repo = repo;
            this.tagRepo = tagRepo; ;
            this.memoryCache = memoryCache;
        }

        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Create()
        {
            VistaEntrenamiento model;
            if(memoryCache.Get("NEWENTRENAMIENTO") == null)
            {
                model = new VistaEntrenamiento();
                model.Id = await this.repo.GetMaxIdAsync();
                model.SelectedTags = new List<int>();
                memoryCache.Set("NEWENTRENAMIENTO", model);
            }
            else
            {
                model = memoryCache.Get<VistaEntrenamiento>("NEWENTRENAMIENTO");
            }

            int idUsuario = HttpContext.Session.GetObject<Usuario>("USER").Id;
            model.TagsDisponibles = await this.tagRepo.GetTagsAsync(idUsuario);
            return View(model);
        }

        [HttpPost]
        public IActionResult UpdateTags(string tagsSeleccionadosIds)
        {
            var vista = memoryCache.Get<VistaEntrenamiento>("NEWENTRENAMIENTO");
            if (vista != null)
            {
                if (vista.SelectedTags != null)
                {
                    vista.SelectedTags = tagsSeleccionadosIds?
                   .Split(',', StringSplitOptions.RemoveEmptyEntries)
                   .Select(int.Parse).ToList();

                    memoryCache.Set("NEWENTRENAMIENTO", vista);
                }
                else
                {
                    vista.SelectedTags = new List<int>();
                    memoryCache.Set("NEWENTRENAMIENTO", vista);
                }
            }
              
            return RedirectToAction("Create");
        }


    }
}
