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
    public partial class EdicionHabitacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Empleado"] == null )
            {
                Response.Redirect("~/Pages/Error.aspx?regresar=0");
            }
            else
            {
                if (Page.IsPostBack == false)
             { //si no esta posteado

                int idHabitacion = int.Parse(Request.QueryString["id"]);//

                using (var hab = new HostingEntities())
                {
                    var habit = hab.ConsultarHabitacionPorID(idHabitacion).FirstOrDefault();
                    string estado = habit.estado;
                    if (estado == "A")
                    {
                        if (habit != null)
                        {

                            txthotel.Text = habit.nombre;
                            txtnumhabitacion.Text = habit.numeroHabitacion;
                            txtcapacidadmax.Text = habit.capacidadMaxima.ToString();
                            txtdescripcion.Text = habit.descripcion;
                        }
                    }

                    else
                    {
                        Response.Redirect("~/Pages/Resultado.aspx?resul=3");
                    }
                }
            }
        }
        }
        protected void btnregresar_Click(object sender, EventArgs e)
        {
            if (Session["Empleado"] != null) //se pregunta si la session empleado no es nula (primer if)
            {
                Response.Redirect("~/Pages/ListaHabitaciones.aspx");
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
                int idHabitacion = int.Parse(Request.QueryString["id"]);
                string numHab = txtnumhabitacion.Text;
                int capmax = int.Parse(txtcapacidadmax.Text);
                string descripcion = txtdescripcion.Text;


                using (HostingEntities db = new HostingEntities())
                {
                    
                    var h = db.spConsultaCreacionHabitaciones().FirstOrDefault();
                    //                
                    //aqui insertamos al procedimiento los datos 
                    if (numHab == h.numeroHabitacion )//preguntamos si la habitacion ya existe
                    {
                        lblmensaje.Visible = true;
                    }
                    else
                    {
                        db.spEditarHabitacion(idHabitacion, numHab, capmax, descripcion);
                        Response.Redirect("~/Pages/Resultado.aspx?resul=1");
                    }


            }

        }

        protected void btninactivar_Click(object sender, EventArgs e)
        {

            try
            {
                int idHabitacion = int.Parse(Request.QueryString["id"]);


                using (HostingEntities db = new HostingEntities())
                {
                    db.spHabitacionInactiva(idHabitacion);
                }
            }
            catch { Response.Redirect("~/Pages/Error.aspx?regresar=2"); }
            Response.Redirect("~/Pages/Resultado.aspx?resul=2");
        }
    }
}