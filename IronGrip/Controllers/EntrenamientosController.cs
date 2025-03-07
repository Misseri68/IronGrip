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
            if(memoryCache.Get("NEWENTRENAMIENTO") == null)
            {
                VistaEntrenamiento vistaEntrenamiento = new VistaEntrenamiento();
                vistaEntrenamiento.Id = await this.repo.GetMaxIdAsync();
                memoryCache.Set("NEWENTRENAMIENTO", vistaEntrenamiento);
            }
            int idUsuario = HttpContext.Session.GetObject<Usuario>("USER").Id;
            List<Tag> tags = await this.tagRepo.GetTagsAsync(idUsuario);
            return View(tags);
        }
    }
}
