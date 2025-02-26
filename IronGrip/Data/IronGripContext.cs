﻿using IronGrip.Models;
using Microsoft.EntityFrameworkCore;

namespace IronGrip.Data
{
    public class IronGripContext : DbContext
    {
        public IronGripContext(DbContextOptions<IronGripContext> options) : base(options) { }

        public DbSet<Usuario> Usuarios { get; set; }
    }
}
