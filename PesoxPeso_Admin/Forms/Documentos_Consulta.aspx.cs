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

public partial class Documentos_Consulta : System.Web.UI.Page
{
    PesoxPeso_modelContainer contexto = new PesoxPeso_modelContainer();
    int institucion;
    int id_registro;

    protected void Page_Load(object sender, EventArgs e)
    {
        int id_usuario = Convert.ToInt32(Session["sist_Id_Usuario"].ToString());

        var año_actual = (from seleccionar in contexto.tb_Generales_Parametros select seleccionar).First();
        año_HiddenField.Value = año_actual.año_registro.ToString();

        if (!IsPostBack)
        {
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Agregar_Archivo_Button_Click(object sender, EventArgs e)
    {

        // creamos el directorio
        string vdiretorio = MapPath("~/documentos_consulta");
        if (Directory.Exists(vdiretorio) == false)
        {
            try { Directory.CreateDirectory(vdiretorio); }
            catch (Exception ex) { }
        }

        string wdirectorio = "~/documentos_consulta/año_" + año_HiddenField.Value;
        vdiretorio = MapPath( wdirectorio );
        if (Directory.Exists(vdiretorio) == false)
        {
            try { Directory.CreateDirectory(vdiretorio); }
            catch (Exception ex) { }
        }

        string warchivo = "";
        // SI SELECCIONO ARCHIVO
        if (Documento_FileUpload.HasFile == true)
        {
            string sName = Documento_FileUpload.FileName;
            string sExt = Path.GetExtension(sName);
            // VALIDAMOS EXTENSION DEL ARCHIVO
            //if (sExt == ".cer")
            //{
            warchivo = vdiretorio + "/" + sName;
            Documento_FileUpload.SaveAs(warchivo);

            Data objData = new Data();
            string strStoreProcedure = "spr_agrega_documento_consulta";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@año", año_HiddenField.Value );
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@descripcion_archivo", Referencia_TextBox.Text);
                Params[1].SqlDbType = SqlDbType.Text;
                Params[2] = new SqlParameter("@url_archivo", wdirectorio + "/" + sName);
                Params[2].SqlDbType = SqlDbType.Text;

                objData.ExecuteSPNonQuery(Params, strStoreProcedure);
            }
            catch (Exception ex) { (new ObjetoBase()).Log(ex.Message + ex.StackTrace); }
            finally
            {
                objData.CloseConnection();
                objData = null;

                Documentos_GridView.DataBind();
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Seleccione archivo...');", true);
        }

    }

    protected void Eliminar_Archivo_Button_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        Data objData = new Data();
        string strStoreProcedure = "[spr_elimina_documento_consulta]";

        int vid_documento_consulta = Convert.ToInt32(Documentos_GridView.DataKeys[gr.RowIndex].Value);

        try
        {
            var nombre_archivo = (from buscar in contexto.Documentos_Consulta where buscar.id_documento_consulta == vid_documento_consulta select buscar).First();
            string path = MapPath(nombre_archivo.url_archivo);
            File.Delete(path);

            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[1];

            Params[0] = new SqlParameter("@id_documento_consulta", vid_documento_consulta);
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

            Documentos_GridView.DataBind();
        }
    }

}
