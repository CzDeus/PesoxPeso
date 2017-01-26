using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["sist_Id_Usuario"] != null)
                Response.Redirect("~\\Default.aspx");
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void btnAcceso_Click(object sender, EventArgs e)
    {
        Data objData = new Data();
        string strStoreProcedure = "sp_Valida_Acceso_Sistema_Usuario_Institucion";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@correo", Usuario_TextBox.Text);
            Params[0].SqlDbType = SqlDbType.NVarChar;
            Params[1] = new SqlParameter("@contraseña", Password_TextBox.Text);
            Params[1].SqlDbType = SqlDbType.NVarChar;

            DataTable dt = objData.ExecuteSPQuery(Params, strStoreProcedure);

            if(dt.Rows.Count != 0)
            {
                Session["sist_Id_Usuario"] = dt.Rows[0]["id_registro"];
                Session["sist_Nombre_Usuario"] = dt.Rows[0]["responsable"];

                Session["correo"] = Usuario_TextBox.Text;

                toma_funciones();
                Response.Redirect(ResolveUrl("~/Default.aspx"), true);
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Usuario / Contraseña Incorrectos...');", true);
        }
        catch (Exception ex)
        {
            (new ObjetoBase()).Log(ex.Message + ex.StackTrace);
        }
        finally
        {
            objData.CloseConnection();
            objData = null;
        }
    }

    protected void toma_funciones()
    {
        //Data objData = new Data();
        //string strStoreProcedure = "spr_Generales_lee_funciones_instituciones";

        //try
        //{
        //    objData.OpenConnection();

        //    SqlParameter Param = new SqlParameter("@id_General_Usuario", Convert.ToInt32(Session["sist_Id_Usuario"]));
        //    Param.SqlDbType = SqlDbType.Int;

        //    DataTable dt = objData.ExecuteSPQuery(strStoreProcedure);

        //    for (int x = 0; x < dt.Rows.Count; x++)
        //        Session["sist_Funciones"] = Convert.ToString(Session["sist_Funciones"]) + dt.Rows[x]["funcion"] + ",";
        //}
        //catch (Exception ex)
        //{
        //    (new ObjetoBase()).Log(ex.Message + ex.StackTrace);
        //}
        //finally
        //{
        //    objData.CloseConnection();
        //    objData = null;
        //}
    }
}