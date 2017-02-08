using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entity_Model;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ResetPassword : System.Web.UI.Page
{
    Entity_Model.PesoxPeso_modelContainer contexto = new Entity_Model.PesoxPeso_modelContainer();
    public int id_usuario = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["guid"] != null)
        {
            if (Request["request"] != null)
            {
                divCambiarContraseña.Visible = true;
                divEnviarCorreo.Visible = false;

                int result;
                string id_decrypting_usuario = csSecurityHandler.Decrypting(Request["request"].ToString());
                if (!(Int32.TryParse(id_decrypting_usuario, out result)))
                    Response.Redirect(ResolveUrl("~/Login.aspx"), true);
                else
                {
                    id_usuario = result;
                    string decrypting_guid = csSecurityHandler.Decrypting(Request["guid"].ToString());
                    if (!VerificarGUID(id_usuario, decrypting_guid, out result))
                    {
                        if (result == 0)
                            Response.Redirect(ResolveUrl("~/NotFound.aspx"), true);
                    }
                }
            }
            else
            {
                divEnviarCorreo.Visible = true;
                divCambiarContraseña.Visible = false;
            }
        }
        else
        {
            divEnviarCorreo.Visible = true;
            divCambiarContraseña.Visible = false;
        }
    }

    protected void btnEnviarCorreoElectronico_Click(object sender, EventArgs e)
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_Valida_Correo_institucion";
        bool error = false;

        try
        {
            objData.OpenConnection();

            SqlParameter Param = new SqlParameter("@correo", txtCorreoElectronico.Text);
            Param.SqlDbType = SqlDbType.NVarChar;

            DataTable dt = objData.ExecuteSPQuery(Param, strStoreProcedure);
            if (dt.Rows.Count != 0)
            {
                strStoreProcedure = "spr_Realiza_Cambio_GUID_Institucion";
                string GUID = Guid.NewGuid().ToString();
                string id_registro = dt.Rows[0]["id_registro"].ToString();

                SqlParameter[] Params = new SqlParameter[2];
                Params[0] = new SqlParameter("@id_registro", id_registro);
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@guid", GUID);
                Params[1].SqlDbType = SqlDbType.NVarChar;

                dt = objData.ExecuteSPQuery(Params, strStoreProcedure);

                string id_encrypt_institucion = csSecurityHandler.Encrypt(id_registro);
                string encrypt_guid = csSecurityHandler.Encrypt(GUID);

                var datos_correo = (from seleccionar in contexto.tb_Generales_Parametros select seleccionar).First();

                csEmail Email = new csEmail();
                Email.puerto = datos_correo.correo_puerto;
                Email.servidorSMTP = datos_correo.correo_servidorSMTP;
                Email.emailUsuario = datos_correo.correo_emailUsuario;
                Email.emailPassword = datos_correo.correo_emailPassword;
                Email.correoReminente = datos_correo.correo_correoReminente;
                Email.correoDestinatario = txtCorreoElectronico.Text;
                Email.nombreMostrar = datos_correo.correo_nombreMostrar;
                Email.asunto = "Sistema Peso por Peso - Cambio de Contraseña";
                Email.mensaje = "Dar click <a href='http://localhost:60997/ResetPassword.aspx?request=" + id_encrypt_institucion + "&guid=" + encrypt_guid + "'>Aquí</a> para especificar su nueva Contraseña.";
                //Email.mensaje = "Dar click <a href='http://instituciones_pesoxpeso.difson.gob.mx/ResetPassword.aspx?request=" + id_encrypt_institucion + "&guid=" + encrypt_guid + "'>Aquí</a> para especificar su nueva Contraseña.";

                if ((new csEmailHandler()).SendEmail(Email))
                    error = true;
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_modal('Se le ha enviado un correo');", true);
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('El correo no es valido');", true);
        }
        catch (Exception ex)
        {
            (new ObjetoBase()).Log(ex.Message + ex.StackTrace);
            error = true;
        }
        finally
        {
            objData.CloseConnection();
            objData = null;
        }

        if (error)
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Ocurrio un error. Pongase en contacto con sistemas');", true);
    }

    protected void btnConfirmarContraseña_Click(object sender, EventArgs e)
    {
        if (txtContraseña_1.Text == txtContraseña_2.Text)
        {
            Data objData = new Data();
            string strStoreProcedure = "spr_Realiza_Cambio_Contraseña_Institucion";
            bool error = false;

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[2];
                Params[0] = new SqlParameter("@id_registro", id_usuario);
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@password", txtContraseña_1.Text);
                Params[1].SqlDbType = SqlDbType.NVarChar;

                DataTable dt = objData.ExecuteSPQuery(Params, strStoreProcedure);

                var datos_correo = (from seleccionar in contexto.tb_Generales_Parametros select seleccionar).First();

                csEmail Email = new csEmail();
                Email.puerto = datos_correo.correo_puerto;
                Email.servidorSMTP = datos_correo.correo_servidorSMTP;
                Email.emailUsuario = datos_correo.correo_emailUsuario;
                Email.emailPassword = datos_correo.correo_emailPassword;
                Email.correoReminente = datos_correo.correo_correoReminente;
                Email.correoDestinatario = dt.Rows[0].ItemArray[0].ToString();
                Email.nombreMostrar = datos_correo.correo_nombreMostrar;
                Email.asunto = "Sistema Peso por Peso - Confirmación Cambio de Contraseña";
                Email.mensaje = "Cambio de contraseña completada. \n" +
                    "Usuario: " + dt.Rows[0].ItemArray[0].ToString() + "\n" +
                    "Contraseña: " + txtContraseña_1.Text + "<br><br>" + "Dar click <a href='http://localhost:18658/Default.aspx'>Aquí</a> para accesar al sistema y continuar con el registro de la solicitud.";
                //Email.mensaje = "Cambio de contraseña completada. \n" +
                //                    "Usuario: " + dt.Rows[0].ItemArray[0].ToString() + "\n" +
                //                    "Contraseña: " + txtContraseña_1.Text + "<br><br>" + "Dar click <a href='http://instituciones_pesoxpeso.difson.gob.mx'>Aquí</a> para accesar al sistema y continuar con el registro de la solicitud.";

                if ((new csEmailHandler()).SendEmail(Email))
                    error = true;
                else
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_modal('Se le ha enviado un correo');", true);
            }
            catch (Exception ex)
            {
                (new ObjetoBase()).Log(ex.Message + ex.StackTrace);
                error = true;
            }
            finally
            {
                objData.CloseConnection();
                objData = null;
            }

            if (error)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Ocurrio un error. Pongase en contacto con sistemas');", true);
                var cancelar = (from buscar in contexto.Registro_Usuarios where buscar.id_registro == id_usuario select buscar).First();
                cancelar.contraseña = "";
                contexto.SaveChanges();
            }
            else
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_modal('Cambio de contraseña exitoso');", true);
        }
        else
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Las contraseñas no coinciden');", true);
    }

    protected void btnCerrar_Click(object sender, EventArgs e)
    {
        Response.Redirect(ResolveUrl("~/Login.aspx"), true);
    }

    private bool VerificarGUID(int id_usuario, string guid, out int result)
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_Valida_GUID_Cambio_Contraseña_Institucion";
        bool error = false;
        result = 0;

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[2];
            Params[0] = new SqlParameter("@id_registro", id_usuario);
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@guid", guid);
            Params[1].SqlDbType = SqlDbType.NVarChar;

            DataTable dt = objData.ExecuteSPQuery(Params, strStoreProcedure);

            if (dt.Rows.Count != 0)
                result = 1;

        }
        catch (Exception ex)
        {
            (new ObjetoBase()).Log(ex.Message + ex.StackTrace);
            error = true;
        }
        finally
        {
            objData.CloseConnection();
            objData = null;
        }

        return error;
    }
}