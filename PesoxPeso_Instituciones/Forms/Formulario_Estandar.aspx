﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Formulario_Estandar.aspx.cs" Inherits="Forms_Formulario_Estandar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
    <link href="<%=  ResolveClientUrl("~/content/css/plugins/datapicker/datepicker3.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>

            <div class="row col-lg-12">
                <div class="col-lg-10" style="text-align: left">
                    <asp:Label ID="Nombre_Institucion_Encabezado_Label" runat="server" Text="Nombre Institucion" Font-Size="X-Large"></asp:Label>
                </div>
                <div class="col-lg-2" style="text-align: right">
                    <asp:LinkButton ID="Home" CssClass="btn btn-success" runat="server" OnClick="Home_Click"><span class="glyphicon glyphicon-home"></span></asp:LinkButton>
                </div>
            </div>

            <div class="row col-lg-12" style="text-align: center">
                <h1 style="background: #CCCCCC; text-align: center"><b>FORMULARIO ESTÁNDAR</b></h1>
            </div>

            <div id="botones" class="col-xs-12" style="top: 0; left: 0">
                <div class="row" style="text-align: center">
                    <div class="col-lg-12">
                        <h3><b>1. Carátula de identificación</b></h3>
                        <asp:Button ID="Caratula_Button" runat="server" Text="Registro" CssClass="btn btn-info btn-md" CommandArgument="div_registro_P1" OnCommand="Botones_Click" />
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <h3><b>2. Datos que acreditan la existencia de la personalidad jurídica</b></h3>
                        <asp:Button ID="Datos_acreditar_Button" runat="server" Text="Registro" CssClass="btn btn-info btn-md" CommandArgument="div_acreditar_P1" OnCommand="Botones_Click" />
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <h3><b>3. Presentación del proyecto</b></h3>
                        <asp:Button ID="Presentacion_Button" runat="server" Text="Registro" CssClass="btn btn-info btn-md" CommandArgument="div_presentacion_P1" OnCommand="Botones_Click" />
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <h3><b>4. Situación financiera</b></h3>
                        <asp:Button ID="Situacion_Financiera_Button" runat="server" Text="Registro" CssClass="btn btn-info btn-md" CommandArgument="div_situacion_financiera_P1" OnCommand="Botones_Click" />
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <h3><b>5. Cumplimiento de las obligaciones fiscales</b></h3>
                        <asp:Button ID="Obligaciones_Button" runat="server" Text="Registro" CssClass="btn btn-info btn-md" CommandArgument="div_cumplimiento_P1" OnCommand="Botones_Click" />
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <asp:Button ID="Adjuntar_Archivos_Button" runat="server" Text="Adjuntar Archivos" CssClass="btn btn-success" CommandName="" CommandArgument="" OnClick="Adjuntar_Archivos_Button_Click" />
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <asp:Button ID="Salir_Sin_Guardar_Button" runat="server" Text="Guardar Sin Enviar" CssClass="btn btn-primary" CommandName="" CommandArgument="Simular_Guardar" OnCommand="Terminar_Registro_Button_Click" />
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <asp:Button ID="Terminar_Registro_Button" runat="server" Text="Terminar Registro" CssClass="btn btn-danger" CommandName="" CommandArgument="Guardar_Todo" OnCommand="Terminar_Registro_Button_Click" />
                        </div>
                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3">
                            <asp:Button ID="Imprimir_Button" runat="server" Text="imprimir" CssClass="btn btn-info btn-md" OnClick="Imprimir_Click" />
                        </div>
                    </div>
                </div>
            </div>

            <%--            <div id="Guardar_Todo" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2><b>¡PRECAUCION!</b></h2>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Labelx" runat="server" Text="La informacion se guardara y no se podre editar la informacion capturada ¿Seguro desea guardar toda la informacion registrada?"></asp:Label>
                        </div>
                        <div class="modal-footer">
                            <div class="col-lg-12">
                                <div class="col-lg-6" style="text-align: center">
                                    <asp:Button ID="Guardar_Button" runat="server" Text="Guardar informacion" CssClass="btn btn-primary" CommandName="" CommandArgument="" />
                                </div>
                                <div class="col-lg-6" style="text-align: center">
                                    <asp:Button ID="Cancelar_Button" runat="server" Text="Cancelar" CssClass="btn btn-danger" data-dismiss="modal" Style="width: 100px" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>--%>

            <%--onkeyup="this.value=cpf(this.value);" --%>

            <%--1--%>
            <div id="div_registro_P1" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label6" runat="server" Text="II. INFORMACIÓN GENERAL" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:Label ID="Nombre_Dominio_Label" runat="server" Text="Nombre o denominación de la institución (de acuerdo al acta constitutiva):"></asp:Label>
                                        <asp:TextBox ID="Nombre_Dominio_TextBox" runat="server" CssClass="form-control" ReadOnly="True" MaxLength="200" onkeydown="return (event.keyCode!=13);"></asp:TextBox>

                                        <asp:Label ID="Nombre_Programa_Label" runat="server" Text="Nombre del proyecto:"></asp:Label>
                                        <asp:TextBox ID="Nombre_Programa_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" MaxLength="200" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label28" runat="server" Text="SECTOR O RUBROS DE ATENCIÓN" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <div class="col-lg-offset-1 col-lg-10" style="text-align: center">
                                        <asp:SqlDataSource ID="Detalles_Sector_Rubros_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_sector_rubros" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Sector_Rubros_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_sector_rubro"
                                            DataSourceID="Detalles_Sector_Rubros_SqlDataSource" CssClass="table table-hover table-bordered" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:BoundField DataField="nombre_sector_rubro" HeaderText="Tipos" SortExpression="nombre_sector_rubro" />
                                                <asp:TemplateField HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="col-xs-12 col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Datos_Registro_P1" runat="server" Text="Siguiente" CssClass="btn btn-primary" CommandName="div_registro_P1" CommandArgument="div_registro_P2" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Salir_Button" runat="server" Text="Salir" CssClass="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_registro_P2" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12">
                                    <asp:Label ID="Objetivo_Social_Label" runat="server" Text="Objetivo social:"></asp:Label>
                                    <asp:TextBox ID="Objetivo_Social_Programa_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                </div>

                                <div class="col-lg-12">
                                    <div class="form-group">
                                        <asp:Label ID="Label87" runat="server" Text="Fecha constitución:"></asp:Label>
                                        <div class="input-group date">
                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                            <asp:TextBox ID="Fecha_Constitucion_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label7" runat="server" Text="III. DATOS ORGANIZACIONALES" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="col-lg-12">
                                    <br />
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label2" runat="server" Text="Remunerados:"></asp:Label>
                                        <asp:TextBox ID="Remunerados_TextBox" runat="server" CssClass="form-control"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" BackColor="#ffffea"
                                            MaxLength="7" OnTextChanged="Calcular_Total_Personas_Laborando" AutoPostBack="true" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-3">
                                        <asp:Label ID="Label3" runat="server" Text="Voluntarios:"></asp:Label>
                                        <asp:TextBox ID="Voluntarios_TextBox" runat="server" CssClass="form-control"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" BackColor="#ffffea"
                                            MaxLength="7" OnTextChanged="Calcular_Total_Personas_Laborando" AutoPostBack="true" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label1" runat="server" Text="Número de personas que laboran en la institución:"></asp:Label>
                                        <asp:TextBox ID="Num_Personas_Laborando_TextBox" runat="server" CssClass="form-control"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            MaxLength="7" ReadOnly="true" onkeydown="return (event.keyCode!=13);">0</asp:TextBox>
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label4" runat="server" Text="Mencionar las áreas de atención en la institución:"></asp:Label>
                                        <asp:TextBox ID="Areas_atencion_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label5" runat="server" Text="Mencionar las áreas de apoyo administrativo de la institución:"></asp:Label>
                                        <asp:TextBox ID="Areas_Apoyo_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_registro_P2_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_registro_P2" CommandArgument="div_registro_P1" OnCommand="Botones_Click" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_registro_P2_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_registro_P2" CommandArgument="div_registro_P3" OnCommand="Botones_Click" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button2" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div id="div_registro_P3" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
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
                                    <br />
                                    <div class="col-lg-12">
                                        <b>
                                            <asp:Label ID="Total_población_Label" runat="server" Text="Población atendida en promedio mensual en el año actual y anterior:"></asp:Label></b>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="col-lg-6">
                                            <asp:Label ID="Año_Actual_Label" runat="server" Text="Poblacion año actual:"></asp:Label>
                                            <asp:TextBox ID="Año_Actual_TextBox" runat="server" class="form-control"
                                                onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                                BackColor="#ffffea" MaxLength="7" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                        </div>
                                        <div class="col-lg-6">
                                            <asp:Label ID="Año_Anterior_Label" runat="server" Text="Poblacion año Anterior:"></asp:Label>
                                            <asp:TextBox ID="Año_Anterior_TextBox" runat="server" class="form-control"
                                                onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                                BackColor="#ffffea" MaxLength="7" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label9" runat="server" Text="V. INFORMACIÓN FINANCIERA" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">

                                        <asp:Label ID="Total_Ingresos_Label" runat="server" Text="Total de ingresos captados en efectivo por actividades y/o donaciones durante el ejercicio actual:"></asp:Label>
                                        <div class="input-group m-b">
                                            <span class="input-group-addon">$</span>
                                            <asp:TextBox ID="Total_Ingresos_TextBox" runat="server" class="form-control"
                                                onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" BackColor="#ffffea"
                                                onkeyup="this.value=cpf(this.value);" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Total_Donativos_Label" runat="server" Text="Total de donativos en especie recibidos en el ejercicio actual:"></asp:Label>
                                        <div class="input-group m-b">
                                            <span class="input-group-addon">$</span>
                                            <asp:TextBox ID="Total_Donativos_TextBox" runat="server" class="form-control"
                                                onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" BackColor="#ffffea"
                                                onkeyup="this.value=cpf(this.value);" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                        </div>

                                        <asp:Label ID="Total_Egresos_Label" runat="server" Text="Total de egresos aplicados:"></asp:Label>
                                        <div class="input-group m-b">
                                            <span class="input-group-addon">$</span>
                                            <asp:TextBox ID="Total_Egresos_TextBox" runat="server" class="form-control"
                                                onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" BackColor="#ffffea"
                                                onkeyup="this.value=cpf(this.value);" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>

                                        </div>

                                        <asp:Label ID="Monto_Solicitado_Label" runat="server" Text="Monto Solicitado:"></asp:Label>
                                        <div class="input-group m-b">
                                            <span class="input-group-addon">$</span>
                                            <asp:TextBox ID="Monto_Solicitado_TextBox" runat="server" class="form-control"
                                                onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" BackColor="#ffffea"
                                                onkeyup="this.value=cpf(this.value);" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_registro_P3_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_registro_P3" CommandArgument="div_registro_P2" OnCommand="Botones_Click" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_registro_P3_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_registro_P3" CommandArgument="div_acreditar_P1" OnCommand="Botones_Click" />
                                </div>

                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button13" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--2--%>
            <div id="div_acreditar_P1" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
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
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:Label ID="Nombre_Institucion_Label" runat="server" Text="Nombre de la institución/nombre comercial:"></asp:Label>
                                        <asp:TextBox ID="Nombre_Institucion_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>

                                        <asp:Label ID="Denominacion_Label" runat="server" Text="Denominación o razón social de la institución:"></asp:Label>
                                        <asp:TextBox ID="Denominacion_TextBox" runat="server" class="form-control" ReadOnly="True" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Registro_contribuyente_Label" runat="server" Text="Registro federal de contribuyente:"></asp:Label>
                                        <asp:TextBox ID="Registro_contribuyente_TextBox" runat="server" class="form-control" Style="text-transform: uppercase" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Siglas_Label" runat="server" Text="Siglas:"></asp:Label>
                                        <asp:TextBox ID="Siglas_TextBox" runat="server" class="form-control" BackColor="#ffffea" Style="text-transform: uppercase" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="row col-lg-12 ">

                                    <div class="col-lg-12">
                                        <asp:Label ID="Label78" runat="server" Text="Objetivo Social:"></asp:Label>
                                        <asp:TextBox ID="Objetivo_Social_TextBox" runat="server" class="form-control" TextMode="MultiLine" Rows="4" ReadOnly="true" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Telefono_Label" runat="server" Text="Teléfono:"></asp:Label>
                                        <asp:TextBox ID="Telefono_TextBox" runat="server" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Correo_electrico_Label" runat="server" Text="Correo electrónico:"></asp:Label>
                                        <asp:TextBox ID="Correo_electronico_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-6">
                                        <asp:Label ID="Pagina_Web_Label" runat="server" Text="Página web:"></asp:Label>
                                        <asp:TextBox ID="Pagina_Web_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-6">
                                        <asp:Label ID="Label59" runat="server" Text="Red social:"></asp:Label>
                                        <asp:TextBox ID="Red_Social_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_acreditar_P1_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_acreditar_P1" CommandArgument="div_registro_P3" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_acreditar_P1_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_acreditar_P1" CommandArgument="div_acreditar_P2" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button1" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_acreditar_P2" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label11" runat="server" Text="2.2 Domicilio Legal y/o Fiscal" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12 ">
                                    <br />

                                    <div class="col-lg-12">
                                        <asp:Label ID="Label12" runat="server" Text="Calle y número:"></asp:Label>
                                        <asp:TextBox ID="Calle_Numero_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Label13" runat="server" Text="Municipio:"></asp:Label>
                                        <asp:DropDownList ID="Municipio_DropDownList" runat="server" class="form-control" BackColor="#ffffea" DataSourceID="Municipios_SqlDataSource" DataTextField="nombre_municipio" DataValueField="id_municipio">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label14" runat="server" Text="Colonia:"></asp:Label>
                                        <asp:TextBox ID="Colonia_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label15" runat="server" Text="Entidad Federativa:"></asp:Label>
                                        <asp:DropDownList ID="Entidad_Federativa_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                            <asp:ListItem>Sonora</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-lg-12 ">
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label16" runat="server" Text="Código postal:"></asp:Label>
                                        <asp:TextBox ID="CP_TextBox" runat="server" class="form-control"
                                            MaxLength="5" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label17" runat="server" Text="Celular:"></asp:Label>
                                        <asp:TextBox ID="Celular_TextBox" runat="server" class="form-control"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label18" runat="server" Text="Teléfono:"></asp:Label>
                                        <asp:TextBox ID="Telefonos_TextBox" runat="server" class="form-control"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label30" runat="server" Text="Correo electrónico:"></asp:Label>
                                        <asp:TextBox ID="Correo_Domicilio_Fiscal" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>

                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label20" runat="server" Text="2.3 Personalidad Jurídica:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label21" runat="server" Text="Forma de contitución:"></asp:Label>
                                        <asp:DropDownList ID="Personalidad_Juridica_DropDownList" runat="server" class="form-control" BackColor="#ffffea"
                                            DataSourceID="Personalidad_Juridica_SqlDataSource" DataTextField="nombre_personalidad_juridica" DataValueField="id_personalidad_juridica" OnSelectedIndexChanged="Personalidad_Juridica_DropDownList_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-6">
                                        <asp:Label ID="Label22" runat="server" Text="Especifique:"></asp:Label>
                                        <asp:TextBox ID="Otro_Personalidad_Juridica_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <asp:Button ID="div_acreditar_P2_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_acreditar_P2" CommandArgument="div_acreditar_P1" OnCommand="Botones_Click" />
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <asp:Button ID="div_acreditar_P2_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_acreditar_P2" CommandArgument="div_acreditar_P3" OnCommand="Botones_Click" />
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <asp:Button ID="Button3" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_acreditar_P3" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label23" runat="server" Text="2.5 Acta constitutiva y sus reformas" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label24" runat="server" Text="No. de la escritura pública en la que consta su acta constitutiva, como IAP, IAC u otra institución no gubernamental:"></asp:Label>
                                        <asp:TextBox ID="Num_Escritura_TextBox" runat="server" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label117" runat="server" Text="Volumen:"></asp:Label>
                                        <asp:TextBox ID="Volumen_Num_Escritura_TextBox" runat="server" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="form-group">
                                            <asp:Label ID="Label26" runat="server" Text="Fecha:"></asp:Label>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <asp:TextBox ID="Fecha_Escritura_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-12" style="text-align: center">
                                        <asp:Label ID="Label29" runat="server" Text="Información notario público ante el cual se dio fe de la misma" Font-Bold="True"></asp:Label>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label25" runat="server" Text="Nombre:"></asp:Label>
                                        <asp:TextBox ID="Nombre_Notario_Pulico_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label60" runat="server" Text="Número:"></asp:Label>
                                        <asp:TextBox ID="Numero_Notario_TextBox" runat="server" class="form-control" BackColor="#ffffea"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label64" runat="server" Text="Lugar:"></asp:Label>
                                        <asp:TextBox ID="Lugar_Notario_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label27" runat="server" Text="No. registro Público de la Propiedad:"></asp:Label>
                                        <asp:TextBox ID="Registro_Propiedad_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label120" runat="server" Text="Volumen:"></asp:Label>
                                        <asp:TextBox ID="Volumen_Registro_Propiedad_TextBox" runat="server" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label112" runat="server" Text="Fecha:"></asp:Label>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <asp:TextBox ID="Fecha_Registro_Propiedad_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label19" runat="server" Text="Descripción del objetivo social:"></asp:Label>
                                        <asp:TextBox ID="Descripcion_Objeto_Social_TextBox" runat="server" class="form-control" TextMode="MultiLine" Rows="4" ReadOnly="True" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <div class="col-lg-12" style="text-align: right">
                                        <asp:Button ID="Agregar_Reforma_Constitutiva_Button" runat="server" CssClass="btn btn-primary" Text="Agregar reforma" OnClick="Agregar_Reforma_Constitutiva_Button_Click" />
                                    </div>
                                    <div class="col-lg-12">
                                        <br />
                                        <asp:SqlDataSource ID="Detalle_Reformas_Constitutivas_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_reformas_constitutivas" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Reformas_Constitutivas_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_reforma_contitutiva"
                                            DataSourceID="Detalle_Reformas_Constitutivas_SqlDataSource" CssClass="table table-hover table-bordered" onkeydown="return (event.keyCode!=13);">

                                            <Columns>
                                                <asp:TemplateField HeaderText="Reformas" HeaderStyle-Width="60%">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Detalle_Reforma_TextBox" runat="server" Text='<%# Bind("reforma") %>'
                                                            BackColor="#ffffea" Width="100%" TextMode="MultiLine" Rows="4"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Fecha" HeaderStyle-Width="30%" HeaderStyle-VerticalAlign="Middle">
                                                    <ItemTemplate>
                                                        <div class="form-group">
                                                            <asp:Label ID="Label26" runat="server"></asp:Label>
                                                            <div class="input-group date">
                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                <asp:TextBox ID="Fecha_Reforma_TextBox" runat="server"
                                                                    Text='<%# Bind("fecha") %>'
                                                                    CssClass="form-control" BackColor="#ffffea"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Button ID="Eliminar_Reforma_Constitutiva_Button" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="Eliminar_Reforma_Constitutiva_Button_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_acreditar_P3_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_acreditar_P3" CommandArgument="div_acreditar_P2" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_acreditar_P3_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_acreditar_P3" CommandArgument="div_acreditar_P4" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button4" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div id="div_acreditar_P4" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label31" runat="server" Text="2.6 ¿Tiene la institución autorización de la Secretaria de Hacienda para expedir recibos deducibles de impuestos sobre la renta?" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-8">
                                        <asp:Label ID="Label32" runat="server" Text="Seleccione un opción:"></asp:Label>
                                        <asp:DropDownList ID="Permiso_Expedir_Recibos_DropDownList" runat="server" class="form-control" BackColor="#ffffea"
                                            OnSelectedIndexChanged="Permiso_Expedir_Recibos_DropDownList_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem>Sí</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                            <asp:ListItem>En trámite</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        <div id="fecha_permiso" runat="server" class="form-group">
                                            <asp:Label ID="Label33" runat="server" Text="¿Desde qué fecha?"></asp:Label>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <asp:TextBox ID="Fecha_Permisos_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label34" runat="server" Text="2.7 Fecha de la última publicación en el Diario Oficial" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <asp:Label ID="Label115" runat="server" Text="Fecha:"></asp:Label>
                                            <div class="input-group date">
                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                <asp:TextBox ID="Fecha_Ultima_Publicacion_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Label36" runat="server" Text="Sección:"></asp:Label>
                                        <asp:TextBox ID="Seccion_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-4">
                                        <asp:Label ID="Label37" runat="server" Text="Página"></asp:Label>
                                        <asp:TextBox ID="Pagina_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label42" runat="server" Text="2.8 Órgano Supremo de la institución" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-8">
                                        <asp:Label ID="Label49" runat="server" Text="Seleccione un opción:"></asp:Label>
                                        <asp:DropDownList ID="Organo_Supremo_DropDownList" runat="server" class="form-control" BackColor="#ffffea" DataSourceID="Organos_Supremos_SqlDataSource"
                                            DataTextField="nombre_organo_supremo" DataValueField="id_organo_supremo" OnSelectedIndexChanged="Organo_Supremo_DropDownList_SelectedIndexChanged" AutoPostBack="true">
                                        </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label50" runat="server" Text="Describa cual:"></asp:Label>
                                        <asp:TextBox ID="Otro_Organo_Supremo_TextBox" runat="server" class="form-control" ReadOnly="true" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_acreditar_P4_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_acreditar_P4" CommandArgument="div_acreditar_P3" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_acreditar_P4_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_acreditar_P4" CommandArgument="div_acreditar_P5" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button19" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_acreditar_P5" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        </div>
                        <div class="modal-body">
                            <div class="row col-lg-12" style="text-align: center">
                                <br />
                                <asp:Label ID="Label51" runat="server" Text="2.9 Datos del Representante Legal" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                            </div>

                            <div class="row col-lg-12" style="text-align: center">
                                <br />
                                <div class="col-lg-12">
                                    <asp:Label ID="Label52" runat="server" Text="Nombre:"></asp:Label>
                                    <asp:TextBox ID="Nombre_Representante_Legal_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>

                                <div class="col-lg-6">
                                    <asp:Label ID="Label53" runat="server" Text="Calle:"></asp:Label>
                                    <asp:TextBox ID="Calle_Representante_Legal_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>

                                <div class="col-lg-2">
                                    <asp:Label ID="Label81" runat="server" Text="Número:"></asp:Label>
                                    <asp:TextBox ID="Numero_Representante_Legal_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>

                                <div class="col-lg-4">
                                    <asp:Label ID="Label82" runat="server" Text="Colonia:"></asp:Label>
                                    <asp:TextBox ID="Colonia_Representante_Legal_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>

                                <div class="col-lg-6">
                                    <asp:Label ID="Label83" runat="server" Text="Municipio:"></asp:Label>
                                    <asp:DropDownList ID="Ciudad_Representante_Legal_DropDownList" runat="server" class="form-control" BackColor="#ffffea" DataSourceID="Municipios_SqlDataSource" DataTextField="nombre_municipio" DataValueField="id_municipio">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label ID="Label107" runat="server" Text="Entidad federativa:"></asp:Label>
                                    <asp:DropDownList ID="Estado_Representante_Legal_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                        <asp:ListItem>Sonora</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>

                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-lg-6">
                                    <asp:Label ID="Label54" runat="server" Text="Teléfono:"></asp:Label>
                                    <asp:TextBox ID="Telefono_Representante_Legal_TextBox" runat="server" class="form-control"
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                        BackColor="#ffffea" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label ID="Label106" runat="server" Text="Celular:"></asp:Label>
                                    <asp:TextBox ID="Celular_Representante_Legal_TextBox" runat="server" class="form-control"
                                        onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                        BackColor="#ffffea" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                                <div class="col-lg-6">
                                    <asp:Label ID="Label55" runat="server" Text="Correo electrónico:"></asp:Label>
                                    <asp:TextBox ID="Correo_Representante_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>

                                <div class="col-lg-6">
                                    <asp:Label ID="Label56" runat="server" Text="RFC:"></asp:Label>
                                    <asp:TextBox ID="Rfc_Representante_TextBox" runat="server" class="form-control" BackColor="#ffffea" Style="text-transform: uppercase" MaxLength="13" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <br />
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_acreditar_P5_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_acreditar_P5" CommandArgument="div_acreditar_P4" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_acreditar_P5_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_acreditar_P5" CommandArgument="div_presentacion_P1" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button14" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--3--%>
            <div id="div_presentacion_P1" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                            <h2>3. PRESENTACIÓN DEL PROYECTO</h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label48" runat="server" Text="3.1 Nombre del Proyecto" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:TextBox ID="Nombre_Programa_2_TextBox" runat="server" class="form-control" ReadOnly="True"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label47" runat="server" Text="3.2 Domicilio de oficinas operativas y/o ubicación de ejecución del proyecto:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label38" runat="server" Text="Calle:"></asp:Label>
                                        <asp:TextBox ID="Calle_Oficinas_Operativas_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label113" runat="server" Text="Número:"></asp:Label>
                                        <asp:TextBox ID="Numero_Oficinas_Operativas_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label39" runat="server" Text="Colonia:"></asp:Label>
                                        <asp:TextBox ID="Colonia_Oficinas_Operativas_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                        <%--                                        <asp:DropDownList ID="Colonia_Oficinas_Operativas_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                            <asp:ListItem>Balderrama</asp:ListItem>
                                        </asp:DropDownList>--%>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-2">
                                        <asp:Label ID="Label44" runat="server" Text="Código Postal:"></asp:Label>
                                        <asp:TextBox ID="CP_Oficina_Operativa_TextBox" runat="server" class="form-control"
                                            BackColor="#ffffea" MaxLength="5" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-10">
                                        <asp:Label ID="Label40" runat="server" Text="Entre las calles:"></asp:Label>
                                        <asp:TextBox ID="Entre_Calles_Oficinas_Operativas_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label41" runat="server" Text="Municipio:"></asp:Label>
                                        <asp:DropDownList ID="Id_Municipio_Oficina_Operativa_DropDownList" runat="server" class="form-control" BackColor="#ffffea" DataSourceID="Municipios_SqlDataSource" DataTextField="nombre_municipio" DataValueField="id_municipio">
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-6">
                                        <asp:Label ID="Label45" runat="server" Text="Teléfono:"></asp:Label>
                                        <asp:TextBox ID="Telefono_Oficina_Operativa_TextBox" runat="server" class="form-control"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" MaxLength="10" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label43" runat="server" Text="Horario de prestación de servicios:"></asp:Label>
                                        <asp:TextBox ID="Horario_Oficina_Operativa_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-7" style="text-align: justify">
                                        <asp:Label ID="Mensaje_Incompleto" runat="server" Text="*Quedan campos vacios" ForeColor="Red" Visible="false"></asp:Label>
                                        <asp:Label ID="Label116" runat="server" Text="*Debera llenar los campos para agregar por lo menos una oficina operativa, en caso en que el proyecto se desarrolle individualmente en otro domicilio, favor de repetir el proceso."></asp:Label>
                                    </div>
                                    <div class="col-lg-2" style="text-align: center">
                                        <asp:Button ID="Limpiar_Button" runat="server" Text="Limpiar" CssClass="btn btn-warning" Visible="false" OnClick="Limpiar_Button_Click"/>
                                    </div>
                                    <div class="col-lg-3" style="text-align: center">
                                        <asp:Button ID="Agregar_Oficina_Operativa_Button" runat="server" Text="Agregar oficina operativa" CssClass="btn btn-success" OnCommand="Agregar_Oficina_Operativa_Button_Command"/>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <asp:SqlDataSource ID="Detalles_Oficinas_Operativas_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_oficinas_operativas" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                                    <asp:GridView ID="Oficinas_Operativas_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="Detalles_Oficinas_Operativas_SqlDataSource"
                                        CssClass="table table-hover table-bordered" DataKeyNames="id_oficina_operativa" onkeydown="return (event.keyCode!=13);">
                                        <Columns>
                                            <asp:BoundField DataField="Oficinas_Operativas" HeaderText="Oficinas Operativas" ReadOnly="True" SortExpression="Oficinas_Operativas" />
                                            <asp:TemplateField HeaderStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:Button ID="Ver_Info_Oficina_Operativa" runat="server" Text="Ver" CssClass="btn btn-info" OnClick="Ver_Info_Oficina_Operativa_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-Width="10%">
                                                <ItemTemplate>
                                                    <asp:Button ID="Eliminar_Oficina_Operativa_Button" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="Eliminar_Oficina_Operativa_Button_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P1_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P1" CommandArgument="div_acreditar_P5" OnCommand="Botones_Click" OnClick="Agregar_Oficina_Operativa_Button_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P1_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P1" CommandArgument="div_presentacion_P2" OnCommand="Botones_Click" OnClick="Agregar_Oficina_Operativa_Button_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button5" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div id="div_presentacion_P2" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label46" runat="server" Text="3.3 Descripción del Proyecto" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:TextBox ID="Descripcion_Programa_TextBox" runat="server" class="form-control" BackColor="#ffffea" TextMode="MultiLine" Rows="30"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P2_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P2" CommandArgument="div_presentacion_P1" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P2_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P2" CommandArgument="div_presentacion_P3" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button6" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div id="div_presentacion_P3" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label57" runat="server" Text="3.4 Metas del Proyecto" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:TextBox ID="Meta_Programa_TextBox" runat="server" class="form-control" BackColor="#ffffea" TextMode="MultiLine" Rows="12"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label71" runat="server" Text="3.5 Diagnóstico Situacional:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:TextBox ID="Diagnostico_Situacional_TextBox" runat="server" TextMode="MultiLine" Rows="12" BackColor="#ffffea" Width="100%" placeholder="(Descripción breve de sus necesidades y problemáticas)"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P3_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P3" CommandArgument="div_presentacion_P2" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P3_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P3" CommandArgument="div_presentacion_P4" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button7" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div id="div_presentacion_P4" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label72" runat="server" Text="3.6 Enlace del Proyecto:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-6">
                                        <asp:Label ID="Label114" runat="server" Text="Nombre:"></asp:Label>
                                        <asp:TextBox ID="Nombre_Enlace_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-3">
                                        <asp:Label ID="Label118" runat="server" Text="Teléfono:"></asp:Label>
                                        <asp:TextBox ID="Telefono_Enlace_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" MaxLength="10" onkeydown="return (event.keyCode!=13);" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"></asp:TextBox>
                                    </div>

                                    <div class="col-lg-3">
                                        <asp:Label ID="Label119" runat="server" Text="Correo:"></asp:Label>
                                        <asp:TextBox ID="Correo_Enlace_TextBox" runat="server" CssClass="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label58" runat="server" Text="3.7 Tiempo estimado por etapas para la puesta en marcha del proyecto:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12" style="text-align: right">
                                        <asp:Button ID="Agregar_Etapa_Button" runat="server" CssClass="btn btn-primary" Text="Agregar nueva etapa" OnClick="Agregar_Etapa_Button_Click" />
                                    </div>

                                    <div class="col-lg-12">
                                        <br />
                                        <asp:SqlDataSource ID="Detalles_Tiempo_Estimado_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_tiempo_estimado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Tiempos_Estimados_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_tiempo_estimado"
                                            DataSourceID="Detalles_Tiempo_Estimado_SqlDataSource" CssClass="table table-hover table-bordered" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Fecha inicial" HeaderStyle-Width="20%" HeaderStyle-VerticalAlign="Middle">
                                                    <ItemTemplate>
                                                        <div class="form-group">
                                                            <asp:Label ID="Label500" runat="server"></asp:Label>
                                                            <div class="input-group date">
                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                <asp:TextBox ID="Fecha_Inicial_TextBox" runat="server"
                                                                    Text='<%# Bind("fecha_inicial") %>'
                                                                    CssClass="form-control" BackColor="#ffffea"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Fecha final" HeaderStyle-Width="20%" HeaderStyle-VerticalAlign="Middle">
                                                    <ItemTemplate>
                                                        <div class="form-group">
                                                            <asp:Label ID="Label26" runat="server"></asp:Label>
                                                            <div class="input-group date">
                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                                <asp:TextBox ID="Fecha_final_TextBox" runat="server"
                                                                    Text='<%# Bind("fecha_final") %>'
                                                                    CssClass="form-control" BackColor="#ffffea"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Descripción" HeaderStyle-Width="50%">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Descripcion_Tiempo_TextBox" runat="server" Text='<%# Bind("descripcion") %>'
                                                            BackColor="#ffffea" Width="100%"
                                                            TextMode="MultiLine" Rows="4"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Button ID="Eliminar_Tiempo_Estimado_Button" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="Eliminar_Tiempo_Estimado_Button_Click" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P4_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P4" CommandArgument="div_presentacion_P3" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P4_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P4" CommandArgument="div_presentacion_P5" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button8" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_presentacion_P5" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label62" runat="server" Text="3.8 Explique brevemente por qué el proyecto o ayuda solicitada, constribuirá a subsanar las necesidades o problemáticas." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:TextBox ID="Justificacion_Programa_TextBox" runat="server" TextMode="MultiLine" Rows="3" BackColor="#ffffea" Width="100%"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label63" runat="server" Text="3.9 Costo estimado del proyecto." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />

                                    <div class="col-lg-12" style="text-align: right">
                                        <asp:Button ID="Agregar_Costo_Button" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="Agregar_Costo_Button_Click" />
                                    </div>

                                    <div class="col-lg-12" style="text-align: right">
                                        <br />
                                        <asp:SqlDataSource ID="Detalle_Costo_Estimado_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_costo_estimado" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Costo_Estimado_Programa_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_costo_estimado"
                                            DataSourceID="Detalle_Costo_Estimado_SqlDataSource" CssClass="table table-hover table-bordered" ShowFooter="true" OnRowDataBound="Costo_Estimado_Programa_GridView_RowDataBound" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Conceptos ">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Detalle_Concepto_TextBox" runat="server" Text='<%# Bind("concepto") %>'
                                                            BackColor="#ffffea" class="form-control"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="Label61" runat="server" Text="Total:" Font-Bold="true" Font-Size="Larger"></asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Monto">
                                                    <ItemTemplate>
                                                        <div class="input-group m-b">
                                                            <span class="input-group-addon">$</span>
                                                            <asp:TextBox ID="Detalle_Monto_TextBox" runat="server" Text='<%# Bind("monto") %>' OnTextChanged="Detalle_Costo_Estimado_TextBox_TextChanged"
                                                                AutoPostBack="true" class="form-control" BackColor="#ffffea"></asp:TextBox>
                                                            <%--<span class="input-group-addon">.00</span>--%>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="input-group m-b">
                                                            <span class="input-group-addon">$</span>
                                                            <asp:TextBox ID="Total_Costo_Estimado_TextBox" runat="server" class="form-control"
                                                                ReadOnly="True"></asp:TextBox>
                                                        </div>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-Width="100px">
                                                    <ItemTemplate>
                                                        <asp:Button ID="Eliminar_Detalle_Costo_Estimado_Button" runat="server" Text="Eliminar" OnClick="Eliminar_Costo_Button_Click" CssClass="btn btn-danger" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P5_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P5" CommandArgument="div_presentacion_P4" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P5_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P5" CommandArgument="div_presentacion_P6" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button9" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_presentacion_P6" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label65" runat="server" Text="3.10 Datos de la población atendida (señale con número la cantidad)." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label67" runat="server" Text="Mínima"></asp:Label>
                                        <asp:TextBox ID="poblacion_Minima_TextBox" runat="server" class="form-control"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" onkeyup="this.value=cpf(this.value);" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label68" runat="server" Text="Máxima"></asp:Label>
                                        <asp:TextBox ID="poblacion_Maxima_TextBox" runat="server" class="form-control"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" onkeyup="this.value=cpf(this.value);" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <asp:Label ID="Label69" runat="server" Text="Actual"></asp:Label>
                                        <asp:TextBox ID="poblacion_Actual_TextBox" runat="server" class="form-control"
                                            onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" onkeyup="this.value=cpf(this.value);" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <div>
                                        <br />
                                    </div>
                                    <b>Tipo de población que atiende (Seleccione)</b>
                                </div>
                                <div class="row col-lg-12">
                                    <%-- Tipo Poblacion Atendida --%>
                                    <div class="col-lg-offset-1 col-lg-10" style="text-align: center">
                                        <asp:SqlDataSource ID="Detalle_Tipo_Poblacion_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_tipo_poblacion" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Tipo_Poblacion_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_tipo_poblacion"
                                            DataSourceID="Detalle_Tipo_Poblacion_SqlDataSource" CssClass="table table-hover table-bordered" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:BoundField DataField="nombre_tipo_poblacion" HeaderText="Tipo Poblacion" SortExpression="nombre_tipo_poblacion" />
                                                <asp:TemplateField HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P6_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P6" CommandArgument="div_presentacion_P5" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P6_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P6" CommandArgument="div_presentacion_P7" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button10" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_presentacion_P7" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label70" runat="server" Text="3.11 Características de la población atendida (Por rango de edad)." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <%-- Poblacion Atendida --%>
                                    <div class="col-lg-12" style="text-align: center">
                                        <asp:SqlDataSource ID="Detalle_Poblacion_Atendida_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_poblacion_atendida" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Poblacion_Atendida_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_poblacion_atendida"
                                            ShowFooter="true" DataSourceID="Detalle_Poblacion_Atendida_SqlDataSource" CssClass="table table-hover table-bordered"
                                            OnRowDataBound="Poblacion_Atendida_GridView_RowDataBound" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:BoundField DataField="nombre_poblacion_atendida" HeaderText="Edad" SortExpression="nombre_poblacion_atendida" />
                                                
                                                <asp:TemplateField HeaderText="Hombres (Cantidad)">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Poblacion_Atendida_Hombres_TextBox" runat="server" Text='<%# Bind("cantidad_hombres") %>'
                                                            BackColor="#ffffea" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                                            OnTextChanged="Poblacion_Atendida_Hombres_TextBox_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="Total_Hombres" runat="server" class="form-control"
                                                            ReadOnly="True"></asp:TextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mujeres (Cantidad)">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Poblacion_Atendida_Mujeres_TextBox" runat="server" Text='<%# Bind("cantidad_mujeres") %>'
                                                            BackColor="#ffffea" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                                            OnTextChanged="Poblacion_Atendida_Hombres_TextBox_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="Total_Mujeres" runat="server" class="form-control"
                                                            ReadOnly="True"></asp:TextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P7_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P7" CommandArgument="div_presentacion_P6" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P7_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P7" CommandArgument="div_presentacion_P8" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Salir_Button_dp7" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_presentacion_P8" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label66" runat="server" Text="3.12 Indicadores de Carencia Social de la población promedio que atiende." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label73" runat="server" Text="¿La población beneficiada cuenta con ingresos económicos?"></asp:Label>
                                        <asp:DropDownList ID="Tipo_Ingreso_Poblacion_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                            <asp:ListItem>Formales.</asp:ListItem>
                                            <asp:ListItem>Informarles.</asp:ListItem>
                                            <asp:ListItem>Varían.</asp:ListItem>
                                            <asp:ListItem>Se desconoce.</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label74" runat="server" Text="3.12.1 Ingreso de la población: (revisar costo oficial canasta básica)." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>


                                <div class="row col-lg-12" style="text-align: left">
                                    <br />
                                    <div class="col-lg-12">
                                        <asp:DropDownList ID="Nivel_Ingreso_Poblacion_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                            <asp:ListItem>Ato-Medio: Ingreso mensual superior al costo de la canasta básica completa.</asp:ListItem>
                                            <asp:ListItem>Bajo: Ingreso mensual al costo de la canasta básica completa.</asp:ListItem>
                                            <asp:ListItem>Muy Bajo: Ingreso mensual menos al costo de la canasta básica alimentaria.</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P8_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P8" CommandArgument="div_presentacion_P7" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P8_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P8" CommandArgument="div_presentacion_P9" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button20" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_presentacion_P9" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label75" runat="server" Text="3.12.2 Rezago educativo promedio:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <div class="col-lg-6" style="text-align: left">
                                        <asp:Label ID="Label35" runat="server" Text="¿La poblacion que atiende está en edad escolar?"></asp:Label>
                                        <asp:DropDownList ID="Rezago_Educativo_DropDownList" runat="server" class="form-control" BackColor="#ffffea" OnSelectedIndexChanged="Rezago_Educativo_DropDownList_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem>Sí</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                            <asp:ListItem>Varía</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>

                                    <div class="col-lg-6" id="Porcentaje_Poblacion_Atendida" runat="server">
                                        <asp:Label ID="Porcentaje_Poblacion_Atendida_Label" runat="server" Text="% de población atendida en edad escolar"></asp:Label>
                                        <div class="input-group m-b">
                                            <asp:TextBox ID="Porcentaje_Poblacion_Atendida_TextBox" runat="server" class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                            <span class="input-group-addon">%</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        <b>
                                            <asp:Label ID="Label77" runat="server" Text="En caso de ser afirmativa o varía:"></asp:Label></b>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <div class="col-lg-12">
                                        ¿Las personas de 3 a 15 años de edad que atiende asiste a un centro de educación básica o que hayan terminado la educación secundaria?
                                    </div>

                                    <div class="col-lg-12" style="text-align: left">

                                        <asp:DropDownList ID="Personas_hasta_15_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                            <asp:ListItem>Sí</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                            <asp:ListItem>Varía</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        ¿Las personas nacidas antes de 1982 cuentan al menos con primaria completa?
                                    </div>

                                    <div class="col-lg-12" style="text-align: left">
                                        <asp:DropDownList ID="Personas_antes_1982_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                            <asp:ListItem>Sí</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                            <asp:ListItem>Varía</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div class="row col-lg-12">
                                    <br />
                                    <div class="col-lg-12">
                                        ¿Las personas nacidas apartir de 1982 cuentan al menos con secundaria completa?
                                    </div>
                                    <div class="col-lg-12" style="text-align: right">
                                        <asp:DropDownList ID="Personas_Apartir_1982_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                            <asp:ListItem>Sí</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                            <asp:ListItem>Varía</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P9_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P9" CommandArgument="div_presentacion_P8" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P9_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P9" CommandArgument="div_presentacion_P10" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button21" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_presentacion_P10" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label86" runat="server" Text="3.12.3 Acceso a los servicios de salud" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <%-- Servicios Salud --%>
                                    <div class="col-lg-offset-1 col-lg-10">
                                        <asp:SqlDataSource ID="Detalle_Servicios_Salud_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_servicios_salud" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <br />

                                        <asp:GridView ID="Servicio_Salud_GridView" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered" DataKeyNames="id_servicio_salud"
                                            DataSourceID="Detalle_Servicios_Salud_SqlDataSource" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:BoundField DataField="nombre_servicio_salud" HeaderText="Servicio Salud" SortExpression="nombre_servicio_salud" ItemStyle-Width="80%" />
                                                <asp:TemplateField HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <asp:CheckBox ID="CheckBox1" runat="server" />
                                            </EmptyDataTemplate>
                                        </asp:GridView>
                                    </div>
                                </div>

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label79" runat="server" Text="3.12.4 Acceso a la seguridad social:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: left">
                                    <br />
                                    <%-- Seguridad Social --%>
                                    <div class="col-lg-offset-1 col-lg-10" style="text-align: center">
                                        <asp:SqlDataSource ID="Detalle_Seguridad_Social_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_seguridad_social" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Seguridad_Social_GridView" runat="server" AutoGenerateColumns="False" DataSourceID="Detalle_Seguridad_Social_SqlDataSource"
                                            DataKeyNames="id_seguridad_social" CssClass="table table-hover table-bordered" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:BoundField DataField="nombre_seguridad_social" HeaderText="Seguridad Social" SortExpression="nombre_servicios_basicos" ItemStyle-Width="80%" />
                                                <asp:TemplateField HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P10_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P10" CommandArgument="div_presentacion_P9" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P10_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P10" CommandArgument="div_presentacion_P11" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button22" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_presentacion_P11" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label80" runat="server" Text="3.12.5 Calidad y espacios de las viviendas:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: left">
                                    <br />
                                    <%-- Espacios vivienda --%>
                                    <div class="col-lg-12">

                                        <div class="col-lg-4" style="text-align: center">
                                            <asp:SqlDataSource ID="Detalle_Piso_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_piso" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                            <div class="col-lg-12">
                                                <asp:GridView ID="Piso_GridView" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered"
                                                    DataKeyNames="id_piso" DataSourceID="Detalle_Piso_SqlDataSource" ShowFooter="true" onkeydown="return (event.keyCode!=13);">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Piso">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Piso_Label" runat="server" Text='<%# Eval("nombre_piso") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate runat="server">
                                                                <asp:TextBox ID="Piso_Otros_TextBox" runat="server" class="form-control" BackColor="#ffffea"></asp:TextBox>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Seleccionar">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" style="text-align: center">
                                            <asp:SqlDataSource ID="Detalle_Techo_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_techo" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                            <div class="col-lg-12">
                                                <asp:GridView ID="Techo_GridView" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered"
                                                    DataKeyNames="id_techo" DataSourceID="Detalle_Techo_SqlDataSource" ShowFooter="true" onkeydown="return (event.keyCode!=13);">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Techo">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Techo_Label" runat="server" Text='<%# Eval("nombre_techo") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="Techo_Otros_TextBox" runat="server" class="form-control" BackColor="#ffffea"></asp:TextBox>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>

                                                        <asp:TemplateField HeaderText="Seleccionar">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>

                                        <div class="col-lg-4" style="text-align: center">
                                            <asp:SqlDataSource ID="Detalle_Muro_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_muro" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                            <div class="col-lg-12">
                                                <asp:GridView ID="Muro_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_muro" DataSourceID="Detalle_Muro_SqlDataSource"
                                                    CssClass="table table-hover table-bordered" ShowFooter="true" onkeydown="return (event.keyCode!=13);">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="Muro">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Muro_Label" runat="server" Text='<%# Eval("nombre_muro") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                <asp:TextBox ID="Muro_Otros_TextBox" runat="server" class="form-control" BackColor="#ffffea"></asp:TextBox>
                                                            </FooterTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="Seleccionar">
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-12">
                                    <br />
                                    <div class="col-lg-6" style="text-align: center">
                                        <asp:Label ID="Label84" runat="server" Text="Promedio personas que habita la vivienda: "></asp:Label>
                                        <asp:TextBox ID="Promedio_Personas_Vivienda_TextBox" runat="server" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6" style="text-align: center">
                                        <asp:Label ID="Label85" runat="server" Text="No. De habitaciones: "></asp:Label>
                                        <asp:TextBox ID="Num_Habitaciones_TextBox" runat="server" class="form-control" onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                            BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                    </div>
                                </div>

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label101" runat="server" Text="3.12.6 Acceso a los servicio básicos en la vivienda:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: left">
                                    <br />
                                    <%-- Servicios Basicos --%>
                                    <div class="col-lg-offset-1 col-lg-10" style="text-align: center">
                                        <asp:SqlDataSource ID="Detalle_Servicios_Basicos_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_servicios_basicos" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Servicios_Basicos_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_servicios_basicos" DataSourceID="Detalle_Servicios_Basicos_SqlDataSource"
                                            CssClass="table table-hover table-bordered" onkeydown="return (event.keyCode!=13);">

                                            <Columns>
                                                <asp:BoundField DataField="nombre_servicios_basicos" HeaderText="Servicio Basico" SortExpression="nombre_servicios_basicos" ItemStyle-Width="80%" />
                                                <asp:TemplateField HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>

                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P11_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P11" CommandArgument="div_presentacion_P10" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P11_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P11" CommandArgument="div_presentacion_P12" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button23" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_presentacion_P12" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label102" runat="server" Text="3.12.7 Acceso a la alimentación: La población beneficiada consume en promedio al dia:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <%-- Consumo al Dia --%>
                                    <div class="col-lg-offset-1 col-lg-10" style="text-align: center">
                                        <asp:SqlDataSource ID="Detalle_Consumo_Dia_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_consumo_dia" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Consumo_Dia_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_consumo_dia" DataSourceID="Detalle_Consumo_Dia_SqlDataSource"
                                            CssClass="table table-hover table-bordered" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:BoundField DataField="nombre_consumo_dia" HeaderText="Consumo Por Dia" SortExpression="Consumo Por Dia" ItemStyle-Width="80%" />
                                                <asp:TemplateField HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label103" runat="server" Text="3.12.8 Acceso a la comunicación." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: left">
                                    <br />
                                    <%-- Acceso Comunicacion --%>
                                    <div class="col-lg-offset-1 col-lg-10" style="text-align: center">
                                        <asp:SqlDataSource ID="Detalle_Acesso_Comunicacion_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_acceso_comunicacion" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Acceso_Comunicacion_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_acceso_comunicacion" DataSourceID="Detalle_Acesso_Comunicacion_SqlDataSource"
                                            CssClass="table table-hover table-bordered" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:BoundField DataField="nombre_acceso_comunicacion" HeaderText="Acceso Comunicación" SortExpression="nombre_acceso_comunicacion" ItemStyle-Width="80%" />
                                                <asp:TemplateField HeaderText="Seleccionar">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="Seleccionar_CheckBox" runat="server" Checked='<%# Convert.ToBoolean(Eval("seleccionado")) %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label104" runat="server" Text="Observaciones:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="Observaciones_Acceso_TextBox" runat="server" TextMode="MultiLine" Rows="3" Width="75%" BackColor="#ffffea"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P12_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P12" CommandArgument="div_presentacion_P11" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P12_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P12" CommandArgument="div_presentacion_P13" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button24" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_presentacion_P13" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:Label ID="Label105" runat="server" Text="3.13 Oficinas con las que se relaciona la OSC´S" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="row col-lg-12" style="text-align: center">
                                    <br />
                                    <div class="col-lg-12" style="text-align: right">
                                        <asp:Button ID="Agregar_Oficinas_Relacion_Button" runat="server" Text="Agregar" CssClass="btn btn-primary" OnClick="Agregar_Oficinas_Relacion_Button_Click" />
                                    </div>
                                    <div class="col-lg-12">
                                        <br />
                                        <asp:SqlDataSource ID="Detalle_Oficinas_Relacion_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_oficinas_relacion" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Oficinas_Relacion_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_oficina_relacion" DataSourceID="Detalle_Oficinas_Relacion_SqlDataSource"
                                            CssClass="table table-hover table-bordered" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Institución ">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Detalle_Institucion_TextBox" runat="server" Text='<%# Bind("institucion") %>'
                                                            BackColor="#ffffea" class="form-control"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Objetivo y/o beneficio">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Detalle_Objetivo_Beneficio_TextBox" runat="server" Text='<%# Bind("objetivo_beneficio") %>'
                                                            class="form-control" BackColor="#ffffea"></asp:TextBox>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <asp:Button ID="Eliminar_Oficinas_Relacion_Button" runat="server" Text="Eliminar" OnClick="Eliminar_Detalle_Costo_Estimado_Button_Click" CssClass="btn btn-danger" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row col-lg-12" style="text-align: center">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P13_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_presentacion_P13" CommandArgument="div_presentacion_P12" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_presentacion_P13_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_presentacion_P13" CommandArgument="div_situacion_financiera_P1" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button25" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--4--%>
            <div id="div_situacion_financiera_P1" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                            <h2>4. SITUACIÓN FINANCIERA DE LA INSTITUCIÓN</h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <div class="col-lg-offset-2 col-lg-8">
                                        <asp:Label ID="Label100" runat="server" Text="4.1 ¿Su institución cuenta con patrimonio propio?." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                        <br />
                                        <asp:DropDownList ID="Patrimonio_Institucion_DropDownList" runat="server" class="form-control"
                                            BackColor="#ffffea" OnSelectedIndexChanged="Patrimonio_Institucion_DropDownList_SelectedIndexChanged" AutoPostBack="true">
                                            <asp:ListItem>Si</asp:ListItem>
                                            <asp:ListItem>No</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>

                                <div id="ocultar" runat="server">
                                    <div class="row col-lg-12" style="text-align: center">
                                        <br />
                                        <div class="col-lg-offset-2 col-lg-8">
                                            <asp:Label ID="Label88" runat="server" Text="4.2 En propiedades inmuebles." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                            <br />
                                            <div class="col-lg-5">
                                                <br />
                                                <asp:DropDownList ID="Propiedades_Inmuebles_DropDownList" runat="server" class="form-control" AutoPostBack="true" BackColor="#ffffea" OnSelectedIndexChanged="Propiedades_Inmuebles_DropDownList_SelectedIndexChanged">
                                                    <asp:ListItem>Sí</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-7">
                                                <asp:Label ID="Label89" runat="server" Text="Valor aproximado:"></asp:Label>
                                                <div class="input-group m-b">
                                                    <span class="input-group-addon">$</span>
                                                    <asp:TextBox ID="Valor_Aproximado_Inmuebles_TextBox" runat="server"
                                                        onkeyup="this.value=cpf(this.value);" MaxLength="10"
                                                        class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <div class="row col-lg-12" style="text-align: center">
                                        <br />
                                        <div class="col-lg-offset-2 col-lg-8">
                                            <asp:Label ID="Label90" runat="server" Text="4.3 En Inversiones." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                            <br />
                                            <div class="col-lg-5">
                                                <br />
                                                <asp:DropDownList ID="Inversiones_DropDownList" runat="server" class="form-control" AutoPostBack="true" BackColor="#ffffea" OnSelectedIndexChanged="Inversiones_DropDownList_SelectedIndexChanged">
                                                    <asp:ListItem>Sí</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-7">
                                                <asp:Label ID="Label91" runat="server" Text="Valor aproximado:"></asp:Label>

                                                <div class="input-group m-b">
                                                    <span class="input-group-addon">$</span>
                                                    <asp:TextBox ID="Valor_Aproximado_Inversiones_TextBox" runat="server"
                                                        onkeyup="this.value=cpf(this.value);" MaxLength="10"
                                                        class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row col-lg-12" style="text-align: center">
                                        <br />
                                        <div class="col-lg-offset-2 col-lg-8">
                                            <asp:Label ID="Label92" runat="server" Text="4.4 En fideicomisos." CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                            <br />
                                            <div class="col-lg-5">
                                                <br />
                                                <asp:DropDownList ID="Fideicomisos_DropDownList" runat="server" class="form-control" BackColor="#ffffea" AutoPostBack="true" OnSelectedIndexChanged="Fideicomisos_DropDownList_SelectedIndexChanged">
                                                    <asp:ListItem>Sí</asp:ListItem>
                                                    <asp:ListItem>No</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="col-lg-7">
                                                <asp:Label ID="Label93" runat="server" Text="Valor aproximado:"></asp:Label>

                                                <div class="input-group m-b">
                                                    <span class="input-group-addon">$</span>
                                                    <asp:TextBox ID="Valor_Aproximados_Fideicomisos_TextBox" runat="server"
                                                        onkeyup="this.value=cpf(this.value);" MaxLength="10"
                                                        class="form-control" BackColor="#ffffea" onkeydown="return (event.keyCode!=13);"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_situacion_financiera_P1_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_situacion_financiera_P1" CommandArgument="div_presentacion_P13" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_situacion_financiera_P1_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_situacion_financiera_P1" CommandArgument="div_situacion_financiera_P2" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button15" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_situacion_financiera_P2" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="row col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label108" runat="server" Text="4.5 Principales fuentes de financiamientos utilizadas para la institución, utilizando como muestra el promedio anual, tomando como base los últimos tres años:" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <%-- Principales Fuentes --%>
                                    <div class="col-lg-12">
                                        <asp:SqlDataSource ID="Detalle_Principales_FuentesSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_detalle_principales_fuentes" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Principales_Fuentes_GridView" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered"
                                            ShowFooter="True" DataKeyNames="id_principales_fuentes" DataSourceID="Detalle_Principales_FuentesSqlDataSource"
                                            OnRowDataBound="Principales_Fuentes_GridView_RowDataBound" onkeydown="return (event.keyCode!=13);">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Concepto">
                                                    <ItemTemplate>
                                                        <asp:Label ID="nombre_concepto" runat="server" Text='<%# Eval("nombre_fuente") %>'> </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="Total" runat="server" Text="Total de ingresos promedio anual"> </asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Importe promedio anual">
                                                    <ItemTemplate>
                                                        <div class="input-group m-b">
                                                            <span class="input-group-addon">$</span>
                                                            <asp:TextBox ID="Importe_Promedio_Anual_TextBox" runat="server" Text='<%# Eval("importe_promedio") %>'
                                                                BackColor="#ffffea" class="form-control" MaxLength="10" AutoPostBack="true"
                                                                OnTextChanged="Importe_Promedio_Anual_TextBox_TextChanged"></asp:TextBox>
                                                        </div>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <div class="input-group m-b">
                                                            <span class="input-group-addon">$</span>
                                                            <asp:TextBox ID="Total_Importe_Promedio_Anual_TextBox" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="%" HeaderStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Porcentaje_Importe_TextBox" runat="server" Text='<%# Eval("porcentaje") %>'
                                                            class="form-control" ReadOnly="true"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="Porcentaje_Total" runat="server" Text="100%" class="form-control" ReadOnly="true"></asp:TextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_situacion_financiera_P2_AnteriorButton" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_situacion_financiera_P2" CommandArgument="div_situacion_financiera_P1" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_situacion_financiera_P2_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_situacion_financiera_P2" CommandArgument="div_situacion_financiera_P3" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button16" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div id="div_situacion_financiera_P3" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">

                        <div class="modal-header" style="text-align: center">
                            <h2><b>FORMULARIO ESTÁNDAR</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label109" runat="server" Text="4.6 Principales egresos de la institucion (utilizar el promedio anual de los tres últimos años)" CssClass="form-control" BackColor="#CCCCCC"></asp:Label>
                                </div>
                                <div class="row col-lg-12">
                                    <br />
                                    <%-- Principales Egresos --%>
                                    <div class="col-lg-12">
                                        <asp:SqlDataSource ID="Detalle_Principales_Egresos_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>"
                                            SelectCommand="spr_lee_detalle_principales_egresos" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="Id_Formulario_HiddenField" DefaultValue="0" Name="id_formulario" PropertyName="Value" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <asp:GridView ID="Principales_Egresos_GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="id_principales_egreso"
                                            DataSourceID="Detalle_Principales_Egresos_SqlDataSource" CssClass="table table-hover table-bordered" ShowFooter="True"
                                            OnRowDataBound="Principales_Egresos_GridView_RowDataBound" onkeydown="return (event.keyCode!=13);">
                                            <Columns>

                                                <asp:TemplateField HeaderText="Concepto">
                                                    <ItemTemplate>
                                                        <asp:Label ID="nombre_concepto" runat="server" Text='<%# Eval("nombre_egreso") %>'> </asp:Label>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:Label ID="Total" runat="server" Text="Total de egresos (promedio anual)"> </asp:Label>
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Importe promedio anual">
                                                    <ItemTemplate>
                                                        <div class="input-group m-b">
                                                            <span class="input-group-addon">$</span>
                                                            <asp:TextBox ID="Importe_Promedio_Anual_Egresos_TextBox" runat="server" Text='<%# Eval("importe_egresos") %>'
                                                                BackColor="#ffffea" CssClass="form-control"
                                                                onkeypress="if(event.keyCode<48 || event.keyCode>57)event.returnValue=false;"
                                                                OnTextChanged="Importe_Promedio_Anual_Egresos_TextBox_TextChanged" AutoPostBack="true"></asp:TextBox>
                                                        </div>

                                                    </ItemTemplate>

                                                    <FooterTemplate>
                                                        <itemtemplate>
                                                            <div class="input-group m-b">
                                                                <span class="input-group-addon">$</span>
                                                                <asp:TextBox ID="Total_Costo_Estimado_TextBox_2" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                                            </div>
                                                        </itemtemplate>
                                                    </FooterTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="%" HeaderStyle-Width="20%">
                                                    <ItemTemplate>
                                                        <asp:TextBox ID="Porcentaje_Importe_Egresos_TextBox" runat="server" Text='<%# Eval("porcentaje") %>'
                                                            CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        <asp:TextBox ID="Numero_Porcentaje" runat="server" class="form-control" Text="100%" ReadOnly="true"></asp:TextBox>
                                                    </FooterTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <div class="row col-lg-12">
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <asp:Button ID="div_situacion_financiera_P3_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_situacion_financiera_P3" CommandArgument="div_situacion_financiera_P2" OnCommand="Botones_Click" />
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <asp:Button ID="div_situacion_financiera_P3_Siguiente_Button" runat="server" Text="Siguiente" class="btn btn-primary" CommandName="div_situacion_financiera_P3" CommandArgument="div_cumplimiento_P1" OnCommand="Botones_Click" />
                                    </div>
                                    <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                        <asp:Button ID="Button17" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--5--%>
            <div id="div_cumplimiento_P1" class="modal fade" tabindex="-1" role="dialog" data-backdrop="static">
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
                                    <asp:Label ID="Label95" runat="server" Text="Nombre, razón o denominación social:"></asp:Label>
                                    <asp:TextBox ID="Nombre_Razon_TextBox" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <asp:Label ID="Label96" runat="server" Text="Domicilio Fiscal:"></asp:Label>
                                    <asp:TextBox ID="Domicilio_Fiscal_TextBox" runat="server" class="form-control" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <asp:Label ID="Label97" runat="server" Text="Clave del Registro Federal de Contribuyentes:"></asp:Label>
                                    <asp:TextBox ID="Clave_Registro_TextBox" runat="server" class="form-control" ReadOnly="true" Style="text-transform: uppercase" MaxLength="13"></asp:TextBox>
                                </div>
                                <div class="col-lg-12">
                                    <br />
                                    <asp:Label ID="Mensaje_Final_Label" runat="server" Text="¿Ha presentado en tiempo y forma las declaraciones del ejercicio por impuestos federales que corresponden a los últimos tres ejercicios fiscales, 
                                        así como la declaraciones de pagos provisionales correspondientes a__ y__; por los últimos impuestos, o siendo de nueva creación, ha dado cumplimiento a las obligaciones fiscales?:"></asp:Label>
                                </div>

                                <div class="col-lg-offset-5 col-lg-2" style="text-align: center">
                                    <br />
                                    <asp:DropDownList ID="Impuesto_Federal_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                        <asp:ListItem>Si</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                </div>

                                <div class="col-lg-12">
                                    <br />
                                    <asp:Label ID="Label99" runat="server" Text="¿Tiene adeudos fiscales firmes a cargo por impuestos federales?"></asp:Label>
                                </div>

                                <div class="col-lg-offset-5 col-lg-2" style="text-align: center">
                                    <br />
                                    <asp:DropDownList ID="Adeudos_Fiscales_DropDownList" runat="server" class="form-control" BackColor="#ffffea">
                                        <asp:ListItem>Si</asp:ListItem>
                                        <asp:ListItem>No</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer">
                            <div class="row col-lg-12">
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="div_cumplimiento_P1_Anterior_Button" runat="server" Text="Anterior" class="btn btn-success" CommandName="div_cumplimiento_P1" CommandArgument="div_situacion_financiera_P3" OnCommand="Botones_Click" />
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                </div>
                                <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
                                    <asp:Button ID="Button18" runat="server" Text="Salir" class="btn btn-danger"  CommandName="div_cumplimiento_P1" OnCommand="Botones_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="Guardar_Todo" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()"><span aria-hidden="true">&times;</span></button>
                            <asp:Label ID="Label110" Text="SE FINALIZARA EL REGISTRO" runat="server" CssClass="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Label111" Text="Al guardar la información no podra hacer cambios ¿Desea continuar?" runat="server" CssClass="mensaje" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <div class="col-lg-12" style="text-align: center">
                                <div class="col-lg-6">
                                    <%--<button type="button" class="btn btn-success" data-dismiss="modal" onclick="hideModal()" style="width: 30%">Si</button>--%>
                                    <asp:Button ID="Confirmar_Llenado_Button" runat="server" class="btn btn-success" Style="width: 30%" Text="Si" OnClick="Confirmar_Llenado_Button_Click" />
                                </div>
                                <div class="col-lg-6">
                                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="hideModal()" style="width: 30%">No</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_alertas" data-backdrop="static">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="hideModal()"><span aria-hidden="true">&times;</span></button>
                            <%--<h4 class="modal-title">Aviso</h4>--%>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Mensaje_Label" Text="" runat="server" CssClass="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="hideModal()">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->
            <asp:SqlDataSource ID="Municipios_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="SELECT * FROM [Catalogo_Municipios]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Personalidad_Juridica_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="SELECT * FROM [Catalogo_Personalidad_Juridica]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Organos_Supremos_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="SELECT * FROM [Catalogo_Organos_Supremos]"></asp:SqlDataSource>

            <asp:HiddenField ID="Id_Formulario_HiddenField" runat="server" />
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Imprimir_Button" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>

    <script src="<%=  ResolveClientUrl("~/content/js/plugins/datapicker/bootstrap-datepicker.js") %>"></script>

    <script src="<%=  ResolveClientUrl("~/Scripts/jquery.blockUI.js") %>"></script>

    <script type="text/javascript">

        //function myFunction() {
        //    var myWindow = window.open("", "", "width=200,height=100");
        //}

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
            hideModal();
            $(".chosen-select").chosen();

            $('.input-group.date').datepicker({
                startView: 1,
                todayBtn: "linked",
                keyboardNavigation: false,
                forceParse: false,
                autoclose: true,
                format: "dd/mm/yyyy",
                language: "ES",
                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
            });

            //Array para dar formato en español
            $.datepicker.regional['es'] =
            {
                closeText: 'Cerrar',
                prevText: 'Previo',
                nextText: 'Próximo',

                monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
                'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun',
                'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                monthStatus: 'Ver otro mes', yearStatus: 'Ver otro año',
                dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
                dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sáb'],
                dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'],
                dateFormat: 'dd/mm/yy', firstDay: 0,
                initStatus: 'Selecciona la fecha', isRTL: false
            };
            $.datepicker.setDefaults($.datepicker.regional['es']);

            //miDate: fecha de comienzo D=días | M=mes | Y=año
            //maxDate: fecha tope D=días | M=mes | Y=año
            $("#datepicker").datepicker({ minDate: "-1D", maxDate: "+1M +10D" });
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

        var i = 1;

        $("input[type=text]").bind("keypress keydown click", function (e) {
            console.log("HOLIS");
            if (e.which == 13) {
                console.log("HOLIS");
                e.preventDefault();
            }
        });

        $("#add_row").click(function () {
            $('#addr' + i).html("<td>" + (i + 1) + "</td><td><input name='name" + i + "' type='text' placeholder='Concepto' class='form-control input-md'  /> </td><td><input  name='mail" + i + "' type='text' placeholder='Monto'  class='form-control input-md'></td>");
            i++;
            $('#tab_logic').append('<tr id="addr' + (i) + '"></tr>');
        });

        $("#delete_row").click(function () {
            if (i > 1) {
                $("#addr" + (i - 1)).html('');
                i--;
            }
        });

        function valida_rfc(vrfc) {
            //if (len(vrfc) = 12)
            //{
            //    var vreg_exp_12 = new RegExp("^[A-Za-z]{3}([0-9]{2})(1[0-2]|0[1-9])([0-3][0-9])([ -]?)([A-Za-z0-9]{2})([A0-9]{1})$");
            //    if (vreg_exp_12.test(vrfc)) {
            //        despliega_aviso("El Formato de RFC es XXXX999999XX9");
            //        return false;
            //    }
            //}
            //if (len(vrfc) = 13) {
            //    var vreg_exp_13 = new RegExp("^[A-Za-z]{4}([0-9]{2})(1[0-2]|0[1-9])([0-3][0-9])([ -]?)([A-Za-z0-9]{2})([A0-9]{1})$");
            //    if (vreg_exp_13.test(vrfc)) {
            //        despliega_aviso("El Formato de RFC es XXXX999999XX9");
            //        return false;
            //    }
            //}
            //if len(vrfc) < 12
            //{
            //    despliega_aviso("El Formato de RFC es XXXX999999XX9");
            //    return false;
            //}
        }

        function cpf(v) {
            v = v.replace(',', '')
            v = v.replace(/([^0-9\.]+)/g, '');
            v = v.replace(/^[\.]/, '');
            v = v.replace(/[\.][\.]/g, '');
            v = v.replace(/\.(\d)(\d)(\d)/g, '.$1$2');
            v = v.replace(/\.(\d{1,2})\./g, '.$1');
            v = v.toString().split('').reverse().join('').replace(/(\d{3})/g, '$1,');
            v = v.split('').reverse().join('').replace(/^[\,]/, '');
            //if (v.length == 0) { v = "0" };
            return v;
        }

    </script>
</asp:Content>
