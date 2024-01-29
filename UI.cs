using System;
using System.Data;
using MySql.Data.MySqlClient;
using Dapper;

class UI
{
    static void Main(string[] args)
    {
        

   
        {
            var result = db.Query("SELECT * FROM Employees");
            foreach (var row in result)
            {
                Console.WriteLine(row.Name);

            }
        }
    }
}