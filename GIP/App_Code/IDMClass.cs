using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GIP
{
    public class IDMClass
    {
      
     
            public string access_token { get; set; }
            public string refresh_token { get; set; }
            public string scope { get; set; }
            public string id_token { get; set; }
            public string token_type { get; set; }
            public int expires_in { get; set; }
      

    }
}