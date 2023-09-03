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
    public partial class ModificarReservacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Empleado"] == null && Session["Cliente"] == null)
                {
                    Response.Redirect("~/Pages/IniciarSesion.aspx");
                }

                try
                {
                    int idReservacion = int.Parse(Request.QueryString["id"]);

                    using (var db = new HostingEntities())
                    {
                        var personaRV = db.spConsultarReservacionPorId(idReservacion).FirstOrDefault();
                        if (personaRV != null)
                        {
                            txthotel.Text = personaRV.nombre;
                            txtnumhabitacion.Text = personaRV.numeroHabitacion;
                            txtcliente.Text = personaRV.nombreCompleto;
                            txtfechaentrada.Text = personaRV.fechaEntrada.ToString("dd/MM/yyyy");
                            txtfechasal.Text = personaRV.fechaSalida.ToString("dd/MM/yyyy");
                            txtnumadultos.Text = personaRV.numeroAdultos.ToString();
                            txtnuminos.Text = personaRV.numeroNinhos.ToString();

                        }
                    }



                }
                catch
                {
                    Response.Redirect("~/Pages/Error.aspx?");
                }
            }

        }
        protected void btnregresar_Click(object sender, EventArgs e)
        {
            if (Session["Empleado"] != null) //se pregunta si la session empleado no es nula (primer if)
            {
                int idReservacion = int.Parse(Request.QueryString["id"]);
                Response.Redirect("~/Pages/Detalle.aspx?id=" + idReservacion);
            }
            else if (Session["Cliente"] != null) //se pregunta si la session empleado no es nula (primer if)
            {
                Response.Redirect("~/Pages/MisReservaciones.aspx");
            }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    int idReservacion = int.Parse(Request.QueryString["id"]);
                    DateTime fehaen = DateTime.Parse(txtfechaentrada.Text);
                    DateTime fehasal = DateTime.Parse(txtfechasal.Text);
                    int numninos = int.Parse(txtnuminos.Text);
                    int numadultos = int.Parse(txtnumadultos.Text);
                    DateTime fehamod = DateTime.Now;
                    int idPersona = 0;
                    if (Session["Empleado"] != null)
                    {
                        idPersona = ((Logueo)Session["Empleado"]).Idusuario;
                    }
                    decimal CostoTotal;
                    decimal precioDeAdulto; //(precioAdultos * NumAdultos) * Cantidad_Dias;
                    decimal precioDeNinho; //(precioNinos * NumNinos) * Cantidad_Dias;

                    using (var db = new HostingEntities())
                    {
                        var costo = db.spConsultarReservacionPorId(idReservacion).FirstOrDefault();


                        //decimal precioDeAdulto = (precioAdultos * NumAdultos);
                        //decimal precioDeNinho = (precioNinos * NumNinos);
                        //decimal CostoTotal = (precioDeAdulto + precioDeNinho) * Cantidad_Dias;

                        precioDeAdulto = costo.costoPorCadaAdulto * numadultos;
                        precioDeNinho = costo.costoPorCadaNinho * numninos;
                        CostoTotal = (precioDeAdulto + precioDeNinho) * costo.totalDiasReservacion;
                        if (costo != null)
                        {
                            db.spEditarReservacion(idReservacion, numadultos, numninos, fehaen, fehasal, fehamod, CostoTotal, idPersona);
                        }

                    }

                }
                catch { Response.Redirect("~/Pages/Error.aspx?"); }
                Response.Redirect("~/Pages/Resultado.aspx?resul=5");
            }
        }

        protected void Cvfechen_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                args.IsValid = false;

                if (DateTime.Parse(txtfechaentrada.Text) > DateTime.Today)
                {
                    args.IsValid = true;

                }
            }
            catch
            { }
        }

        protected void Cvfechsal_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                args.IsValid = false;

                if (DateTime.Parse(txtfechasal.Text) >= DateTime.Parse(txtfechaentrada.Text))
                {
                    args.IsValid = true;
                }
            }
            catch
            { }
        }
    }
}