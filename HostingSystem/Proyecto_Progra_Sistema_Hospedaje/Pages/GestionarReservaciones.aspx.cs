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
    public partial class GestionarReservaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
              if (Page.IsPostBack == false)
                {
                
                    if (Session["Empleado"] != null)
                    {
                        try
                        {
                            DrownDownL();
                            using (HostingEntities db = new HostingEntities())
                            { //aqui traemos todos los datos de tods las reservaciones

                                var gestionarR = db.spGestionarReservaciones().ToList();

                                GrdGestion.DataSource = gestionarR;
                                GrdGestion.DataBind();
                            }

                        }
                        catch
                        {
                            Response.Redirect("~/Pages/Error.aspx?regresar=1");
                        }

                    }
                    else
                    {
                        Response.Redirect("~/Pages/Error.aspx?regresar=0");
                        Response.Redirect("~/Pages/IniciarSesion.aspx");
                    }

                }
        }
        protected void cvfecha_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                args.IsValid = false;
                {
                    if (DateTime.Parse(txtfechaentrada.Text) <= DateTime.Parse(txtfechasalida.Text))
                    {
                        args.IsValid = true;
                    }
                }
            }
            catch { }
        }
        protected void btnfiltrar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                try
                {
                    if (ddlcliente.SelectedItem.Value != "")
                    {
                        int IdCliente = int.Parse(ddlcliente.SelectedItem.Value);
                        DateTime FechaEntrada = Convert.ToDateTime(txtfechaentrada.Text);
                        DateTime FechaSalida = Convert.ToDateTime(txtfechasalida.Text);

                        using (HostingEntities db = new HostingEntities())
                        {
                            var MisReservaciones = db.spGesReservacionFiltros(IdCliente, FechaEntrada, FechaSalida).ToList();

                            GrdGestion.DataSource = MisReservaciones;
                            GrdGestion.DataBind();
                        }
                    }
                    else if (ddlcliente.SelectedItem.Value == "")
                    {
                        DateTime FechaEntrada = Convert.ToDateTime(txtfechaentrada.Text);
                        DateTime FechaSalida = Convert.ToDateTime(txtfechasalida.Text);

                        using (HostingEntities db = new HostingEntities())
                        {
                            var MisReservaciones = db.spGesReservacionFechas(FechaEntrada, FechaSalida).ToList();

                            GrdGestion.DataSource = MisReservaciones;
                            GrdGestion.DataBind();
                        }

                    }
                    else 
                    {
                        lblfiltro.Visible = true;
                    }
                }
                catch
                {
                    Response.Redirect("~/Pages/Error.aspx?regresar=1");
                }
            }
    }
        void DrownDownL() 
        {
                    var listacliente = new List<ListItem>();

                    listacliente.Add(new ListItem { Text = "Nombre del cliente", Value = "" });

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
       
        }
    }
