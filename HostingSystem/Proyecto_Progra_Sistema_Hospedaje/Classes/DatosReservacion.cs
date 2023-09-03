using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Proyecto_Progra_Sistema_Hospedaje.Classes
{
        public class DatosReservacion
        {
            public int idReservacion { set; get; }
            public string nombrecompleto { set; get; }
            public string hotel { set; get; }
            public DateTime fechaEntrada { set; get; }
            public DateTime fechaSalida { set; get; }
            public decimal costoTotal { set; get; }
            public string estado { set; get; }

            public string EstadoD
            {
                get
                {
                    if (this.estado == "I")
                    {
                        return "Cancelada";
                    }
                    else if (this.estado == "A" && (this.fechaSalida < DateTime.Today))
                    {
                        return "Finalizada";
                    }
                    else if (this.estado == "A" && (this.fechaEntrada <= DateTime.Today))
                    {
                        return "En proceso";
                    }
                    else if (this.estado == "A" && (this.fechaEntrada > DateTime.Today) &&
                    (this.fechaSalida > DateTime.Today))
                    {
                        return "En espera";
                    }
                    else
                    {
                        return "N/A";
                    }
                }
            }
        }
}