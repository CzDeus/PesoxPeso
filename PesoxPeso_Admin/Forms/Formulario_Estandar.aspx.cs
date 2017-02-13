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
using System.Drawing;

public partial class Forms_Formulario_Estandar : System.Web.UI.Page
{
    PesoxPeso_modelContainer contexto = new PesoxPeso_modelContainer();

    static int institucion;
    DateTime vfecha;
    int result;
    double resultd;
    static int id_oficina = 0;
    decimal v_kwh_base = 0, v_kwh_base2 = 0, v_kwh_base3 = 0;

    int id_formulario;
    int id_usuario;

    string tipo_formulario;

    string v_modal = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        //hola.Visible = false;
        id_usuario = Convert.ToInt32(Session["sist_Id_Usuario"].ToString());
        id_formulario = Convert.ToInt32(Session["id_formulario"]);
        tipo_formulario = Session["tipo"].ToString();

        if (Request["tipo"] != null)
        {
            //tipo_formulario = Request["tipo"].ToString();
            Session["tipo"] = Request["tipo"].ToString();
        }


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
            var buscar_institucion = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();
            institucion = buscar_institucion.id_institucion;
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
            var select = (from rfc in contexto.Catalogo_Instituciones where rfc.id_institucion == institucion select rfc).First();
            string rfc_institucion = select.rfc;
            string nombre_institucion = select.nombre_institucion;

            var FE = (from llenar in contexto.Formulario_Estandar where llenar.id_institucion == institucion && llenar.año_registro == año select llenar).First();

            string fecha_actual = DateTime.Now.ToString("dd-MM-yyyy");

            Id_Formulario_HiddenField.Value = FE.id_formulario_estandar.ToString();

            /*P1*/

            //Nombre_Institucion_Encabezado_Label.Text = select.nombre_institucion + " " + select.sucursal;

            Nombre_Dominio_TextBox.Text = nombre_institucion;
            Nombre_Programa_TextBox.Text = FE.nombre_programa;

            Nombre_Programa_2_TextBox.Text = Nombre_Programa_TextBox.Text;


            Objetivo_Social_Programa_TextBox.Text = FE.objetivo_social_programa;
            Objetivo_Social_TextBox.Text = FE.objetivo_social_programa;
            Registro_contribuyente_TextBox.Text = rfc_institucion;
            Fecha_Constitucion_TextBox.Text = Obtener_Fecha(FE.fecha_constitucion);

            if (FE.num_personas_laborando == 0)
            {
                Num_Personas_Laborando_TextBox.Text = "";
            }
            else
            {
                Num_Personas_Laborando_TextBox.Text = FE.num_personas_laborando.ToString();
            }

            if (FE.remunerados != 0)
            {
                Remunerados_TextBox.Text = FE.remunerados.ToString();
            }
            else
            {
                Remunerados_TextBox.Text = "";
            }

            if (FE.voluntarios != 0)
            {
                Voluntarios_TextBox.Text = FE.voluntarios.ToString();
            }
            else
            {
                Voluntarios_TextBox.Text = "";
            }

            Areas_atencion_TextBox.Text = FE.areas_atencion;
            Areas_Apoyo_TextBox.Text = FE.areas_apoyo;

            ///*P2*//

            if (FE.año_actual != 0)
            {
                Año_Actual_TextBox.Text = FE.año_actual.ToString();
            }
            else
            {
                Año_Actual_TextBox.Text = "";
            }

            if (FE.año_anterior != 0)
            {
                Año_Anterior_TextBox.Text = FE.año_anterior.ToString();
            }
            else
            {
                Año_Anterior_TextBox.Text = "";
            }


            if (FE.total_ingresos == 0)
            {
                Total_Ingresos_TextBox.Text = "";
            }
            else
            {
                Total_Ingresos_TextBox.Text = FE.total_ingresos.ToString("N");
            }

            if (FE.total_ingresos == 0)
            {
                Total_Donativos_TextBox.Text = "";
            }
            else
            {
                Total_Donativos_TextBox.Text = FE.total_donativos.ToString("N");
            }

            if (FE.total_ingresos == 0)
            {
                Total_Egresos_TextBox.Text = "";
            }
            else
            {
                Total_Egresos_TextBox.Text = FE.total_egresos.ToString("N");
            }

            if (FE.total_ingresos == 0)
            {
                Monto_Solicitado_TextBox.Text = "";
            }
            else
            {
                Monto_Solicitado_TextBox.Text = FE.monto_solicitado.ToString("N");
            }

            ///*P3*///
            var nom_institucion = (from seleccion in contexto.Catalogo_Instituciones where seleccion.id_institucion == institucion select seleccion.nombre_institucion).First();
            Nombre_Institucion_TextBox.Text = FE.denominacion;

