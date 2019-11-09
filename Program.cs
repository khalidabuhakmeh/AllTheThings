using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using Dapper;
using Microsoft.EntityFrameworkCore;
using NPoco;

namespace AllTheThings
{
    class Program
    {
        public static string connectionString = "server=localhost,11433;database=allthethings;user=sa;password=Pass123!";
        
        async static Task Main(string[] args)
        {
            var sql = "select * from people where id = @id;" +
                      "select * from foods where peopleId = @id;";
            
            await using var connection = new SqlConnection(connectionString);
            await connection.OpenAsync();
            
            UsingSqlDataAdapter(connection, sql);
            
            await UsingSqlCommand(connection, sql);
            
            await UsingDapper(connection, sql);
            
            UsingNpoco(connection, sql);

            await UsingEntityFrameworkCore(sql);
        }

        private static async Task UsingEntityFrameworkCore(string sql)
        {
            Console.WriteLine("*** Using Entity Framework ***");
            
            var database = new MyDbContext();
            var connection = database.Database.GetDbConnection();
            await connection.OpenAsync();

            var command = connection.CreateCommand();
            command.CommandText = sql;
            command.CommandType = CommandType.Text;
            // namespace weirdness
            command.Parameters.Add(new Microsoft.Data.SqlClient.SqlParameter("@id", 1));

            var reader = await command.ExecuteReaderAsync();
            var people = new List<Person>();
            var food = new List<Food>();
            
            while (await reader.ReadAsync())
            {
                people.Add(new Person
                {
                    Id = reader.GetInt32("Id"),
                    Email = reader.GetString("Email"),
                    FirstName = reader.GetString("FirstName"),
                    LastName = reader.GetString("LastName"),
                });                    
            }

            await reader.NextResultAsync();
            
            while (await reader.ReadAsync())
            {
                food.Add(new Food
                {
                    Id = reader.GetInt32("Id"),
                    Name = reader.GetString("Name"),
                    PeopleId = reader.GetInt32("PeopleId")
                });    
            }
            
            database.AttachRange(people);
            database.AttachRange(food);

            await reader.CloseAsync();
            
            Console.WriteLine($"People: {people.Count}\nFood: {food.Count}");
        }


        private static void UsingNpoco(SqlConnection connection, string sql)
        {
            var database = new Database(connection);

            var (people, food) =
                database.FetchMultiple<Person, Food>(sql,new {id = 1});
            
            Console.WriteLine($"People: {people.Count}\nFood: {food.Count}");
        }

        private static async Task UsingDapper(SqlConnection connection, string sql)
        {
            Console.WriteLine("*** Dapper ***");
            
            var results = await connection.QueryMultipleAsync(sql,new { id = 1 });
            var people = results.Read<Person>().ToList();
            var food = results.Read<Food>().ToList();
            
            Console.WriteLine($"People: {people.Count}\nFood: {food.Count}");
        }

        public static async Task UsingSqlCommand(SqlConnection connection, string sql)
        {
            Console.WriteLine("*** SqlCommand ***");
                
            var command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", 1);

            var reader = await command.ExecuteReaderAsync();
            var people = new List<Person>();
            var food = new List<Food>();
            
            while (await reader.ReadAsync())
            {
                people.Add(new Person
                {
                    Id = reader.GetInt32("Id"),
                    Email = reader.GetString("Email"),
                    FirstName = reader.GetString("FirstName"),
                    LastName = reader.GetString("LastName"),
                });                    
            }

            await reader.NextResultAsync();
            
            while (await reader.ReadAsync())
            {
                food.Add(new Food
                {
                    Id = reader.GetInt32("Id"),
                    Name = reader.GetString("Name"),
                    PeopleId = reader.GetInt32("PeopleId")
                });    
            }

            await reader.CloseAsync();
            
            Console.WriteLine($"People: {people.Count}\nFood: {food.Count}");
        }

        public static void UsingSqlDataAdapter(SqlConnection connection, string sql)
        {
            Console.WriteLine("*** SqlDataAdapter ***");
            
            var dataset = new DataSet();
            var adapter = new SqlDataAdapter();
                
            var command = new SqlCommand(sql, connection);
            command.Parameters.AddWithValue("@id", 1);
            adapter.SelectCommand = command;

            adapter.Fill(dataset);

            var people = dataset.Tables[0].ToList<Person>();
            var food = dataset.Tables[1].ToList<Food>();
            
            Console.WriteLine($"People: {people.Count}\nFood: {food.Count}");
        }
    }

    public class Person
    {
        public int Id { get; set; }
        public string FirstName { get; set; }
        public string LastName {get;set;}
        public string Email { get; set; }
    }

    public class Food
    {
        public int Id { get; set; }
        public int PeopleId { get; set; }
        public string Name { get; set; }
    }
    
    public static class DataTableExtensions
    {
        public static List<T> ToList<T>(this DataTable dt)
        {
            const BindingFlags flags = BindingFlags.Public | BindingFlags.Instance;
            var columnNames = dt.Columns.Cast<DataColumn>()
                .Select(c => c.ColumnName)
                .ToList();
            var objectProperties = typeof(T).GetProperties(flags);
            var targetList = dt.AsEnumerable().Select(dataRow =>
            {
                var instanceOfT = Activator.CreateInstance<T>();

                foreach (var properties in objectProperties.Where(properties => columnNames.Contains(properties.Name) && dataRow[properties.Name] != DBNull.Value))
                {
                    properties.SetValue(instanceOfT, dataRow[properties.Name], null);
                }
                return instanceOfT;
            }).ToList();

            return targetList;
        }
    }

    public class MyDbContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(Program.connectionString);
        }
        
        public DbSet<Person> People { get; set; }
        public DbSet<Food> Foods { get; set; }
    }
}

