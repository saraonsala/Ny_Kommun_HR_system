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
            // SQL query to retrieve employment details
            string sqlQuery = @"
                SELECT
                    e.ID,
                    e.Name,
                    e.Salary,
                    e.Holiday_entitlement,
                    ss.SSYcode_nr AS SSYcode,
                    d.Department_name,
                    s.Schema_nr,
                    p.Pension_org_name,
                    ss.Position,
                    t.Union_name
                FROM
                    employees e
                INNER JOIN
                    ssycode ss ON e.SSYcode_ID = ss.ID
                INNER JOIN
                    department d ON e.Department_ID = d.ID
                INNER JOIN
                    schema_employees s ON e.Schema_employees_ID = s.ID
                INNER JOIN
                    pension_agreements p ON e.Pension_agreements_ID = p.ID
                INNER JOIN
                    trade_union_membership t ON e.Trade_union_Membership_ID = t.ID
                ORDER BY
                    d.Department_name ASC;";

            // Use Dapper to execute the SQL query and retrieve the results
            var result = db.Query(sqlQuery);

            
            foreach (var row in result)
            {
                Console.WriteLine($"ID: {row.ID}");
                Console.WriteLine($"Name: {row.Name}");
                Console.WriteLine($"Salary: {row.Salary.ToString("C", new System.Globalization.CultureInfo("sv-SE"))}");
                Console.WriteLine($"Holiday Entitlement: {row.Holiday_entitlement}");
                Console.WriteLine($"SSYcode: {row.SSYcode}");
                Console.WriteLine($"Department: {row.Department_name}");
                Console.WriteLine($"Schema Number: {row.Schema_nr}");
                Console.WriteLine($"Pension Organization: {row.Pension_org_name}");
                Console.WriteLine($"Position: {row.Position}");
                Console.WriteLine($"Union Name: {row.Union_name}");
                Console.WriteLine();
            }
        }
    }
}