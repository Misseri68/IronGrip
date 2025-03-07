namespace IronGrip.Models
{
    public class VistaEntrenamiento
    {
        public int Id { get; set; }
        public List<Tag> Tags { get; set; }
        public List<Ejercicio> Ejercicios { get; set; }
        public List<Serie> Series { get; set; }
        public List<EjercicioHecho> EjerciciosHechos { get; set; }

    }
}