            Denominacion_TextBox.Text = nom_institucion;
            Siglas_TextBox.Text = FE.siglas;

            Telefono_TextBox.Text = FE.telefono;
            Correo_electronico_TextBox.Text = FE.correo_electronico;
            Pagina_Web_TextBox.Text = FE.pagina_web;
            Red_Social_TextBox.Text = FE.red_social_institucion;
            Calle_Numero_TextBox.Text = FE.calle_numero;

            if (FE.id_municipio != 0)
            {
                Municipio_DropDownList.SelectedValue = FE.id_municipio.ToString();
            }

            Colonia_TextBox.Text = FE.colonia;
            CP_TextBox.Text = FE.CP;
            Celular_TextBox.Text = FE.celular;
            Telefonos_TextBox.Text = FE.telefonos;
            Correo_Domicilio_Fiscal.Text = FE.correo_dom_fiscal;

            if (FE.id_personalidad_juridica != 0)
            {
                Personalidad_Juridica_DropDownList.SelectedValue = FE.id_personalidad_juridica.ToString(); ;
            }

            if (FE.id_personalidad_juridica == 3)
            {
                Otro_Personalidad_Juridica_TextBox.Text = FE.otro_personalidad_juridica;
            }

            ///*P4*/
            Num_Escritura_TextBox.Text = FE.num_escritura.ToString();
            Volumen_Num_Escritura_TextBox.Text = FE.volumen_num_escritura;
            Fecha_Escritura_TextBox.Text = Obtener_Fecha(FE.fecha_escritura);
            Nombre_Notario_Pulico_TextBox.Text = FE.nombre_notario_publico;
            Numero_Notario_TextBox.Text = FE.numero_notario_publico;
            Lugar_Notario_TextBox.Text = FE.lugar_notario_publico;
            Registro_Propiedad_TextBox.Text = FE.registro_propiedad;
            Volumen_Registro_Propiedad_TextBox.Text = FE.volumen_registro_propiedad;
            Fecha_Registro_Propiedad_TextBox.Text = Obtener_Fecha(FE.fecha_registro_propiedad);

            Permiso_Expedir_Recibos_DropDownList.SelectedIndex = FE.permiso_expedir_recibos;

            if (FE.permiso_expedir_recibos == 1)
            {
                fecha_permiso.Visible = false;
            }
            ////////////////////////////////////////////////////////////////////////////////////

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
            Colonia_Representante_Legal_TextBox.Text = FE.colonia_representante_legal;
            Descripcion_Objeto_Social_TextBox.Text = FE.objetivo_social_programa;
            if (FE.id_ciudad_representante_legal != 0)
            {
                Ciudad_Representante_Legal_DropDownList.SelectedValue = FE.id_ciudad_representante_legal.ToString();
            }
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

            if (FE.poblacion_minima != 0)
            {
                poblacion_Minima_TextBox.Text = FE.poblacion_minima.ToString();
            }
            else
            {
                poblacion_Minima_TextBox.Text = "";
            }

            if (FE.poblacion_maxima != 0)
            {
                poblacion_Maxima_TextBox.Text = FE.poblacion_maxima.ToString();
            }
            else
            {
                poblacion_Maxima_TextBox.Text = "";
            }

            if (FE.poblacion_actual != 0)
            {
                poblacion_Actual_TextBox.Text = FE.poblacion_actual.ToString();
            }
            else
            {
                poblacion_Actual_TextBox.Text = "";
            }

            ///*P9*/

            ///*P10*/
            Tipo_Ingreso_Poblacion_DropDownList.SelectedIndex = FE.tipo_ingreso_poblacion;
            Nivel_Ingreso_Poblacion_DropDownList.SelectedIndex = FE.nivel_ingreso_poblacion;
            Rezago_Educativo_DropDownList.SelectedIndex = FE.rezago_educativo;

            if (Rezago_Educativo_DropDownList.SelectedIndex == 1)
            {
                Porcentaje_Poblacion_Atendida.Visible = false;
            }
            else
            {
                if (FE.porcentaje_poblacion_atendida != 0)
                {
                    Porcentaje_Poblacion_Atendida_TextBox.Text = FE.porcentaje_poblacion_atendida.ToString();

                }
                else
                {
                    Porcentaje_Poblacion_Atendida_TextBox.Text = "";
                }
            }

            Personas_hasta_15_DropDownList.SelectedIndex = FE.personas_hasta_15;
            Personas_antes_1982_DropDownList.SelectedIndex = FE.personas_hasta_1982;
            Personas_Apartir_1982_DropDownList.SelectedIndex = FE.personas_apartir_1982;

