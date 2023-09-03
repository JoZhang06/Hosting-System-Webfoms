using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Proyecto_Progra_Sistema_Hospedaje.Classes;
using Proyecto_Progra_Sistema_Hospedaje.Data;


namespace Proyecto_Progra_Sistema_Hospedaje
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Empleado"] != null)
            {
                Logueo objempleado = (Logueo)Session["Empleado"];

                liMisreserv.Visible = true;
                liGestionreserv.Visible = true;
                liGestionha.Visible = true;
                lnkcerrarsesion.Visible = true;
                lblusuario.Text = "Empleado : " + objempleado.NombreUsuario;

            }
            if (Session["Cliente"] != null)
            {
                Logueo objcliente = (Logueo)Session["Cliente"];

                liMisreserv.Visible = true;
                lnkcerrarsesion.Visible = true;
                lblusuario.Text = "Cliente : " + objcliente.NombreUsuario;
            }

        }

        protected void lnkcerrarsesion_Click(object sender, EventArgs e)
        {

            lbmensaje.CssClass = "alert alert-info";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModal();", true);

        }

        protected void btncontinuar_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("~/Pages/IniciarSesion.aspx");
        }

        protected void btnSi_Click(object sender, EventArgs e)
        {
            if (Session["Empleado"] != null)
            {
                int idReservacion = int.Parse(Request.QueryString["id"]);//se trae el dato del id reservacion del frontend
                Logueo objempleado = (Logueo)Session["Empleado"];
                try
                {
                    using (HostingEntities db = new HostingEntities())//hacemos le using
                    {
                        var Consulta = db.spGestionarReservaciones().FirstOrDefault();
                        int idHabitacion = Consulta.idHabitacion;
                        if (Consulta != null) 
                        { 
                            var cancelar = db.spCancelarReservacion(idReservacion, idHabitacion, objempleado.Idusuario, DateTime.Now);
                        }
                    }
                }
                catch { }
                Response.Redirect("~/Pages/Resultado.aspx?resul=6");
            }
          }
        }
    }