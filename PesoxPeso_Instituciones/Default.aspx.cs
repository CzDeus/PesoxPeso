using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Entity_Model;


public partial class _Default : System.Web.UI.Page
{
    PesoxPeso_modelContainer contexto = new PesoxPeso_modelContainer();

    int id_registro;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["sist_Id_Usuario"] == null)
            Response.Redirect(ResolveUrl("~/Login.aspx"), true);

        Correo_HiddenField.Value = Session["correo"].ToString();

        if (!IsPostBack)
        {
            var instituciones = (from buscar in contexto.Registro_Usuarios where buscar.correo == Correo_HiddenField.Value && buscar.contraseña != "" select buscar).Count();

            if (instituciones > 1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modal_Instituciones", "$('#modal_Instituciones').modal('show');", true);
            }
            else
            {
                id_registro = Convert.ToInt32(Session["sist_Id_Usuario"].ToString());
                Nombre_Intitucion_Label.Text = Desplegar_Nombre();
                Cambiar_Institucion_Button.Visible = false;
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Instituciones_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int rowIndex = int.Parse(e.CommandArgument.ToString());
        id_registro = Convert.ToInt32(Instituciones_GridView.DataKeys[rowIndex]["id_registro"]);

        string nombre = Desplegar_Nombre();

        Session["sist_Id_Usuario"] = id_registro;
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
    }

    protected string Desplegar_Nombre()
    {
        var nombre_institucion = (from buscar in contexto.Registro_Usuarios where buscar.id_registro == id_registro select new { buscar.nombre_institucion, buscar.sucursal, buscar.id_institucion }).First();
        Nombre_Intitucion_Label.Text = nombre_institucion.nombre_institucion + ' ' + nombre_institucion.sucursal;

        string nombre = nombre_institucion.nombre_institucion + ' ' + nombre_institucion.sucursal;

        Session["id_institucion"] = nombre_institucion.id_institucion;

        return nombre;
    }

    protected void Cambiar_Institucion_Button_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "modal_Instituciones", "$('#modal_Instituciones').modal('show');", true);
    }
}