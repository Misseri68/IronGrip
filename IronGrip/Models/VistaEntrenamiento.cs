namespace IronGrip.Models
{
    public class VistaEntrenamiento
    {
        public VistaEntrenamiento()
        {
            this.Entrenamiento = new Entrenamiento();
            this.Entrenamiento.Fecha = DateTime.Now;
        }
        public int Id { get; set; }
        public List<Tag> TagsDisponibles { get; set; }
        public List<int> SelectedTags { get; set; }
        public List<Ejercicio> Ejercicios { get; set; }
        public List<Serie> Series { get; set; }
        public List<EjercicioHecho> EjerciciosHechos { get; set; }
        public Entrenamiento Entrenamiento { get; set; }
    }
}
