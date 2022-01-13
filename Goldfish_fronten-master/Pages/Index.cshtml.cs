using System;
using System.IO;
using System.Net;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Goldfish.Models;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.VisualBasic;
using Microsoft.VisualStudio.Web.CodeGeneration.Contracts.Messaging;

namespace Goldfish.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;

        public IndexModel(ILogger<IndexModel> logger)
        {
            _logger = logger;
        }
        
        [BindProperty(SupportsGet = true)] 
        public string Msg { get; set; }
        
        [BindProperty]
        public Login Log { get; set; }
        
        public void OnGet()
        {
        }

        public IActionResult OnPost()
        {
            var httpWebRequest = (HttpWebRequest) WebRequest.Create("http://localhost:3001/login");
            httpWebRequest.ContentType = "application/json";
            httpWebRequest.Method = "POST";

            using (var streamWriter = new StreamWriter(httpWebRequest.GetRequestStream()))
            {
                string json = "{\"username\":\"" + Log.Name + "\"," +
                              "\"password\":\"" + Log.Pass + "\"}";

                streamWriter.Write(json);
            }
            
            var httpResponse = (HttpWebResponse) httpWebRequest.GetResponse();
            using (var streamReader = new StreamReader(httpResponse.GetResponseStream()))
            {
                var result = streamReader.ReadToEnd();

                try
                {
                    Console.Write(result);
                    if (result.Contains("Nome de Utilizador ou Password errado!"))
                    {
                        Msg = "Nome de Utilizador ou Password errado!";
                        return Page();
                        
                    }
                    else
                    {
                        if (result.Contains("\"type\":2"))
                        {
                            return RedirectToPage("/Entrepreneur/Profile",new {result});
                        }
                        else
                        {
                            if (result.Contains("\"type\":3"))
                            {
                                return RedirectToPage("/Investor/InvestorProfile", new {result});
                            }
                            else
                            {
                                Msg = "Something is Wong";
                                return Page();
                            }
                            
                        }
                    }
                    
                    
                }
                catch (Exception e)
                {
                    Console.WriteLine("error");
                    throw;
                }    
            }
        }
    }
}