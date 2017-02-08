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

public partial class Forms_Formulario_Estandar : System.Web.UI.Page
{
    PesoxPeso_modelContainer contexto = new PesoxPeso_modelContainer();

    int institucion;
    DateTime vfecha;
    int result;
    double resultd;

    int id_formulario;
    int id_usuario;

    string tipo_formulario = "";

    string v_modal = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //hola.Visible = false;
        id_usuario = Convert.ToInt32(Session["sist_Id_Usuario"].ToString());
        id_formulario = Convert.ToInt32(Session["id_formulario"]);

        if (Request["tipo"] != null)
            tipo_formulario = Request["tipo"].ToString();

        if (tipo_formulario == "V")
        {
            botones_administrador.Visible = false;
            botones_verificador.Visible = true;
        }
        else
        {
            botones_administrador.Visible = true;
            botones_verificador.Visible = false;
        }

        if (!IsPostBack)
        {
            cargar_formulario();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
        }
    }

    protected void Botones_Click(Object sender, CommandEventArgs e)
    {

        var estatus_actual = (from seleccionar in contexto.Registro_Usuarios where seleccionar.id_formulario_estandar == id_formulario select seleccionar).First();

        if (estatus_actual.estatu_actual_registro == 3 && tipo_formulario == "V" || estatus_actual.estatu_actual_registro == 4 && tipo_formulario == "A")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);

            string v_div = e.CommandArgument.ToString();
            ScriptManager.RegisterStartupScript(this, this.GetType(), v_div, "$('#" + v_div + "').modal('show');", true);

            cargar_formulario();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('No tiene autorizacion para acceder en este momento.');", true);
        }
    }

    private string Obtener_Fecha(DateTime fecha_completa)
    {
        string fecha = fecha_completa.ToString("d");
        return fecha;
    }

    protected void cargar_formulario()
    {
        var c_año = (from años in contexto.tb_Generales_Parametros select años).First();
        int año = Convert.ToInt32(c_año.año_registro);

        try
        {
            var FE = (from llenar in contexto.Formulario_Estandar where llenar.id_formulario_estandar == id_formulario select llenar).First();

            string fecha_actual = DateTime.Now.ToString("dd-MM-yyyy");

            Id_Formulario_HiddenField.Value = FE.id_formulario_estandar.ToString();

            /*P1*/
            Nombre_Dominio_TextBox.Text = FE.nombre_dominio;
            Nombre_Programa_TextBox.Text = FE.nombre_programa;

            Nombre_Programa_2_TextBox.Text = Nombre_Programa_TextBox.Text;


            Objetivo_Social_Programa_TextBox.Text = FE.objetivo_social_programa;
            Objetivo_Social_TextBox.Text = FE.objetivo_social_programa;
            //Registro_contribuyente_TextBox.Text = rfc_institucion;
            Fecha_Constitucion_TextBox.Text = Obtener_Fecha(FE.fecha_constitucion);
            Num_Personas_Laborando_TextBox.Text = FE.num_personas_laborando.ToString();
            Remunerados_TextBox.Text = FE.remunerados.ToString();
            Voluntarios_TextBox.Text = FE.voluntarios.ToString();
            Areas_atencion_TextBox.Text = FE.areas_atencion;
            Areas_Apoyo_TextBox.Text = FE.areas_apoyo;

            ///*P2*/
            Año_Actual_TextBox.Text = FE.año_actual.ToString();
            Año_Anterior_TextBox.Text = FE.año_anterior.ToString();
            Total_Ingresos_TextBox.Text = FE.total_ingresos.ToString();
            Total_Donativos_TextBox.Text = FE.total_donativos.ToString();
            Total_Egresos_TextBox.Text = FE.total_egresos.ToString();
            Monto_Solicitado_TextBox.Text = FE.monto_solicitado.ToString();

            ///*P3*///
            //var nom_institucion = (from seleccion in contexto.Catalogo_Instituciones where seleccion.id_institucion == institucion select seleccion.nombre_institucion).First();
            //Nombre_Institucion_TextBox.Text = nom_institucion;

            Denominacion_TextBox.Text = FE.denominacion;
            Siglas_TextBox.Text = FE.siglas;

            Telefono_TextBox.Text = FE.telefono;
            Correo_electronico_TextBox.Text = FE.correo_electronico;
            Pagina_Web_TextBox.Text = FE.pagina_web;
            Red_Social_TextBox.Text = FE.red_social_institucion;
            Calle_Numero_TextBox.Text = FE.calle_numero;
            Municipio_DropDownList.SelectedIndex = FE.id_municipio;
            Colonia_TextBox.Text = FE.colonia;
            CP_TextBox.Text = FE.CP;
            Celular_TextBox.Text = FE.celular;
            Telefonos_TextBox.Text = FE.telefonos;
            Correo_Domicilio_Fiscal.Text = FE.correo_dom_fiscal;
            Personalidad_Juridica_DropDownList.SelectedIndex = FE.id_personalidad_juridica;
            Otro_Personalidad_Juridica_TextBox.Text = FE.otro_personalidad_juridica;

            ///*P4*/
            Num_Escritura_TextBox.Text = FE.num_escritura.ToString();
            Fecha_Escritura_TextBox.Text = Obtener_Fecha(FE.fecha_escritura);
            Nombre_Notario_Pulico_TextBox.Text = FE.nombre_notario_publico;
            Numero_Notario_TextBox.Text = FE.numero_notario_publico;
            Lugar_Notario_TextBox.Text = FE.lugar_notario_publico;
            Registro_Propiedad_TextBox.Text = FE.registro_propiedad;
            Fecha_Registro_Propiedad_TextBox.Text = Obtener_Fecha(FE.fecha_registro_propiedad);
            Permiso_Expedir_Recibos_DropDownList.SelectedIndex = FE.permiso_expedir_recibos;
            Fecha_Permisos_TextBox.Text = Obtener_Fecha(FE.fecha_permiso);
            Fecha_Ultima_Publicacion_TextBox.Text = Obtener_Fecha(FE.fecha_ultima_publicacion);
            Seccion_TextBox.Text = FE.seccion;
            Pagina_TextBox.Text = FE.pagina;

            ///*P5*/
            //id organo
            Otro_Organo_Supremo_TextBox.Text = FE.otro_organo_supremo;
            Nombre_Representante_Legal_TextBox.Text = FE.nombre_representante_legal;
            Calle_Representante_Legal_TextBox.Text = FE.calle_representante_legal;
            Numero_Representante_Legal_TextBox.Text = FE.numero_representante_legal;
            Colonia_Representante_Legal_TextBox.Text = FE.colonia;
            Descripcion_Objeto_Social_TextBox.Text = FE.objetivo_social_programa;
            Ciudad_Representante_Legal_DropDownList.SelectedIndex = FE.id_ciudad_representante_legal;
            Telefono_Representante_Legal_TextBox.Text = FE.telefono_representante_legal;
            Celular_Representante_Legal_TextBox.Text = FE.celular_representante_legal;
            Correo_Representante_TextBox.Text = FE.correo_representante;
            Rfc_Representante_TextBox.Text = FE.rfc_representante;

            ///*P6*/
            Descripcion_Programa_TextBox.Text = FE.descripcion_programa;
            Meta_Programa_TextBox.Text = FE.meta_programa;

            ///*P7*/
            Diagnostico_Situacional_TextBox.Text = FE.diagnostico_situacional;
            Nombre_Enlace_TextBox.Text = FE.nombre_enlace;
            Telefono_Enlace_TextBox.Text = FE.telefono_enlace;
            Correo_Enlace_TextBox.Text = FE.correo_enlace;

            ///*P8*/
            Justificacion_Programa_TextBox.Text = FE.justificacion_programa;
            poblacion_Minima_TextBox.Text = FE.poblacion_minima.ToString();
            poblacion_Maxima_TextBox.Text = FE.poblacion_maxima.ToString();
            poblacion_Actual_TextBox.Text = FE.poblacion_actual.ToString();

            ///*P9*/

            ///*P10*/
            Tipo_Ingreso_Poblacion_DropDownList.SelectedIndex = FE.tipo_ingreso_poblacion;
            Nivel_Ingreso_Poblacion_DropDownList.SelectedIndex = FE.nivel_ingreso_poblacion;
            Rezago_Educativo_DropDownList.SelectedIndex = FE.rezago_educativo;
            Porcentaje_Poblacion_Atendida_TextBox.Text = FE.porcentaje_poblacion_atendida.ToString();

            Personas_hasta_15_DropDownList.SelectedIndex = FE.personas_hasta_15;
            Personas_antes_1982_DropDownList.SelectedIndex = FE.personas_hasta_1982;
            Personas_Apartir_1982_DropDownList.SelectedIndex = FE.personas_apartir_1982;

            ///*P11*/
            Promedio_Personas_Vivienda_TextBox.Text = FE.promedio_personas_viviendo.ToString();
            Num_Habitaciones_TextBox.Text = FE.num_habitaciones.ToString();

            ///*P12*/
            Observaciones_Acceso_TextBox.Text = FE.observaciones_acceso;

            ///*P13*/
            Valor_Aproximado_Inmuebles_TextBox.Text = FE.valor_aproximado_inmuebles.ToString();
            Valor_Aproximado_Inversiones_TextBox.Text = FE.valor_aproximado_inversiones.ToString();
            Valor_Aproximados_Fideicomisos_TextBox.Text = FE.valor_aproximado_fideicomisos.ToString();

            ///*P14*/
            //total_importe_promedio_anual_TextBox.Text = FE.total_principales_fuentes.ToString();



            ///*P15*/
            //Total_Principales_Egresos_TextBox.Text = FE.total_principales_egresos.ToString();


            ///*P16*/
            //Nombre_Razon_TextBox.Text = FE.nombre_razon;
            //Domicilio_Fiscal_TextBox.Text = FE.domicilio_fiscal;
            //Clave_Registro_TextBox.Text = FE.clave_registro;

            Impuesto_Federal_DropDownList.SelectedIndex = FE.impuesto_federal;
            Adeudos_Fiscales_DropDownList.SelectedIndex = FE.adeudos_fiscales;
        }
        catch (Exception)
        { }

    }

    protected void Seleccionar_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        CheckBox chk = (CheckBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_seguridad_social";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_seguridad_social", Seguridad_Social_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;
            Params[2] = new SqlParameter("@seleccionado", chk.Checked);
            Params[2].SqlDbType = SqlDbType.Bit;

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
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P10", "$('#div_presentacion_P10').modal('show');", true);
    }

    protected void Seleccionar_Servicio_Salud_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        CheckBox chk = (CheckBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_servicios_salud";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_servicio_salud", Servicio_Salud_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;
            Params[2] = new SqlParameter("@seleccionado", chk.Checked);
            Params[2].SqlDbType = SqlDbType.Bit;

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
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P10", "$('#div_presentacion_P10').modal('show');", true);
    }

    protected void Seleccionar_Servicios_Basicos_CheckBox_CheckedChanged(object sender, EventArgs e)
    {

        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        CheckBox chk = (CheckBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_servicios_basicos";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_servicios_basicos", Servicios_Basicos_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;
            Params[2] = new SqlParameter("@seleccionado", chk.Checked);
            Params[2].SqlDbType = SqlDbType.Bit;

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
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P11", "$('#div_presentacion_P11').modal('show');", true);
    }

    protected void Seleccionar_Consumo_Dia_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        CheckBox chk = (CheckBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_consumo_dia";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_consumo_dia", Servicios_Basicos_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;
            Params[2] = new SqlParameter("@seleccionado", chk.Checked);
            Params[2].SqlDbType = SqlDbType.Bit;

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
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P12", "$('#div_presentacion_P12').modal('show');", true);
    }

    protected void Seleccionar_acceso_Comunicacion_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        CheckBox chk = (CheckBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_acceso_comunicacion";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_acceso_comunicacion", Servicios_Basicos_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;
            Params[2] = new SqlParameter("@seleccionado", chk.Checked);
            Params[2].SqlDbType = SqlDbType.Bit;

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
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P12", "$('#div_presentacion_P12').modal('show');", true);
    }

    protected void Importe_Porcentaje_TextBox_TextChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        TextBox chk = (TextBox)sender;

        //Data objData = new Data();
        //string strStoreProcedure = "spr_sumar_principales_egresos";

        //try
        //{
        //    objData.OpenConnection();

        //    SqlParameter[] Params = new SqlParameter[3];

        //    Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
        //    Params[0].SqlDbType = SqlDbType.Int;

        //    TextBox importe = gr.FindControl("Importe_Promedio_Anual_TextBox") as TextBox;
        //    decimal valor = Convert.ToDecimal(importe.Text);

        //    Params[1] = new SqlParameter("@cantidad", valor);
        //    Params[1].SqlDbType = SqlDbType.Decimal;

        //    Params[2] = new SqlParameter("@id_principales_fuentes", Principales_Fuentes_GridView.DataKeys[gr.RowIndex].Value);
        //    Params[2].SqlDbType = SqlDbType.Int;

        //    objData.ExecuteSPNonQuery(Params, strStoreProcedure);
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

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_principales_fuentes";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[4];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_principales_fuentes", Principales_Fuentes_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;

            TextBox importe = gr.FindControl("Importe_Promedio_Anual_TextBox") as TextBox;
            Params[2] = new SqlParameter("@importe_promedio", Convert.ToDouble(importe.Text));
            Params[2].SqlDbType = SqlDbType.Float;

            TextBox porcentaje = gr.FindControl("Porcentaje_Importe_TextBox") as TextBox;
            if (porcentaje.Text == "")
            {
                porcentaje.Text = "0";
            }
            Params[3] = new SqlParameter("@porcentaje", Convert.ToDouble(porcentaje.Text));
            Params[3].SqlDbType = SqlDbType.Float;

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
        }

        Principales_Fuentes_GridView.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_situacion_financiera_P2", "$('#div_situacion_financiera_P2').modal('show');", true);
    }

    protected void Tipo_Poblacion_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        CheckBox chk = (CheckBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_tipo_poblacion";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_tipo_poblacion", Tipo_Poblacion_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;
            Params[2] = new SqlParameter("@seleccionado", chk.Checked);
            Params[2].SqlDbType = SqlDbType.Bit;

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
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P6", "$('#div_presentacion_P6').modal('show');", true);
    }

    protected void Importes_Principales_Egresos_TextBox_TextChanged(object sender, EventArgs e)
    {
        //Calcular_Porcentaje_Principales_Egresos();

        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        TextBox chk = (TextBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_principales_egresos";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[4];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_principal_egreso", Principales_Egresos_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;

            TextBox importe = gr.FindControl("Importe_Promedio_Anual_Egresos_TextBox") as TextBox;
            Params[2] = new SqlParameter("@importe_egresos", Convert.ToDouble(importe.Text));
            Params[2].SqlDbType = SqlDbType.Float;

            TextBox porcentaje = gr.FindControl("Porcentaje_Importe_Egresos_TextBox") as TextBox;
            Params[3] = new SqlParameter("@porcentaje", Convert.ToDouble(porcentaje.Text));
            Params[3].SqlDbType = SqlDbType.Float;

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
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_situacion_financiera_P3", "$('#div_situacion_financiera_P3').modal('show');", true);
    }

    protected void Piso_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        CheckBox chk = (CheckBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_piso";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_piso", Piso_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;
            Params[2] = new SqlParameter("@seleccionado", chk.Checked);
            Params[2].SqlDbType = SqlDbType.Bit;

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
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P11", "$('#div_presentacion_P11').modal('show');", true);
    }

    protected void Techo_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        CheckBox chk = (CheckBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_techo";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_techo", Techo_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;
            Params[2] = new SqlParameter("@seleccionado", chk.Checked);
            Params[2].SqlDbType = SqlDbType.Bit;

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
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P11", "$('#div_presentacion_P11').modal('show');", true);

    }

    protected void Muro_CheckBox_CheckedChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        CheckBox chk = (CheckBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_muro";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];
            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;
            Params[1] = new SqlParameter("@id_muro", Muro_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;
            Params[2] = new SqlParameter("@seleccionado", chk.Checked);
            Params[2].SqlDbType = SqlDbType.Bit;

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
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P11", "$('#div_presentacion_P11').modal('show');", true);
    }

    protected void Poblacion_Atendida_TextBox_TextChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        TextBox chk = (TextBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_poblacion_atendida";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[4];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_poblacion_atendida", Poblacion_Atendida_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;

            TextBox hombres = gr.FindControl("Poblacion_Atendida_Hombres_TextBox") as TextBox;
            Params[2] = new SqlParameter("@cantidad_hombres", hombres.Text);
            Params[2].SqlDbType = SqlDbType.Text;

            TextBox mujeres = gr.FindControl("Poblacion_Atendida_Mujeres_TextBox") as TextBox;
            Params[3] = new SqlParameter("@cantidad_mujeres", mujeres.Text);
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
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P7", "$('#div_presentacion_P7').modal('show');", true);

    }

    protected void Detalle_Costo_Estimado_TextBox_TextChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        TextBox chk = (TextBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_costo_estimado";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[4];

            Params[0] = new SqlParameter("@id_costo_estimado", Costo_Estimado_Programa_GridView.DataKeys[gr.RowIndex].Value);
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[1].SqlDbType = SqlDbType.Int;

            TextBox concepto = gr.FindControl("Detalle_Concepto_TextBox") as TextBox;
            Params[2] = new SqlParameter("@concepto", Convert.ToString(concepto.Text));
            Params[2].SqlDbType = SqlDbType.VarChar;

            TextBox monto = gr.FindControl("Detalle_Monto_TextBox") as TextBox;
            Params[3] = new SqlParameter("@monto", Convert.ToDouble(monto.Text));
            Params[3].SqlDbType = SqlDbType.Float;

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
        }

        Costo_Estimado_Programa_GridView.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P5", "$('#div_presentacion_P5').modal('show');", true);
    }

    protected void Agregar_Costo_Button_Click(object sender, EventArgs e)
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_agregar_detalle_costo_estimado";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[1];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
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
        }
        Costo_Estimado_Programa_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P5", "$('#div_presentacion_P5').modal('show');", true);
    }

    protected void Eliminar_Costo_Button_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        Data objData = new Data();
        string strStoreProcedure = "spr_eliminar_detalle_costo_estimado";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[2];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_costo_estimado", Costo_Estimado_Programa_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;

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
        }
        Costo_Estimado_Programa_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P5", "$('#div_presentacion_P5').modal('show');", true);
    }

    protected void Detalle_Oficinas_Relacion_TextChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        TextBox chk = (TextBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_oficina_relacion";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[4];

            Params[0] = new SqlParameter("@id_oficina_relacion", Oficinas_Relacion_GridView.DataKeys[gr.RowIndex].Value);
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[1].SqlDbType = SqlDbType.Int;

            TextBox institucion = gr.FindControl("Detalle_Institucion_TextBox") as TextBox;
            Params[2] = new SqlParameter("@institucion", Convert.ToString(institucion.Text));
            Params[2].SqlDbType = SqlDbType.NVarChar;

            TextBox objetivo = gr.FindControl("Detalle_Objetivo_Beneficio_TextBox") as TextBox;
            Params[3] = new SqlParameter("@objetivo_beneficio", Convert.ToDouble(objetivo.Text));
            Params[3].SqlDbType = SqlDbType.NVarChar;

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
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P13", "$('#div_presentacion_P13').modal('show');", true);
    }

    protected void Agregar_Oficinas_Relacion_Button_Click(object sender, EventArgs e)
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_agrega_detalle_oficinas_relacion";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[1];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
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
        }
        Oficinas_Relacion_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P13", "$('#div_presentacion_P13').modal('show');", true);
    }

    protected void Eliminar_Detalle_Costo_Estimado_Button_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        Data objData = new Data();
        string strStoreProcedure = "spr_eliminar_detalle_oficinas_relacion";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[2];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_oficina_relacion", Oficinas_Relacion_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;

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
        }
        Oficinas_Relacion_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P13", "$('#div_presentacion_P13').modal('show');", true);
    }

    protected void Eliminar_Reforma_Constitutiva_Button_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        Data objData = new Data();
        string strStoreProcedure = "spr_eliminar_detalle_reformas_constitutivas";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[2];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_reforma_constitutiva", Reformas_Constitutivas_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;

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
        }

        Reformas_Constitutivas_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_acreditar_P3", "$('#div_acreditar_P3').modal('show');", true);
    }

    protected void Detalle_Reforma_Constitutiva_TextBox_TextChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        TextBox chk = (TextBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_reformas_constitutivas";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[4];

            Params[0] = new SqlParameter("@id_reforma_contitutiva", Reformas_Constitutivas_GridView.DataKeys[gr.RowIndex].Value);
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[1].SqlDbType = SqlDbType.Int;

            TextBox institucion = gr.FindControl("Detalle_Reforma_TextBox") as TextBox;
            Params[2] = new SqlParameter("@reforma", institucion.Text);
            Params[2].SqlDbType = SqlDbType.NVarChar;

            TextBox objetivo = gr.FindControl("Fecha_Reforma_TextBox") as TextBox;

            if (objetivo.Text == "")
            {
                objetivo.Text = "13-05-1990";
            }

            Params[3] = new SqlParameter("@fecha", Convert.ToDateTime(objetivo.Text));
            Params[3].SqlDbType = SqlDbType.DateTime;

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
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_acreditar_P3", "$('#div_acreditar_P3').modal('show');", true);
    }

    protected void Agregar_Reforma_Constitutiva_Button_Click(object sender, EventArgs e)
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_agregar_detalle_reformas_constitutivas";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[1];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
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
        }
        Reformas_Constitutivas_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_acreditar_P3", "$('#div_acreditar_P3').modal('show');", true);
    }

    protected void Agregar_Oficina_Operativa_Button_Click(object sender, EventArgs e)
    {

        if (Calle_Oficinas_Operativas_TextBox.Text != "" && Numero_Oficinas_Operativas_TextBox.Text != "" && Entre_Calles_Oficinas_Operativas_TextBox.Text != ""
            && Telefono_Oficina_Operativa_TextBox.Text != "" && Horario_Oficina_Operativa_TextBox.Text != "")
        {

            Data objData = new Data();
            string strStoreProcedure = "spr_agrega_detalle_oficinas_operativas";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[9];

                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;

                Params[1] = new SqlParameter("@calle", Calle_Oficinas_Operativas_TextBox.Text);
                Params[1].SqlDbType = SqlDbType.NVarChar;

                Params[2] = new SqlParameter("@numero", Numero_Oficinas_Operativas_TextBox.Text);
                Params[2].SqlDbType = SqlDbType.NVarChar;

                Params[3] = new SqlParameter("@colonia", Convert.ToInt32(Colonia_Oficinas_Operativas_DropDownList.SelectedIndex));
                Params[3].SqlDbType = SqlDbType.Int;

                Params[4] = new SqlParameter("@cp", CP_Oficina_Operativa_TextBox.Text);
                Params[4].SqlDbType = SqlDbType.NVarChar;

                Params[5] = new SqlParameter("@entre", Entre_Calles_Oficinas_Operativas_TextBox.Text);
                Params[5].SqlDbType = SqlDbType.NVarChar;

                Params[6] = new SqlParameter("@municipio", Convert.ToInt32(Id_Municipio_Oficina_Operativa_DropDownList.SelectedValue));
                Params[6].SqlDbType = SqlDbType.Int;

                Params[7] = new SqlParameter("@telefono", Telefono_Oficina_Operativa_TextBox.Text);
                Params[7].SqlDbType = SqlDbType.NVarChar;

                Params[8] = new SqlParameter("@horarios", Horario_Oficina_Operativa_TextBox.Text);
                Params[8].SqlDbType = SqlDbType.NVarChar;

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
            }
            Oficinas_Operativas_GridView.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P1", "$('#div_presentacion_P1').modal('show');", true);
        }
    }

    protected void Eliminar_Oficina_Operativa_Button_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        Data objData = new Data();
        string strStoreProcedure = "spr_eliminar_detalle_oficinas_operativas";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[2];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_oficina_operativa", Oficinas_Operativas_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;

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
        }

        Oficinas_Operativas_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P1", "$('#div_presentacion_P1').modal('show');", true);
    }

    protected void Agregar_Etapa_Button_Click(object sender, EventArgs e)
    {
        Data objData = new Data();
        string strStoreProcedure = "spr_agregar_detalle_tiempo_estimado";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[1];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
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
        }
        Tiempos_Estimados_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P4", "$('#div_presentacion_P4').modal('show');", true);
    }

    protected void Eliminar_Tiempo_Estimado_Button_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        Data objData = new Data();
        string strStoreProcedure = "spr_eliminar_detalle_tiempo_estimado";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[2];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_tiempo_estimado", Tiempos_Estimados_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;

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
        }

        Tiempos_Estimados_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P4", "$('#div_presentacion_P4').modal('show');", true);
    }

    protected void Detalle_Tiempo_Estimado_TextBox_TextChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        TextBox chk = (TextBox)sender;

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_tiempo_estimado";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[5];

            Params[0] = new SqlParameter("@id_tiempo_estimado", Tiempos_Estimados_GridView.DataKeys[gr.RowIndex].Value);
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[1].SqlDbType = SqlDbType.Int;

            TextBox fecha_inicial = gr.FindControl("Fecha_Inicial_TextBox") as TextBox;
            Params[2] = new SqlParameter("@fecha_inicial", Convert.ToDateTime(fecha_inicial.Text));
            Params[2].SqlDbType = SqlDbType.Date;

            TextBox fecha_final = gr.FindControl("Fecha_final_TextBox") as TextBox;
            Params[3] = new SqlParameter("@fecha_final", Convert.ToDateTime(fecha_final.Text));
            Params[3].SqlDbType = SqlDbType.Date;

            TextBox descripcion = gr.FindControl("Descripcion_Tiempo_TextBox") as TextBox;
            Params[4] = new SqlParameter("@descripcion", descripcion.Text);
            Params[4].SqlDbType = SqlDbType.Text;

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
        }
        Tiempos_Estimados_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P4", "$('#div_presentacion_P4').modal('show');", true);
    }

    protected void Calcular_Total_Personas_Laborando_TextBox_TextChanged(object sender, EventArgs e)
    {
        int remunerados = Convert.ToInt32(Remunerados_TextBox.Text);
        int voluntarios = Convert.ToInt32(Voluntarios_TextBox.Text);
        int totales = Convert.ToInt32(Num_Personas_Laborando_TextBox.Text);

        int suma = remunerados + voluntarios;

        if (remunerados > 0 && voluntarios > 0 && suma < totales)
        {
            Remunerados_TextBox.BackColor = System.Drawing.Color.Red;
            Voluntarios_TextBox.BackColor = System.Drawing.Color.Red;
        }
    }

    protected void Observaciones_Button_Command(object sender, CommandEventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_observaciones", "$('#div_observaciones').modal('show');", true);

        var observaciones = (from seleccionar in contexto.Observaciones_Verificacion where seleccionar.id_formulario == id_formulario && seleccionar.id_verificador == id_usuario && seleccionar.estatus == true select seleccionar).ToList();

        if (observaciones.Count == 0)
        {
            Observaciones_Verificacion observaciones_nuevas = new Observaciones_Verificacion();
            observaciones_nuevas.id_formulario = id_formulario;
            observaciones_nuevas.fecha_obsevaciones = DateTime.Today;
            observaciones_nuevas.observaciones = "";
            observaciones_nuevas.id_verificador = id_usuario;
            observaciones_nuevas.estatus = true;

            string tipo_persona = "";

            if (tipo_formulario == "V")
            {
                tipo_persona = "Verificador";
            }
            else
            {
                tipo_persona = "Autorizador";
            }

            observaciones_nuevas.tipo_persona = tipo_persona;

            contexto.Observaciones_Verificacion.Add(observaciones_nuevas);

            contexto.SaveChanges();
        }
        else
        {
            Observaciones_TextBox.Text = observaciones[0].observaciones;
        }

        Nombre_Div_HiddenField.Value = e.CommandArgument.ToString();
    }

    protected void Guardar_Observaciones_Button_Click(object sender, EventArgs e)
    {
        //if (tipo_formulario == "V")
        //{
        var observaciones = (from seleccionar in contexto.Observaciones_Verificacion where seleccionar.id_formulario == id_formulario && seleccionar.id_verificador == id_usuario && seleccionar.estatus == true select seleccionar).First();
        observaciones.observaciones = Observaciones_TextBox.Text;
        //}else if(tipo_formulario == "A")
        //{
        //    var observaciones = (from seleccionar in contexto.Observaciones_Administrador where seleccionar.id_formulario == id_formulario && seleccionar.id_admin == id_usuario && seleccionar.estatus == true select seleccionar).First();
        //    observaciones.observaciones = Observaciones_TextBox.Text;
        //}

        contexto.SaveChanges();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), Nombre_Div_HiddenField.Value, "$('#" + Nombre_Div_HiddenField.Value + "').modal('show');", true);
    }

    //VERIFICADOR
    protected void Validar_Verificado_Button_Command(object sender, CommandEventArgs e)
    {
        var institucion = (from leer in contexto.Formulario_Estandar where leer.id_formulario_estandar == id_formulario select leer).First();

        var estado_registro = (from devolver in contexto.Registro_Usuarios where devolver.id_institucion == institucion.id_institucion && devolver.id_formulario_estandar == id_formulario select devolver).First();
        estado_registro.estatu_actual_registro = 4;

        if ((from buscar in contexto.Observaciones_Verificacion where buscar.id_formulario == id_formulario && buscar.id_verificador == id_usuario && buscar.estatus == true select buscar).Count() > 0)
        {
            var cambiar_estado = (from buscar in contexto.Observaciones_Verificacion where buscar.id_formulario == id_formulario && buscar.id_verificador == id_usuario && buscar.estatus == true select buscar).First();
            cambiar_estado.estatus = false;
        }

        contexto.SaveChanges();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        string v_div = e.CommandArgument.ToString();
        ScriptManager.RegisterStartupScript(this, this.GetType(), v_div, "$('#" + v_div + "').modal('show');", true);
    }

    protected void Regresar_Institucion_Button_Command(object sender, CommandEventArgs e)
    {
        var estado_observaciones = (from cambiar in contexto.Observaciones_Verificacion where cambiar.id_formulario == id_formulario && cambiar.id_verificador == id_usuario && cambiar.estatus == true select cambiar).ToList();

        if (estado_observaciones.Count != 0)
        {
            var institucion = (from leer in contexto.Formulario_Estandar where leer.id_formulario_estandar == id_formulario select leer).First();
            var estado_registro = (from devolver in contexto.Registro_Usuarios where devolver.id_institucion == institucion.id_institucion && devolver.id_formulario_estandar == id_formulario select devolver).First();

            //ENVIAR CORREO ELECTRONICO
            bool verificar = ReenviarCorreo(estado_registro.correo, "Dar click <a href='http://instituciones_pesoxpeso.difson.gob.mx/' y favor de revisar los siguientes puntos de su formulario estandar: " + estado_observaciones[0].observaciones, 0);

            if (verificar == true)
            {
                estado_observaciones[0].estatus = false;
                estado_registro.estatu_actual_registro = 1;
                contexto.SaveChanges();

                Observaciones_GridView.DataBind();
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Necesita agregar comentarios para poder reenviar.');", true);
        }
    }

    //AUTORIZADOR
    protected void Regresar_Validador_Button_Command(object sender, CommandEventArgs e)
    {
        var estado_observaciones = (from cambiar in contexto.Observaciones_Verificacion where cambiar.id_formulario == id_formulario && cambiar.id_verificador == id_usuario && cambiar.estatus == true select cambiar).ToList();

        if (estado_observaciones.Count != 0)
        {
            var institucion = (from leer in contexto.Formulario_Estandar where leer.id_formulario_estandar == id_formulario select leer).First();

            var estado_registro = (from devolver in contexto.Registro_Usuarios where devolver.id_institucion == institucion.id_institucion && devolver.id_formulario_estandar == id_formulario select devolver).First();

            var correo_verificador = (from buscar in contexto.tb_Generales_Usuarios where buscar.id_General_Usuario == estado_registro.id_verificador select buscar).First();

            //ENVIAR CORREO ELECTRONICO
            bool verificar = ReenviarCorreo(correo_verificador.correo, "Dar click <a href='http://instituciones_pesoxpeso.difson.gob.mx/' y favor de revisar los siguientes puntos de su formulario estandar: " + estado_observaciones[0].observaciones, 0);

            if(verificar == true)
            {
                estado_observaciones[0].estatus = false;
                estado_registro.estatu_actual_registro = 3;
                contexto.SaveChanges();

                Observaciones_GridView.DataBind();
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Necesita agregar comentarios para poder reenviar.');", true);
        }
    }

    protected void Autorizar_Button_Command(object sender, CommandEventArgs e)
    {
        var institucion = (from leer in contexto.Formulario_Estandar where leer.id_formulario_estandar == id_formulario select leer).First();

        var estado_registro = (from devolver in contexto.Registro_Usuarios where devolver.id_institucion == institucion.id_institucion && devolver.id_formulario_estandar == id_formulario select devolver).First();
        estado_registro.estatu_actual_registro = 5;

        ReenviarCorreo(estado_registro.correo, "Su tramite finalizo con exito favor de comunicarse con la institucion para continuar con el proceso", 1);

        contexto.SaveChanges();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('El registro finalizo con exito se le comunicara a la institucion.');", true);
    }

    //METODO DE ENVIO DE CORREO TANTO A LA INSTITUCION COMO AL VERIFICADOR
    protected bool ReenviarCorreo(string correo, string observaciones, int valor)
    {

        bool guardar = false; 

        Data objData = new Data();

        string strStoreProcedure;
        string store_cambio_GUI;
        string id_GUI;
        string id;

         int num_param = 0;

        if (tipo_formulario == "V" && valor == 0 || tipo_formulario == "A" && valor == 1)
        {
            strStoreProcedure = "sp_valida_correo_usuario_institucion";
            store_cambio_GUI = "sp_Realiza_Cambio_GUID_Institucion";
            id_GUI = "@id_registro";
            id = "id_registro";
            num_param = 2;
        }
        else if (tipo_formulario == "A" && valor == 0)
        {
            strStoreProcedure = "spr_Valida_Correo";
            store_cambio_GUI = "spr_Realiza_Cambio_GUID";
            id_GUI = "@id_general_usuario";
            id = "id_General_Usuario";
            num_param = 1;
        }
        else
        {
            strStoreProcedure = "";
            store_cambio_GUI = "";
            id_GUI = "";
            id = "";
        }

        bool error = false;

        try
        {
            objData.OpenConnection();

            SqlParameter[] Param = new SqlParameter[num_param];

            Param[0] = new SqlParameter("@correo", correo);
            Param[0].SqlDbType = SqlDbType.NVarChar;

            if (num_param == 2)
            {
                Param[1] = new SqlParameter("@id_registro", id_formulario);
                Param[1].SqlDbType = SqlDbType.Int;
            }

            DataTable dt = objData.ExecuteSPQuery(Param, strStoreProcedure);
            if (dt.Rows.Count != 0)
            {
                strStoreProcedure = store_cambio_GUI;
                string GUID = Guid.NewGuid().ToString();
                string id_general_usuario = dt.Rows[0][id].ToString();

                SqlParameter[] Params = new SqlParameter[2];
                Params[0] = new SqlParameter(id_GUI, id_general_usuario);
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@guid", GUID);
                Params[1].SqlDbType = SqlDbType.NVarChar;

                dt = objData.ExecuteSPQuery(Params, strStoreProcedure);

                string id_encrypt_usuario = csSecurityHandler.Encrypt(id_general_usuario);
                string encrypt_guid = csSecurityHandler.Encrypt(GUID);

                var datos_correo = (from seleccionar in contexto.tb_Generales_Parametros select seleccionar).First();

                csEmail Email = new csEmail();
                Email.puerto = datos_correo.correo_puerto;
                Email.servidorSMTP = datos_correo.correo_servidorSMTP;
                //INFORMACION DE QUIEN ENVIA
                Email.emailUsuario = datos_correo.correo_emailUsuario;
                Email.emailPassword = datos_correo.correo_emailPassword;
                Email.correoReminente = datos_correo.correo_correoReminente;
                Email.correoDestinatario = correo;
                Email.nombreMostrar = datos_correo.correo_nombreMostrar;
                Email.asunto = "Sistema Peso por Peso - Observaciones";
                //Email.mensaje = observaciones;
                Email.mensaje = observaciones;

                if ((new csEmailHandler()).SendEmail(Email))
                {
                    error = true;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Se envio correo a la institucion para corregir sus datos');", true);
                    guardar = true;
                }
            }
            //else
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('El correo no es valido');", true);
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
            guardar = false;
        }

        return guardar;
    }

    protected void Historial_Observaciones_Button_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_ver_observaciones", "$('#div_ver_observaciones').modal('show');", true);
    }

    protected void Revision_Documentos_Click(object sender, EventArgs e)
    {
        Response.Redirect("Documentos_Institucion.aspx");
    }
}