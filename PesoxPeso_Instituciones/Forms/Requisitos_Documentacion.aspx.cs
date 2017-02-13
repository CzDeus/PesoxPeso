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


public partial class Forms_Requisitos_Documentacion : System.Web.UI.Page
{
    PesoxPeso_modelContainer contexto = new PesoxPeso_modelContainer();
    int institucion;
    int id_registro;

    protected void Page_Load(object sender, EventArgs e)
    {
        int id_usuario = Convert.ToInt32(Session["sist_Id_Usuario"].ToString());

        var usuario = (from seleccionar in contexto.Registro_Usuarios where seleccionar.id_registro == id_usuario select seleccionar).First();

        Nombre_Institucion_Encabezado_Label.Text = usuario.nombre_institucion + " " + usuario.sucursal;

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

    protected void guardar_archivos_Button_Click(object sender, EventArgs e)
    {
        try
        {
            var buscar = (from buscar_institucion in contexto.Archivos_Instituciones where buscar_institucion.id_institucion == institucion select buscar_institucion).First();
        }
        catch
        {
            Archivos_Instituciones archivos = new Archivos_Instituciones();
            archivos.id_institucion = institucion;
            contexto.Archivos_Instituciones.Add(archivos);
            contexto.SaveChanges();
        }

        var llenar = (from buscar_institucion in contexto.Archivos_Instituciones where buscar_institucion.id_institucion == institucion select buscar_institucion).First();

        //if (FileUpload2.HasFile)
        //{
        //    using (BinaryReader reader = new BinaryReader(FileUpload2.PostedFile.InputStream))
        //    {
        //        llenar.acta_constitutiva = reader.ReadBytes(FileUpload2.PostedFile.ContentLength);
        //    }
        //}
        //contexto.SaveChanges();
        //verificar_archivos();
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

    protected void Prueba_Click(Object sender, CommandEventArgs e)
    {
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        Numero_Requisito_HiddenField.Value = e.CommandArgument.ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_adjuntar", "$('#div_adjuntar').modal('show');", true);
    }

    protected void Agregar_Archivo_Button_Click(object sender, EventArgs e)
    {

        var año_actual = (from seleccionar in contexto.tb_Generales_Parametros select seleccionar).First();

        //creamos el directorio

        //string vdiretorio = MapPath("~/archivos_registro");
        string vdiretorio = "Z:\\Documentos";

        if (Directory.Exists(vdiretorio) == false)
        {
            try { Directory.CreateDirectory(vdiretorio); }
            catch (Exception ex) { }
        }
        //string vdiretorio = MapPath("\\192.168.1.77\\Prueba");

        //vdiretorio = MapPath("~/Documentos/institucion_" + institucion.ToString() + "_" + año_actual.año_registro);

        vdiretorio = "Z:\\Documentos\\institucion_" + institucion.ToString() + "_" + año_actual.año_registro;

        if (Directory.Exists(vdiretorio) == false)
        {
            try { Directory.CreateDirectory(vdiretorio); }
            catch (Exception ex) { }
        }

        string warchivo = "";

        // SI SELECCIONO ARCHIVO
        if (Archivos_FileUpload.HasFile == true)
        {
            string sName = Archivos_FileUpload.FileName;

            //WebClient cliente = new WebClient();

            //NetworkCredential nc = new NetworkCredential("Juan", "123");

            //Uri addy = new Uri(@"\\192.168.1.77\Prueba\" + sName);
            //byte[] arrReturn = cliente.UploadFile(addy, "Hola");

            string sExt = Path.GetExtension(sName);
            // VALIDAMOS EXTENSION DEL ARCHIVO
            //if (sExt == ".cer")
            //{
            warchivo = vdiretorio + "/" + sName;
            Archivos_FileUpload.SaveAs(warchivo);
            //warchivo = sName;

            Data objData = new Data();
            string strStoreProcedure = "spr_agrega_archivos_adjunto";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[4];
                Params[0] = new SqlParameter("@id_registro_solicitud", id_registro);
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@numero_requisito", Convert.ToInt32(Numero_Requisito_HiddenField.Value));
                Params[1].SqlDbType = SqlDbType.Int;
                Params[2] = new SqlParameter("@descripcion_archivo", Referencia_Archivo_TextBox.Text);
                Params[2].SqlDbType = SqlDbType.Text;
                Params[3] = new SqlParameter("@url_archivo", warchivo);
                Params[3].SqlDbType = SqlDbType.Text;

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

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Seleccione archivo...');", true);
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

    protected void Home_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Default.aspx");
    }

    protected void btn_salir_Click(object sender, EventArgs e)
    {
        Response.Redirect("Formulario_Estandar.aspx");
    }
}
