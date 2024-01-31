using System;
using System.Data;
using MySql.Data.MySqlClient;
using Dapper;

class Program
{
    static string connectionString = "server=localhost;user=root;database=your_hr_system_database";

    static void Main(string[] args)
    {
        using (IDbConnection db = new MySqlConnection(connectionString))
        {
            while (true)
            {
                Console.WriteLine("-----------------------");
                Console.WriteLine("\nChoose an action:");
                Console.WriteLine("1. Add employee");
                Console.WriteLine("2. Update employee");
                Console.WriteLine("3. Delete employee");
                Console.WriteLine("4. Show all employees");
                Console.WriteLine("5. Exit");
                Console.WriteLine("-----------------------");

                int choice;
                if (int.TryParse(Console.ReadLine(), out choice))
                {
                    switch (choice)
                    {
                        case 1:
                            AddEmployee();
                            break;
                        case 2:
                            UpdateEmployee();
                            break;
                        case 3:
                            DeleteEmployee();
                            break;
                        case 4:
                            ShowAllEmployees(db);
                            break;
                        case 5:
                            Environment.Exit(0);
                            break;
                        default:
                            Console.WriteLine("Invalid choice. Try again.");
                            break;
                    }
                }
                else
                {
                    Console.WriteLine("Invalid input. Please enter an integer.");
                }
            }
        }
    }

    static void AddEmployee()
    {
        Console.WriteLine("Add a new employee.");

        // Read necessary information from the user
        Console.Write("Name: ");
        string name = Console.ReadLine()+"";
        // Read other attributes as needed

        using (var connection = new MySqlConnection(connectionString))
        {
            connection.Open();

            // Create the SQL command to add an employee
            string sqlQuery = $"INSERT INTO employees (Name, ...) VALUES ('{name}', ...);";

            using (var command = new MySqlCommand(sqlQuery, connection))
            {
                command.ExecuteNonQuery();
                Console.WriteLine("Employee added!");
            }
        }
    }

    static void UpdateEmployee()
    {
        Console.WriteLine("Update an existing employee.");

        // Read necessary information from the user, such as employee ID and the new attributes
        Console.Write("Enter the ID of the employee to be updated: ");
        int employeeId;
        if (int.TryParse(Console.ReadLine(), out employeeId))
        {
            // Read other attributes to be updated

            using (var connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                // Create the SQL command to update an employee
                string sqlQuery = $"UPDATE employees SET ... WHERE ID = {employeeId};";

                using (var command = new MySqlCommand(sqlQuery, connection))
                {
                    command.ExecuteNonQuery();
                    Console.WriteLine("Employee updated!");
                }
            }
        }
        else
        {
            Console.WriteLine("Invalid ID. Try again.");
        }
    }

    static void DeleteEmployee()
    {
        Console.WriteLine("Delete an existing employee.");

        // Read necessary information from the user, such as employee ID
        Console.Write("Enter the ID of the employee to be deleted: ");
        int employeeId;
        if (int.TryParse(Console.ReadLine(), out employeeId))
        {
            using (var connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                // Create the SQL command to delete an employee
                string sqlQuery = $"DELETE FROM employees WHERE ID = {employeeId};";

                using (var command = new MySqlCommand(sqlQuery, connection))
                {
                    command.ExecuteNonQuery();
                    Console.WriteLine("Employee deleted!");
                }
            }
        }
        else
        {
            Console.WriteLine("Invalid ID. Try again.");
        }
    }

    static void ShowAllEmployees(IDbConnection db)
    {
        // SQL query to retrieve all employees' details
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
            Console.WriteLine($"Salary: {row.Salary.ToString("C", new System.Globalization.CultureInfo("en-US"))}");
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
