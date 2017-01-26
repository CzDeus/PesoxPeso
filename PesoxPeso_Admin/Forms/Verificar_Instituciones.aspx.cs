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

public partial class Forms_Verificar_Instituciones : System.Web.UI.Page
{
    PesoxPeso_modelContainer contexto = new PesoxPeso_modelContainer();
    int id_instituciuon = 0;
    string tipo_formulario = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        Id_Usuario_HiddenField.Value = Session["sist_Id_Usuario"].ToString();

        //if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F14") < 0 || Convert.ToString(Session["sist_Funciones"]).IndexOf("F11") < 0)
        //{
        //    Response.Redirect("/Login.aspx", true);
        //}

        if (!IsPostBack)
        {
            if (Request["tipo"] != null)

                tipo_formulario = Request["tipo"].ToString();
                Tipo_HiddenField.Value = tipo_formulario;

            if (tipo_formulario == "V")
            {
                Estado_Registro_Verificador.Visible = true;
                Estado_Registro_Autorizador.Visible = false;
                Id_Estatus_Buscar_HiddenField.Value = "3";
                Encabezado_Text.Text = "REVISION DE INSTITUCIONES";
            }
            else
            {
                //Id_Usuario_HiddenField.Value = "0";
                Estado_Registro_Verificador.Visible = false;
                Estado_Registro_Autorizador.Visible = true;
                Id_Estatus_Buscar_HiddenField.Value = "4";
                Encabezado_Text.Text = "REVISION REGISTROS VERIFICADOS";
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
        Instituciones_Asignadas_GridView.DataBind();
    }

    protected void Estado_Registro_SelectedIndexChanged(object sender, EventArgs e)
    {
        tipo_formulario = Request["tipo"].ToString();

        if (tipo_formulario == "V")
        {
            if (Estado_Registro_Verificador != null)
            {
                if (Estado_Registro_Verificador.SelectedItem.Value == "Pendientes")
                {
                    Id_Estatus_Buscar_HiddenField.Value = "3";
                }
                else if (Estado_Registro_Verificador.SelectedItem.Value == "Verificados")
                {
                    Id_Estatus_Buscar_HiddenField.Value = "4";
                }
                else if (Estado_Registro_Verificador.SelectedItem.Value == "Todos")
                {
                    Id_Estatus_Buscar_HiddenField.Value = "7";
                }
            }
        }
        else if (tipo_formulario == "A")
        {
            if (Estado_Registro_Autorizador != null)
            {
                if (Estado_Registro_Autorizador.SelectedItem.Value == "Verificados")
                {
                    Id_Estatus_Buscar_HiddenField.Value = "4";
                }
                else if (Estado_Registro_Autorizador.SelectedItem.Value == "Autorizados")
                {
                    Id_Estatus_Buscar_HiddenField.Value = "5";
                }
                else if (Estado_Registro_Autorizador.SelectedItem.Value == "Todos")
                {
                    Id_Estatus_Buscar_HiddenField.Value = "7";
                }
            }
        }

        Instituciones_Asignadas_GridView.DataBind();
    }

    protected void Instituciones_Asignadas_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        
        int rowIndex = int.Parse(e.CommandArgument.ToString());

        int id_registro = Convert.ToInt32(Instituciones_Asignadas_GridView.DataKeys[rowIndex]["id_registro"]);

        var id_institucion = (from buscar in contexto.Registro_Usuarios where buscar.id_registro == id_registro select buscar).First();
        var año_actual = (from año in contexto.tb_Generales_Parametros select año).First();

        var id_formulario = (from buscar in contexto.Formulario_Estandar where buscar.id_institucion == id_institucion.id_institucion && buscar.año_registro == año_actual.año_registro select buscar).First();

        tipo_formulario = Request["tipo"].ToString();

        Session["id_formulario"] = id_formulario.id_formulario_estandar;
        Response.Redirect("Formulario_Estandar.aspx?tipo=" + tipo_formulario);
    }
}