using IronGrip.Data;

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

    }
}
