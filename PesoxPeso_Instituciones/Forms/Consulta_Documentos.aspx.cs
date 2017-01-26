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

public partial class Consulta_Documentos : System.Web.UI.Page
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
            int id = Convert.ToInt32(Session["id_registro"]);
            var institucion = (from seleccion in contexto.Registro_Usuarios where seleccion.id_registro == id select seleccion).First();
            Nombre_Institucion_Encabezado_Label.Text = institucion.nombre_institucion + " " + institucion.sucursal;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }


    protected void Consultar_Button_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        int vid_documento_consulta = Convert.ToInt32(Documentos_GridView.DataKeys[gr.RowIndex].Values["id_documento_consulta"]);
        string vurl_archivo = Documentos_GridView.DataKeys[gr.RowIndex].Values["url_archivo"].ToString();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "abrir_documento", "window.open('" + vurl_archivo + "');", true);
    }

    protected void Home_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Default.aspx");
    }
}
