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
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Empleado"] == null && Session["Cliente"] == null)
            {
                Response.Redirect("~/Pages/IniciarSesion.aspx");
            }else
            {
                if (Session["Empleado"] != null)
                {
                    //Este codigo es para ver el detalle de la reservacion
                    int idReservacion = int.Parse(Request.QueryString["id"]);//se trae el dato del id reservacion del frontend

                    try
                    {
                        using (HostingEntities db = new HostingEntities())//hacemos le using
                        {
                            var personaRV = db.spConsultarReservacionPorId(idReservacion).FirstOrDefault();//hacemos la consulta
                            DateTime FechaEn = personaRV.fechaEntrada;
                            DateTime FechaSal = personaRV.fechaSalida;
                            string estado = personaRV.estado;

                            if (Session["Cliente"] != null && estado == "A" && FechaEn > DateTime.Today) // aqui hacemos las especificaciones de detalle
                                                                                                         // para mostrar sus respectivos botones                                                                             
                            {
                                btneditar.Visible = true;
                            }
                            else if (Session["Empleado"] != null && estado == "A" && FechaSal > DateTime.Today)
                            {
                                btneditar.Visible = true;
                            }
                            else if (Session["Empleado"] != null || Session["Cliente"] != null && estado == "A" && FechaEn > DateTime.Today)
                            {
                                btncancelar.Visible = true;
                            }

                        }

                        using (var db = new HostingEntities())
                        {                                                    //hacemos el llamado al entities y creamos la variable
                            var personaRV = db.spConsultarReservacionPorId(idReservacion).FirstOrDefault();//consultamos por el query string de id Reservacion
                            if (personaRV != null)
                            {

                                txtnreservacion.Text = personaRV.idReservacion.ToString();//jalamos los datos a los respectivos textbox para que se muestren
                                txtcliente.Text = personaRV.nombreCompleto;
                                txthotel.Text = personaRV.nombre;
                                txtfechaen.Text = personaRV.fechaEntrada.ToString("dd/MM/yyyy");
                                txtfechasal.Text = personaRV.fechaSalida.ToString("dd/MM/yyyy");
                                txtnumha.Text = personaRV.numeroHabitacion;
                                txtdiareserva.Text = (personaRV.fechaSalida.AddDays(01) - personaRV.fechaEntrada).ToString("dd") + " - " + "días";
                                txtnumninos.Text = personaRV.numeroNinhos.ToString();
                                txtnumadultos.Text = personaRV.numeroAdultos.ToString();
                                txtcostototal.Text = "$" + personaRV.costoTotal;//Total días reservación * [ (número de adultos * costo por cada adulto) + (número niños * costo por cada niño) ]

                            }
                        }
                        PaneGrid.Visible = true;
                        GrdDetalle.Visible = true;
                        using (HostingEntities bd = new HostingEntities())//Apartado de la bitacora "Lista de acciones realizaas"
                        {
                            var bitacora = bd.spConsultarBitacora(idReservacion).ToList();
                            GrdDetalle.DataSource = bitacora;
                            GrdDetalle.DataBind();
                        }
                    }
                    catch { }
                }
                else 
                {
                    if (Session["Cliente"] != null)
                    {
                        try
                        {
                            int idReservacion = int.Parse(Request.QueryString["id"]);//se trae el dato del id reservacion del frontend


                        }
                        catch { }
                    }
                }
            }
        }
        protected void btneditar_Click(object sender, EventArgs e)
        {
            int idReservacion = int.Parse(Request.QueryString["id"]);
            Response.Redirect("~/Pages/ModificarReservacion.aspx?id=" + idReservacion);

        }

        protected void btncancelar_Click(object sender, EventArgs e)
        {
            //lbmensaje.CssClass = "alert alert-info";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openModalC();", true);
        }

        protected void btnregresar_Click(object sender, EventArgs e)
        {
            Logueo objempleado = (Logueo)Session["Empleado"];
            if (Session["Empleado"] != null) //se pregunta si la session empleado no es nula (primer if)
            {
                Response.Redirect("~/Pages/GestionarReservaciones.aspx");
            }
            else if (Session["Cliente"] != null) //se pregunta si la session empleado no es nula (primer if)
            {
                Response.Redirect("~/Pages/MisReservaciones.aspx");
            }
        }
    }
}