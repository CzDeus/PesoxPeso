using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Forms_Catalogo_Instituciones : System.Web.UI.Page
{
    private bool boolBuscar = true;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F03") < 0)
        {
            Response.Redirect("/Login.aspx", true);
        }

        if (!Page.IsPostBack)
        {
            Instituciones_GridView.SelectRow(0);
            Instituciones_GridView.DataBind();
            if (Instituciones_GridView.Rows.Count == 0)
            {
                Instituciones_DetailsView.ChangeMode(DetailsViewMode.Insert);
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "desbloquea_pagina", "desbloquea_pagina();", true);
        }
    }

    protected void Instituciones_DetailsView_DataBound(object sender, EventArgs e)
    {
        Instituciones_GridView.DataBind();
    }

    protected void Button_Buscar_Click(object sender, EventArgs e)
    {
        Instituciones_GridView.SelectRow(0);
        Instituciones_GridView.DataBind();
    }

    protected void Delete_Button_Click(object sender, EventArgs e)
    {
        // CHECAMOS QUE NO EXISTA EL ID EN OTROS ARCHIVOS
        var sql_connectionstring = ConfigurationManager.ConnectionStrings["db_Peso_x_Peso_ConnectionString"].ConnectionString;
        using (var connection = new SqlConnection(sql_connectionstring))
        {
            SqlCommand sql_command = new SqlCommand("sp_eliminar_institucion", connection);
            sql_command.CommandType = CommandType.StoredProcedure;

            sql_command.Parameters.Add("@id_institucion", SqlDbType.Int);
            sql_command.Parameters["@id_institucion"].Value = Instituciones_DetailsView.SelectedValue;

            connection.Open();
            var reader = sql_command.ExecuteReader();
            if (reader.Read() == false)
            {
                try
                {
                    Instituciones_DetailsView.DeleteItem();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Se Elimino Correctamente...');", true);
                }
                catch (Exception ex) { }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('NO se puede Eliminar, Registro con Referencias en otros archivos...');", true);
            }
        }
        Instituciones_GridView.DataBind();
    }

    protected void Instituciones_DetailsView_ItemInserting(object sender, DetailsViewInsertEventArgs e)
    {
        bool wcancelar = false;

        wcancelar = valida_captura(e.Values["nombre_institucion"], wcancelar);
        wcancelar = valida_captura(e.Values["nombre_director"], wcancelar);
        wcancelar = valida_captura(e.Values["direccion"], wcancelar);
        wcancelar = valida_captura(e.Values["telefono"], wcancelar);
        wcancelar = valida_captura(e.Values["rfc"], wcancelar);

        if (wcancelar)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Debe Capturar Datos Completos...');", true);
            e.Cancel = true;
        }
    }

    protected void Instituciones_DetailsView_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {
        bool wcancelar = false;

        wcancelar = valida_captura(e.NewValues["nombre_institucion"], wcancelar);
        wcancelar = valida_captura(e.NewValues["nombre_director"], wcancelar);
        wcancelar = valida_captura(e.NewValues["direccion"], wcancelar);
        wcancelar = valida_captura(e.NewValues["telefono"], wcancelar);
        wcancelar = valida_captura(e.NewValues["rfc"], wcancelar);

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

    protected void btnNuevoUsuario_Click(object sender, EventArgs e)
    {
        Instituciones_DetailsView.ChangeMode(DetailsViewMode.Insert);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_detalles();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
    }


    //protected void Instituciones_GridView_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    Instituciones_DetailsView.ChangeMode(DetailsViewMode.ReadOnly);
    //    if (!boolBuscar)
    //    {
    //        boolBuscar = false;
    //        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
    //    }
    //}

    protected void Instituciones_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        boolBuscar = false;
        Instituciones_DetailsView.ChangeMode(DetailsViewMode.ReadOnly);
        if (!boolBuscar)
        {
            boolBuscar = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
        }
    }

    protected void Instituciones_DetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "New")
            ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
        if (e.CommandName == "Edit")
            ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
        //else if (e.CommandName == "Cancel")
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "div_detalles", "$('#div_detalles').modal('show');", true);
    }
}