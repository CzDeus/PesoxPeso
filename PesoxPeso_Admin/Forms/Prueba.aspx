<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Prueba.aspx.cs" Inherits="Forms_Prueba" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>
            <div class="row" style="text-align: center">
                <h1><b>FORMULARIO ESTANDAR</b></h1>
            </div>

            <div id="botones" class="col-xs-12" style="top: 0; left: 0">
                <div class="row" style="text-align: center">
                    <div class="col-lg-12">
                        <h3><b>1. Caratula de indentificación</b></h3>
                        <asp:Button ID="Caratula_Button" runat="server" Text="Registro" class="btn btn-info btn-md" OnClick="Caratula_Button_Click" />
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <h3><b>2. Datos que acreditan la existencia de la personalidad jurídica</b></h3>
                        <asp:Button ID="Datos_acreditar_Button" runat="server" Text="Button" data-toggle="modal" data-target="#div_acreditar_P1" class="btn btn-info btn-md" />
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <h3><b>3. Presentacion del programa</b></h3>
                        <asp:Button ID="Presentacion_Button" runat="server" Text="Button" data-toggle="modal" data-target="#div_presentacion_P3" class="btn btn-info btn-md" />
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <h3><b>4. Situación financiera</b></h3>
                        <asp:Button ID="Situacion_Financiera_Button" runat="server" Text="Button" data-toggle="modal" data-target="#div_situacion_financiera_P1" class="btn btn-info btn-md" />
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <h3><b>5. Cumplimiento de las obligaciones fiscales</b></h3>
                        <asp:Button ID="Obligaciones_Button" runat="server" Text="Button" data-toggle="modal" data-target="#div_cumplimiento_P1" class="btn btn-info btn-md" />
                    </div>
                </div>
            </div>

            <div id="div_registro_P1" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">

                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label6" runat="server" Text="II. INFORMACIÓN GENERAL" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <asp:Label ID="Nombre_Dominio_Label" runat="server" Text="Nombre o denominación de la institución (de acuerdo al acta constitutiva):"></asp:Label>
                                    <asp:TextBox ID="Nombre_Dominio_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Nombre_Programa_Label" runat="server" Text="Nombre de programa y/o proyecto:"></asp:Label>
                                    <asp:TextBox ID="Nombre_Programa_TextBox" runat="server" class="form-control"></asp:TextBox>

                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-4">
                                        <asp:Label ID="Sector_Label" runat="server" Text="Sector o rubros de atención:"></asp:Label>
                                        <asp:DropDownList ID="Sector_DropDownList" runat="server" class="form-control"></asp:DropDownList>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Objetivo_Social_Label" runat="server" Text="Objetivo social:"></asp:Label>
                                        <asp:TextBox ID="Objetivo_Social_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Fecha_Constitucion_Label" runat="server" Text="Fecha_Constitucion:"></asp:Label>
                                        <asp:TextBox ID="Fecha_Constitucion_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label7" runat="server" Text="III. DATOS ORGANIZACIONALES" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />

                                    <asp:Label ID="Label1" runat="server" Text="Número de personas que laboran en la institución:"></asp:Label>
                                    <asp:TextBox ID="Num_Personas_Laborando_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Label2" runat="server" Text="Remunerados:"></asp:Label>
                                    <asp:TextBox ID="Remunerados_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Label3" runat="server" Text="Voluntarios:"></asp:Label>
                                    <asp:TextBox ID="Voluntarios_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Label4" runat="server" Text="Mencionar las áreas de atencion en la institucion:"></asp:Label>
                                    <asp:TextBox ID="Areas_atencion_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Label5" runat="server" Text="Mencionar las áreas de apoyo administrativo de la institución:"></asp:Label>
                                    <asp:TextBox ID="Areas_Apoyo_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Datos_Registro_P1" runat="server" Text="Siguiente" class="btn btn-primary" OnClick="Datos_Registro_P1_Click" />
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Salir_Button" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" tabindex="-1" data-backdrop="static" id="div_registro_P2">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">

                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label8" runat="server" Text="IV. DATOS DE LA POBLACIÓN ATENDIDA" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">

                                    <b>
                                        <asp:Label ID="Total_Poblacion_Label" runat="server" Text="Poblacion atendida en promedio mensual en el año actual y anterior:"></asp:Label></b>
                                    <br />
                                    <asp:Label ID="Año_Actual_Label" runat="server" Text="Año actual:"></asp:Label>
                                    <asp:TextBox ID="Año_Actual_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Año_Anterior_Label" runat="server" Text="Año Anterior:"></asp:Label>
                                    <asp:TextBox ID="Año_Anterior_TextBox" runat="server" class="form-control"></asp:TextBox>

                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Text="V. INFORMACIÓN FINANCIERA" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">

                                    <asp:Label ID="Total_Ingresos_Label" runat="server" Text="Total de ingrensos captados en efectivo por actividades y/o donaciones durante el ejercicio actual:"></asp:Label>
                                    <asp:TextBox ID="Total_Ingresos_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Total_Donativos_Label" runat="server" Text="Total de donativos en especie recibidos en el ejercicio actual:"></asp:Label>
                                    <asp:TextBox ID="Total_Donativos_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Total_Egresos_Label" runat="server" Text="Total de egresos aplicados:"></asp:Label>
                                    <asp:TextBox ID="Total_Egresos_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Monto_Solicitado_Label" runat="server" Text="Monto Solicitado:"></asp:Label>
                                    <asp:TextBox ID="Monto_Solicitado_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_registro_P1" data-dismiss="modal" style="width: 100px">
                                        Anterior
                                    </button>
                                </div>

                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_acreditar_P1" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>

                                <div class="col-lg-4">
                                    <asp:Button ID="Button2" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <%-- 2 --%>
            <div class="modal fade" tabindex="-1" data-backdrop="static" id="div_acreditar_P1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                            <h2>2. DATOS QUE ACREDITAN LA EXISTENCIA DE LA PERSONALIDAD JURÍDICA</h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label10" runat="server" Text="2.1 Datos Generales de la Institución" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <asp:Label ID="Nombre_Institucion_Label" runat="server" Text="Nombre de la institucion/nombre comercial:"></asp:Label>
                                    <asp:TextBox ID="Nombre_Institucion_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Denominacion_Label" runat="server" Text="Denominación o razón social de la institucion:"></asp:Label>
                                    <asp:TextBox ID="Denominacion_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Registro_contribuyente_Label" runat="server" Text="Registro federal de contribuyente:"></asp:Label>
                                    <asp:TextBox ID="Registro_contribuyente_TextBox" runat="server" class="form-control"></asp:TextBox>

                                    <asp:Label ID="Siglas_Label" runat="server" Text="Siglas:"></asp:Label>
                                    <asp:TextBox ID="Siglas_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="row col-lg-12 ">
                                    <div class="col-lg-4">
                                        <asp:Label ID="Telefono_Label" runat="server" Text="Telefono:"></asp:Label>
                                        <asp:TextBox ID="Telefono_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Correo_electrico_Label" runat="server" Text="Correo electrico:"></asp:Label>
                                        <asp:TextBox ID="Correo_electrico_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Pagina_Web_Label" runat="server" Text="Pagina web:"></asp:Label>
                                        <asp:TextBox ID="Pagina_Web_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label11" runat="server" Text="2.2 Domicilio Legal y/o Fiscal" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12 ">
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label12" runat="server" Text="Calle y número:"></asp:Label>
                                        <asp:TextBox ID="Calle_Numero_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label13" runat="server" Text="Municipio:"></asp:Label>
                                        <asp:DropDownList ID="Municipio_DropDownList" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label14" runat="server" Text="Colonia:"></asp:Label>
                                        <asp:TextBox ID="Colonia_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label15" runat="server" Text="Entidad Federativa:"></asp:Label>
                                        <asp:DropDownList ID="Entidad_Federativa_DropDownList" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-lg-12 ">
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label16" runat="server" Text="Código postal:"></asp:Label>
                                        <asp:TextBox ID="CP_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label17" runat="server" Text="Celular:"></asp:Label>
                                        <asp:TextBox ID="Celular_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label18" runat="server" Text="Teléfonos:"></asp:Label>
                                        <asp:TextBox ID="Telefonos_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label19" runat="server" Text="Correo electrónico:"></asp:Label>
                                        <asp:TextBox ID="Correo_Electronico_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label20" runat="server" Text="2.3 Personalidad Jurídica:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label21" runat="server" Text="Seleccione una opcion:"></asp:Label>
                                        <asp:DropDownList ID="Personalidad_Juridica_DropDownList" runat="server" class="form-control"></asp:DropDownList>
                                    </div>

                                    <div class="col-lg-6">
                                        <asp:Label ID="Label22" runat="server" Text="Especifique:"></asp:Label>
                                        <asp:TextBox ID="Otro_Personalidad_Juridica_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_registro_P2" data-dismiss="modal" style="width: 100px">Anterior</button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_acreditar_P2" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button1" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" tabindex="-1" data-backdrop="static" id="div_acreditar_P2">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label23" runat="server" Text="2.5 Acta constitutiva y sus reformas" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-8">
                                        <asp:Label ID="Label24" runat="server" Text="No. de la escritura pública en la que consta su acta constitutiva, como IAP, IAC u otra institución no gubernamental:"></asp:Label>
                                        <asp:TextBox ID="Num_Escritura_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <br />
                                        <asp:Label ID="Label26" runat="server" Text="Fecha:"></asp:Label>
                                        <asp:TextBox ID="Fecha_Escritura_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label25" runat="server" Text="Nombre, número y ligar de Notario Público ante el cual se dio fe de la misma:"></asp:Label>
                                        <asp:TextBox ID="Info_Notaria_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-8">
                                        <asp:Label ID="Label27" runat="server" Text="Registro Público de la Propiedad:"></asp:Label>
                                        <asp:TextBox ID="Registro_Propiedad_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label28" runat="server" Text="Fecha:"></asp:Label>
                                        <asp:TextBox ID="Fecha_Registro_Propiedad_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-8">
                                        <asp:Label ID="Label29" runat="server" Text="Reformas al acta constitutiva:"></asp:Label>
                                        <asp:TextBox ID="Reforma_Constitutiva_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label30" runat="server" Text="Fecha:"></asp:Label>
                                        <asp:TextBox ID="Fecha_Reforma_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label31" runat="server" Text="2.6 ¿Tiene la institución de la Secretaria de Hacienda para expedir recibos deducibles de impuestos sobre la renta?" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-8">
                                        <asp:Label ID="Label32" runat="server" Text="Seleccione un opcion:"></asp:Label>
                                        <asp:DropDownList ID="Permiso_Expedir_Recibos_DropDownList" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label33" runat="server" Text="¿Desde qué fecha?"></asp:Label>
                                        <asp:TextBox ID="Fecha_Permisos_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label34" runat="server" Text="2.7 Fecha de la última publicacion en el Diario Oficial" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label35" runat="server" Text="Fecha:"></asp:Label>
                                        <asp:TextBox ID="Fecha_Ultima_Publicacion_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Label36" runat="server" Text="Sección:"></asp:Label>
                                        <asp:TextBox ID="Seccion_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Label37" runat="server" Text="Página"></asp:Label>
                                        <asp:TextBox ID="Pagina_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_acreditar_P1" data-dismiss="modal" style="width: 100px">
                                        Anterior
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_acreditar_P3" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button3" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" tabindex="-1" data-backdrop="static" id="div_acreditar_P3">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label42" runat="server" Text="2.8 Órgano Supremo de la institución" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-8">
                                        <asp:Label ID="Label49" runat="server" Text="Seleccione un opcion:"></asp:Label>
                                        <asp:DropDownList ID="Organo_Supremo_DropDownList" runat="server" class="form-control"></asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label50" runat="server" Text="Otro:"></asp:Label>
                                        <asp:TextBox ID="Otros_Organo_Supremo_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label51" runat="server" Text="2.9 Datos del Representante Legal" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label52" runat="server" Text="Nombre:"></asp:Label>
                                        <asp:TextBox ID="Nombre_Representante_Legal_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-6">
                                        <asp:Label ID="Label53" runat="server" Text="Domicilio:"></asp:Label>
                                        <asp:TextBox ID="Domicilio_Representante_Legal_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label54" runat="server" Text="Telefono y No. Celular:"></asp:Label>
                                        <asp:TextBox ID="Tel_Cel_Representante_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Label55" runat="server" Text="Correo electronico:"></asp:Label>
                                        <asp:TextBox ID="Correo_Representante_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>


                                    <div class="col-lg-4">
                                        <asp:Label ID="Label56" runat="server" Text="RFC:"></asp:Label>
                                        <asp:TextBox ID="Rfc_Representante_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_acreditar_P2" data-dismiss="modal" style="width: 100px">
                                        Anterior
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_presentacion_P1" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button4" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <%-- 3 --%>
            <div class="modal fade" id="div_presentacion_P1" tabindex="-1" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                            <h2>3. PRESENTACION DEL PROGRAMA</h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label48" runat="server" Text="3.1 Nombre del Programa y/o Proyecto" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <br />
                                    <%-- CHECAR --%>
                                    <asp:TextBox ID="Nombre_Programa_2_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>


                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label47" runat="server" Text="3.2 Domicilio de oficinas operativas y/o ubicación de ejecución del proyecto:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <br />
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label38" runat="server" Text="Calle y número:"></asp:Label>
                                        <asp:TextBox ID="Calle_Num_Of_Operativas_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Label39" runat="server" Text="Colonia:"></asp:Label>
                                        <asp:TextBox ID="Colonia_Oficinas_Operativas_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Label40" runat="server" Text="Entre las calles:"></asp:Label>
                                        <asp:TextBox ID="Entre_Calles_Oficinas_Operativas_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label41" runat="server" Text="Municipio:"></asp:Label>
                                        <asp:DropDownList ID="Municipio_Oficina_Operativa_DropDownList" runat="server" class="form-control"></asp:DropDownList>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Label43" runat="server" Text="Horario de prestacion de servicios:"></asp:Label>
                                        <asp:TextBox ID="Horario_Oficina_Operativa_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-2">
                                        <asp:Label ID="Label44" runat="server" Text="Código Postal:"></asp:Label>
                                        <asp:TextBox ID="CP_Oficina_Operativa_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label45" runat="server" Text="Teléfono:"></asp:Label>
                                        <asp:TextBox ID="Telefono_Oficina_Operativa_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label46" runat="server" Text="3.3 Descripcion del Programa y/o Proyecto" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <br />
                                </div>

                                <div class="row col-lg-12">
                                    <asp:TextBox ID="Descripcion_Programa_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label57" runat="server" Text="3.4 Metas del Programa y/o Proyecto" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <br />
                                </div>

                                <div class="row col-lg-12">
                                    <asp:TextBox ID="Meta_Programa_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                            </div>


                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_acreditar_P3" data-dismiss="modal" style="width: 100px">Anterior</button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_presentacion_P2" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button5" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" id="div_presentacion_P2" tabindex="-1" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label71" runat="server" Text="3.5 Diagnóstico Situacional:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <br />
                                </div>

                                <div class="row col-lg-12">
                                    <textarea id="Diagnostico_Situacional_TextArea" class="form-control" rows="3" placeholder="(Descripción breve de sus necesidades y problemáticas)" required></textarea>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label72" runat="server" Text="3.6 Enlace del Programa y/o Proyecto:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <br />
                                </div>

                                <div class="row col-lg-12">
                                    <textarea id="Enlace_Programa_TextArea" class="form-control" rows="3" placeholder="(Nombre, teléfono y correo electronico de la persona ue servirá de enlace)" required></textarea>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label58" runat="server" Text="3.7 Tiempo estimado por etapas para la puerta en marcha del programa y/o proyecto:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label59" runat="server" Text="Fecha Inicial:"></asp:Label>
                                        <asp:TextBox ID="Fecha_Inicial_Tiempo_Estimado_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-6">
                                        <asp:Label ID="Label60" runat="server" Text="Fecha Final:"></asp:Label>
                                        <asp:TextBox ID="Fecha_Final_Tiempo_Estimado_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <asp:Label ID="Label61" runat="server" Text="Descripcion:"></asp:Label>
                                    <textarea id="descripcion_Tiempo_TextArea" class="form-control" rows="3" placeholder="Descripción de los tiempos" required></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_presentacion_P1" data-dismiss="modal" style="width: 100px">
                                        Anterior
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_presentacion_P3" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button6" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" id="div_presentacion_P3" tabindex="-1" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label62" runat="server" Text="3.8 Explique brevemente porque el programa, proyecto o ayuda solicitada, constribuirá a subsanar las necesidades o problemáticas." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <br />
                                </div>

                                <div class="row col-lg-12">
                                    <textarea id="Justificacion_Programa_TextArea" class="form-control" rows="3" placeholder="" required></textarea>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label63" runat="server" Text="3.9 Costo estimado del Programa." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <br />
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <table class="table table-bordered table-hover" id="tab_logic">
                                        <thead>
                                            <tr>
                                                <th class="text-center">#
                                                </th>
                                                <th class="text-center">Conceptos
                                                </th>
                                                <th class="text-center">Monto
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr id='addr0'>
                                                <td>1
                                                </td>
                                                <td>
                                                    <input type="text" name='name0' placeholder='Conceptos' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='mail0' placeholder='Monto' class="form-control" />
                                                </td>
                                            </tr>
                                        </tbody>
                                        <tfoot>
                                            <tr id="total">
                                                <td></td>
                                                <td>
                                                    <asp:Label ID="Label64" runat="server" Text="Total:"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="Total_Conceptos_TextBox" runat="server" class="form-control"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>

                                <div class="row col-lg-12">
                                    <a id="add_row" class="btn btn-default pull-left">Agregar Concepto</a>
                                    <a id='delete_row' class="pull-right btn btn-default">Borrar Concepto</a>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label65" runat="server" Text="3.10 Datos de la población atendida (cantidad señale con número)." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label67" runat="server" Text="Mínima"></asp:Label>
                                        <asp:TextBox ID="Poblacion_Minima_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label68" runat="server" Text="Máxima"></asp:Label>
                                        <asp:TextBox ID="Poblacion_Maxima_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label69" runat="server" Text="Actual"></asp:Label>
                                        <asp:TextBox ID="Poblacion_Actual_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div>
                                        <br />
                                    </div>
                                    <b>Tipo de poblacion que atiende (Seleccione)</b>
                                </div>

                                <div class="row col-lg-12">
                                    <form>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Niñas, niños y adolecentes.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Mujeres.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Indigenas</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Adictos o en condiciones de vagancia.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Adultos mayores.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Discapacitados.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Indigentes.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Víctima de condicion de delito.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Personas marginadas.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Personas afectadas por desastres.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Migrantes.</label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_presentacion_P2" data-dismiss="modal" style="width: 100px">
                                        Anterior
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_presentacion_P4" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button7" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="modal fade" id="div_presentacion_P4" tabindex="-1" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">

                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label70" runat="server" Text="3.11 Caracteristicas de la poblacion atendida (Por rango de edad)." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <div>
                                        <br />
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Edad
                                                </th>
                                                <th class="text-center">Hombres
                                                </th>
                                                <th class="text-center">Mujeres
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="col-lg-2">
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 0 - 4" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 05 - 11" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 12 - 17" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 18 - 24" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <%--                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 25 - 28" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 29 - 35" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 36 - 40" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 41 - 45" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 46 - 50" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 51 - 55" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 56 - 60" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 61 - 64" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 65 - 75" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name='Edades' class="form-control" placeholder="De 75 y mas" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='H' class="form-control" />
                                                </td>
                                                <td>
                                                    <input type="text" name='M' class="form-control" />
                                                </td>
                                            </tr>--%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_presentacion_P3" data-dismiss="modal" style="width: 100px">
                                        Anterior
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_presentacion_P5" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button8" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="div_presentacion_P5" tabindex="-1" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">

                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label66" runat="server" Text="3.12 Indicadores de Carencia Social de la poblacion promedio que atiende." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label73" runat="server" Text="¿La población beneficiada cuenta con ingresos económicos?"></asp:Label>
                                </div>
                                <div class="row col-lg-12" style="text-align: center">
                                    <form>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Formales</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Informales</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Varian</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Se desconoce</label>
                                    </form>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label74" runat="server" Text="3.12.1 Ingreso de la poblacion: (revisar costo oficial canasta básica)." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <form>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value=""><b>Alto-Medio</b>. Ingreso mensual superior al costo de la canasta basica completa.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value=""><b>Bajo</b>. Ingreso mensual menor al costo de la canasta básica completa.</label>
                                        </div>
                                        <div class="col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value=""><b>Muy Bajo</b>. Ingreso mensual menso al costo de la canas básica alimentaria.</label>
                                        </div>
                                    </form>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label75" runat="server" Text="3.12.2 Rezago educativo promedio:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">

                                    <div class="col-lg-6">
                                        <asp:Label ID="Label78" runat="server" Text="¿La población que atiende está en edad escolar?"></asp:Label>

                                        <form>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Si</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">No</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Varian</label>
                                        </form>
                                    </div>

                                    <div class="col-lg-6">
                                        <asp:Label ID="Label76" runat="server" Text="% de población atendida en edad escolar"></asp:Label>
                                        <asp:TextBox ID="TextBox47" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <b>
                                        <asp:Label ID="Label77" runat="server" Text="En caso de ser afirmativa o varia:"></asp:Label></b>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-12">
                                        ¿Las personas de 3 a 15 años de edad que atiende asiste a un centro de educación básica o que hayan terminado la educacion secundaria?
                                    </div>
                                    <div class="col-lg-12" style="text-align: center">
                                        <form>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Si</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">No</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Varia</label>
                                        </form>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        ¿Las personas nacidas antes de 1982 cuentan al menos con primaria completa?
                                    </div>
                                    <div class="col-lg-12" style="text-align: center">
                                        <form>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Si</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">No</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Varia</label>
                                        </form>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        ¿Las personas nacidas apartir de 1982 cuentan al menos con secundaria completa?
                                    </div>
                                    <div class="col-lg-12" style="text-align: center">
                                        <form>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Si</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">No</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Varia</label>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_presentacion_P4" data-dismiss="modal" style="width: 100px">Anterior</button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_presentacion_P6" data-dismiss="modal" style="width: 100px">Siguiente</button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button9" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="div_presentacion_P6" tabindex="-1" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTANDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label86" runat="server" Text="3.12.3 Acceso a los servicios de salud" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <form>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Seguro Popular</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />IMSS</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />ISSSTE O ISSSTESON</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />PEMEX, EJERCITO, MARINA, PARTICULAR, OTRO</label>
                                    </form>
                                </div>

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label79" runat="server" Text="3.12.4 Acceso a la seguridad social:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <form>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">IMSS</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />ISSSTE</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />ISSSTESON</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">PEMEX</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />Cuenta con sistema de ahorro para el retiro: SAR o AFORE</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />No cuenta.</label>
                                    </form>
                                </div>

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label80" runat="server" Text="3.12.5 Calidad y espacios de las viviendas:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: left">
                                    <div class="col-lg-4">
                                        <div class="col-lg-12" style="text-align: left">
                                            <b>
                                                <asp:Label ID="Label81" runat="server" Text="Piso:"></asp:Label></b>
                                        </div>
                                        <div class="col-lg-12" style="text-align: left">
                                            <form>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="">Firme Concreto</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="" />Con recubrimiento</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="" />Otros</label>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="col-lg-12" style="text-align: left">
                                            <b>
                                                <asp:Label ID="Label82" runat="server" Text="Techo:"></asp:Label></b>
                                        </div>
                                        <div class="col-lg-12" style="text-align: left">
                                            <form>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="">Losa de concreto</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="" />Madera:</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="" />Lámina</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="" />Otro</label>
                                                </div>
                                            </form>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <div class="col-lg-12" style="text-align: left">
                                            <b>
                                                <asp:Label ID="Label83" runat="server" Text="Muros:"></asp:Label></b>
                                        </div>
                                        <div class="col-lg-12" style="text-align: left">
                                            <form>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="">Ladrillo</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="" />Block</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="" />Madera</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="" />Adobe</label>
                                                </div>
                                                <div class="col-lg-12">
                                                    <label class="checkbox-inline">
                                                        <input type="checkbox" value="" />Otro</label>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <br />
                                    <div class="col-lg-6" style="text-align: center">
                                        <asp:Label ID="Label84" runat="server" Text="Promedio personas que habita la vivienda: "></asp:Label>
                                        <asp:TextBox ID="Promedio_Personas_Vivienda_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6" style="text-align: center">
                                        <asp:Label ID="Label85" runat="server" Text="No. De habitaciones: "></asp:Label>
                                        <asp:TextBox ID="Num_Habitaciones_TextBox" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label101" runat="server" Text="3.12.6 Acceso a los servicio básicos en la vivienda:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <form>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Agua entubada</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />Drenaje conectado</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />Electricidad por servicio publico</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Panel solar</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />Planta</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />Gas para cocinar</label>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_presentacion_P5" data-dismiss="modal" style="width: 100px">Anterior</button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_presentacion_P7" data-dismiss="modal" style="width: 100px">Siguiente</button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button10" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" tabindex="-1" data-backdrop="static" id="div_presentacion_P7">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTANDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label102" runat="server" Text="3.12.7 Acceso a la alimentacion: La poblacion beneficiada consume en promedio al dia:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <form>
                                        <div class="row col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Desayuno, comida, merienda y cena.</label>
                                        </div>
                                        <div class="row col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="" />Desayuno, comida y cena.</label>
                                        </div>
                                        <div class="row col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="" />Solo dos comidas al dia.</label>
                                        </div>
                                        <div class="row col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Solo una comida al dia.</label>
                                        </div>
                                        <div class="row col-lg-4">
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="" />A veces no come en el dia.</label>
                                        </div>
                                    </form>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label103" runat="server" Text="3.12.8 Acceso a la comunicacion." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <form>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Acceso a television.</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />Acceso a internet.</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />Uso de redes sociales.</label>
                                    </form>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <asp:Label ID="Label104" runat="server" Text="Observaciones:"></asp:Label>
                                    <br />
                                    <textarea id="Observaciones_Acceso_TextArea" class="form-control" rows="3" required></textarea>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label105" runat="server" Text="3.13 Oficinas con las que se relaciona la OSC´S" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label106" runat="server" Text="Institucion"></asp:Label>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label107" runat="server" Text="Objetivo y/o beneficio"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_presentacion_P6" data-dismiss="modal" style="width: 100px">Anterior</button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_situacion_financiera_P1" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Salir_Button_dp7" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- 4 --%>
            <div class="modal fade" tabindex="-1" data-backdrop="static" id="div_situacion_financiera_P1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                            <h2>4. SITUACÍON FINANCIERA</h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label100" runat="server" Text="4.1 Situacíon financiera de la institución." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label87" runat="server" Text="¿Su institucion cuenta con patrimonio propio?."></asp:Label>
                                    <%--                                    <asp:TextBox ID="patrimonio_propio_TextBox" runat="server" class="form-control"></asp:TextBox>--%>
                                    <div class="row col-lg-12" style="text-align: center">
                                        <form>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Si</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">No</label>
                                        </form>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label88" runat="server" Text="4.2 En propiedades inmubles." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>
                                <div class=" col-lg-12">
                                    <div class="col-lg-4" style="text-align: center">
                                        <form>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Si</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">No</label>
                                        </form>
                                    </div>
                                    <div class="col-lg-3" style="text-align: right">
                                        <asp:Label ID="Label89" runat="server" Text="Valor aproximado:"></asp:Label>
                                    </div>
                                    <div class="col-lg-5">
                                        <asp:TextBox ID="Valor_Aproximado_Inmuebles_TextBox" placeholder="$" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label90" runat="server" Text="4.3 En Inversiones." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>
                                <div class=" col-lg-12">
                                    <div class="col-lg-4" style="text-align: center">
                                        <form>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Si</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">No</label>
                                        </form>
                                    </div>
                                    <div class="col-lg-3" style="text-align: right">
                                        <asp:Label ID="Label91" runat="server" Text="Valor aproximado:"></asp:Label>
                                    </div>
                                    <div class="col-lg-5">
                                        <asp:TextBox ID="Valor_Aproximado_Inversiones_TextBox" placeholder="$" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label92" runat="server" Text="4.4 En fideicomisos." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>
                                <div class=" col-lg-12">
                                    <div class="col-lg-4" style="text-align: center">
                                        <form>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">Si</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox" value="">No</label>
                                        </form>
                                    </div>
                                    <div class="col-lg-3" style="text-align: right">
                                        <asp:Label ID="Label93" runat="server" Text="Valor aproximado:"></asp:Label>
                                    </div>
                                    <div class="col-lg-5">
                                        <asp:TextBox ID="Valor_Aproximados_Fideicomisos_TextBox" placeholder="$" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_presentacion_P7" data-dismiss="modal" style="width: 100px">Anterior</button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_situacion_financiera_P2" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button15" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" tabindex="-1" data-backdrop="static" id="div_situacion_financiera_P2">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Concepto
                                                </th>
                                                <th class="text-center">Importe promedio anual
                                                </th>
                                                <th class="text-center">%
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Aportación de Patronatos" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Cuotas de socios" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Recuperación por servicio asistencial" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Productos financieros (intereses)" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Eventos (rifas, sorteos, bazares, etc)" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Subsidios de gobierno" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Actividades productivas (ventas de articulos)" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Rentas" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Otras (especificar)" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5" style="text-align: right">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Total de ingresos promedio anual" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" disabled />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_situacion_financiera_P1" data-dismiss="modal" style="width: 100px">Anterior</button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_situacion_financiera_P3" data-dismiss="modal" style="width: 100px">Siguiente</button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button16" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" tabindex="-1" data-backdrop="static" id="div_situacion_financiera_P3">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12">
                                    <table class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Concepto
                                                </th>
                                                <th class="text-center">Importe promedio anual
                                                </th>
                                                <th class="text-center">%
                                                </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Gastos administrativos" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Gastos asistenciales" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Otros gastos (especifique)" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="col-lg-5" style="text-align: right">
                                                    <input type="text" name='Concepto' class="form-control" placeholder="Total de egresos (promedio anual)" disabled />
                                                </td>
                                                <td>
                                                    <input type="text" name='Importe' class="form-control" disabled />
                                                </td>
                                                <td class="col-lg-1">
                                                    <input type="text" name='Porcentaje' class="form-control" />
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_situacion_financiera_P2" data-dismiss="modal" style="width: 100px">Anterior</button>
                                </div>
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#div_cumplimiento_P1" data-dismiss="modal" style="width: 100px">
                                        Siguiente
                                    </button>
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button17" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- 5 --%>
            <div class="modal fade" tabindex="-1" data-backdrop="static" id="div_cumplimiento_P1">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                            <h2>5. CUMPLIMIENTO DE LAS OBLIGACIONES FISCALES</h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label94" runat="server" Text="5.1 Datos Generales:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <asp:Label ID="Label95" runat="server" Text="Nombre, razón o denominacion social:"></asp:Label>
                                    <asp:TextBox ID="Nombre_Razon_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <asp:Label ID="Label96" runat="server" Text="Domicilio Fiscal:"></asp:Label>
                                    <asp:TextBox ID="Domicilio_Fiscal_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <asp:Label ID="Label97" runat="server" Text="Clave del Registro Federal de Contribuyentes:"></asp:Label>
                                    <asp:TextBox ID="Clave_Registro_TextBox" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <asp:Label ID="Label98" runat="server" Text="¿Ha presentado en tiempo y forma las declaraciones del ejercicio por impuestos federales que corresponden a los últimos tres ejercicios fiscales, 
                                        asi como la declaraciones de pagos provisionales correspondientes a__ y__; por los ultimos impuestos, o siendo de nueva creación, ha dado cumplimiento a las obligaciones fiscales?:"></asp:Label>
                                    <form>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Si.</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />No.</label>
                                    </form>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <asp:Label ID="Label99" runat="server" Text="¿Tiene adeudos fiscales firmes a cargo por impuestos federales?"></asp:Label>
                                    <form>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="">Si.</label>
                                        <label class="checkbox-inline">
                                            <input type="checkbox" value="" />No.</label>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <div class="col-lg-4">
                                    <button type="button" class="btn btn-success" data-toggle="modal" data-target="#div_situacion_financiera_P3" data-dismiss="modal" style="width: 100px">Anterior</button>
                                </div>
                                <div class="col-lg-4">
                                </div>
                                <div class="col-lg-4">
                                    <asp:Button ID="Button18" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
    <%--    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>

    <script src="<%= ResolveUrl("~/Scripts/jquery.blockUI.js") %>"></script>--%>
    <script type="text/javascript">

        //function myFunction() {
        //    var myWindow = window.open("", "", "width=200,height=100");
        //}

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
        }

        function despliega_aviso(mensaje) {
            $('#div_alertas').find('.mensaje').text(mensaje);
            $('#div_alertas').modal('show');
        }

        function bloquea_pagina() {
            $.blockUI({ message: 'Espere por Favor...' });
        }

        function desbloquea_pagina() {
            $.unblockUI();
        }

        function hideModal() {
            $('.modal-backdrop.fade.in').remove();
        }

        //var i = 1;

        //$("#add_row").click(function () {
        //    $('#addr' + i).html("<td>" + (i + 1) + "</td><td><input name='name" + i + "' type='text' placeholder='Concepto' class='form-control input-md'  /> </td><td><input  name='mail" + i + "' type='text' placeholder='Monto'  class='form-control input-md'></td>");
        //    i++;
        //    $('#tab_logic').append('<tr id="addr' + (i) + '"></tr>');
        //});

        //$("#delete_row").click(function () {
        //    if (i > 1) {
        //        $("#addr" + (i - 1)).html('');
        //        i--;
        //    }
        //});

    </script>
</asp:Content>
