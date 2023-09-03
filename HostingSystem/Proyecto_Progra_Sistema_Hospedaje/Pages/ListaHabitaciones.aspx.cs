using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto_Progra_Sistema_Hospedaje.Classes;
using Proyecto_Progra_Sistema_Hospedaje.Data;

namespace Proyecto_Progra_Sistema_Hospedaje.Pages
{
    public partial class ListaHabitaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Empleado"] == null  )
            {
                Response.Redirect("~/Pages/Error.aspx?regresar=0");
            }
            else
            {
                try
                    {
                        using (HostingEntities dbs = new HostingEntities())
                        {

                            var misreservaciones = dbs.spListaHabitaciones().ToList();
                            grdlistahab.DataSource = misreservaciones;
                            grdlistahab.DataBind();

                        }
                     }
                    catch 
                    {
                        Response.Redirect("~/Pages/Error.aspx?regresar=2"); 
                    }
              }
            }
        }
}