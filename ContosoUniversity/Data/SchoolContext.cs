using ContosoUniversity.Models;
using Microsoft.EntityFrameworkCore;
using System;

namespace ContosoUniversity.Data
{
    public class SchoolContext : DbContext
    {
        public SchoolContext(DbContextOptions<SchoolContext> options) : base(options)
        {
            Console.WriteLine("[SchoolContext.SchoolContext()] : empty contructor");
        }

        public DbSet<Course> Courses { get; set; }
        public DbSet<Enrollment> Enrollments { get; set; }
        public DbSet<Student> Students { get; set; }

        ////////////////////////////////////////////////////////////////////////////////////
        // Override the default behavior by specifying singular table names in the DbContext
        ////////////////////////////////////////////////////////////////////////////////////
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            Console.WriteLine("[SchoolContext.OnModelCreating()] : BEGIN");

            modelBuilder.Entity<Course>().ToTable("Course");
            modelBuilder.Entity<Enrollment>().ToTable("Enrollment");
            modelBuilder.Entity<Student>().ToTable("Student");

            Console.WriteLine("[SchoolContext.OnModelCreating()] : END");
        }
    }
}