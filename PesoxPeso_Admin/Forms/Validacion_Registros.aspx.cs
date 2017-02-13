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


using System.Net.Mail;

public partial class Forms_Validacion_Registros : System.Web.UI.Page
{
    Entity_Model.PesoxPeso_modelContainer contexto = new Entity_Model.PesoxPeso_modelContainer();

    csEmailHandler enviar_correo = new csEmailHandler();

    int id_registro;
    int id_institucion = 0;

    static int ver = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        Instituciones_GridView.DataSource = Instituciones_SqlDataSource;
        Instituciones_GridView.DataBind();

        if (Convert.ToString(Session["sist_Funciones"]).IndexOf("F05") < 0)
        {
            Response.Redirect("/Login.aspx", true);
        }

        if (!Page.IsPostBack)
        {
            Verificar_Registros.Visible = false;
            Registros(1);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ejecuta_javascript", "ejecuta_javascript();", true);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "desbloquea_pagina", "desbloquea_pagina();", true);
        }
    }

    protected void Registros_Pendientes_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Verificar")
        {
            int rowIndex = int.Parse(e.CommandArgument.ToString());
            id_registro = Convert.ToInt32(Registros_Pendientes_GridView.DataKeys[rowIndex]["id_registro"]);

            id_registro_HiddenField.Value = id_registro.ToString();

            Llenar_Datos_Registro(id_registro);

            registro_principal.Visible = false;
            Verificar_Registros.Visible = true;

            if (Estado_Registro.SelectedItem.Text != "Pendientes")
            {
                asignar_institucion.Visible = false;
            }
        }
    }

    protected void Agregar_Catalogo_Button_Command(object sender, CommandEventArgs e)
    {

        if (e.CommandName == "AgregarCatalogo")
        {
            //Catalogo_Instituciones db = new Catalogo_Instituciones();

            //var agregar = (from catalogos in contexto.Catalogo_Instituciones select catalogos).ToList();
            //agregar[0].nombre_institucion = "mama";

            //contexto.SaveChanges();
            if (Nombre_Institucion_Registrada_TextBox.Text != "")
            {
                string sucursal_institucion = Sucursal_Institucion_TextBox.Text;
                string rfc_institucion = Rfc_Institucion_TextBox.Text;

                var consultar = (from buscar in contexto.Catalogo_Instituciones where buscar.sucursal == sucursal_institucion && buscar.rfc == rfc_institucion select buscar).Count();

                if (consultar == 0)
                {
                    Catalogo_Instituciones nueva_institucion = new Catalogo_Instituciones();

                    nueva_institucion.nombre_institucion = Nombre_Institucion_Registrada_TextBox.Text;
                    nueva_institucion.direccion = "";
                    nueva_institucion.nombre_director = "";
                    nueva_institucion.rfc = Rfc_Institucion_TextBox.Text;
                    nueva_institucion.sucursal = Sucursal_Institucion_TextBox.Text;
                    nueva_institucion.telefono = "";

                    contexto.Catalogo_Instituciones.Add(nueva_institucion);

                    contexto.SaveChanges();

                    Buscar_Institucion_Catalogo_Button_Click(null, null);
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Institución Agregada Correctamente');", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('La institución se encuentra actualmente registrada');", true);
                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Escriba el nombre de la institución');", true);
            }
        }
    }

    protected void Instituciones_GridView_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Asignar_Institucion")
        {
            int id_registro = Convert.ToInt32(id_registro_HiddenField.Value);

            int rowIndex = int.Parse(e.CommandArgument.ToString());
            id_institucion = Convert.ToInt32(Instituciones_GridView.DataKeys[rowIndex]["id_institucion"]);

            // VALIDAMOS QUE NO TENGA OTROS USUARIOS LA INSTITUCION
            var buscar_otro = (from buscar in contexto.Registro_Usuarios where buscar.id_institucion == id_institucion select buscar).ToList();
            if (buscar_otro.Count > 0)
                ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Ya existe usuario asignado a la institucion');", true);
            else
            {

                // ENVIAMOS CORREO
                Data objData = new Data();
                //string strStoreProcedure = "sp_valida_correo_usuario_institucion";
                bool error = false;

                try
                {
                    objData.OpenConnection();

                    SqlParameter[] param = new SqlParameter[2];

                    //param[0] = new SqlParameter("@correo", Correo_Verificar_TextBox.Text);
                    //param[0].SqlDbType = SqlDbType.NVarChar;
                    //param[1] = new SqlParameter("@id_registro", id_registro);
                    //param[1].SqlDbType = SqlDbType.Int;

                    //DataTable dt = objData.ExecuteSPQuery(param, strStoreProcedure);
                    if (id_registro != 0)
                    {
                        string strStoreProcedure = "sp_Realiza_Cambio_GUID_Institucion";
                        string GUID = Guid.NewGuid().ToString();
                        string id_general_usuario = id_registro.ToString();

                        SqlParameter[] Params = new SqlParameter[2];
                        Params[0] = new SqlParameter("@id_registro", id_general_usuario);
                        Params[0].SqlDbType = SqlDbType.Int;
                        Params[1] = new SqlParameter("@guid", GUID);
                        Params[1].SqlDbType = SqlDbType.NVarChar;

                        DataTable dt = objData.ExecuteSPQuery(Params, strStoreProcedure);

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
                        Email.correoDestinatario = Correo_Verificar_TextBox.Text;
                        Email.nombreMostrar = datos_correo.correo_nombreMostrar;
                        Email.asunto = "Sistema Peso por Peso - Registro de Contraseña";
                        Email.mensaje = "Dar click <a href='http://localhost:60997/ResetPassword.aspx?request=" + id_encrypt_usuario + "&guid=" + encrypt_guid + "'>Aquí</a> para especificar su nueva Contraseña.";
                        //Email.mensaje = "Dar click <a href='http://instituciones_pesoxpeso.difson.gob.mx/ResetPassword.aspx?request=" + id_encrypt_usuario + "&guid=" + encrypt_guid + '">Aquí</a> para especificar su nueva Contraseña.";

                        if ((new csEmailHandler()).SendEmail(Email))
                            error = true;
                        else
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('Se asignó el registro al catálogo de instituciones y se envió correo al usuario');", true);
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
                else
                {

                    var asignar_institucion = (from buscar in contexto.Registro_Usuarios where buscar.id_registro == id_registro select buscar).First();

                    var info_intitucion = (from leer in contexto.Catalogo_Instituciones where leer.id_institucion == id_institucion select leer).First();

                    asignar_institucion.id_institucion = id_institucion;
                    asignar_institucion.rfc_institucion = info_intitucion.rfc;
                    asignar_institucion.nombre_institucion = info_intitucion.nombre_institucion;

                    asignar_institucion.estatu_actual_registro = 1;

                    contexto.SaveChanges();

                    var año = (from seleccionar in contexto.tb_Generales_Parametros select seleccionar).First();

                    int año_actual = año.año_registro;

                    var verificar_formulario = (from verificar in contexto.Formulario_Estandar where verificar.id_institucion == id_institucion && verificar.año_registro == año_actual select verificar).ToList();

                    if (verificar_formulario.Count == 0)
                    {
                        Formulario_Estandar formulario = new Formulario_Estandar();

                        formulario.id_institucion = id_institucion;
                        formulario.año_registro = año_actual;
                        formulario.num_folio = 0;
                        formulario.fecha_recepcion = DateTime.Today;
                        formulario.nombre_dominio = "";
                        formulario.nombre_programa = "";
                        formulario.objetivo_social_programa = "";
                        formulario.fecha_constitucion = DateTime.Today;
                        formulario.num_personas_laborando = 0;
                        formulario.remunerados = 0;
                        formulario.voluntarios = 0;
                        formulario.areas_atencion = "";
                        formulario.areas_apoyo = "";
                        formulario.año_actual = 0;
                        formulario.año_anterior = 0;
                        formulario.total_ingresos = 0;
                        formulario.total_donativos = 0;
                        formulario.total_egresos = 0;
                        formulario.monto_solicitado = 0;
                        formulario.denominacion = "";
                        formulario.siglas = "";
                        formulario.telefono = "";
                        formulario.correo_electronico = "";
                        formulario.pagina_web = "";
                        formulario.red_social_institucion = "";
                        formulario.calle_numero = "";
                        formulario.id_municipio = 0;
                        formulario.colonia = "";
                        formulario.CP = "";
                        formulario.celular = "";
                        formulario.telefonos = "";
                        formulario.correo_dom_fiscal = "";
                        formulario.id_personalidad_juridica = 0;
                        formulario.otro_personalidad_juridica = "";
                        formulario.num_escritura = "";
                        formulario.fecha_escritura = DateTime.Today;
                        formulario.nombre_notario_publico = "";
                        formulario.numero_notario_publico = "";
                        formulario.lugar_notario_publico = "";
                        formulario.registro_propiedad = "";
                        formulario.fecha_registro_propiedad = DateTime.Today;
                        formulario.permiso_expedir_recibos = 0;
                        formulario.fecha_permiso = DateTime.Today;
                        formulario.fecha_ultima_publicacion = DateTime.Today;
                        formulario.seccion = "";
                        formulario.pagina = "";
                        formulario.id_organo_supremo = 0;
                        formulario.otro_organo_supremo = "";
                        formulario.nombre_representante_legal = "";
                        formulario.calle_representante_legal = "";
                        formulario.numero_representante_legal = "";
                        formulario.colonia_representante_legal = "";
                        formulario.id_ciudad_representante_legal = 0;
                        formulario.telefono_representante_legal = "";
                        formulario.celular_representante_legal = "";
                        formulario.correo_representante = "";
                        formulario.rfc_representante = "";
                        formulario.descripcion_programa = "";
                        formulario.meta_programa = "";
                        formulario.diagnostico_situacional = "";
                        formulario.nombre_enlace = "";
                        formulario.telefono_enlace = "";
                        formulario.correo_enlace = "";
                        formulario.justificacion_programa = "";
                        formulario.poblacion_minima = 0;
                        formulario.poblacion_maxima = 0;
                        formulario.poblacion_actual = 0;
                        formulario.tipo_ingreso_poblacion = 0;
                        formulario.nivel_ingreso_poblacion = 0;
                        formulario.rezago_educativo = 0;
                        formulario.porcentaje_poblacion_atendida = 0;
                        formulario.personas_hasta_15 = 0;
                        formulario.personas_hasta_1982 = 0;
                        formulario.personas_apartir_1982 = 0;
                        formulario.piso = "";
                        formulario.piso_otro = "";
                        formulario.techo = "";
                        formulario.techo_otro = "";
                        formulario.muros = "";
                        formulario.muro_otro = "";
                        formulario.promedio_personas_viviendo = 0;
                        formulario.num_habitaciones = 0;
                        formulario.observaciones_acceso = "";
                        formulario.patrimonio_institucion = 0;
                        formulario.propiedades_inmuebles = 0;
                        formulario.valor_aproximado_inmuebles = 0;
                        formulario.inversiones = 0;
                        formulario.valor_aproximado_inversiones = 0;
                        formulario.fideicomisos = 0;
                        formulario.valor_aproximado_fideicomisos = 0;
                        formulario.total_principales_fuentes = 0;
                        formulario.total_principales_egresos = 0;
                        //formulario.nombre_razon = "";
                        //formulario.domicilio_fiscal = "";
                        //formulario.clave_registro = "";
                        formulario.impuesto_federal = 0;
                        formulario.adeudos_fiscales = 0;
                        formulario.volumen_num_escritura = "";
                        formulario.volumen_registro_propiedad = "";

                        contexto.Formulario_Estandar.Add(formulario);
                        contexto.SaveChanges();

                        var asignar_institucion2 = (from buscar in contexto.Registro_Usuarios where buscar.id_registro == id_registro select buscar).First();
                        asignar_institucion2.id_formulario_estandar = formulario.id_formulario_estandar;
                        contexto.SaveChanges();

                        Estatus_Registros estatus = new Estatus_Registros();
                        estatus.id_institucion = id_institucion;
                        estatus.id_registro = asignar_institucion.id_registro;
                        estatus.fecha = DateTime.Today;
                        estatus.estatus = 1;

                        contexto.Estatus_Registros.Add(estatus);

                        contexto.SaveChanges();
                    }
                }
            }
        }
    }

    protected void Llenar_Datos_Registro(int id_registro)
    {
        var llenar = (from buscar in contexto.Registro_Usuarios where buscar.id_registro == id_registro select buscar).First();

        Nombre_Institucion_Registrada_TextBox.Text = llenar.nombre_institucion;
        Nombre_Registrado_TextBox.Text = llenar.responsable;
        Sucursal_Institucion_TextBox.Text = llenar.sucursal;
        Telefono_Verificar_TextBox.Text = llenar.telefono;
        Correo_Verificar_TextBox.Text = llenar.correo;
        Rfc_Institucion_TextBox.Text = llenar.rfc_institucion;
    }

    protected void Buscar_Institucion_Catalogo_Button_Click(object sender, EventArgs e)
    {
        string texto_buscar = "";

        texto_buscar = Nombre_Institucion_Buscar_TextBox.Text.Trim();

        DataTable data_table = new DataTable();

        var sql_connectionstring = ConfigurationManager.ConnectionStrings["db_Peso_x_Peso_ConnectionString"].ConnectionString;
        SqlConnection dataConnection = new SqlConnection(sql_connectionstring);
        SqlDataAdapter data_adapter = new SqlDataAdapter("sp_Buscar_Instituciones", dataConnection);
        data_adapter.SelectCommand.CommandType = CommandType.StoredProcedure;

        data_adapter.SelectCommand.Parameters.Add("@nombre_buscar_institucion", SqlDbType.VarChar, 20);
        data_adapter.SelectCommand.Parameters["@nombre_buscar_institucion"].Value = texto_buscar;
        data_adapter.Fill(data_table);

        Instituciones_GridView.DataSource = data_table;
        Instituciones_GridView.DataBind();

        ////var llenar = (from buscar in contexto.Catalogo_Instituciones where buscar.nombre_institucion.Contains(Nombre_Institucion_Buscar_TextBox.Text) select buscar).ToList();
        //if (llenar.Count != 0)
        //{
        //    //Instituciones_GridView.DataSource = llenar;
        //    //Instituciones_GridView.DataBind();
        //}else
        //{
        //    ScriptManager.RegisterStartupScript(this, this.GetType(), "mensaje", "despliega_aviso('No se encontro la institucion');", true);
        //}
    }

    protected void Salir_Button_Click(object sender, EventArgs e)
    {
        Registros(1);

        registro_principal.Visible = true;
        Verificar_Registros.Visible = false;
        Estado_Registro.SelectedValue = "Pendientes";
    }

    protected void Buscar_Button_Click(object sender, EventArgs e)
    {

        if (Estado_Registro.SelectedValue != null)
        {
            if (Estado_Registro.SelectedItem.Text == "Pendientes")
            {
                Registros(1);
            }
            else if (Estado_Registro.SelectedItem.Text == "Registrados")
            {
                Registros(2);

            }
            else if (Estado_Registro.SelectedItem.Text == "Todos")
            {
                Registros(3);
            }
        }
    }

    protected void Registros(int tipo)
    {
        if (tipo == 1)
        {
            var buscar = (from pendientes in contexto.Registro_Usuarios where pendientes.id_institucion == 0 && pendientes.estatu_actual_registro == 0 select pendientes).ToList();
            this.FillTable_Registros(buscar);

            Registros_Pendientes_GridView.Columns[4].Visible = true;
            Registros_Pendientes_GridView.Columns[5].Visible = true;

        }
        else if (tipo == 2)
        {
            var buscar = (from pendientes in contexto.Registro_Usuarios where pendientes.id_institucion != 0 && pendientes.estatu_actual_registro == 1 select pendientes).ToList();

            this.FillTable_Registros(buscar);
            Registros_Pendientes_GridView.Columns[4].Visible = true;
            Registros_Pendientes_GridView.Columns[5].Visible = false;
        }
        else if (tipo == 3)
        {
            var buscar = (from pendientes in contexto.Registro_Usuarios where pendientes.estatu_actual_registro <= 2 select pendientes).ToList();
            this.FillTable_Registros(buscar);
            Registros_Pendientes_GridView.Columns[4].Visible = false;
            Registros_Pendientes_GridView.Columns[5].Visible = false;
        }
    }

    private void FillTable_Registros(List<Registro_Usuarios> buscar)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("id_registro");
        dt.Columns.Add("fecha_registro");
        dt.Columns.Add("nombre_institucion");
        dt.Columns.Add("rfc_institucion");
        dt.Columns.Add("sucursal");

        for (int x = 0; x < buscar.Count; x++)
        {
            DataRow dr = dt.NewRow();

            dr["id_registro"] = buscar[x].id_registro;
            dr["fecha_registro"] = buscar[x].fecha_registro.ToShortDateString();
            dr["rfc_institucion"] = buscar[x].rfc_institucion;
            dr["nombre_institucion"] = buscar[x].nombre_institucion;
            dr["sucursal"] = buscar[x].sucursal;

            dt.Rows.Add(dr);
        }

        Registros_Pendientes_GridView.DataSource = dt;
        Registros_Pendientes_GridView.DataBind();
    }

    protected void Llenar_Registros_Pendientes(object sender, EventArgs e)
    {
        string texto_buscar = "";

        texto_buscar = Nombre_Institucion_TextBox.Text.Trim();

        DataTable data_table = new DataTable();

        var sql_connectionstring = ConfigurationManager.ConnectionStrings["db_Peso_x_Peso_ConnectionString"].ConnectionString;
        SqlConnection dataConnection = new SqlConnection(sql_connectionstring);
        SqlDataAdapter data_adapter = new SqlDataAdapter("sp_Buscar_registro", dataConnection);
        data_adapter.SelectCommand.CommandType = CommandType.StoredProcedure;
        data_adapter.SelectCommand.Parameters.Add("@nombre_buscar_institucion", SqlDbType.VarChar, 20);
        data_adapter.SelectCommand.Parameters["@nombre_buscar_institucion"].Value = texto_buscar;
        data_adapter.Fill(data_table);

        Registros_Pendientes_GridView.DataSource = data_table;
        Registros_Pendientes_GridView.DataBind();
    }

}