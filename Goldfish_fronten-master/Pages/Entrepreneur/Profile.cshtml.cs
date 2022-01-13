using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace Goldfish.Pages.Entrepreneur
{
    
    public class ProfileModel : PageModel
    {
        [BindProperty(SupportsGet = true)]
        public object Profile { get; set; }
        
        public void OnGet( object profile)
        {
            Profile = profile;
        }
    }
}