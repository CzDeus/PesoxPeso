using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Configuration;
using System.Data.SqlClient;

using System.Text.RegularExpressions;
public partial class Forms_Registro : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F04") < 0)
        {
            Response.Redirect("/Login.aspx", true);
        }

        if (!Page.IsPostBack)
        {

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "desbloquea_pagina", "desbloquea_pagina();", true);
        }
    }

    protected void Enviar_Solicitud_Button_Click(object sender, EventArgs e)
    {
        if (Nombre_InstitucionTextBox.Text == "" || Nombre_Persona_TextBox.Text == "" || Telefono_TextBox.Text == "" || Correo_TextBox.Text == "" || Confirmar_Correo_TextBox.Text == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Quedan Campos Vacios');", true);
        }
        else
        {
            if (Comprobar_Formato_Correo(Correo_TextBox.Text) == true && Comprobar_Formato_Correo(Confirmar_Correo_TextBox.Text) == true)
            {

                int comparar = Correo_TextBox.Text.CompareTo(Confirmar_Correo_TextBox.Text);

                if (comparar == 0)
                {
                    var sql_connectionstring = ConfigurationManager.ConnectionStrings["db_Peso_x_Peso_ConnectionString"].ConnectionString;
                    using (var connection = new SqlConnection(sql_connectionstring))
                    {
                        SqlCommand sql_command = new SqlCommand("sp_Registro_Usuario", connection);
                        sql_command.CommandType = CommandType.StoredProcedure;

                        sql_command.Parameters.Add("@nombre_institucion", SqlDbType.Text);
                        sql_command.Parameters["@nombre_institucion"].Value = Nombre_InstitucionTextBox.Text;

                        sql_command.Parameters.Add("@responsable", SqlDbType.Text);
                        sql_command.Parameters["@responsable"].Value = Nombre_Persona_TextBox.Text;

                        sql_command.Parameters.Add("@telefono", SqlDbType.Text);
                        sql_command.Parameters["@telefono"].Value = Telefono_TextBox.Text;

                        sql_command.Parameters.Add("@correo", SqlDbType.Text);
                        sql_command.Parameters["@correo"].Value = Correo_TextBox.Text;

                        sql_command.Parameters.Add("@rfc", SqlDbType.Text);
                        sql_command.Parameters["@rfc"].Value = RFC_institucion_TextBox.Text;

                        connection.Open();
                        sql_command.ExecuteNonQuery();
                        connection.Close();

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Se ha realizado su registro, se le enviará correo de confirmación');", true);

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Los correos no concuerdan');", true);
                }
            }else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Verifique el formato de los correos');", true);
            }
        }
    }

    public static bool Comprobar_Formato_Correo(string correo)
    {
        String sFormato;
        sFormato = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
        if(Regex.IsMatch(correo, sFormato))
        {
            if(Regex.Replace(correo, sFormato, String.Empty).Length == 0)
            {
                return true;
            }else
            {
                return false;
            }
        }
        else
        {
            return false;
        }
    }
}