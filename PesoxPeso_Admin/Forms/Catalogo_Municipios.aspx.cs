using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Forms_Catalogo_Municipios : System.Web.UI.Page
{
    private bool boolBuscar = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F07") < 0)
        {
            Response.Redirect("/Login.aspx", true);
        }

        if (!Page.IsPostBack)
        {
            Municipios_GridView.SelectRow(0);
            Municipios_GridView.DataBind();
            if (Municipios_GridView.Rows.Count == 0)
            {
                Municipios_DetailsView.ChangeMode(DetailsViewMode.Insert);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Municipios_DetailsView_DataBound(object sender, EventArgs e)
    {
        Municipios_GridView.DataBind();
    }

    protected void Button_Buscar_Click(object sender, EventArgs e)
    {
        this.boolBuscar = true;
        Municipios_GridView.SelectRow(0);
        Municipios_GridView.DataBind();
    }

    protected void Delete_Button_Click(object sender, EventArgs e)
    {
        // CHECAMOS QUE NO EXISTA EL ID EN OTROS ARCHIVOS
        var sql_connectionstring = ConfigurationManager.ConnectionStrings["db_Peso_x_Peso_ConnectionString"].ConnectionString;
        using (var connection = new SqlConnection(sql_connectionstring))
        {
            SqlCommand sql_command = new SqlCommand("sp_elimina_municipio", connection);
            sql_command.CommandType = CommandType.StoredProcedure;

            sql_command.Parameters.Add("@id_municipio", SqlDbType.Int);
            sql_command.Parameters["@id_municipio"].Value = Municipios_DetailsView.SelectedValue;

            connection.Open();
            var reader = sql_command.ExecuteReader();
            if (reader.Read() == false)
            {
                try
                {
                    Municipios_DetailsView.DeleteItem();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Se Elimino Correctamente...');", true);
                }
                catch (Exception ex) { }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('NO se puede Eliminar, Registro con Referencias en otros archivos...');", true);
            }
        }
        Municipios_GridView.DataBind();
    }

    protected void Municipios_DetailsView_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        bool wcancelar = false;

        wcancelar = valida_captura(e.Values["nombre_municipio"], wcancelar);


        if (wcancelar)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Debe Capturar Datos Completos...');", true);
            e.Cancel = true;
        }
    }

    protected void Municipios_DetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        bool wcancelar = false;

        wcancelar = valida_captura(e.NewValues["nombre_municipio"], wcancelar);

        if (wcancelar)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Debe Capturar Datos Completos...');", true);
            e.Cancel = true;
        }
    }

    private Boolean valida_captura(object vcampo, Boolean vcancelar)
    {
        bool verror = false;

        if (vcancelar)
        { verror = true; }
        else
        {
            if (vcampo == null)
            { verror = true; }
            else
            {
                if (vcampo.ToString().Length == 0)
                { verror = true; }
            }
        }
        return verror;
    }

    protected void btnNuevoMunicipio_Click(object sender, EventArgs e)
    {
        Municipios_DetailsView.ChangeMode(DetailsViewMode.Insert);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_detalles();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
    }


    //protected void Municipios_GridView_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    boolBuscar = false;
    //    Municipios_DetailsView.ChangeMode(DetailsViewMode.ReadOnly);
    //    if (!boolBuscar)
    //    {
    //        boolBuscar = false;
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
    //    }
    //}

    protected void Municipios_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        boolBuscar = false;
        Municipios_DetailsView.ChangeMode(DetailsViewMode.ReadOnly);
        if (!boolBuscar)
        {
            boolBuscar = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
        }
    }

    protected void Municipios_DetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "New")
            ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
        if (e.CommandName == "Edit")
            ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
        //else if (e.CommandName == "Cancel")
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
    }

}