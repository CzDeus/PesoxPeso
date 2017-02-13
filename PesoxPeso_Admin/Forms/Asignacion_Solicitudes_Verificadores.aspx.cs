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

public partial class Forms_Asignacion_Solicitudes_Verificadores : System.Web.UI.Page
{
    PesoxPeso_modelContainer contexto = new PesoxPeso_modelContainer();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Id_Estatus_Buscar_HiddenField.Value = "2";
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Asignados_Verificadores_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int indexRow = Convert.ToInt32(e.CommandArgument);
        string id_verificador = Convert.ToString(Asignados_Verificadores_GridView.DataKeys[indexRow].Value);

        Id_Asignado_Registro_HiddenField.Value = id_verificador;

        Registros_Asignados_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "instituciones_asignadas", "$('#instituciones_asignadas').modal('show');", true);
    }

    protected void Asignar_Verificador_Button_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        DropDownList ddl_verificador = (DropDownList)gr.FindControl("Verificadores_DropDownList");
        int id_verificador = Convert.ToInt32(ddl_verificador.SelectedValue);

        int westatus = (id_verificador == 0) ? 2 : 3;

        int id_registro_seleccionado = Convert.ToInt32(Registros_Completos_GridView.DataKeys[gr.RowIndex].Value);

        var asignar_verificador = (from buscar in contexto.Registro_Usuarios where buscar.id_registro == id_registro_seleccionado select buscar).First();

        asignar_verificador.id_verificador = id_verificador;
        asignar_verificador.fecha_asignada = DateTime.Now;
        asignar_verificador.estatu_actual_registro = westatus;

        Estatus_Registros estatus = new Estatus_Registros();
        estatus.id_institucion = asignar_verificador.id_institucion;
        estatus.id_registro = asignar_verificador.id_registro;
        estatus.fecha = DateTime.Today;
        estatus.estatus = westatus;
        contexto.Estatus_Registros.Add(estatus);

        var verificar = (from buscar in contexto.Observaciones_Verificacion where buscar.id_verificador == id_verificador && buscar.fecha_obsevaciones == DateTime.Today && buscar.estatus == true select buscar).ToList();

        if (verificar.Count == 0)
        {
            var año = (from seleccionar in contexto.tb_Generales_Parametros select seleccionar).First();
            int año_general = año.año_registro;
            var id_formulario = (from buscar in contexto.Formulario_Estandar where buscar.id_institucion == asignar_verificador.id_institucion && buscar.año_registro == año_general select buscar).First();

            contexto.spr_Elimina_Observaciones_Vacias(id_formulario.id_formulario_estandar);

            Observaciones_Verificacion observaciones = new Observaciones_Verificacion();
            observaciones.id_formulario = id_formulario.id_formulario_estandar;
            observaciones.fecha_obsevaciones = DateTime.Today;
            observaciones.observaciones = "";
            observaciones.id_verificador = asignar_verificador.id_verificador;
            observaciones.estatus = true;
            observaciones.tipo_persona = "Verificador";

            contexto.Observaciones_Verificacion.Add(observaciones);
        }

        contexto.SaveChanges();

        Registros_Completos_GridView.DataBind();
        Asignados_Verificadores_GridView.DataBind();
    }

    protected void Estado_Registro_SelectedIndexChanged(object sender, EventArgs e)
    {
        int valor = 0;

        if (Estado_Registro != null)
        {
            if (Estado_Registro.SelectedItem.Value == "No_Asignados")
            {
                Id_Estatus_Buscar_HiddenField.Value = "2";

            }
            else if (Estado_Registro.SelectedItem.Value == "Asignados")
            {
                Id_Estatus_Buscar_HiddenField.Value = "3";
                valor = 1;

            }
            else if (Estado_Registro.SelectedItem.Value == "Todos")
            {
                Id_Estatus_Buscar_HiddenField.Value = "7";
            }

            Registros_Completos_GridView.DataBind();
        }

        if (valor == 1)
        {
            Registros_Asignados_GridView.Columns[1].Visible = false;
        }
    }

    protected void Buscar_Button_Click(object sender, EventArgs e)
    {
        Registros_Completos_GridView.DataBind();
    }
}