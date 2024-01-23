using System;
using System.Data;
using MySql.Data.MySqlClient;
using Dapper;

class Program
{
    static void Main(string[] args)
    {
        string connectionString = "server=localhost;user=root;database=en_kommuns_hr_system";

        using (IDbConnection db = new MySqlConnection(connectionString))
        {
            var result = db.Query("SELECT * FROM Employees");
            foreach (var row in result)
            {
                Console.WriteLine(row.Name);

            }
        }
    }
}