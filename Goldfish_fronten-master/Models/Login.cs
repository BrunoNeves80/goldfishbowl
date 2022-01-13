using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Linq;
using System.Reflection.Metadata;
using System.Runtime.InteropServices;
using System.Threading.Tasks;
using MySqlConnector;

namespace Goldfish.Models
{
    public class Login
    {
        public string Name { get; set; }
        public string Pass { get; set; }
        
        //private AppDb Db { get; }
        
    }
    
}