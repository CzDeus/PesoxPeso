<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Documentos_Institucion.aspx.cs" Inherits="Forms_Documentos_Institucion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%=  ResolveClientUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>

            <div class="col-lg-12" style="text-align: center">
                <h1><b>Documentos Institucion</b></h1>
            </div>

            <div class="row col-lg-12">
                <fieldset>
                    <legend>Documentos<asp:HiddenField ID="Numero_Requisito_HiddenField" runat="server" />
                    </legend>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label2" runat="server" Text="1. Copia simple del acta constitutiva. (en caso de presentar modificaciones al objeto social, y/o cambios en el nombramiento del presidente o representante legal o similar, agregar las modificaciones)."></asp:Label>
                        </div>

                        <%--                        <div id="check_2" class="col-lg-1" runat="server" style="text-align: right">
                            <div class="btn btn-primary btn-circle"><i class="fa fa-check"></i></div>
                        </div>
                        <div id="times_2" class="col-lg-1" runat="server" style="text-align: right">
                            <div class="btn btn-danger btn-circle"><i class="fa fa-times"></i></div>
                        </div>--%>

                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Ajuntar_Acta_Constitutiva_Button" runat="server" Text="Revisar" CommandArgument="2" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label3" runat="server" Text="2. Copia del Registro Federal de contribuyentes."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Registro_Federal_Button" runat="server" Text="Revisar" CommandArgument="3" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label4" runat="server" Text="3. Copia de identificación oficial del representante legal de la organización."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Identificacion_Oficial_Button" runat="server" Text="Revisar" CommandArgument="4" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label5" runat="server" Text="4. Copia de la Cédula profesional del Contador que emite los estados financieros indicados en el punto 6."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Copia_Cedula_Button" runat="server" Text="Revisar" CommandArgument="5" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label6" runat="server" Text="5. Estados financieros del Ejercicio 2015 y al lll Trimestre de 2016, Avalados y debidamente firmados por el Contador Público que los expide."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Estados_Financieros_Button" runat="server" Text="Revisar" CommandArgument="6" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label19" runat="server" Text="6. Copia de la última declaración anual de impuestos (Formato personas morales con fines no lucrativos F21) y declaración al mes de septiembre de 2016"></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Declaracion_Anual_Button" runat="server" Text="Revisar" CommandArgument="7" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label20" runat="server" Text="7. Comprobante de domicilio reciente. (Recibo de luz, agua o telefono de no más de 2 meses de antiguedad)."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Comprobante_Domicilio_Button" runat="server" Text="Revisar" CommandArgument="8" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label21" runat="server" Text="8. Plantilla de personal (ya sea de carácter voluntario o remunerado)"></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Plantilla_Personal_Button" runat="server" Text="Revisar" CommandArgument="9" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label22" runat="server" Text="9. Organigrama y documento que contenga o describa las funciones y/o actividades del personal remunerado y voluntario (manual operativo, o manual de organización, o reglamento interno u otro)"></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Organigrama_Button" runat="server" Text="Revisar" CommandArgument="10" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <br />
                        <div class="col-lg-9">
                            <asp:Label ID="Label23" runat="server" Text="10. Base de datos de la población beneficiada en ese ejercicio que al menos incluya: nombre, edad, domicilio y beneficio otorgado, entre otros. Agregar al menos 6 imagenes fotograficas o video como evidencia de los beneficios otorgados."></asp:Label>
                        </div>
                        <div class="col-lg-3" style="text-align: center">
                            <asp:Button ID="Bd_Poblacion_Button" runat="server" Text="Revisar" CommandArgument="11" OnCommand="Prueba_Click" />
                        </div>
                    </div>

                    <div class="col-lg-12" style="text-align: center">
                        <br />
                        <asp:Button ID="salir_button" runat="server" Text="Salir" CssClass="btn btn-danger" OnClick="salir_button_Click"/>
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

            <div id="div_adjuntar" class="modal fade" tabindex="-1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content modal-lg">
                        <div class="modal-header" style="text-align: center">
                            <h2><b>Archivos adjuntos por la institución</b></h2>
                        </div>

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-lg-12" style="text-align: center">
                                    <br />
                                    <asp:GridView ID="Archivos_Registrados_GridView" runat="server" CssClass="table table-hover table-bordered"
                                        AutoGenerateColumns="False" DataKeyNames="id_archivo_adjunto" DataSourceID="Lee_Archivos_Registrados_SqlDataSource">
                                        <Columns>
                                            <asp:BoundField DataField="descripcion_archivo" HeaderText="Referencia" SortExpression="descripcion_archivo" />
                                            <asp:BoundField DataField="url_archivo" HeaderText="Nombre Archivo" SortExpression="url_archivo" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:Button ID="ver_Archivo_Button" runat="server" Text="Visualizar" CssClass="btn btn-success" OnClick="ver_Archivo_Button_Click" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>


                        </div>

                        <div class="modal-footer" style="text-align: center">
                            <div class="col-lg-12" style="text-align: center">
                                <br />
                                <asp:Button ID="btn_salir" runat="server" Text="Salir" CssClass="btn btn-danger" />
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
        <%--        <Triggers>
            <asp:PostBackTrigger ControlID="Agregar_Archivo_Button" />
        </Triggers>--%>
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
