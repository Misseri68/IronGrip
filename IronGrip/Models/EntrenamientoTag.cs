using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace IronGrip.Models
{
    [Table("entrenamiento_tag")]
    public class EntrenamientoTag
    {
        [Key, Column("id_entrenamiento", Order = 0)]
        public int IdEntrenamiento { get; set; }


        [Key, Column("id_tag", Order = 1)]
        public int IdTag { get; set; }

    }
}
