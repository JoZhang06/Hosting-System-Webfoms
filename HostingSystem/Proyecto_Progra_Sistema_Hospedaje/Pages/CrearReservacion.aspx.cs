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
    public partial class CrearReservacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Empleado"] == null && Session["Cliente"] == null)
            {
                Response.Redirect("~/Pages/IniciarSesion.aspx");
            }

            if (Page.IsPostBack == false)
            {
                try
                {
                    //Sesion del empleado               
                    if (Session["Empleado"] != null)
                    {
                        var idhotel = new List<ListItem>();
                        idhotel.Add(new ListItem { Text = "Seleccionar un Hotel", Value = "" });

                        using (HostingEntities hotel = new HostingEntities())
                        {
                            var consulhotel = (from h in hotel.spConsultarHotel()
                                               select new ListItem
                                               { Text = h.nombre, Value = h.idHotel.ToString() }).ToList();//Drop del hotel

                            idhotel.AddRange(consulhotel);

                        }
                        ddlhotel.DataSource = idhotel;
                        ddlhotel.DataTextField = "Text";
                        ddlhotel.DataValueField = "Value";
                        ddlhotel.DataBind();


                        var listacliente = new List<ListItem>();

                        ddlcliente.Enabled = true; //si la sesion es de empleado
                                                   //el drop down list se activa sino pro defecto en el front end esta como enabled
                        listacliente.Add(new ListItem { Text = "Seleccionar un cliente", Value = "" });
                        using (HostingEntities client = new HostingEntities())
                        {
                            var consulcliente = (from p in client.spConsultaReservacionPorCliente()
                                                 select new ListItem
                                                 { Text = p.nombreCompleto, Value = p.idPersona.ToString() }).ToList();

                            listacliente.AddRange(consulcliente);
                        }
                        ddlcliente.DataSource = listacliente;
                        ddlcliente.DataTextField = "Text";
                        ddlcliente.DataValueField = "Value";
                        ddlcliente.DataBind();
                    }

                    //Sesion del cliente                        
                    else if (Session["Cliente"] != null)
                    {
                        var idhotel = new List<ListItem>();//DDL del hotel
                        idhotel.Add(new ListItem { Text = "Seleccionar un Hotel", Value = "" });

                        using (HostingEntities hotel = new HostingEntities())
                        {
                            var consulhotel = (from h in hotel.spConsultarHotel()
                                               select new ListItem
                                               { Text = h.nombre, Value = h.idHotel.ToString() }).ToList();

                            idhotel.AddRange(consulhotel);

                        }
                        ddlhotel.DataSource = idhotel;
                        ddlhotel.DataTextField = "Text";
                        ddlhotel.DataValueField = "Value";
                        ddlhotel.DataBind();


                        var listacliente = new List<ListItem>();
                        Logueo objcliente = (Logueo)Session["Cliente"];//casteo para el dropdownlist del cliente

                        string nombre = objcliente.NombreUsuario;
                        int idcliente = objcliente.Idusuario;//aqui se trae el id del cliente del objeto cliente id persona
                        using (HostingEntities client = new HostingEntities())
                        {
                            var consulcliente = (from p in client.spConsultaReservacionPorCliente()
                                                 select new ListItem
                                                 { Text = nombre, Value = idcliente.ToString()}).ToList();

                            listacliente.AddRange(consulcliente);
                        }
                        ddlcliente.DataSource = listacliente;
                        ddlcliente.DataTextField = "Text";
                        ddlcliente.DataValueField = "Value";
                        ddlcliente.DataBind();

                    }
                }

                catch { Response.Redirect("~/Pages/Error.aspx?regresar=0"); }
            }
        }
        protected void Cvfechen_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                args.IsValid = false;

                if (DateTime.Parse(txtfechaentrada.Text) >= DateTime.Today)
                {
                    args.IsValid = true;

                }
                else
                {
                    args.IsValid = false;
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
                else 
                {
                    args.IsValid = false;
                }
            }
            catch
            { }
        }

        protected void btnguardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                try
            {
                Logueo objempleado = (Logueo)Session["Empleado"];
                int idPersona = int.Parse(ddlcliente.SelectedValue);
                int idHotel = int.Parse(ddlhotel.SelectedValue);
                DateTime fechaen = DateTime.Parse(txtfechaentrada.Text);
                DateTime fechasal = DateTime.Parse(txtfechasal.Text);
                int NumAdultos = int.Parse(txtnumadultos.Text);
                int NumNinos = int.Parse(txtnuminos.Text);

                using (HostingEntities db = new HostingEntities())
                {
                    var NuevaReserv = db.spNuevaReservacion(objempleado.Idusuario, idPersona, idHotel, fechaen, fechasal, NumAdultos, NumNinos);

                }

               
            }
            catch
            {
                Response.Redirect("~/Pages/Error.aspx?regresar=0");
            }

            Response.Redirect("~/Pages/Resultado.aspx?resul=4");

        }
    }
        protected void btnregresar_Click(object sender, EventArgs e)
        {
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