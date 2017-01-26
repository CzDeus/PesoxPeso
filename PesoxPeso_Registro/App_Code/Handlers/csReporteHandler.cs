using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Microsoft.Reporting.WebForms;

/// <summary>
/// Summary description for csReporteHandler
/// </summary>
public class csReporteHandler : ObjetoBase
{
    public csReporteHandler()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public void Imprimir(csReporte Reporte)
    {
        DataTable dt = null;
        byte[] bytes = null;
        string strMimeType = string.Empty;

        Microsoft.Reporting.WebForms.Warning warnings = null;

        // DEFINIMOS EL REPORTE
        ReportViewer Reporte_ReportViewer = new ReportViewer();
        Reporte_ReportViewer.ProcessingMode = ProcessingMode.Local;
        Reporte_ReportViewer.LocalReport.ReportPath = Reporte.urlFormato;

        // ASIGNAMOS PARAMETROS AL REPORTE
        int countParametrosReporte = Reporte.parametrosReporte.Count;
        ReportParameter[] reporteParams = new ReportParameter[countParametrosReporte];

        for (int x = 0; x < countParametrosReporte; x++)
            reporteParams[x] = new ReportParameter(Reporte.parametrosReporte.ElementAt(x).Key, Reporte.parametrosReporte.ElementAt(x).Value);

        Reporte_ReportViewer.LocalReport.SetParameters(reporteParams);

        // CREAMOS DATATABLE PARA LA SOLICITUD
        Data objData = new Data();

        try
        {
            objData.OpenConnection();

            int countParametrosStoreProcedure = Reporte.parametrosStoreProcedure.Count;
            SqlParameter[] sqlParams = new SqlParameter[countParametrosStoreProcedure];

            for (int x = 0; x < countParametrosReporte; x++)
            {
                sqlParams[x] = new SqlParameter(Reporte.parametrosStoreProcedure[x].parametro, Reporte.parametrosStoreProcedure[x].valor);
                sqlParams[x].SqlDbType = (SqlDbType)Reporte.parametrosStoreProcedure[x].tipo;
            }

            dt = objData.ExecuteSPQuery(sqlParams, Reporte.storeProcedure);
        }
        catch (Exception ex)
        {
            LogError(ex.Message + ex.StackTrace);
            dt = null;
        }
        finally
        {
            objData.CloseConnection();
            objData = null;
        }

        if (dt != null)
        {
            // CREAMOS DATASET
            ReportDataSource Solicitud_ReportDataSource = new ReportDataSource(Reporte.dataSet, dt);

            // AGREGAMOS DATASET AL REPORTE
            Reporte_ReportViewer.LocalReport.DataSources.Add(Solicitud_ReportDataSource);

            // RENDER AL REPORTE
            bytes = Reporte_ReportViewer.LocalReport.Render(Reporte.formato, null);

            // ABRE EL PDF
            HttpContext.Current.Response.Buffer = true;
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ContentType = strMimeType;
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=/Solicitud_Adquisicion." + Reporte.formato);
            HttpContext.Current.Response.BinaryWrite(bytes);    // create the file
            HttpContext.Current.Response.Flush();
        }
    }
}