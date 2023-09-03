using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using Proyecto_Progra_Sistema_Hospedaje.Data;

namespace Proyecto_Progra_Sistema_Hospedaje
{
    public class Global : HttpApplication
    {

        void Application_Start(object sender, EventArgs e)
        {
            using (HostingEntities db = new HostingEntities())//hacemos le using
            {
                
            }
                // Código que se ejecuta al iniciar la aplicación
                RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}