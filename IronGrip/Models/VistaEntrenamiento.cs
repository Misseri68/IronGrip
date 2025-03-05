namespace IronGrip.Models
{
    public class VistaEntrenamiento
    {
        public int Id { get; set; }
        List<Tag> Tags { get; set; }
        List<Ejercicio> Ejercicios { get; set; }
        List<Serie> Series { get; set; }
        List<EjercicioHecho> EjerciciosHechos { get; set; }

    }
}
