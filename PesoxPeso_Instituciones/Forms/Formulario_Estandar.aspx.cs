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

    int institucion;
    DateTime vfecha;
    int result;
    double resultd;
    int id_registro;
    int estado_registro;

    decimal v_kwh_base = 0;
    decimal v_kwh_base2 = 0;
    decimal v_kwh_base3 = 0;

    bool valor;

    static bool nueva_Of_Operativa = true;
    static int id_oficina = 0;

    private List<object> listCampos = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //Costo_Estimado_Programa_GridView.DataBind();
        id_registro = Convert.ToInt32(Session["sist_Id_Usuario"].ToString());

        int a = Convert.ToInt32(Session["sist_Id_Usuario"].ToString());

        var usuario = (from seleccionar in contexto.Registro_Usuarios where seleccionar.id_registro == a select seleccionar).First();

        estado_registro = usuario.estatu_actual_registro;
        institucion = Convert.ToInt32(Session["id_institucion"].ToString());

        if (id_oficina == 0)
        {
            Agregar_Oficina_Operativa_Button.Text = "Agregar Oficina Operativa";
        }

        if (!IsPostBack)
        {
            cargar_formulario();
            if (estado_registro != 1)
            {
                Terminar_Registro_Button.CssClass = "btn btn - outline btn - default";
                Terminar_Registro_Button.Enabled = false;

                Adjuntar_Archivos_Button.CssClass = "btn btn - outline btn - default";
                Adjuntar_Archivos_Button.Enabled = false;

                Salir_Sin_Guardar_Button.CssClass = "btn btn - outline btn - default";
                Salir_Sin_Guardar_Button.Enabled = !Salir_Sin_Guardar_Button.Enabled;
            }
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
            //Poblacion_Atendida_GridView.DataBind();
        }
    }

    protected void Botones_Click(Object sender, CommandEventArgs e)
    {
        if (estado_registro == 1)
        {
            switch (e.CommandName)
            {
                case "div_registro_P1":
                    guardar_div_registro_P1();
                    Guarda_Sectores_Rubros();
                    break;

                case "div_registro_P2":
                    guardar_div_registro_P2();
                    break;

                case "div_registro_P3":
                    guardar_div_registro_P3();
                    break;

                case "div_acreditar_P1":
                    guardar_div_acreditar_P1();
                    break;

                case "div_acreditar_P2":
                    guardar_div_acreditar_P2();
                    break;

                case "div_acreditar_P3":
                    guardar_div_acreditar_P3();
                    Guardar_Detalle_Reforma_Constitutiva();
                    break;

                case "div_acreditar_P4":
                    guardar_div_acreditar_P4();
                    break;

                case "div_acreditar_P5":
                    guardar_div_acreditar_P5();
                    break;

                case "div_presentacion_P2":
                    guardar_div_presentacion_P2();
                    break;

                case "div_presentacion_P3":
                    guardar_div_presentacion_P3();
                    break;

                case "div_presentacion_P4":
                    guardar_div_presentacion_P4();
                    Guardar_Detalle_Tiempo_Estimado();
                    break;

                case "div_presentacion_P5":
                    guardar_div_presentacion_P5();
                    Guardar_Detalle_Tiempo_Estimado();
                    break;

                case "div_presentacion_P6":
                    guardar_div_presentacion_P6();
                    Guarda_Tipo_Poblacion();
                    break;

                case "div_presentacion_P7":
                    Guardar_Poblacion_Atendida();
                    break;

                case "div_presentacion_P8":
                    guardar_div_presentacion_P8();
                    break;

                case "div_presentacion_P9":
                    guardar_div_presentacion_P9();
                    break;

                case "div_presentacion_P10":
                    Guardar_Servicio_Salud();
                    Guardar_Seguridad_Social();
                    break;

                case "div_presentacion_P11":
                    guardar_div_presentacion_P11();
                    Guardar_Piso();
                    Guardar_Techo();
                    Guardar_Muro();
                    Guardar_Servicios_Basicos();
                    break;

                case "div_presentacion_P12":
                    guardar_div_presentacion_P12();
                    Guardar_Acceso_Alimentacion();
                    Guardar_Acceso_Comunicacion();
                    break;

                case "div_presentacion_P13":
                    Guardar_Oficinas_Relacion();
                    break;

                case "div_situacion_financiera_P1":
                    guardar_div_situacion_financiera_P1();
                    break;

                case "div_situacion_financiera_P2":
                    guardar_div_situacion_financiera_P2();
                    Guardar_Principales_Ingresos();
                    break;

                case "div_situacion_financiera_P3":
                    guardar_div_situacion_financiera_P3();
                    Guardar_Principales_Egresos();
                    break;

                case "div_cumplimiento_P1":
                    guardar_div_cumplimiento_P1();
                    break;

            }

            string v_div = e.CommandArgument.ToString();

            //if (e.CommandName == "div_registro_P2")
            //{
            //    valor = Calcular_Total_Personas_Laborando();
            //    if (valor == false)
            //    {
            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
            //        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_registro_P2", "$('#div_registro_P2').modal('show');", true);

            //        Remunerados_TextBox.BackColor = System.Drawing.Color.Red;
            //        Voluntarios_TextBox.BackColor = System.Drawing.Color.Red;
            //    }
            //}

            //if(e.CommandName != "div_registro_P2" || e.CommandName == "div_registro_P2" && valor == true)
            //{
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), v_div, "$('#" + v_div + "').modal('show');", true);
            //}

            switch (v_div)
            {
                case "div_registro_P1":
                    Sector_Rubros_GridView.DataBind();
                    break;
                case "div_acreditar_P3":
                    Reformas_Constitutivas_GridView.DataBind();
                    break;
                case "div_presentacion_P4":
                    Tiempos_Estimados_GridView.DataBind();
                    break;
                case "div_presentacion_P5":
                    Costo_Estimado_Programa_GridView.DataBind();
                    break;
                case "div_presentacion_P6":
                    Tipo_Poblacion_GridView.DataBind();
                    break;
                case "div_presentacion_P10":
                    Servicio_Salud_GridView.DataBind();
                    Seguridad_Social_GridView.DataBind();
                    break;
                case "div_presentacion_P11":
                    Piso_GridView.DataBind();
                    Techo_GridView.DataBind();
                    Muro_GridView.DataBind();
                    Servicios_Basicos_GridView.DataBind();
                    break;
                case "div_presentacion_P12":
                    Consumo_Dia_GridView.DataBind();
                    Acceso_Comunicacion_GridView.DataBind();
                    break;
                case "div_presentacion_P13":
                    Oficinas_Relacion_GridView.DataBind();
                    break;
                case "div_presentacion_P7":
                    Poblacion_Atendida_GridView.DataBind();
                    break;
                case "div_situacion_financiera_P2":
                    Principales_Fuentes_GridView.DataBind();
                    break;
                case "div_situacion_financiera_P3":
                    Principales_Egresos_GridView.DataBind();
                    break;
            }
            cargar_formulario();
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('No puede editar la informacion, actualmente el formulario se encuentra en revision.');", true);
        }
    }

    private void guardar_div_registro_P1()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.nombre_dominio = Nombre_Dominio_TextBox.Text;
        FE.nombre_programa = Nombre_Programa_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_registro_P2()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.objetivo_social_programa = Objetivo_Social_Programa_TextBox.Text;
        FE.fecha_constitucion = DateTime.TryParse(Fecha_Constitucion_TextBox.Text, out vfecha) ? Convert.ToDateTime(Fecha_Constitucion_TextBox.Text) : vfecha;
        FE.num_personas_laborando = Int32.TryParse(Num_Personas_Laborando_TextBox.Text, out result) ? result : 0;
        FE.remunerados = Int32.TryParse(Remunerados_TextBox.Text, out result) ? result : 0;
        FE.voluntarios = Int32.TryParse(Voluntarios_TextBox.Text, out result) ? result : 0;
        FE.areas_atencion = Areas_atencion_TextBox.Text;
        FE.areas_apoyo = Areas_Apoyo_TextBox.Text;
        Nombre_Programa_2_TextBox.Text = Nombre_Programa_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_registro_P3()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.año_actual = Int32.TryParse(Año_Actual_TextBox.Text, out result) ? result : 0;
        FE.año_anterior = Int32.TryParse(Año_Anterior_TextBox.Text, out result) ? result : 0;
        FE.total_ingresos = Double.TryParse(Total_Ingresos_TextBox.Text, out resultd) ? resultd : 0;
        FE.total_donativos = Double.TryParse(Total_Donativos_TextBox.Text, out resultd) ? resultd : 0;
        FE.total_egresos = Double.TryParse(Total_Egresos_TextBox.Text, out resultd) ? resultd : 0;
        FE.monto_solicitado = Double.TryParse(Monto_Solicitado_TextBox.Text, out resultd) ? resultd : 0;

        contexto.SaveChanges();
    }

    private void guardar_div_acreditar_P1()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.denominacion = Nombre_Institucion_TextBox.Text;
        FE.siglas = Siglas_TextBox.Text;
        FE.telefono = Telefono_TextBox.Text;
        FE.correo_electronico = Correo_electronico_TextBox.Text;
        FE.pagina_web = Pagina_Web_TextBox.Text;
        FE.red_social_institucion = Red_Social_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_acreditar_P2()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.calle_numero = Calle_Numero_TextBox.Text;
        FE.id_municipio = Convert.ToInt32(Municipio_DropDownList.SelectedValue);
        FE.colonia = Colonia_TextBox.Text;

        FE.correo_dom_fiscal = Correo_Domicilio_Fiscal.Text;
        FE.CP = CP_TextBox.Text;
        FE.celular = Celular_TextBox.Text;
        FE.telefonos = Telefonos_TextBox.Text;

        FE.id_personalidad_juridica = Convert.ToInt32(Personalidad_Juridica_DropDownList.SelectedValue);
        FE.otro_personalidad_juridica = Otro_Personalidad_Juridica_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_acreditar_P3()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.num_escritura = Num_Escritura_TextBox.Text;
        FE.volumen_num_escritura = Volumen_Num_Escritura_TextBox.Text;
        FE.fecha_escritura = (DateTime.TryParse(Fecha_Escritura_TextBox.Text, out vfecha) ? Convert.ToDateTime(Fecha_Escritura_TextBox.Text) : vfecha);
        FE.nombre_notario_publico = Nombre_Notario_Pulico_TextBox.Text;
        FE.numero_notario_publico = Numero_Notario_TextBox.Text;
        FE.lugar_notario_publico = Lugar_Notario_TextBox.Text;
        FE.registro_propiedad = Registro_Propiedad_TextBox.Text;
        FE.volumen_registro_propiedad = Volumen_Registro_Propiedad_TextBox.Text;
        FE.fecha_registro_propiedad = (DateTime.TryParse(Fecha_Registro_Propiedad_TextBox.Text, out vfecha) ? Convert.ToDateTime(Fecha_Registro_Propiedad_TextBox.Text) : vfecha);
        contexto.SaveChanges();
    }

    private void guardar_div_acreditar_P4()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.permiso_expedir_recibos = Convert.ToInt32(Permiso_Expedir_Recibos_DropDownList.SelectedIndex);
        FE.fecha_permiso = (DateTime.TryParse(Fecha_Permisos_TextBox.Text, out vfecha) ? Convert.ToDateTime(Fecha_Permisos_TextBox.Text) : vfecha);
        FE.fecha_ultima_publicacion = (DateTime.TryParse(Fecha_Ultima_Publicacion_TextBox.Text, out vfecha) ? Convert.ToDateTime(Fecha_Ultima_Publicacion_TextBox.Text) : vfecha);
        FE.seccion = Seccion_TextBox.Text;
        FE.pagina = Pagina_TextBox.Text;
        FE.id_organo_supremo = Convert.ToInt32(Organo_Supremo_DropDownList.SelectedIndex);
        FE.otro_organo_supremo = Otro_Organo_Supremo_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_acreditar_P5()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.nombre_representante_legal = Nombre_Representante_Legal_TextBox.Text;
        FE.calle_representante_legal = Calle_Representante_Legal_TextBox.Text;
        FE.numero_representante_legal = Numero_Representante_Legal_TextBox.Text;
        FE.colonia_representante_legal = Colonia_Representante_Legal_TextBox.Text;
        FE.id_ciudad_representante_legal = Convert.ToInt32(Ciudad_Representante_Legal_DropDownList.SelectedValue);
        FE.telefono_representante_legal = Telefono_Representante_Legal_TextBox.Text;
        FE.celular_representante_legal = Celular_Representante_Legal_TextBox.Text;
        FE.correo_representante = Correo_Representante_TextBox.Text;
        FE.rfc_representante = Rfc_Representante_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_presentacion_P2()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.descripcion_programa = Descripcion_Programa_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_presentacion_P3()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.meta_programa = Meta_Programa_TextBox.Text;
        FE.diagnostico_situacional = Diagnostico_Situacional_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_presentacion_P4()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.nombre_enlace = Nombre_Enlace_TextBox.Text;
        FE.telefono_enlace = Telefono_Enlace_TextBox.Text;
        FE.correo_enlace = Correo_Enlace_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_presentacion_P5()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.justificacion_programa = Justificacion_Programa_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_presentacion_P6()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.poblacion_minima = Int32.TryParse(poblacion_Minima_TextBox.Text, out result) ? result : 0;
        FE.poblacion_maxima = Int32.TryParse(poblacion_Maxima_TextBox.Text, out result) ? result : 0;
        FE.poblacion_actual = Int32.TryParse(poblacion_Actual_TextBox.Text, out result) ? result : 0;


        contexto.SaveChanges();
    }

    private void guardar_div_presentacion_P8()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.tipo_ingreso_poblacion = Tipo_Ingreso_Poblacion_DropDownList.SelectedIndex;
        FE.nivel_ingreso_poblacion = Nivel_Ingreso_Poblacion_DropDownList.SelectedIndex;

        contexto.SaveChanges();
    }

    private void guardar_div_presentacion_P9()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        double valor;

        FE.rezago_educativo = Rezago_Educativo_DropDownList.SelectedIndex;
        FE.porcentaje_poblacion_atendida = (Double.TryParse(Porcentaje_Poblacion_Atendida_TextBox.Text, out valor) ? Convert.ToDouble(Porcentaje_Poblacion_Atendida_TextBox.Text) : 0);

        if (Rezago_Educativo_DropDownList.SelectedIndex == 0 || Rezago_Educativo_DropDownList.SelectedIndex == 2)
        {
            FE.personas_hasta_15 = Personas_hasta_15_DropDownList.SelectedIndex;
            FE.personas_hasta_1982 = Personas_antes_1982_DropDownList.SelectedIndex;
            FE.personas_apartir_1982 = Personas_Apartir_1982_DropDownList.SelectedIndex;
        }


        contexto.SaveChanges();
    }

    private void guardar_div_presentacion_P11()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.promedio_personas_viviendo = Int32.TryParse(Promedio_Personas_Vivienda_TextBox.Text, out result) ? result : 0;
        FE.num_habitaciones = Int32.TryParse(Num_Habitaciones_TextBox.Text, out result) ? result : 0;

        FE.piso_otro = ((TextBox)Piso_GridView.FooterRow.FindControl("Piso_Otros_TextBox")).Text;
        FE.techo_otro = ((TextBox)Techo_GridView.FooterRow.FindControl("Techo_Otros_TextBox")).Text;
        FE.muro_otro = ((TextBox)Muro_GridView.FooterRow.FindControl("Muro_Otros_TextBox")).Text;


        contexto.SaveChanges();
    }

    private void guardar_div_presentacion_P12()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.observaciones_acceso = Observaciones_Acceso_TextBox.Text;

        contexto.SaveChanges();
    }

    private void guardar_div_situacion_financiera_P1()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        FE.patrimonio_institucion = Patrimonio_Institucion_DropDownList.SelectedIndex;

        if (Patrimonio_Institucion_DropDownList.SelectedIndex == 0)
        {
            FE.propiedades_inmuebles = Propiedades_Inmuebles_DropDownList.SelectedIndex;
            FE.inversiones = Inversiones_DropDownList.SelectedIndex;
            FE.fideicomisos = Fideicomisos_DropDownList.SelectedIndex;
            FE.valor_aproximado_inmuebles = Double.TryParse(Valor_Aproximado_Inmuebles_TextBox.Text, out resultd) ? resultd : 0;
            FE.valor_aproximado_inversiones = Double.TryParse(Valor_Aproximado_Inversiones_TextBox.Text, out resultd) ? resultd : 0;
            FE.valor_aproximado_fideicomisos = Double.TryParse(Valor_Aproximados_Fideicomisos_TextBox.Text, out resultd) ? resultd : 0;
        }

        contexto.SaveChanges();
    }

    private void guardar_div_situacion_financiera_P2()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        contexto.SaveChanges();
    }

    private void guardar_div_situacion_financiera_P3()
    {
        //int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        //var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();
        //contexto.SaveChanges();
    }

    private void guardar_div_cumplimiento_P1()
    {
        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var FE = (from buscar in contexto.Formulario_Estandar where buscar.id_formulario_estandar == id_formulario select buscar).First();

        //FE.nombre_razon = Nombre_Razon_TextBox.Text;
        //FE.domicilio_fiscal = Domicilio_Fiscal_TextBox.Text;
        //FE.clave_registro = Clave_Registro_TextBox.Text;

        FE.impuesto_federal = Impuesto_Federal_DropDownList.SelectedIndex;
        FE.adeudos_fiscales = Adeudos_Fiscales_DropDownList.SelectedIndex;

        contexto.SaveChanges();
    }

    protected void Adjuntar_Archivos_Button_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Forms/Requisitos_Documentacion.aspx");
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

            Nombre_Institucion_Encabezado_Label.Text = select.nombre_institucion + " " + select.sucursal;

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
            Municipio_DropDownList.SelectedIndex = FE.id_municipio;
            Colonia_TextBox.Text = FE.colonia;
            CP_TextBox.Text = FE.CP;
            Celular_TextBox.Text = FE.celular;
            Telefonos_TextBox.Text = FE.telefonos;
            Correo_Domicilio_Fiscal.Text = FE.correo_dom_fiscal;
            Personalidad_Juridica_DropDownList.SelectedIndex = FE.id_personalidad_juridica;

            if (FE.id_personalidad_juridica == 2)
            {
                Otro_Personalidad_Juridica_TextBox.Text = FE.otro_personalidad_juridica;
                Otro_Personalidad_Juridica_TextBox.ReadOnly = false;
                Otro_Personalidad_Juridica_TextBox.BackColor = ColorTranslator.FromHtml("#ffffea");
            }
            else
            {
                Otro_Personalidad_Juridica_TextBox.ReadOnly = true;
                Otro_Personalidad_Juridica_TextBox.BackColor = Color.LightGray;
                Otro_Personalidad_Juridica_TextBox.Text = "";
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

    private string Obtener_Fecha(DateTime fecha_completa)
    {
        string fecha = fecha_completa.ToString("d");
        return fecha;
    }

    //PUNTO II
    protected void Guarda_Sectores_Rubros()
    {
        // BARREMOS REGISTRO POR REGISTRO
        foreach (GridViewRow grow in Sector_Rubros_GridView.Rows)
        {
            // TOMAMOS EL CHECKBOX
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_sector_rubros";
            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_sector_rubro", Sector_Rubros_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    //PUNTO 2.5
    protected void Guardar_Detalle_Reforma_Constitutiva()
    {
        foreach (GridViewRow grow in Reformas_Constitutivas_GridView.Rows)
        {
            TextBox detalle = (TextBox)grow.FindControl("Detalle_Reforma_TextBox");

            TextBox fecha = (TextBox)grow.FindControl("Fecha_Reforma_TextBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_reformas_constitutivas";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[4];

                Params[0] = new SqlParameter("@id_reforma_contitutiva", Reformas_Constitutivas_GridView.DataKeys[grow.RowIndex].Value);
                Params[0].SqlDbType = SqlDbType.Int;

                Params[1] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[1].SqlDbType = SqlDbType.Int;

                Params[2] = new SqlParameter("@reforma", detalle.Text);
                Params[2].SqlDbType = SqlDbType.NVarChar;

                if (fecha.Text == "")
                {
                    fecha.Text = "13-05-1990";
                }

                Params[3] = new SqlParameter("@fecha", Convert.ToDateTime(fecha.Text));
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
        }
    }

    protected void Eliminar_Reforma_Constitutiva_Button_Click(object sender, EventArgs e)
    {
        Guardar_Detalle_Reforma_Constitutiva();

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

    //PUNTO 3.7
    protected void Guardar_Detalle_Tiempo_Estimado()
    {
        foreach (GridViewRow grow in Tiempos_Estimados_GridView.Rows)
        {
            TextBox fecha_inicial = (TextBox)grow.FindControl("Fecha_Inicial_TextBox");

            TextBox fecha_final = (TextBox)grow.FindControl("Fecha_final_TextBox");

            TextBox descripcion = (TextBox)grow.FindControl("Descripcion_Tiempo_TextBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_tiempo_estimado";


            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[5];

                Params[0] = new SqlParameter("@id_tiempo_estimado", Tiempos_Estimados_GridView.DataKeys[grow.RowIndex].Value);
                Params[0].SqlDbType = SqlDbType.Int;

                Params[1] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[1].SqlDbType = SqlDbType.Int;

                Params[2] = new SqlParameter("@fecha_inicial", Convert.ToDateTime(fecha_inicial.Text));
                Params[2].SqlDbType = SqlDbType.Date;

                Params[3] = new SqlParameter("@fecha_final", Convert.ToDateTime(fecha_final.Text));
                Params[3].SqlDbType = SqlDbType.Date;

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
        }
    }

    protected void Eliminar_Tiempo_Estimado_Button_Click(object sender, EventArgs e)
    {
        Guardar_Detalle_Tiempo_Estimado();

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

    protected void Agregar_Etapa_Button_Click(object sender, EventArgs e)
    {
        Guardar_Detalle_Tiempo_Estimado();

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

    //PUNTO 3.9
    protected void Detalle_Costo_Estimado_TextBox_TextChanged(object sender, EventArgs e)
    {
        Detalle_Costo_Estimado();
        //GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;
        //TextBox chk = (TextBox)sender;

        //Data objData = new Data();
        //string strStoreProcedure = "spr_actualiza_detalle_costo_estimado";

        //try
        //{
        //    objData.OpenConnection();

        //    SqlParameter[] Params = new SqlParameter[4];

        //    Params[0] = new SqlParameter("@id_costo_estimado", Costo_Estimado_Programa_GridView.DataKeys[gr.RowIndex].Value);
        //    Params[0].SqlDbType = SqlDbType.Int;

        //    Params[1] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
        //    Params[1].SqlDbType = SqlDbType.Int;

        //    TextBox concepto = gr.FindControl("Detalle_Concepto_TextBox") as TextBox;
        //    Params[2] = new SqlParameter("@concepto", Convert.ToString(concepto.Text));
        //    Params[2].SqlDbType = SqlDbType.VarChar;

        //    TextBox monto = gr.FindControl("Detalle_Monto_TextBox") as TextBox;
        //    Params[3] = new SqlParameter("@monto", Convert.ToDouble(monto.Text));
        //    Params[3].SqlDbType = SqlDbType.Float;

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

        //Costo_Estimado_Programa_GridView.DataBind();

        //ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        //ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P5", "$('#div_presentacion_P5').modal('show');", true);
    }

    protected void Detalle_Costo_Estimado()
    {
        foreach (GridViewRow grow in Costo_Estimado_Programa_GridView.Rows)
        {
            TextBox concepto = (TextBox)grow.FindControl("Detalle_Concepto_TextBox");

            TextBox monto = (TextBox)grow.FindControl("Detalle_Monto_TextBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_costo_estimado";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[4];

                Params[0] = new SqlParameter("@id_costo_estimado", Costo_Estimado_Programa_GridView.DataKeys[grow.RowIndex].Value);
                Params[0].SqlDbType = SqlDbType.Int;

                Params[1] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[1].SqlDbType = SqlDbType.Int;

                Params[2] = new SqlParameter("@concepto", Convert.ToString(concepto.Text));
                Params[2].SqlDbType = SqlDbType.VarChar;

                //if (monto.Text == "")
                //{
                //    monto.Text = "0";
                //}

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
        }

        Costo_Estimado_Programa_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P5", "$('#div_presentacion_P5').modal('show');", true);
    }

    protected void Agregar_Costo_Button_Click(object sender, EventArgs e)
    {
        v_kwh_base = 0;
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

        //Detalle_Costo_Estimado();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P5", "$('#div_presentacion_P5').modal('show');", true);
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

    protected void Eliminar_Costo_Button_Click(object sender, EventArgs e)
    {

        //Detalle_Costo_Estimado();
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

    //PUNTO 3.10
    protected void Guarda_Tipo_Poblacion()
    {
        foreach (GridViewRow grow in Tipo_Poblacion_GridView.Rows)
        {
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_tipo_poblacion";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_tipo_poblacion", Tipo_Poblacion_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    //PUNTO 3.11
    protected void Guardar_Poblacion_Atendida()
    {
        foreach (GridViewRow grow in Poblacion_Atendida_GridView.Rows)
        {
            TextBox hombres = (TextBox)grow.FindControl("Poblacion_Atendida_Hombres_TextBox");

            TextBox mujeres = (TextBox)grow.FindControl("Poblacion_Atendida_Mujeres_TextBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_poblacion_atendida";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[4];

                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;

                Params[1] = new SqlParameter("@id_poblacion_atendida", Poblacion_Atendida_GridView.DataKeys[grow.RowIndex].Value);
                Params[1].SqlDbType = SqlDbType.Int;

                Params[2] = new SqlParameter("@cantidad_hombres", hombres.Text);
                Params[2].SqlDbType = SqlDbType.Text;

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
        }
    }

    //PUNTO 3.12.3
    protected void Guardar_Servicio_Salud()
    {
        foreach (GridViewRow grow in Servicio_Salud_GridView.Rows)
        {
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_servicios_salud";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_servicio_salud", Servicio_Salud_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    //PUNTO 3.12.4
    protected void Guardar_Seguridad_Social()
    {
        foreach (GridViewRow grow in Seguridad_Social_GridView.Rows)
        {
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_seguridad_social";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_seguridad_social", Seguridad_Social_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    //PUNTO 3.12.5
    protected void Guardar_Piso()
    {
        foreach (GridViewRow grow in Piso_GridView.Rows)
        {
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_piso";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_piso", Piso_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    protected void Guardar_Techo()
    {
        foreach (GridViewRow grow in Techo_GridView.Rows)
        {
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_techo";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_techo", Techo_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    protected void Guardar_Muro()
    {
        foreach (GridViewRow grow in Muro_GridView.Rows)
        {
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_muro";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_muro", Muro_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    //PUNTO 3.12.6
    protected void Guardar_Servicios_Basicos()
    {
        foreach (GridViewRow grow in Servicios_Basicos_GridView.Rows)
        {
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_servicios_basicos";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_servicios_basicos", Servicios_Basicos_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    //PUNTO 3.12.7
    protected void Guardar_Acceso_Alimentacion()
    {
        foreach (GridViewRow grow in Consumo_Dia_GridView.Rows)
        {
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_consumo_dia";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_consumo_dia", Consumo_Dia_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    //PUNTO 3.12.8
    protected void Guardar_Acceso_Comunicacion()
    {
        foreach (GridViewRow grow in Acceso_Comunicacion_GridView.Rows)
        {
            CheckBox chk = (CheckBox)grow.FindControl("Seleccionar_CheckBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_acceso_comunicacion";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];
                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;
                Params[1] = new SqlParameter("@id_acceso_comunicacion", Acceso_Comunicacion_GridView.DataKeys[grow.RowIndex].Value);
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
        }
    }

    //PUNTO 3.13
    protected void Guardar_Oficinas_Relacion()
    {
        foreach (GridViewRow grow in Oficinas_Relacion_GridView.Rows)
        {
            TextBox txt = (TextBox)grow.FindControl("Detalle_Institucion_TextBox");

            TextBox txt2 = (TextBox)grow.FindControl("Detalle_Objetivo_Beneficio_TextBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_oficina_relacion";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[4];

                Params[0] = new SqlParameter("@id_oficina_relacion", Oficinas_Relacion_GridView.DataKeys[grow.RowIndex].Value);
                Params[0].SqlDbType = SqlDbType.Int;

                Params[1] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[1].SqlDbType = SqlDbType.Int;

                Params[2] = new SqlParameter("@institucion", Convert.ToString(txt.Text));
                Params[2].SqlDbType = SqlDbType.NVarChar;

                Params[3] = new SqlParameter("@objetivo_beneficio", Convert.ToString(txt2.Text));
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
        }
    }

    //PUNTO 4.5
    protected void Guardar_Principales_Ingresos()
    {
        foreach (GridViewRow grow in Principales_Fuentes_GridView.Rows)
        {
            TextBox promedio = (TextBox)grow.FindControl("Importe_Promedio_Anual_TextBox");

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_principales_fuentes";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[3];

                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;

                Params[1] = new SqlParameter("@id_principales_fuentes", Principales_Fuentes_GridView.DataKeys[grow.RowIndex].Value);
                Params[1].SqlDbType = SqlDbType.Int;

                Params[2] = new SqlParameter("@importe_promedio", Convert.ToDouble(promedio.Text));
                Params[2].SqlDbType = SqlDbType.Float;

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
        }
    }

    protected void Importe_Promedio_Anual_TextBox_TextChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        TextBox promedio = (TextBox)gr.FindControl("Importe_Promedio_Anual_TextBox");

        Data objData = new Data();
        string strStoreProcedure = "spr_actualiza_detalle_principales_fuentes";

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[3];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@id_principales_fuentes", Principales_Fuentes_GridView.DataKeys[gr.RowIndex].Value);
            Params[1].SqlDbType = SqlDbType.Int;

            if (promedio.Text == "")
            {
                promedio.Text = "0";
            }

            Params[2] = new SqlParameter("@importe_promedio", Convert.ToDouble(promedio.Text));
            Params[2].SqlDbType = SqlDbType.Float;

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

    //PUNTO 4.6
    protected void Guardar_Principales_Egresos()
    {
        foreach (GridViewRow grow in Principales_Egresos_GridView.Rows)
        {
            TextBox importe = grow.FindControl("Importe_Promedio_Anual_Egresos_TextBox") as TextBox;
            TextBox porcentaje = grow.FindControl("Porcentaje_Importe_Egresos_TextBox") as TextBox;

            Data objData = new Data();
            string strStoreProcedure = "spr_actualiza_detalle_principales_egresos";

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[4];

                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;

                Params[1] = new SqlParameter("@id_principal_egreso", Principales_Egresos_GridView.DataKeys[grow.RowIndex].Value);
                Params[1].SqlDbType = SqlDbType.Int;

                Params[2] = new SqlParameter("@importe_egresos", Convert.ToDouble(importe.Text));
                Params[2].SqlDbType = SqlDbType.Float;

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
        }
    }

    protected void Importe_Promedio_Anual_Egresos_TextBox_TextChanged(object sender, EventArgs e)
    {
        GridViewRow gr = ((Control)sender).NamingContainer as GridViewRow;

        TextBox importe = gr.FindControl("Importe_Promedio_Anual_Egresos_TextBox") as TextBox;
        TextBox porcentaje = gr.FindControl("Porcentaje_Importe_Egresos_TextBox") as TextBox;

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

            if (importe.Text == "")
            {
                importe.Text = "0";
            }

            Params[2] = new SqlParameter("@importe_egresos", Convert.ToDouble(importe.Text));
            Params[2].SqlDbType = SqlDbType.Float;

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
        Principales_Egresos_GridView.DataBind();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_situacion_financiera_P3", "$('#div_situacion_financiera_P3').modal('show');", true);
    }

    protected void Agregar_Oficinas_Relacion_Button_Click(object sender, EventArgs e)
    {
        Guardar_Oficinas_Relacion();

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
        Guardar_Oficinas_Relacion();
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

    protected void Agregar_Reforma_Constitutiva_Button_Click(object sender, EventArgs e)
    {
        Guardar_Detalle_Reforma_Constitutiva();

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
        if (Calle_Oficinas_Operativas_TextBox.Text != "" || Numero_Oficinas_Operativas_TextBox.Text != "" || Entre_Calles_Oficinas_Operativas_TextBox.Text != ""
    || Telefono_Oficina_Operativa_TextBox.Text != "" || Horario_Oficina_Operativa_TextBox.Text != "" || CP_Oficina_Operativa_TextBox.Text != "")
        {
            TextBox campo_texto = sender as TextBox;

            Data objData = new Data();

            string strStoreProcedure = "";
            int num_param = 0;

            if (id_oficina == 0)
            {
                strStoreProcedure = "spr_agrega_detalle_oficinas_operativas";
                num_param = 9;
            }
            else
            {
                strStoreProcedure = "sp_actualiza_oficina_operativa";
                num_param = 10;
            }

            try
            {
                objData.OpenConnection();

                SqlParameter[] Params = new SqlParameter[num_param];

                Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
                Params[0].SqlDbType = SqlDbType.Int;

                Params[1] = new SqlParameter("@calle", Calle_Oficinas_Operativas_TextBox.Text);
                Params[1].SqlDbType = SqlDbType.NVarChar;

                Params[2] = new SqlParameter("@numero", Numero_Oficinas_Operativas_TextBox.Text);
                Params[2].SqlDbType = SqlDbType.NVarChar;

                Params[3] = new SqlParameter("@colonia", Colonia_Oficinas_Operativas_TextBox.Text);
                Params[3].SqlDbType = SqlDbType.NVarChar;

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

                if (nueva_Of_Operativa == false)
                {
                    Params[9] = new SqlParameter("@id_oficina", id_oficina);
                    Params[9].SqlDbType = SqlDbType.NVarChar;
                }

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

            Calle_Oficinas_Operativas_TextBox.Text = "";
            Numero_Oficinas_Operativas_TextBox.Text = "";
            Entre_Calles_Oficinas_Operativas_TextBox.Text = "";
            Telefono_Oficina_Operativa_TextBox.Text = "";
            Horario_Oficina_Operativa_TextBox.Text = "";
            CP_Oficina_Operativa_TextBox.Text = "";
            Colonia_Oficinas_Operativas_TextBox.Text = "";

            Mensaje_Incompleto.Visible = false;
            nueva_Of_Operativa = true;
            id_oficina = 0;
        }

    }

    protected void Agregar_Oficina_Operativa_Button_Command(object sender, CommandEventArgs e)
    {
        TextBox campo_texto = sender as TextBox;

        //if (Calle_Oficinas_Operativas_TextBox.Text != "" && Numero_Oficinas_Operativas_TextBox.Text != "" && Entre_Calles_Oficinas_Operativas_TextBox.Text != ""
        //    && Telefono_Oficina_Operativa_TextBox.Text != "" && Horario_Oficina_Operativa_TextBox.Text != "" && CP_Oficina_Operativa_TextBox.Text != "")
        //{

        Data objData = new Data();
        string strStoreProcedure = "";
        int num_param = 0;

        if (id_oficina == 0)
        {
            strStoreProcedure = "spr_agrega_detalle_oficinas_operativas";
            num_param = 9;
        }
        else
        {
            strStoreProcedure = "sp_actualiza_oficina_operativa";
            num_param = 10;
        }

        try
        {
            objData.OpenConnection();

            SqlParameter[] Params = new SqlParameter[num_param];

            Params[0] = new SqlParameter("@id_formulario", Convert.ToInt32(Id_Formulario_HiddenField.Value));
            Params[0].SqlDbType = SqlDbType.Int;

            Params[1] = new SqlParameter("@calle", Calle_Oficinas_Operativas_TextBox.Text);
            Params[1].SqlDbType = SqlDbType.NVarChar;

            Params[2] = new SqlParameter("@numero", Numero_Oficinas_Operativas_TextBox.Text);
            Params[2].SqlDbType = SqlDbType.NVarChar;

            Params[3] = new SqlParameter("@colonia", Colonia_Oficinas_Operativas_TextBox.Text);
            Params[3].SqlDbType = SqlDbType.NVarChar;

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

            if (nueva_Of_Operativa == false)
            {
                Params[9] = new SqlParameter("@id_oficina", id_oficina);
                Params[9].SqlDbType = SqlDbType.NVarChar;
            }

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

        Calle_Oficinas_Operativas_TextBox.Text = "";
        Numero_Oficinas_Operativas_TextBox.Text = "";
        Entre_Calles_Oficinas_Operativas_TextBox.Text = "";
        Telefono_Oficina_Operativa_TextBox.Text = "";
        Horario_Oficina_Operativa_TextBox.Text = "";
        CP_Oficina_Operativa_TextBox.Text = "";
        Colonia_Oficinas_Operativas_TextBox.Text = "";

        Mensaje_Incompleto.Visible = false;
        nueva_Of_Operativa = true;
        id_oficina = 0;
        Agregar_Oficina_Operativa_Button.Text = "Agregar Oficina Operativa";
        Limpiar_Button.Visible = false;
        //}
        //else
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P1", "$('#div_presentacion_P1').modal('show');", true);

        //    Mensaje_Incompleto.Visible = true;
        //}
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

        Calle_Oficinas_Operativas_TextBox.Text = "";
        Numero_Oficinas_Operativas_TextBox.Text = "";
        Entre_Calles_Oficinas_Operativas_TextBox.Text = "";
        Telefono_Oficina_Operativa_TextBox.Text = "";
        Horario_Oficina_Operativa_TextBox.Text = "";
        CP_Oficina_Operativa_TextBox.Text = "";
        Colonia_Oficinas_Operativas_TextBox.Text = "";

        Agregar_Oficina_Operativa_Button.Text = "Agregar Oficina Operativa";
        Oficinas_Operativas_GridView.DataBind();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P1", "$('#div_presentacion_P1').modal('show');", true);
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

        nueva_Of_Operativa = false;

        Agregar_Oficina_Operativa_Button.Text = "Actualizar oficina operativa";
        Limpiar_Button.Visible = true;

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P1", "$('#div_presentacion_P1').modal('show');", true);
    }

    protected void Calcular_Total_Personas_Laborando(object sender, EventArgs e)
    {
        int remunerados = 0, voluntarios = 0;
        if (Remunerados_TextBox.Text != "")
        {
            //Remunerados_TextBox.Text = "0";

            remunerados = Convert.ToInt32(Remunerados_TextBox.Text);

        }

        if (Voluntarios_TextBox.Text != "")
        {
            //Voluntarios_TextBox.Text = "0";
            voluntarios = Convert.ToInt32(Voluntarios_TextBox.Text);
        }

        int suma = remunerados + voluntarios;

        Num_Personas_Laborando_TextBox.Text = suma.ToString();


        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_registro_P2", "$('#div_registro_P2').modal('show');", true);

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

    protected void Poblacion_Atendida_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            TextBox mujeres = (TextBox)e.Row.FindControl("Total_Mujeres");
            TextBox hombres = (TextBox)e.Row.FindControl("Total_Hombres");

            int id = Convert.ToInt32(Id_Formulario_HiddenField.Value);

            var buscar = (from valor in contexto.Detalle_Poblacion_Atendida where valor.id_formulario == id select valor).Count();

            if (buscar != 0)
            {
                var hombre_mujeres = contexto.spr_Sumar_Hombres_Mujeres(Convert.ToInt32(Id_Formulario_HiddenField.Value)).First();

                hombres.Text = hombre_mujeres.Hombres.ToString();
                mujeres.Text = hombre_mujeres.Mujeres.ToString();
            }
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

    protected void Imprimir_Click(object sender, EventArgs e)
    {
        csParametro[] SPR_Params = new csParametro[1];
        SPR_Params[0] = new csParametro("@id_formulario", Id_Formulario_HiddenField.Value, DbType.Int32);

        csStoreProcedure[] StoreProcedure = new csStoreProcedure[21];
        StoreProcedure[0] = new csStoreProcedure(SPR_Params, "spr_lee_formulario_estandar", "DataSet_Formulario_Estandar");
        StoreProcedure[1] = new csStoreProcedure(SPR_Params, "spr_Reporte_Sector_Rubros", "DataSet_Reporte_Sector_Rubros");
        StoreProcedure[2] = new csStoreProcedure(SPR_Params, "spr_Reporte_Reformas_Constitutivas", "DataSet_Reporte_Reformas_Constitutivas");
        StoreProcedure[3] = new csStoreProcedure(SPR_Params, "spr_lee_detalle_oficinas_operativas", "DataSet_Oficina_Operativo");
        StoreProcedure[4] = new csStoreProcedure(SPR_Params, "spr_lee_detalle_tiempo_estimado", "DataSet_Reporte_Tiempo_Estimado");
        StoreProcedure[5] = new csStoreProcedure(SPR_Params, "spr_lee_detalle_costo_estimado", "DataSet_Reporte_Costo_Estimado");
        StoreProcedure[6] = new csStoreProcedure(SPR_Params, "spr_Reporte_Tipo_Poblacion", "DataSet_Reporte_Tipo_Poblacion");
        StoreProcedure[7] = new csStoreProcedure(SPR_Params, "spr_lee_detalle_poblacion_atendida", "DataSet_Reporte_Poblacion_Atendida");
        StoreProcedure[8] = new csStoreProcedure(SPR_Params, "spr_Reporte_Servicios_Salud", "DataSet_Reporte_Servicios_Salud");
        StoreProcedure[9] = new csStoreProcedure(SPR_Params, "spr_Reporte_Seguridad_Social", "DataSet_Reporte_Seguridad_Social");
        StoreProcedure[10] = new csStoreProcedure(SPR_Params, "spr_Reporte_Piso", "DataSet_Reporte_Piso");
        StoreProcedure[11] = new csStoreProcedure(SPR_Params, "spr_Reporte_Techo", "DataSet_Reporte_Techo");
        StoreProcedure[12] = new csStoreProcedure(SPR_Params, "spr_Reporte_Muro", "DataSet_Reporte_Muro");
        StoreProcedure[13] = new csStoreProcedure(SPR_Params, "spr_Reporte_Servicios_Basicos", "DataSet_Reporte_Servicios_Basicos");
        StoreProcedure[14] = new csStoreProcedure(SPR_Params, "spr_Reporte_Acceso_Alimentacion", "DataSet_Reporte_Acceso_Alimentacion");
        StoreProcedure[15] = new csStoreProcedure(SPR_Params, "spr_Reporte_Acceso_Comunicacion", "DataSet_Reporte_Acceso_Comunicacion");
        StoreProcedure[16] = new csStoreProcedure(SPR_Params, "spr_lee_detalle_oficinas_relacion", "DataSet_Reporte_Oficinas_Relacion");
        StoreProcedure[17] = new csStoreProcedure(SPR_Params, "spr_lee_detalle_principales_fuentes", "DataSet_Reporte_Principales_Fuentes");
        StoreProcedure[18] = new csStoreProcedure(SPR_Params, "spr_lee_detalle_principales_egresos", "DataSet_Reporte_Principales_Egresos");
        StoreProcedure[19] = new csStoreProcedure(SPR_Params, "spr_Reporte_Personalidad_Juridica", "DataSet_Reporte_Personalidad_Juridica");
        StoreProcedure[20] = new csStoreProcedure(SPR_Params, "spr_Totales_Poblacion_Atendida", "DataSet_Totales_Hombres_Mujeres");


        csReporte Reporte = new csReporte();
        Reporte.Formato = "PDF";
        Reporte.Extencion = "pdf";
        Reporte.ReportEmbeddedResource = "Reportes/Reporte_Formulario_Estandar.rdlc";
        Reporte.ParametrosReporte = new csParametro[] { };
        Reporte.StoreProcedure = StoreProcedure;

        (new csReporteHandler()).Imprimir(Reporte);
    }

    //VERFICAR CAMPOS VACIOS
    private void Lista_Campos()
    {
        listCampos = new List<object>()
        {
            Nombre_Dominio_TextBox,
            Nombre_Programa_TextBox,
            Objetivo_Social_Programa_TextBox,
            Areas_atencion_TextBox,
            Areas_Apoyo_TextBox,
            Año_Actual_TextBox,
            Año_Anterior_TextBox,
            Total_Ingresos_TextBox,
            Total_Donativos_TextBox,
            Total_Egresos_TextBox,
            Monto_Solicitado_TextBox,
            Nombre_Institucion_TextBox,
            Denominacion_TextBox,
            Registro_contribuyente_TextBox,
            Siglas_TextBox,
            Objetivo_Social_TextBox,
            Telefonos_TextBox,
            Correo_electronico_TextBox,
            Pagina_Web_TextBox,
            Red_Social_TextBox,
            Calle_Numero_TextBox,
            Colonia_TextBox,
            CP_TextBox,
            Celular_TextBox,
            Telefonos_TextBox,
            Correo_Domicilio_Fiscal,
            Num_Escritura_TextBox,
            Nombre_Notario_Pulico_TextBox,
            Numero_Notario_TextBox,
            Lugar_Notario_TextBox,
            Registro_Propiedad_TextBox,
            Descripcion_Objeto_Social_TextBox,
            Nombre_Representante_Legal_TextBox,
            Calle_Representante_Legal_TextBox,
            Numero_Representante_Legal_TextBox,
            Colonia_Representante_Legal_TextBox,
            Telefono_Representante_Legal_TextBox,
            Celular_Representante_Legal_TextBox,
            Correo_Representante_TextBox,
            Rfc_Representante_TextBox,
            Calle_Oficinas_Operativas_TextBox,
            Numero_Oficinas_Operativas_TextBox,
            Colonia_Oficinas_Operativas_TextBox,
            CP_Oficina_Operativa_TextBox,
            Entre_Calles_Oficinas_Operativas_TextBox,
            Telefono_Oficina_Operativa_TextBox,
            Horario_Oficina_Operativa_TextBox,
            Descripcion_Programa_TextBox,
            Meta_Programa_TextBox,
            Diagnostico_Situacional_TextBox,
            Nombre_Enlace_TextBox,
            Telefono_Enlace_TextBox,
            Correo_Enlace_TextBox,
            Justificacion_Programa_TextBox,
            poblacion_Minima_TextBox,
            poblacion_Maxima_TextBox,
            poblacion_Actual_TextBox,
            Promedio_Personas_Vivienda_TextBox,
            Num_Habitaciones_TextBox
        };
    }

    private bool Verificar_Campos(List<object> listCampos)
    {
        bool vacio = false;

        for (int x = 0; x < listCampos.Count; x++)
        {
            if (listCampos.GetType().Name == "TextBox")
            {
                TextBox txt = (TextBox)listCampos[x];

                if (txt.Text == "")
                {
                    vacio = true;
                    break;
                }

            }
        }

        return vacio;
    }

    //TERMINAR REGISTRO
    protected void Terminar_Registro_Button_Click(object sender, CommandEventArgs e)
    {
        bool faltan = false;

        string valor = e.CommandArgument.ToString();

        if (valor == "Simular_Guardar")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('La informacion se ha guardado.');", true);
        }
        else if (valor == "Guardar_Todo")
        {
            //Lista_Campos();
            //if (!Verificar_Campos(listCampos))
            //{
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Quedan Campos vacios, Verificar formulario estandar.');", true);
            //}
            //else
            //{

            for (int x = 2; x < 11; x++)
            {
                //var buscar = (from leer in contexto.Archivos_Adjuntos where leer.numero_requisito == x select leer).First();

                if ((from leer in contexto.Archivos_Adjuntos where leer.numero_requisito == x && leer.id_registro_solicitud == id_registro select leer).Count() == 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Faltan documentos del punto " + x + ".');", true);
                    faltan = true;
                    break;
                }
            }

            if (faltan == false)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
                string v_div = e.CommandArgument.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), v_div, "$('#" + v_div + "').modal('show');", true);
            }
            //}
        }

    }

    protected void Confirmar_Llenado_Button_Click(object sender, EventArgs e)
    {
        var registro = (from buscar in contexto.Registro_Usuarios where buscar.id_registro == id_registro select buscar).First();
        registro.estatu_actual_registro = 2;
        contexto.SaveChanges();

        Estatus_Registros estatus = new Estatus_Registros();
        estatus.id_institucion = institucion;
        estatus.id_registro = id_registro;
        estatus.fecha = DateTime.Today;
        estatus.estatus = 2;
        contexto.Estatus_Registros.Add(estatus);
        contexto.SaveChanges();

        int id_formulario = Convert.ToInt32(Id_Formulario_HiddenField.Value);
        var verificar = (from buscar in contexto.Observaciones_Verificacion where buscar.id_formulario == id_formulario select buscar).ToList();

        if (verificar.Count != 0)
        {
            var estatus_registro = (from cambiar in contexto.Registro_Usuarios where cambiar.id_formulario_estandar == id_formulario select cambiar).First();
            estatus_registro.estatu_actual_registro = 3;

            contexto.SaveChanges();
        }

        Imprimir_Button.CssClass = "btn btn-info btn-md";
        Imprimir_Button.Enabled = true;

        Terminar_Registro_Button.CssClass = "btn btn - outline btn - default";
        Terminar_Registro_Button.Enabled = false;

        Adjuntar_Archivos_Button.CssClass = "btn btn - outline btn - default";
        Adjuntar_Archivos_Button.Enabled = false;

        Salir_Sin_Guardar_Button.CssClass = "btn btn - outline btn - default";
        Salir_Sin_Guardar_Button.Enabled = false;
    }

    protected void Home_Click(object sender, EventArgs e)
    {
        Response.Redirect("/Default.aspx");
    }

    protected void Personalidad_Juridica_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Personalidad_Juridica_DropDownList.SelectedIndex == 2)
        {
            guardar_div_acreditar_P2();
            Otro_Personalidad_Juridica_TextBox.ReadOnly = false;
            Otro_Personalidad_Juridica_TextBox.BackColor = ColorTranslator.FromHtml("#ffffea");
        }
        else
        {
            Otro_Personalidad_Juridica_TextBox.Text = "";
            guardar_div_acreditar_P2();
            Otro_Personalidad_Juridica_TextBox.ReadOnly = true;
            Otro_Personalidad_Juridica_TextBox.BackColor = Color.LightGray;
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_acreditar_P2", "$('#div_acreditar_P2').modal('show');", true);
    }

    protected void Permiso_Expedir_Recibos_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Permiso_Expedir_Recibos_DropDownList.SelectedIndex != 1)
        {
            guardar_div_acreditar_P4();
            fecha_permiso.Visible = true;
        }
        else
        {
            guardar_div_acreditar_P4();
            fecha_permiso.Visible = false;
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_acreditar_P4", "$('#div_acreditar_P4').modal('show');", true);
    }

    protected void Organo_Supremo_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Organo_Supremo_DropDownList.SelectedIndex != 3)
        {
            guardar_div_acreditar_P4();
            Otro_Organo_Supremo_TextBox.ReadOnly = true;
            Otro_Organo_Supremo_TextBox.BackColor = Color.LightGray;
        }
        else
        {
            guardar_div_acreditar_P4();
            Otro_Organo_Supremo_TextBox.ReadOnly = false;
            Otro_Organo_Supremo_TextBox.BackColor = ColorTranslator.FromHtml("#ffffea");
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_acreditar_P4", "$('#div_acreditar_P4').modal('show');", true);
    }

    protected void Patrimonio_Institucion_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Patrimonio_Institucion_DropDownList.SelectedIndex == 1)
        {
            ocultar.Visible = false;
        }
        else
        {
            ocultar.Visible = true;
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_situacion_financiera_P1", "$('#div_situacion_financiera_P1').modal('show');", true);
    }

    protected void Propiedades_Inmuebles_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Verificar_valores_drop();
        if (Propiedades_Inmuebles_DropDownList.SelectedIndex == 1)
        {
            Valor_Aproximado_Inmuebles_TextBox.BackColor = Color.LightGray;
            Valor_Aproximado_Inmuebles_TextBox.ReadOnly = true;
        }
        else
        {
            Valor_Aproximado_Inmuebles_TextBox.BackColor = ColorTranslator.FromHtml("#ffffea");
            Valor_Aproximado_Inmuebles_TextBox.ReadOnly = false;
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_situacion_financiera_P1", "$('#div_situacion_financiera_P1').modal('show');", true);
    }

    protected void Inversiones_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Verificar_valores_drop();
        if (Inversiones_DropDownList.SelectedIndex == 1)
        {
            Valor_Aproximado_Inversiones_TextBox.BackColor = Color.LightGray;
            Valor_Aproximado_Inversiones_TextBox.ReadOnly = true;
        }
        else
        {
            Valor_Aproximado_Inversiones_TextBox.BackColor = ColorTranslator.FromHtml("#ffffea");
            Valor_Aproximado_Inversiones_TextBox.ReadOnly = false;
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_situacion_financiera_P1", "$('#div_situacion_financiera_P1').modal('show');", true);
    }

    protected void Fideicomisos_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Verificar_valores_drop();

        if (Fideicomisos_DropDownList.SelectedIndex == 1)
        {
            Valor_Aproximados_Fideicomisos_TextBox.BackColor = Color.LightGray;
            Valor_Aproximados_Fideicomisos_TextBox.ReadOnly = true;
        }
        else
        {
            Valor_Aproximados_Fideicomisos_TextBox.BackColor = ColorTranslator.FromHtml("#ffffea");
            Valor_Aproximados_Fideicomisos_TextBox.ReadOnly = false;
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_situacion_financiera_P1", "$('#div_situacion_financiera_P1').modal('show');", true);
    }

    protected void Verificar_valores_drop()
    {
        if (Fideicomisos_DropDownList.SelectedIndex == 1 && Inversiones_DropDownList.SelectedIndex == 1 && Propiedades_Inmuebles_DropDownList.SelectedIndex == 1)
        {
            Patrimonio_Institucion_DropDownList.SelectedIndex = 1;
            ocultar.Visible = false;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "div_situacion_financiera_P1", "$('#div_situacion_financiera_P1').modal('show');", true);
        }
    }

    protected void Poblacion_Atendida_Hombres_TextBox_TextChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P7", "$('#div_presentacion_P7').modal('show');", true);

        this.Guardar_Poblacion_Atendida();

        Poblacion_Atendida_GridView.DataBind();
    }

    protected void Limpiar_Button_Click(object sender, EventArgs e)
    {

        Calle_Oficinas_Operativas_TextBox.Text = "";
        Numero_Oficinas_Operativas_TextBox.Text = "";
        Entre_Calles_Oficinas_Operativas_TextBox.Text = "";
        Telefono_Oficina_Operativa_TextBox.Text = "";
        Horario_Oficina_Operativa_TextBox.Text = "";
        CP_Oficina_Operativa_TextBox.Text = "";
        Colonia_Oficinas_Operativas_TextBox.Text = "";

        Agregar_Oficina_Operativa_Button.Text = "Agregar Oficina Operativa";

        id_oficina = 0;
        nueva_Of_Operativa = true;

        Limpiar_Button.Visible = false;

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P1", "$('#div_presentacion_P1').modal('show');", true);
    }

    protected void Rezago_Educativo_DropDownList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(Rezago_Educativo_DropDownList.SelectedIndex == 1)
        {
            Porcentaje_Poblacion_Atendida.Visible = false;
        }else
        {
            Porcentaje_Poblacion_Atendida.Visible = true;
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "hideModal", "hideModal();", true);
        ScriptManager.RegisterStartupScript(this, this.GetType(), "div_presentacion_P9", "$('#div_presentacion_P9').modal('show');", true);
    }
}
