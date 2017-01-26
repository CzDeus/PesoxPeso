<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Documentos_Consulta.aspx.cs" Inherits="Documentos_Consulta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.css") %>" rel="stylesheet" />
    <link href="<%= ResolveUrl("~/Scripts/chosen/chosen.min.css") %>" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:UpdatePanel runat="server" ID="UP_Pagina" UpdateMode="Always">
        <ContentTemplate>

            <div class="col-lg-12" style="text-align: center">
                <h2><b>Agregar Documentos para Consulta</b></h2>
            </div>

            <div class="row col-lg-12">
                <br />
                <fieldset>
                    <div class="row" >
                        <div class="col-lg-12" style="text-align: center">
                            <asp:Label ID="Label2" runat="server" Text="Referencia:"></asp:Label>
                        </div>
                        <div class="col-lg-12" style="text-align: center">
                            <asp:TextBox ID="Referencia_TextBox" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" BackColor="#ffffea"></asp:TextBox>
                            <br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-12" style="text-align: center">
                            <div class="col-xs-12 col-xs-6 col-md-4 col-lg-4">
                                <asp:FileUpload ID="Documento_FileUpload" runat="server" />
                            </div>
                            <div class="col-xs-12 col-xs-6 col-md-1 col-lg-1"></div>
                            <div class="col-xs-12 col-xs-6 col-md-1 col-lg-1">
                                <asp:Button ID="Agregar_Archivo_Button" runat="server" Text="Agregar" class="btn btn-success" OnClick="Agregar_Archivo_Button_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="col-lg-12">
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="Listado de Documentos"></asp:Label>
                        </div>
                        <div class="col-lg-12" style="text-align: center">
                            <asp:GridView ID="Documentos_GridView" runat="server" AutoGenerateColumns="False" CssClass="table table-hover table-bordered" DataKeyNames="id_documento_consulta" DataSourceID="Lee_Documentos_Registrados_SqlDataSource">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="Consultar_Documento" runat="server" Text='<%# Eval("descripcion_archivo") %>' NavigateUrl='<%# Eval("url_archivo") %>' Target="_blank" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button ID="Eliminar_Archivo_Button" runat="server" CssClass="btn btn-danger" OnClick="Eliminar_Archivo_Button_Click" Text="Eliminar" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </fieldset>
            </div>

            <asp:SqlDataSource ID="Lee_Documentos_Registrados_SqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:db_Peso_x_Peso_ConnectionString %>" SelectCommand="spr_lee_documentos_consulta" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="año_HiddenField" DefaultValue="0" Name="año" PropertyName="Value" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:HiddenField ID="año_HiddenField" runat="server" />

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

    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.jquery.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.js") %>"></script>
    <script src="<%= ResolveUrl("~/Scripts/chosen/chosen.proto.min.js") %>"></script>

    <script type="text/javascript">

        $(document).ready(function () {
            ejecuta_javascript();
        });

        function ejecuta_javascript() {
            $(".chosen-select").chosen();
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

