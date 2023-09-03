using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Proyecto_Progra_Sistema_Hospedaje.Pages
{
    public partial class Resultado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Empleado"] == null && Session["Cliente"] == null)
            {
                Response.Redirect("~/Pages/IniciarSesion.aspx");
            }
            int resul = int.Parse(Request.QueryString["resul"]);

            if (resul == 0)   //Query string de Habitacion
            {
                lblResultado.Text = "Se ha agregado una nueva habitación a la Base de Datos";

            }
            else if (resul == 1)
            {
                lblResultado.Text = "Se ha Editado una Habitación de la Base de Datos";
            }
            else if (resul == 2)
            {
                lblResultado.Text = "Se ha Inactivado una Habitación de la Base de Datos";
            }
            else if (resul == 3)
            {
                lblResultado.Text = "Esta Habitación no se puede modificar, porque se encuentra inactiva";
            }
            //-----------------------------------------------------------------
            else if (resul == 4)//Query string de Reservacion
            {
                lblResultado.Text = "Se ha creado una nueva reservación para la Base de Datos";
            }
            else if (resul == 5)
            {
                lblResultado.Text = "Se ha editado una reservación en la Base de Datos";
            }
            else if (resul == 6)
            {
                lblResultado.Text = "Se ha cancelado una reservación en la Base de Datos";
            }
            //-------------------------------------------------------------------
            

        }

        protected void btnregresar_Click(object sender, EventArgs e)
        {
            int resul = int.Parse(Request.QueryString["resul"]);
            if (resul == 1 || resul == 2 || resul == 0 || resul == 3)
            {
                Response.Redirect("~/Pages/ListaHabitaciones.aspx");
            }

            if (Session["Empleado"] != null && resul == 4 || Session["Empleado"] != null && resul == 5 || Session["Empleado"] != null && resul == 6) //se pregunta si la session empleado no es nula (primer if)
            {
                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
            }
            else if (Session["Cliente"] != null && resul == 4 || Session["Cliente"] != null && resul == 5) //se pregunta si la session empleado no es nula (primer if)
            {
                Response.Redirect("~/Pages/MisReservaciones.aspx");
            }
            else if (Session["Empleado"] != null && resul == 7) //se pregunta si la session empleado no es nula para el numero de habitacion )
            {
                Response.Redirect("~/Pages/ListaHabitaciones.aspx");
            }

        }
    }
}