            ///*P11*//
            if (FE.promedio_personas_viviendo != 0)
            {
                Promedio_Personas_Vivienda_TextBox.Text = FE.promedio_personas_viviendo.ToString();
            }
            else
            {
                Promedio_Personas_Vivienda_TextBox.Text = "";
            }

            if (FE.num_habitaciones != 0)
            {
                Num_Habitaciones_TextBox.Text = FE.num_habitaciones.ToString();
            }
            else
            {
                Num_Habitaciones_TextBox.Text = "";
            }

            ///*P12*/
            Observaciones_Acceso_TextBox.Text = FE.observaciones_acceso;

            ///*P13*//
            if (FE.valor_aproximado_inmuebles != 0)
            {
                Valor_Aproximado_Inmuebles_TextBox.Text = FE.valor_aproximado_inmuebles.ToString("N");
            }
            else
            {
                Valor_Aproximado_Inmuebles_TextBox.Text = "";
            }

            if (FE.valor_aproximado_inversiones != 0)
            {
                Valor_Aproximado_Inversiones_TextBox.Text = FE.valor_aproximado_inversiones.ToString("N");
            }
            else
            {
                Valor_Aproximado_Inversiones_TextBox.Text = "";
            }

            if (FE.valor_aproximado_fideicomisos != 0)
            {
                Valor_Aproximados_Fideicomisos_TextBox.Text = FE.valor_aproximado_fideicomisos.ToString("N");
            }
            else
            {
                Valor_Aproximados_Fideicomisos_TextBox.Text = "";
            }

            Patrimonio_Institucion_DropDownList.SelectedIndex = FE.patrimonio_institucion;
            if (FE.patrimonio_institucion == 1)
            {
                ocultar.Visible = false;
            }
            else
            {
                Propiedades_Inmuebles_DropDownList.SelectedIndex = FE.propiedades_inmuebles;
                Inversiones_DropDownList.SelectedIndex = FE.inversiones;
                Fideicomisos_DropDownList.SelectedIndex = FE.fideicomisos;
            }




            ///*P14*/
            ((TextBox)Piso_GridView.FooterRow.FindControl("Piso_Otros_TextBox")).Text = FE.piso_otro.ToString();
            ((TextBox)Techo_GridView.FooterRow.FindControl("Techo_Otros_TextBox")).Text = FE.techo_otro.ToString();
            ((TextBox)Muro_GridView.FooterRow.FindControl("Muro_Otros_TextBox")).Text = FE.muro_otro.ToString();

            ///*P15*/


            ///*P16*/
            Nombre_Razon_TextBox.Text = nombre_institucion;
            Domicilio_Fiscal_TextBox.Text = FE.calle_numero + " " + FE.colonia + " " + FE.CP + " " + Municipio_DropDownList.SelectedItem;
            Clave_Registro_TextBox.Text = rfc_institucion;

