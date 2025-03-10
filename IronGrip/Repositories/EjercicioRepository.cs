﻿using IronGrip.Data;
using IronGrip.Models;
using Microsoft.EntityFrameworkCore;

namespace IronGrip.Repositories
{
    public class EjercicioRepository
    {
        private IronGripContext context;
        public EjercicioRepository(IronGripContext context)
        {
            this.context = context;
        }

        public async Task CreateEjercicioAsync(string nombre,
            string descripcion, string foto, bool esTiempo, int IdUsuario)
        {
            int id = await GetMaxIdAsync();
            Ejercicio ej = new Ejercicio();
            ej.Id = id;
            ej.Nombre = nombre;
            ej.Descripcion = descripcion;
            ej.Foto = foto;
            ej.EsTiempo = esTiempo;
            ej.IdUsuario = IdUsuario;

            await this.context.Ejercicios.AddAsync(ej);
            this.context.SaveChanges();
        }

        public async Task<int> GetMaxIdAsync()
        {
            if (await this.context.Ejercicios.CountAsync() == 0)
            {
                return 1;
            }
            else
            {
                return await this.context.Ejercicios.MaxAsync(x => x.Id) + 1;
            }
        }


    }
        
}
