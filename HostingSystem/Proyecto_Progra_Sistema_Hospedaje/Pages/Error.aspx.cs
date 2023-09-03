using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Progra_Sistema_Hospedaje.Pages
{
    public partial class Error1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Empleado"] == null && Session["Cliente"] == null)
            {
                Response.Redirect("~/Pages/IniciarSesion.aspx");
            }

        }

        protected void Btnregresar_Click(object sender, EventArgs e)
        {
            int regresar = int.Parse(Request.QueryString["regresar"]);

            if (Session["Ciente"] != null && regresar == 0)   //Query string de Habitacion
            {
                Response.Redirect("~/Pages/MisReservaciones.aspx");
                Lblresultado.Text = "Al parecer algo ha salido mal :(";

            }
            else if (Session["Empleado"] != null && regresar == 0)   //Query string de reserv
            {
                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
            }
            else if (regresar == 1)   //Query string de Habitacion
            {
                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
            }
            else if (regresar == 2)   //Query string de Habitacion
            {
                Response.Redirect("~/Pages/ListaHabitaciones.aspx");
            }
            else if (regresar == 3)   //Query string de Habitacion
            {
                Response.Redirect("~/Pages/ListaHabitaciones.aspx");
            }
        }
    }
}