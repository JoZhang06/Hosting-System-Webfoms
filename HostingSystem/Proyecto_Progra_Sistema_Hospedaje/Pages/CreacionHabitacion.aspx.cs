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
    public partial class CreacionHabitacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Empleado"] == null)
            {
                Response.Redirect("~/Pages/Error.aspx?regresar=0");
            }
            else {
            if (Page.IsPostBack == false)
            {
                try
                {
                    var idhotel = new List<ListItem>();
                    idhotel.Add(new ListItem { Text = "Seleccionar un Hotel", Value = "" });//se agrega un texto por defecto
                    using (HostingEntities hotel = new HostingEntities())
                    {
                        var consulhotel = (from h in hotel.spConsultarHotel()
                                           select new ListItem//Creamos el Drop down list
                                                              //y aqui hacemos el llamado con los datos de la base de datos

                                           { Text = h.nombre, Value = h.idHotel.ToString() }).ToList();

                        idhotel.AddRange(consulhotel);
                    }
                    ddlhotel.DataSource = idhotel; //igualamos la data al list item llamado idhotel
                    ddlhotel.DataTextField = "Text";
                    ddlhotel.DataValueField = "Value";
                    ddlhotel.DataBind();
                }
                catch { Response.Redirect("~/Pages/Error.aspx?regresar=2"); }
            }

        }
        }
        protected void btnguardar_Click(object sender, EventArgs e)
        {
              
                //las variables para la inserccion de datos
                bool Crear = false;
                        int idhotel = Int32.Parse(ddlhotel.SelectedValue);
                        string numhabit = txtnumha.Text;
                        int capmax = int.Parse(txtcapmax.Text);
                        string descripc = txtdesc.Text;

                        using (HostingEntities db = new HostingEntities())
                        {
                           var Hab = db.spValidacionHabitacion(idhotel,numhabit).FirstOrDefault();
                        //                
                        //aqui insertamos al procedimiento los datos 
                            if (Hab.Value == 0)//preguntamos si la habitacion ya existe
                            {
                                db.spCrearHabitacion(idhotel, numhabit, capmax, descripc);
                                Crear = true;
                                if (Crear == true)
                        {
                            Response.Redirect("~/Pages/Resultado.aspx?resul=0");
                        }
                             }

                            else
                            {
                             lblmensaje.Visible = true;
                            }//redireccionamiento si la habitacion ya existe
                    
                }

        }

        protected void btnregresar_Click(object sender, EventArgs e)
        {

                if (Session["Empleado"] != null) //se pregunta si la session empleado no es nula (primer if)
                {
                    Response.Redirect("~/Pages/ListaHabitaciones.aspx");
                }

            }

    }
}