using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for csParametro
/// </summary>
public class csParametro
{
    public string parametro { get; set; }
    public string valor { get; set; }
    public SqlDbType tipo { get; set; }

    public csParametro()
    {
        this.parametro = "";
        this.valor = "";
        this.tipo = SqlDbType.NVarChar;
    }
}