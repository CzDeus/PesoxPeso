<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Requisitos_Documentacion.aspx.cs" Inherits="Forms_Requisitos_Documentacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
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
                <h1 style="background: #CCCCCC; text-align: center"><b>DIRECCIÓN DE ORGANISMOS DE LA SOCIEDAD CIVIL</b></h1>
                <h2>LISTA DE VERIFICACIÓN DE REQUISITOS Y DOCUMENTACION PARA PARTICIPAR EN EL PROGRAMA PESO POR PESO</h2>
            </div>

            <div class="row col-lg-12">
                <br />
                <fieldset>
                    <legend>Documentos<asp:HiddenField ID="Numero_Requisito_HiddenField" runat="server" />
                    </legend>
                    <div class="col-lg-12" runat="server">
                        <br />
                        <div class="col-lg-10">
                            <asp:Label ID="Label1" runat="server" Text="1. Formulario Estándar debidamente requisitado en todos y cada uno de sus apartados, no se aceptarán espacios en blanco. El formulario deberá presentarse firmado por el representante legal."></asp:Label>
                        </div>
                        <div class="col-lg-2" style="text-align: center">
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label2" runat="server" Text="2. Copia simple del acta constitutiva. (en caso de presentar modificaciones al objeto social, y/o cambios en el nombramiento del presidente o representante legal o similar, agregar las modificaciones)."></asp:Label>
                        </div>

                        <%--                        <div id="check_2" class="col-lg-1" runat="server" style="text-align: right">
                            <div class="btn btn-primary btn-circle"><i class="fa fa-check"></i></div>
                        </div>
                        <div id="times_2" class="col-lg-1" runat="server" style="text-align: right">
                            <div class="btn btn-danger btn-circle"><i class="fa fa-times"></i></div>
                        </div>--%>

                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Ajuntar_Acta_Constitutiva_Button" runat="server" Text="Adjuntar" CommandArgument="2" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label3" runat="server" Text="3. Copia del Registro Federal de contribuyentes."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Registro_Federal_Button" runat="server" Text="Adjuntar" CommandArgument="3" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label4" runat="server" Text="4. Copia de identificación oficial del representante legal de la organización."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Identificacion_Oficial_Button" runat="server" Text="Adjuntar" CommandArgument="4" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label5" runat="server" Text="5. Copia de la Cédula profesional del Contador que emite los estados financieros indicados en el punto 6."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Copia_Cedula_Button" runat="server" Text="Adjuntar" CommandArgument="5" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label6" runat="server" Text="6. Estados financieros del Ejercicio 2015 y al lll Trimestre de 2016, Avalados y debidamente firmados por el Contador Público que los expide."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Estados_Financieros_Button" runat="server" Text="Adjuntar" CommandArgument="6" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label19" runat="server" Text="7. Copia de la última declaración anual de impuestos (Formato personas morales con fines no lucrativos F21) y declaración al mes de septiembre de 2016"></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Declaracion_Anual_Button" runat="server" Text="Adjuntar" CommandArgument="7" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label20" runat="server" Text="8. Comprobante de domicilio reciente. (Recibo de luz, agua o telefono de no más de 2 meses de antiguedad)."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Comprobante_Domicilio_Button" runat="server" Text="Adjuntar" CommandArgument="8" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label21" runat="server" Text="9. Plantilla de personal (ya sea de carácter voluntario o remunerado)"></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Plantilla_Personal_Button" runat="server" Text="Adjuntar" CommandArgument="9" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label22" runat="server" Text="10. Organigrama y documento que contenga o describa las funciones y/o actividades del personal remunerado y voluntario (manual operativo, o manual de organización, o reglamento interno u otro)"></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Organigrama_Button" runat="server" Text="Adjuntar" CommandArgument="10" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label23" runat="server" Text="11. Base de datos de la población beneficiada en ese ejercicio que al menos incluya: nombre, edad, domicilio y beneficio otorgado, entre otros. Agregar al menos 6 imágenes fotograficas o video como evidencia de los beneficios otorgados."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Bd_Poblacion_Button" runat="server" Text="Adjuntar" CommandArgument="11" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-10">
                            <asp:Label ID="Label24" runat="server" Text="12. Presentar en papel membretado del Organismo debidamente firmada la carta manifiesto para asegurar el cumplimiento de los criterios de evaluación y selección de las bases para la participación establecida en la convocatoria vigentes, Incisos b) y c)."></asp:Label>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-10">
                            <asp:Label ID="Label25" runat="server" Text="13. Para OSC de nuevo ingreso. Los documentos que se requieren, deberán presentarse claramente impresos (legibles), en carpeta de vinil de 3 pulgadas, (con bolsa exterior) color blanco para organismos del municipios de Hermosillo y negra para Organismos ubicados en municipio foráneos, debiendo acomodar en el orden indicado cada hoja de los documentos en una bolsa protectora y en 20 bolsas protectoras de hojas más pra la documentación que se agrega posteriormente."></asp:Label>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-10">
                            <asp:Label ID="Label26" runat="server" Text="14. Para OSC beneficiados en 2016. Los documentos que se requieren, deberán presentarse claramente impresos (legibles), en sobre manila, rotulado con la denominacion del Organismo y nombre del municipio. Debiendo acomodar en el orden indicado cada hoja de los documentos en una bolsa protectora y 20 bolsas protectoras de hojas más para la documentación que se agrega posteriormente."></asp:Label>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-10">
                            <asp:Label ID="Label27" runat="server" Text="15. Constancia de captura en sistema. (La informacion y documentos deberán capturarse y adjuntarse en el módulo del programa peso por peso ubicado en el portal www.difson.gob.mx)"></asp:Label>
                        </div>
                    </div>

                    <div class="col-lg-12" style="text-align:center">
                        <br />
                        <asp:Button ID="btn_salir" runat="server" Text="Salir" CssClass="btn btn-danger" OnClick="btn_salir_Click"/>
                    </div>

                </fieldset>
            </div>


            <asp:SqlDataSource ID="Lee_Archivos_Registrados_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_archivos_adjuntos_por_requisito" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="Id_Registro_HiddenField" DefaultValue="0" Name="id_registro_solicitud" PropertyName="Value" Type="Int32" />
                    <asp:ControlParameter ControlID="Numero_Requisito_HiddenField" DefaultValue="0" Name="numero_requisito" PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:HiddenField ID="Id_Registro_HiddenField" runat="server" />

            <%-- MODAL ADJUNTAR ARCHIVOS --%>
            <div id="div_adjuntar" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content modal-lg">
                        <div class="modal-header">
                            <h2><b>ADJUNTAR ARCHIVOS</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12" style="text-align: center">
                                    <asp:Label ID="Label7" runat="server" Text="Referencia:"></asp:Label>
                                </div>
                                <div class=" col-lg-offset-2 col-lg-8" style="text-align: center">
                                    <asp:TextBox ID="Referencia_Archivo_TextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4" BackColor="#ffffea"></asp:TextBox>
                                </div>

                                <div class="col-lg-offset-3 col-lg-6" style="text-align: right">
                                    <br />
                                    <asp:FileUpload ID="Archivos_FileUpload" runat="server" />
                                </div>

                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:GridView ID="Archivos_Registrados_GridView" runat="server" CssClass="table table-hover table-bordered"
                                        AutoGenerateColumns="False" DataKeyNames="id_archivo_adjunto" DataSourceID="Lee_Archivos_Registrados_SqlDataSource">
                                        <Columns>
                                            <asp:BoundField DataField="descripcion_archivo" HeaderText="Referencia" SortExpression="descripcion_archivo" />
                                            <asp:BoundField DataField="url_archivo" HeaderText="Nombre Archivo" SortExpression="url_archivo" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="Eliminar_Archivo_Button" runat="server" Text="Eliminar" CssClass="btn btn-danger" OnClick="Eliminar_Archivo_Button_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="col-lg-12">
                                <div class="col-lg-6">
                                    <asp:Button ID="Agregar_Archivo_Button" runat="server" Text="Agregar" class="btn btn-success" OnClick="Agregar_Archivo_Button_Click" />
                                </div>
                                <div class="col-lg-6">
                                    <asp:Button ID="Button1" runat="server" Text="Salir" class="btn btn-danger" data-dismiss="modal" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Modal Mensajes -->
            <div class="modal fade" tabindex="-1" role="dialog" id="div_alertas">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title">Aviso</h4>
                        </div>
                        <div class="modal-body">
                            <asp:Label ID="Mensaje_Label" Text="" runat="server" class="mensaje" Font-Bold="True" Font-Size="X-Large" />
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>

                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- Fin Modal -->

        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="Agregar_Archivo_Button" />
        </Triggers>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphScript" runat="Server">

    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
            $(".chosen-select").chosen();
            hideModal();
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

    </script>
</asp:Content>

