using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entity_Model;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

using System.IO;
using System.Net;

public partial class Forms_Documentos_Institucion : System.Web.UI.Page
{
    PesoxPeso_modelContainer contexto = new PesoxPeso_modelContainer();
    int institucion;
    int id_registro;
    int id_formulario;

    protected void Page_Load(object sender, EventArgs e)
    {
        //int id_usuario = Convert.ToInt32(Session["sist_Id_Usuario"].ToString());

        id_formulario = Convert.ToInt32(Session["id_formulario"]);

        var usuario = (from seleccionar in contexto.Registro_Usuarios where seleccionar.id_formulario_estandar == id_formulario select seleccionar).First();

        institucion = usuario.id_institucion;
        id_registro = usuario.id_registro;

        Id_Registro_HiddenField.Value = id_registro.ToString();

        if (!IsPostBack)
        {
            verificar_archivos();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Prueba_Click(Object sender, CommandEventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        Numero_Requisito_HiddenField.Value = e.CommandArgument.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_adjuntar", "$('#div_adjuntar').modal('show');", true);
    }

    protected void verificar_archivos()
    {
        try
        {
            var verificar = (from buscar in contexto.Archivos_Instituciones where buscar.id_institucion == institucion select buscar).First();

            if (verificar.acta_constitutiva != null)
            {
                //times_2.Visible = false;
                //check_2.Visible = true;
            }
            else
            {
                //times_2.Visible = true;
                //check_2.Visible = false;
            }
        }
        catch
        {

        }
    }

    protected void Eliminar_Archivo_Button_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        Data objData = new Data();
        string strStoreProcedure = "[spr_elimina_archivos_adjunto]";

        int id_archivo = Convert.ToInt32(Archivos_Registrados_GridView.DataKeys[gr.RowIndex].Value);

        try
        {
            var nombre_archivo = (from buscar in contexto.Archivos_Adjuntos where buscar.id_archivo_adjunto == id_archivo select buscar).First();
            string path = nombre_archivo.url_archivo;
            File.Delete(path);

            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[1];

            Params[0] = new SqlParameter("@id_archivo_adjunto", id_archivo);
            Params[0].SqlDbType = SqlDbType.Int;

            objData.ExecuteSPNonQuery(Params, strStoreProcedure);
        }
        catch (Exception ex)
        {
            (new ObjetoBase()).Log(ex.Message + ex.StackTrace);
        }
        finally
        {
            objData.CloseConnection();
            objData = null;

            Archivos_Registrados_GridView.DataBind();
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_adjuntar", "$('#div_adjuntar').modal('show');", true);

    }

    protected void ver_Archivo_Button_Click(object sender, EventArgs e)
    {
        //string FilePath = Server.MapPath("15241815_10154317156203138_1126550217829564015_n.jpg");
        //WebClient User = new WebClient();
        //Byte[] FileBuffer = User.DownloadData("C:\\Users\\User\\Desktop\\PesoxPeso_Instituciones\\archivos_registro\\institucion_33_2017/Como_Programar_CSharp.pdf");
        //if (FileBuffer != null)
        //{
        //    Response.ContentType = "application/pdf";
        //    Response.AddHeader("content-length", FileBuffer.Length.ToString());
        //    Response.BinaryWrite(FileBuffer);
        //}
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        int vid_documento_consulta = Convert.ToInt32(Archivos_Registrados_GridView.DataKeys[gr.RowIndex].Values["id_archivo_adjunto"]);

        var url = (from buscar in contexto.Archivos_Adjuntos where buscar.id_archivo_adjunto == vid_documento_consulta select buscar).First();

        string vurl_archivo = url.url_archivo;
        vurl_archivo = vurl_archivo.ToString().Replace("~", "");
        ScriptManager.RegisterStartupScript(this, this.GetType(), "abrir_documento", "window.open('" + vurl_archivo + "');", true);
    }

    protected void salir_button_Click(object sender, EventArgs e)
    {
        Response.Redirect("Formulario_Estandar.aspx");
    }
}