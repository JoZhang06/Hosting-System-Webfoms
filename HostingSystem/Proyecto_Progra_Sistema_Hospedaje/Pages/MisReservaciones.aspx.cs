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
    public partial class MisReservaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Cliente"] != null) //se pregunta si la session empleado no es nula (primer if)
                {
                    Logueo objcliente = (Logueo)Session["Cliente"];
                    using (HostingEntities db = new HostingEntities())
                    {

                        var lista = (db.spConsultaMisReservaciones(objcliente.Idusuario)
                                     ).ToList(); //permite convertir lo de este codigo en una lista 


                        grdMisRervaciones.DataSource = lista;
                        grdMisRervaciones.DataBind();
                    }
                }

                else if (Session["Empleado"] != null) //se pregunta si la session empleado no es nula (primer if)
                {

                    Logueo objempleado = (Logueo)Session["Empleado"];
                    using (HostingEntities db = new HostingEntities())

                    {

                        var lista = (db.spConsultaMisReservaciones(objempleado.Idusuario)
                                     ).ToList(); //permite convertir lo de este codigo en una lista 


                        grdMisRervaciones.DataSource = lista;
                        grdMisRervaciones.DataBind();
                    }
                }
                else 
                {
                    Response.Redirect("~/Pages/IniciarSesion.aspx");
                }
            }
            catch { }

        }
        protected void btnnuevo_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Pages/CrearReservacion.aspx");
        }
    }
 } 