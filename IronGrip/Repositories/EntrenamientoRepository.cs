using IronGrip.Data;
using Microsoft.EntityFrameworkCore;

namespace IronGrip.Repositories
{
    public class EntrenamientoRepository
    {

        private IronGripContext context;

        public EntrenamientoRepository(IronGripContext context)
        {
            this.context = context;
        }

        //public async Task<EntrenamientoRepository> GetDatosEntrenamiento(int idEntrenamiento)
        //{
        //    string sql = "SELECT * FROM VistaEntrenamientoDetalle";
        //}

        //}

        public async Task<int> GetMaxIdAsync()
        {
            if(await this.context.Entrenamientos.CountAsync() == 0)
            {
                return 1;
            }
            else
            {
                return await this.context.Entrenamientos.MaxAsync(x => x.Id) + 1 ;
            }
        }

    }
}
