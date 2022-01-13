using Microsoft.AspNetCore.Mvc;
using MySqlConnector;

using var connection = new MySqlConnection();

await connection.OpenAsync();

using var command = new MySqlCommand("SELECT field FROM table;", connection);
using var reader = await command.ExecuteReaderAsync();
while (await reader.ReadAsync())
{
    var value = reader.GetValue(0);
    // do something with 'value'
}
namespace Goldfish.Models
{
    public class SqlConnect : Controller
    {
        
        // GET
        public IActionResult Index()
        {
            {
                
            }
            return value;
        }
    }
}