            Impuesto_Federal_DropDownList.SelectedIndex = FE.impuesto_federal;
            Adeudos_Fiscales_DropDownList.SelectedIndex = FE.adeudos_fiscales;

        }
        catch (Exception)
        { }

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

    protected void Costo_Estimado_Programa_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox KWH_Base_Label = (TextBox)e.Row.FindControl("Detalle_Monto_TextBox");
            if (KWH_Base_Label.Text != "")
            {
                v_kwh_base += Decimal.Parse(KWH_Base_Label.Text);
                //v_kwh_base += Convert.ToDouble(KWH_Base_Label.Text);
            }
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            TextBox KWH_Base_Label = (TextBox)e.Row.FindControl("Total_Costo_Estimado_TextBox");
            KWH_Base_Label.Text = v_kwh_base.ToString("##,##0.00");
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

    //Llamar modal confirmacion
    protected void Confirmar_Verificador_Autorizador_Command(object sender, CommandEventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        string v_div = e.CommandArgument.ToString();
        ScriptManager.RegisterStartupScript(this, this.GetType(), v_div, "$('#" + v_div + "').modal('show');", true);
    }

    //REGRESAR INSTITUCION - VERIFICADOR
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

    protected void Regresar_Validador_Button_Command(object sender, CommandEventArgs e)
    {
        var estado_observaciones = (from cambiar in contexto.Observaciones_Verificacion where cambiar.id_formulario == id_formulario && cambiar.id_verificador == id_usuario && cambiar.estatus == true select cambiar).ToList();

        if (estado_observaciones.Count != 0)
        {
            var institucion = (from leer in contexto.Formulario_Estandar where leer.id_formulario_estandar == id_formulario select leer).First();

            var estado_registro = (from devolver in contexto.Registro_Usuarios where devolver.id_institucion == institucion.id_institucion && devolver.id_formulario_estandar == id_formulario select devolver).First();

            var correo_verificador = (from buscar in contexto.tb_Generales_Usuarios where buscar.id_General_Usuario == estado_registro.id_verificador select buscar).First();

            //ENVIAR CORREO ELECTRONICO
            bool verificar = ReenviarCorreo(correo_verificador.correo, "Dar click <a href='http://instituciones_pesoxpeso.difson.gob.mx/'>Aquí</a> y favor de revisar los siguientes puntos de su formulario estandar: " + estado_observaciones[0].observaciones, 0);

            if (verificar == true)
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

                if ((new csEmailHandler()).SendEmail_DIF(Email))
                {
                    error = true;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Se envio correo de aviso a la institución');", true);
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

    protected void Principales_Fuentes_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox KWH_Base_Label = (TextBox)e.Row.FindControl("Importe_Promedio_Anual_TextBox");
            if (KWH_Base_Label.Text != "")
            {
                v_kwh_base2 += Decimal.Parse(KWH_Base_Label.Text);
            }
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            TextBox KWH_Base_Label = (TextBox)e.Row.FindControl("Total_Importe_Promedio_Anual_TextBox");
            KWH_Base_Label.Text = v_kwh_base2.ToString("##,##0.00");
        }
    }

    protected void Principales_Egresos_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox KWH_Base_Label_2 = (TextBox)e.Row.FindControl("Importe_Promedio_Anual_Egresos_TextBox");

            if (KWH_Base_Label_2.Text != "")
            {
                v_kwh_base3 += Decimal.Parse(KWH_Base_Label_2.Text);
            }
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            TextBox KWH_Base_Label_2 = (TextBox)e.Row.FindControl("Total_Costo_Estimado_TextBox_2");
            KWH_Base_Label_2.Text = v_kwh_base3.ToString("##,##0.00");
        }
    }

    protected void Poblacion_Atendida_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            TextBox mujeres = (TextBox)e.Row.FindControl("Total_Mujeres");
            TextBox hombres = (TextBox)e.Row.FindControl("Total_Hombres");

            //int id = Convert.ToInt32(Id_Formulario_HiddenField.Value);

            var buscar = (from valor in contexto.Detalle_Poblacion_Atendida where valor.id_formulario == id_formulario select valor).Count();

            if (buscar != 0)
            {
                var hombre_mujeres = contexto.spr_Sumar_Hombres_Mujeres(Convert.ToInt32(id_formulario)).First();

                hombres.Text = hombre_mujeres.Hombres.ToString();
                mujeres.Text = hombre_mujeres.Mujeres.ToString();
            }
        }
    }

    protected void Ver_Info_Oficina_Operativa_Click(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        id_oficina = Convert.ToInt32(Oficinas_Operativas_GridView.DataKeys[gr.RowIndex].Value);

        var leer = (from buscar in contexto.Detalles_Oficinas_Operativas where buscar.id_oficina_operativa == id_oficina select buscar).First();

        Calle_Oficinas_Operativas_TextBox.Text = leer.calle_oficina_operativa;
        Numero_Oficinas_Operativas_TextBox.Text = leer.numero_oficina_operativa;
        Entre_Calles_Oficinas_Operativas_TextBox.Text = leer.entre_calles_oficina_operativa;
        Telefono_Oficina_Operativa_TextBox.Text = leer.telelefono_oficinas_operativas;
        Horario_Oficina_Operativa_TextBox.Text = leer.horarios;
        CP_Oficina_Operativa_TextBox.Text = leer.cp_oficina_operativa;
        Colonia_Oficinas_Operativas_TextBox.Text = leer.colonia_oficina_operativa;

        Oficinas_Operativas_GridView.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P1", "$('#div_presentacion_P1').modal('show');", true);
    }

    protected void Verificar_Autorizar_Click(object sender, EventArgs e)
    {
        if (tipo_formulario == "V")
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
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Se mando a la autorizacion final.');", true);
        }
        else
        {
            var institucion = (from leer in contexto.Formulario_Estandar where leer.id_formulario_estandar == id_formulario select leer).First();

            var estado_registro = (from devolver in contexto.Registro_Usuarios where devolver.id_institucion == institucion.id_institucion && devolver.id_formulario_estandar == id_formulario select devolver).First();
            estado_registro.estatu_actual_registro = 5;

            ReenviarCorreo(estado_registro.correo, "Su tramite finalizo con exito favor de comunicarse con la institucion para continuar con el proceso", 1);

            contexto.SaveChanges();

            //ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('El registro finalizo con exito se le comunicara a la institucion.');", true);
        }


    }
}