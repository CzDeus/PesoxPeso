using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for csReporte
/// </summary>
public class csReporte
{
    public string formato { get; set; }
    public string urlFormato { get; set; }
    public Dictionary<string, string> parametrosReporte { get; set; }
    public string storeProcedure { get; set; }
    public List<csParametro> parametrosStoreProcedure { get; set; }
    public string dataSet { get; set; }

    public csReporte()
    {
        this.formato = "";
        this.urlFormato = "";
        this.parametrosReporte = new Dictionary<string, string>();
        this.storeProcedure = "";
        this.parametrosStoreProcedure = new List<csParametro>();
        this.dataSet = "";
    }
}